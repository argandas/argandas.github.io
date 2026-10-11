%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume_classic}[2026/02/18 v1.0.0 Resume Classic Style]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,letterpaper]{article}

%----------------------------------------------------------------------------------------
%   PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------
\usepackage[letterpaper,hmargin=20mm,vmargin=20mm,top=10mm]{geometry}
\usepackage[unicode=true]{hyperref}
\hypersetup{
  hidelinks,
  pdfencoding=auto
}
\ifdefined\pdfgentounicode
  \pdfgentounicode=1
\fi
\usepackage[T1]{fontenc}
\usepackage{fontspec}
\usepackage{xcolor}
\setcounter{secnumdepth}{0}
\setlength\parindent{0pt}

%----------------------------------------------------------------------------------------
%   SET FONT
%----------------------------------------------------------------------------------------
\setmainfont[
  Path=assets/fonts/,
  Extension=.ttf,
  BoldFont=Roboto-Bold,
  ItalicFont=Roboto-Italic,
  BoldItalicFont=Roboto-BoldItalic
]{Roboto-Regular}

%----------------------------------------------------------------------------------------
%   COLORS AND SECTIONS
%----------------------------------------------------------------------------------------
\definecolor{slate-blue}{rgb}{0.11,0.44,0.66}
\definecolor{light-black}{rgb}{0.33,0.33,0.33}
\definecolor{dark-black}{rgb}{0.22,0.22,0.22}

\usepackage{sectsty}
\sectionfont{\color{slate-blue}}

%----------------------------------------------------------------------------------------
%   HEADER/FOOTER
%----------------------------------------------------------------------------------------
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\lfoot{}
\rfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Non-indenting itemize
\newenvironment{itemize-bullets}
{\setlength{\leftmargini}{1em}\begin{itemize}\setlength{\parskip}{0pt}\setlength{\itemsep}{0pt plus 1pt}}
{\end{itemize}}

%----------------------------------------------------------------------------------------
%   MAIN HEADER COMMAND
%----------------------------------------------------------------------------------------
\newcommand{\customheader}[5]{%
  \begin{center}
    {\huge{\color{slate-blue}\textbf{#1}}}\\[2.5mm]
    {\color{light-black}{#5 • #2 • #3 • #4}}\\
  \end{center}
}

%----------------------------------------------------------------------------------------
%   SUMMARY
%----------------------------------------------------------------------------------------
\newcommand{\summary}[2]{%
  \vspace{-5mm}\section{#1}%
  \color{light-black}#2%
}

%----------------------------------------------------------------------------------------
%   JOB
%----------------------------------------------------------------------------------------
\newcommand{\job}[6]{%
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    {\color{dark-black}\textbf{#1}} & {\color{dark-black}\textbf{#5}} \\
    {\color{dark-black}\textbf{#2}} & {\color{dark-black}\textbf{#3 -- #4}} \\
  \end{tabular*}
  {\color{light-black}#6}
  \vspace{2mm}
}

%----------------------------------------------------------------------------------------
%   SKILL GROUP
%----------------------------------------------------------------------------------------
\newcommand{\skillgroup}[2]{%
  {\color{dark-black}\textbf{#1:} \color{light-black}#2}
  \par\addvspace{2mm}
}

%----------------------------------------------------------------------------------------
%   EDUCATION / LANGUAGE ITEMS
%----------------------------------------------------------------------------------------
\newcommand{\eduitem}[5]{%
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    {\color{dark-black}\textbf{\MakeUppercase{#1}}} & {\color{dark-black}\textbf{#2}} \\
    {\color{dark-black}\textit{#3}} & {\color{dark-black}#4 -- #5} \\
  \end{tabular*}
  \par\vspace{4mm}
}

\newcommand{\langitem}[2]{%
  {\color{dark-black}\textbf{#1}: \color{light-black}{#2}}\\
}
