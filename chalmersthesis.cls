\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chalmersthesis}[2020/05/26 Licentiate Thesis class for Chalmers]
\typeout{Licentiate thesis class for Chalmers by Pontus Vikstål - v 1.0}
\LoadClass{book}

%----------------------------
%	 REQUIRED PACKAGES
%----------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[swedish,english]{babel}

% control layout of itemize, enumerate, description
\RequirePackage{enumitem}

% enhanced support for alignment of text
\RequirePackage{ragged2e}

% if... then... else... constructs
\RequirePackage{ifthen}

% include pdf documents in Latex
\RequirePackage{pdfpages}

% color
\RequirePackage{xcolor}

% enhanced support for graphics
\RequirePackage{graphicx}

% hyperlinks
\RequirePackage{hyperref}
\hypersetup{colorlinks	= true,
				    citecolor		= blue,
				    linkcolor		= blue,
				    pdfauthor		= {DOE John, john.doe@chalmers.se},
				    pdfsubject	= {2020 John Licentiate Thesis},
				    pdftitle		= {2020 John Licentiate Thesis}
}

% select alternative section titles
\RequirePackage{titlesec}
\titleformat{\chapter}[block] {\sffamily\Huge\bfseries}{\thechapter}{20pt}{\Huge}

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
    \textsc{Thesis for the degree of \@Degree} \\ [20mm]
    \LARGE
    \textsc{\@Title} \\ [15mm]
		\MakeUppercase{\normalsize \@Name}\\[20mm]
		\includegraphics[width=30mm]{figures/titlepage/AvancezChalmers_black_centered.eps}\\[15mm]
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
	\thispagestyle{plain}
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
	\setcounter{page}{1}
}%
{
	\vfill
	\noindent
	\textbf{Keywords: }\@Keywords
	\endgroup
	\vfill
	\clearpage{\pagestyle{plain}\cleardoublepage}
}
%================END ABSTRACT=================

%================BEGIN ACKNOWLEDGMENT=================
\newenvironment{acknowledgment}{%
	\thispagestyle{plain}
	\chapter*{Acknowledgments}
	\phantomsection
	\addcontentsline{toc}{chapter}{Acknowledgments}
}%
{
	\\
	\hspace*{\fill}
	\@Name, \@City, \@Copyrightmonth\, \@Copyrightyear
	\clearpage{\pagestyle{plain}\cleardoublepage}
}
%================END ACKNOWLEDGMENT=================

%================BEGIN PUBLICATIONS=================
\newenvironment{publications}{%
	\phantomsection
	\addcontentsline{toc}{chapter}{Publications}
	\chapter*{Publications}
	\begin{enumerate}[label=\textbf{\Alph*}, ref={\Alph*}, font=\Large, labelsep=1.5cm]
}%
{
	\end{enumerate}
	\clearpage{\pagestyle{plain}\cleardoublepage}
}
%================END PUBLICATIONS=================


% Define storage of strings, for storing included papers
%%%%%%%%%%%%%%%%%%
\newcount\tmpnum
\def\storedata#1#2{\tmpnum=0 \edef\tmp{\string#1}\storedataA#2\end}
\def\storedataA#1{\advance\tmpnum by1
   \ifx\end#1\else
      \expandafter\def\csname data:\tmp:\the\tmpnum\endcsname{#1}%
      \expandafter\storedataA\fi
}
\def\getdata[#1]#2{\csname data:\string#2:#1\endcsname}

%\storedata\mydata{{one}{two}{three}}
%\getdata[1]\mydata
%%%%%%%%%%%%%%%%%%

\newcommand{\getLabel}[1]{\getdata[1]#1}
\newcommand{\getAuthors}[1]{\getdata[2]#1}
\newcommand{\getTitle}[1]{\getdata[3]#1}
\newcommand{\getJournal}[1]{\getdata[4]#1}
\newcommand{\getURL}[1]{\getdata[5]#1}
\newcommand{\getPath}[1]{\getdata[6]#1}
\newcommand{\getStartPage}[1]{\getdata[7]#1}
\newcommand{\getStopPage}[1]{\getdata[8]#1}
\newcommand{\getComment}[1]{\getdata[9]#1}

%\newcommand{\IncludePaper}[4]{#1, \newblock \emph{#2}, \newblock #3.\\ \newblock \url{#4}}
\newcommand{\IncludedPaper}[1]{
	\label{\getLabel{#1}}
	{\bf\getTitle{#1}}\\
	\newblock \getAuthors{#1}\\
	\newblock \href{\getURL{#1}}
	{\getJournal{#1}}\\
	\newblock \getComment{#1}
}


%% this is called in the publications section: publications.tex
\newcommand{\IncludedPaperArxiv}[1]{
	\label{\getLabel{#1}}
	{\bf\getTitle{#1}}\\
	\newblock \getAuthors{#1}\\
	\newblock \href{\getURL{#1}}{\getJournal{#1}}\\
	\newblock \getComment{#1}
}



\newcommand{\PaperContribution}[2]{
	\section*{Paper \ref*{\getLabel{#1}}}
	{\bf \getTitle{#1}}

	#2
	%
	%\emph{#3}
}

%% called in include_papers.tex

\newcommand{\IncludePaper}[1]{
	\phantomsection
	%\addcontentsline{toc}{section}{Paper \ref*{\getLabel{#1}}}
	\vspace*{60mm}
	~\hfill\textbf{\Huge\sffamily{Paper~\ref*{\getLabel{#1}}}}\\[15mm]
	{\bf\getTitle{#1}}\\
	\newblock \getAuthors{#1}\\
	\newblock \getJournal{#1}\\
	\newblock \url{\getURL{#1}}
	\vfill
}


\newcommand{\IncludePaperArxiv}[1]{
	\phantomsection
	%\addcontentsline{toc}{section}{Paper \ref*{\getLabel{#1}}}
	\vspace*{60mm}
	~\hfill\textbf{\Huge\sffamily{Paper~\ref*{\getLabel{#1}}}}\\[15mm]
	{\bf\getTitle{#1}}\\
	\newblock \getAuthors{#1}\\
	%\newblock \getJournal{#1}\\
	\newblock \url{\getURL{#1}}\\
	\newblock \getComment{#1}
	\vfill
	\cleardoublepage
	\includepdf[pages=\getStartPage{#1}-\getStopPage{#1}]{\getPath{#1}}
	\cleardoublepage
}
