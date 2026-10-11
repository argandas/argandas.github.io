param(
    [switch]$SkipRender
)

$ErrorActionPreference = "Stop"

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$BuildDir = Join-Path $RepoRoot ".build"

if (-not (Test-Path $BuildDir)) {
    New-Item -ItemType Directory -Path $BuildDir | Out-Null
}

$Pandoc = Get-Command pandoc -ErrorAction SilentlyContinue
if (-not $Pandoc) {
    Write-Error "pandoc was not found in PATH. Install it with: winget install --id JohnMacFarlane.Pandoc -e"
}

Push-Location $RepoRoot
try {
    if (-not $SkipRender) {
        & python render_docx.py
        if ($LASTEXITCODE -ne 0) {
            exit $LASTEXITCODE
        }
    }

    $mdFile = Join-Path $BuildDir "resume.md"
    if (-not (Test-Path $mdFile)) {
        Write-Error "Could not find $mdFile. Run without -SkipRender first."
    }

    $docxFile = Join-Path $BuildDir "resume.docx"
    & $Pandoc.Source $mdFile "-f" "gfm" "-t" "docx" "-o" $docxFile
    if ($LASTEXITCODE -ne 0) {
        exit $LASTEXITCODE
    }

    Write-Host "Build complete: .build/resume.docx"
}
finally {
    Pop-Location
}
