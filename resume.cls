%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{resume}[2022/04/11 v1.0.0 Resume Class]
\NeedsTeXFormat{LaTeX2e}

\LoadClass[10pt, letterpaper]{article}

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{import}
\usepackage[letterpaper, hmargin=20mm, vmargin=20mm, top=10mm]{geometry} % Use letter paper and set margins
\usepackage{hyperref} % Colors for links, text and headings
\usepackage{lastpage} % Colors for links, text and headings
\usepackage[T1]{fontenc} % Output font encoding for international characters
\setcounter{secnumdepth}{0} % Suppress section numbering

%----------------------------------------------------------------------------------------
%	SET FONT
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specification of custom fonts
\setmainfont[Path = latex/fonts/,
Extension = .ttf,
BoldFont = Roboto-Bold,
ItalicFont = Roboto-Italic,
BoldItalicFont = Roboto-BoldItalic,
SmallCapsFeatures = {Letters = SmallCaps}
]{Roboto-Regular}

%----------------------------------------------------------------------------------------
%	CUSTOM COLORS
%----------------------------------------------------------------------------------------

\usepackage{color} % Required for custom colors
\definecolor{slate-blue}{rgb}{0.11,0.44,0.66}
\definecolor{light-black}{rgb}{0.33,0.33,0.33}
\definecolor{dark-black}{rgb}{0.22,0.22,0.22}

\usepackage{sectsty} % Allows customization of titles
\sectionfont{\color{slate-blue}} % Color section titles

%----------------------------------------------------------------------------------------
%	CUSTOM HEADER AND FOOTER
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Customize the header and footer
\pagestyle{fancy}
\fancyhf{}
\lfoot{\color{light-black}\today}
\rfoot{\color{light-black}{Page \thepage~~of~~\pageref{LastPage}}}

\renewcommand{\headrulewidth}{0pt} % Disable the default header rule
\renewcommand{\footrulewidth}{0pt} % Disable the default footer rule

\setlength\parindent{0pt} % Stop paragraph indentation

% Non-indenting itemize
\newenvironment{itemize-bullets}
{\setlength{\leftmargini}{1em}\begin{itemize}\setlength{\parskip}{0pt} \setlength{\itemsep}{0pt plus 1pt}}
{\end{itemize}}

% Text width for tabbing environments
\newlength{\smallertextwidth}
\setlength{\smallertextwidth}{\textwidth}
\addtolength{\smallertextwidth}{-2cm}

\newcommand{\sqbullet}{~\vrule height 1ex width .8ex depth -.2ex} % Custom square bullet point definition

%----------------------------------------------------------------------------------------
%	MAIN HEADER COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\customheader}[6]{
    \parbox{0.6\textwidth}
    {
        {\huge{\color{slate-blue}\textbf{#1}}}\\ % Header  name and color
        {\Large\color{light-black}{#2}}\\
    }
    \hfill % Horizontal space between the two blocks
    \parbox{0.4\textwidth}
    {
        \begin{tabbing} % Enables tabbing
            \color{light-black}{#3} \\
            \color{light-black}{#4} \\
            \color{light-black}{#5} \\
            \color{light-black}{#6} \\
        \end{tabbing}
    }
}

%----------------------------------------------------------------------------------------
%	SUMMARY SECTION
%----------------------------------------------------------------------------------------

\newcommand{\summary}[2]{
    \vspace{-2em}\section{#1}
    \color{light-black}
    {#2}
}

%----------------------------------------------------------------------------------------
%	JOB COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\job}[6]{
    \begin{tabbing}
        \hspace{0.5cm}\color{dark-black}{\textbf{#1} • {#2}}\\
        \hspace{0.5cm}{#3 - #4} • #5\\
        \hspace{1cm}
        \begin{minipage}{\smallertextwidth}
            \vspace{2mm}
            \color{light-black}
            #6
        \end{minipage}
    \end{tabbing}
    \vspace{0em}
}

%----------------------------------------------------------------------------------------
%	SKILL GROUP COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\skillgroup}[3]{
    \begin{tabbing}
    \hspace{0.5cm}\color{dark-black}{\textbf{#1}}\\
    \hspace{1cm}
    \begin{minipage}{\smallertextwidth}
            \vspace{2mm}
            \color{light-black}
            #2
    \end{minipage}
    \end{tabbing}
    \vspace{-4mm}
}

%----------------------------------------------------------------------------------------
%	INTERESTS GROUP COMMAND
%-----------------------------------------------------------------------------------------

\newcommand{\interestsgroup}[1]{
    \begin{tabbing}
    \hspace{5mm} \= \kill
    #1
    \end{tabbing}
    \vspace{-10mm}
}

\newcommand{\interest}[1]{\sqbullet \> \textbf{#1}\\[3pt]} % Define a custom command for individual interests

%----------------------------------------------------------------------------------------
%	DATE ITEM COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\dateitem}[3]{
    \begin{tabbing}
    \hspace{2.5cm} \= \kill
    \hspace{0.5cm}\color{dark-black}{#1} \> \color{light-black}{{#2} • {#3}}
    \end{tabbing}
    \vspace{-6mm}
}


%----------------------------------------------------------------------------------------
%	EDUCATION ITEM COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\eduitem}[3]{
    \begin{tabbing}
    \hspace{2.5cm} \= \kill
    \hspace{0.5cm}\color{dark-black}{#1} \> \color{light-black}{{#2} • {#3}}
    \end{tabbing}
    \vspace{-6mm}
}

%----------------------------------------------------------------------------------------
%	LANGUAGE ITEM COMMAND
%----------------------------------------------------------------------------------------

\newcommand{\langitem}[3]{
    \begin{tabbing}
    \hspace{2.5cm} \= \kill
    \hspace{0.5cm}\color{dark-black}\textbf{#1} \> \color{light-black}{#2}
    \end{tabbing}
    \vspace{-6mm}
}

%----------------------------------------------------------------------------------------
