param(
    [ValidateSet("worded", "classic")]
    [string]$Format,
    [switch]$Both,
    [switch]$Clean,
    [switch]$SkipRender
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildDir = Join-Path $RepoRoot ".build"

if ($Clean -and (Test-Path $BuildDir)) {
    Remove-Item -Recurse -Force $BuildDir
}

if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir | Out-Null
}

$XeLatex = Get-Command xelatex -ErrorAction SilentlyContinue
if (-not $XeLatex) {
    Write-Error "xelatex was not found in PATH. Install MiKTeX/TeX Live and open a new terminal."
}

$targets = @()
if ($Both -or -not $PSBoundParameters.ContainsKey("Format")) {
    $targets = @("worded", "classic")
} else {
    $targets = @($Format)
}

function Invoke-Render([string]$target) {
    & python render.py --format $target
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

function Build-Tex([string]$target) {
    $texFile = "resume_$target.tex"
    $texPath = Join-Path $RepoRoot $texFile
    if (-not (Test-Path $texPath)) {
        Write-Error "Could not find $texPath"
    }

    $jobName = "resume-$target"
    $outputPdf = Join-Path $BuildDir "$jobName.pdf"
    if (Test-Path $outputPdf) {
        try {
            Remove-Item -Path $outputPdf -Force
        }
        catch {
            Write-Error "Could not overwrite $outputPdf. Close any PDF viewer (including VS Code preview) and run .\build.ps1 again."
        }
    }

    $args = @(
        "-interaction=nonstopmode",
        "-halt-on-error",
        "-jobname=$jobName",
        "-output-directory=.build",
        $texFile
    )

    & $XeLatex.Source @args
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    & $XeLatex.Source @args
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }
}

Push-Location $RepoRoot
try {
    foreach ($target in $targets) {
        if (-not $SkipRender) {
            Invoke-Render $target
        }
        Build-Tex $target
    }

    if ($targets.Count -eq 1) {
        $selected = $targets[0]
        Copy-Item -Path (Join-Path $BuildDir "resume-$selected.pdf") -Destination (Join-Path $BuildDir "resume.pdf") -Force
        Write-Host "Build complete: .build/resume-$selected.pdf (also copied to .build/resume.pdf)"
    } else {
        Write-Host "Build complete: .build/resume-worded.pdf and .build/resume-classic.pdf"
    }
}
finally {
    Pop-Location
}
