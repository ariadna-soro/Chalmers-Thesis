\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chalmersthesis}[2020/05/26 Licentiate Thesis class for Chalmers]
\typeout{Licentiate thesis class for Chalmers by Pontus Vikstål - v 1.0}

% Custom package options
\DeclareOption{print}{
  \PassOptionsToPackage{hidelinks}{hyperref}
}

% Custom package options
\DeclareOption{online}{
  \PassOptionsToPackage{%
    colorlinks = true,
    citecolor = blue,
    linkcolor = blue,
  }{hyperref}
}

% Fallback
\DeclareOption*{
  \ClassWarning{chalmersthesis}{Unknown option '\CurrentOption'}
}

% Execute default options
\ExecuteOptions{online}

% Process given options
\ProcessOptions\relax

% Load base
\LoadClass{book}

%----------------------------
%	 REQUIRED PACKAGES
%----------------------------

% hyperlinks
\RequirePackage{hyperref}

% control layout of itemize, enumerate, description
\RequirePackage{enumitem}

% enhanced support for alignment of text
\RequirePackage{ragged2e}

% if... then... else... constructs
\RequirePackage{ifthen}

% enhanced support for graphics
\RequirePackage{graphicx}

% include pdf documents in Latex
\RequirePackage{pdfpages} 

% select alternative section titles
\RequirePackage{titlesec}
\titleformat{\chapter}[block] {\sffamily\Huge\bfseries}{\thechapter}{20pt}{\Huge}
\titleformat*{\section}{\sffamily\LARGE\bfseries}
\titleformat*{\subsection}{\sffamily\Large\bfseries}
\titlespacing{\subsubsection}{0pt}{1em}{0pt}
\RequirePackage{changepage}

% modify headers and footers
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{} % clear
\fancyhead[LE]{\small \leftmark}
\fancyhead[RO]{\small \rightmark}
\fancyfoot{} % clear
\fancyfoot[LE,RO]{\thepage} % clear
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}

