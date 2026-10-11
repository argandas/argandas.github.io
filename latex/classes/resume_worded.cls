%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume_worded}[2026/02/18 v2.0.0 Resume Worded Style]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt,letterpaper]{article}

%----------------------------------------------------------------------------------------
%   PACKAGES AND DOCUMENT CONFIGURATION
%----------------------------------------------------------------------------------------
\usepackage[letterpaper,margin=18mm]{geometry}
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
\usepackage{enumitem}
\usepackage{xcolor}

\setmainfont[
  Path=assets/fonts/,
  Extension=.ttf,
  BoldFont=Roboto-Bold,
  ItalicFont=Roboto-Italic,
  BoldItalicFont=Roboto-BoldItalic
]{Roboto-Regular}
\setcounter{secnumdepth}{0}
\setlength\parindent{0pt}
\setlength\parskip{0pt}
\setlength\tabcolsep{0pt}

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

%----------------------------------------------------------------------------------------
%   TYPOGRAPHY HELPERS
%----------------------------------------------------------------------------------------
\definecolor{light-black}{rgb}{0.20,0.20,0.20}
\definecolor{dark-black}{rgb}{0.10,0.10,0.10}

\newcommand{\sectiontitle}[1]{%
  \vspace{1.8mm}
  {\Large\textbf{\MakeUppercase{#1}}}\par
  \vspace{0.8mm}
  \hrule
  \vspace{1.5mm}
}

\newenvironment{itemize-bullets}
{\begin{itemize}[leftmargin=1.4em,itemsep=1.5pt,topsep=1pt,parsep=0pt,partopsep=0pt]}
{\end{itemize}}

%----------------------------------------------------------------------------------------
%   MAIN HEADER
%----------------------------------------------------------------------------------------
\newcommand{\customheader}[5]{%
  \begin{center}
    {\LARGE\textbf{\MakeUppercase{#1}}}\\[1mm]
    {\normalsize #5 \quad • \quad #2 \quad • \quad #3 \quad • \quad #4}
  \end{center}
  \vspace{1.5mm}
}

%----------------------------------------------------------------------------------------
%   SUMMARY
%----------------------------------------------------------------------------------------
\newcommand{\summary}[2]{%
  \sectiontitle{#1}
  {\color{light-black}#2\par}
  \vspace{1.5mm}
}

%----------------------------------------------------------------------------------------
%   JOB ENTRY
%----------------------------------------------------------------------------------------
\newcommand{\job}[6]{%
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    \textbf{\MakeUppercase{#1}} & \textbf{#5} \\
    \textbf{#2} & \textbf{#3 -- #4} \\
  \end{tabular*}
  \vspace{0.5mm}
  #6
  \vspace{1.8mm}
}

%----------------------------------------------------------------------------------------
%   SKILL GROUP
%----------------------------------------------------------------------------------------
\newcommand{\skillgroup}[2]{%
  \textbf{#1:} #2\par\addvspace{2mm}
}

%----------------------------------------------------------------------------------------
%   DATE / EDUCATION / LANGUAGE ITEMS
%----------------------------------------------------------------------------------------
\newcommand{\dateitem}[3]{%
  #1 #2, #3\\
}

\newcommand{\eduitem}[5]{%
  \begin{tabular*}{\textwidth}{@{}l@{\extracolsep{\fill}}r@{}}
    \textbf{\MakeUppercase{#1}} & \textbf{#2} \\
    {\textit{#3}} & #4 -- #5 \\
  \end{tabular*}
  \vspace{4mm}
}

\newcommand{\langitem}[2]{%
  \textit{#1:} #2\\
}