% Redefine plain pagestyle
\fancypagestyle{plain}{
	\fancyhead{}% Clear
	\fancyfoot{}
	\fancyfoot[LE,RO]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

% Redefine plain pagestyle
\fancypagestyle{frontmatter}{
	\fancyhead{}% Clear
	\fancyfoot{}
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

% Control table of contents, figures, etc
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\sffamily\Huge\bfseries}
\renewcommand{\cftchapfont}{\sffamily\bfseries}

%----------------------------
%	    NEW COMMANDS
%----------------------------
\newcommand{\Degree}[1]{\def\@Degree{#1}}
\newcommand{\Title}[1]{\def\@Title{#1}}
\newcommand{\BrokenTitle}[1]{\def\@BrokenTitle{#1}}
\newcommand{\Name}[1]{\def\@Name{#1}}
\newcommand{\Division}[1]{\def\@Division{#1}}
\newcommand{\Department}[1]{\def\@Department{#1}}
\newcommand{\Uni}[1]{\def\@Uni{#1}}
\newcommand{\City}[1]{\def\@City{#1}}
\newcommand{\Country}[1]{\def\@Country{#1}}
\newcommand{\Copyrightyear}[1]{\def\@Copyrightyear{#1}}
\newcommand{\Copyrightmonth}[1]{\def\@Copyrightmonth{#1}}
\newcommand{\Cover}[1]{\def\@Cover{#1}}
\newcommand{\ReportNr}[1]{\def\@ReportNr{#1}}
\newcommand{\SerieNr}[1]{\def\@SerieNr{#1}}
\newcommand{\ISBN}[1]{\def\@ISBN{#1}}
\newcommand{\ISSN}[1]{\def\@ISSN{#1}}
\newcommand{\Postcode}[1]{\def\@Postcode{#1}}
\newcommand{\Telephone}[1]{\def\@Telephone{#1}}
\newcommand{\PrintService}[1]{\def\@PrintService{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}


%================BEGIN TITLE PAGE=================
\renewcommand{\maketitle}{
	% First page
  \thispagestyle{empty}
  \begin{center}
    \large
    \textsc{thesis for the degree of \@Degree} \\ [20mm]
    \LARGE
    {\@Title} \\ [15mm]
		\MakeUppercase{\normalsize \@Name}\\[20mm]
		\vfill
	  \large
	  \@Department \\
		\textit{\@Division} \\
		\protect{\@Uni} \\
		\@City, \@Country, \@Copyrightyear
  \end{center}
	\clearpage

	% Print info page
	\thispagestyle{empty}
	\begin{flushleft}
		\vspace*{2cm}
		\@BrokenTitle \\
		\MakeUppercase{\@Name}\\
		\vspace{0.6cm}
		\textcopyright ~\MakeUppercase{\@Name}, \@Copyrightyear \\
		%\vfill
		\vspace{0.6cm}
		%
		Technical Report \ \@ReportNr \\
		ISSN \@ISSN \\
		\vspace{2cm}
		\@Division \\
		\@Department \\
		\@Uni \\
		\@Postcode \ \@City \\
		\@Country \\
		Telephone \@Telephone \\[10mm]
	\end{flushleft} %
	\vfill
	\ifthenelse{\isundefined{\@Cover}}{
		% Do nothing
	}{
		Cover: \@Cover \\
	}
	\vspace{0.2cm}
	\begin{flushleft}
		\@PrintService\\
		\@City, \@Country, \@Copyrightyear
	\end{flushleft}
	\clearpage
}
%================END TITLE PAGE=================

%================BEGIN PRINT INFO=================
\newcommand{\printinfo}{
	\thispagestyle{empty}
	\begin{flushleft}
		\vspace*{2cm}
		\@BrokenTitle \\
		\MakeUppercase{\@Name}\\
		\vspace{0.6cm}
		\textcopyright ~\MakeUppercase{\@Name}, \@Copyrightyear \\
		%\vfill
		\vspace{0.6cm}
		%
		Technical Report \ \@ReportNr \\
		ISSN \@ISSN \\
		\vspace{2cm}
		\@Division \\
		\@Department \\
		\@Uni \\
		\@Postcode \ \@City \\
		\@Country \\
		Telephone \@Telephone \\[10mm]
	\end{flushleft} %
	\vfill
	\ifthenelse{\isundefined{\@Cover}}{
		% Do nothing
	}{
		Cover: \@Cover \\
	}
	\vspace{0.2cm}
	\begin{flushleft}
		\@PrintService\\
		\@City, \@Country, \@Copyrightyear
	\end{flushleft}
	\clearpage
}
%================END PRINT INFO=================

%================BEGIN ABSTRACT=================
\newenvironment{abstract}{%
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\begingroup
	\let\clearpage\relax
	\let\cleardoublepage\relax
	\let\cleardoublepage\relax
	 {\noindent \@BrokenTitle \\
	  \MakeUppercase{\@Name} \\
	  \@Department \\
	  \@Division \\
	  \@Uni
	 \par}

	\chapter*{Abstract}
	\thispagestyle{frontmatter}
	\setcounter{page}{1}
}%
{
	\vfill
	\noindent
	\textbf{Keywords: }\@Keywords
	\endgroup
	\vfill
	\clearpage{\pagestyle{frontmatter}\cleardoublepage}
}
%================END ABSTRACT=================

%================BEGIN ACKNOWLEDGMENT=================
\newenvironment{acknowledgment}{%
	\thispagestyle{plain}
	\chapter*{Acknowledgments}
	\thispagestyle{frontmatter}
	\phantomsection
	\addcontentsline{toc}{chapter}{Acknowledgments}
}%
{
	\\[\baselineskip]
	\hspace*{\fill}
	\@Name, \@City, \@Copyrightmonth\, \@Copyrightyear
	\clearpage{\pagestyle{frontmatter}\cleardoublepage}
}
%================END ACKNOWLEDGMENT=================

%================BEGIN PUBLICATIONS=================
\newenvironment{publications}{%
	\phantomsection
	\addcontentsline{toc}{chapter}{Publications}
	\chapter*{Publications}
	\thispagestyle{frontmatter}
	\begin{enumerate}[label=\textbf{\Alph*}, ref={\Alph*}, font=\Large, labelsep=1.5cm]
}%
{
	\end{enumerate}
	\clearpage{\pagestyle{frontmatter}\cleardoublepage}
}
%================END PUBLICATIONS=================

% this must be the last command.
\endinput