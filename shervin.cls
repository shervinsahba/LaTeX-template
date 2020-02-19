% LaTeX article class by Shervin Sahba
% shervinsahba@gmail.com

% CONTENTS:
% [[0]] AUTHOR SETTINGS
% [[1]] PACKAGES
% [[2]] PAGE LAYOUT
% [[3]] AUTHOR INFO CODE
% [[4]] ENVIRONMENTS
% [[5]] HEADER FOOTER
% [[6]] TABLE STYLE
% [[7]] SECTION PARAMETERS
% [[ ]] NEW CAPTION COMMANDS (unused)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shervin}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[0]] AUTHOR SETTINGS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\myname{Shervin Sahba}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[1]] PACKAGES - FORMATTING, LAYOUT, GRAPHICS, ETC %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% LAYOUT
\usepackage[letterpaper]{geometry}  % to set page geometry
\usepackage{fancyhdr}               % custom headers/footers
\usepackage{lastpage}               % Number of pages in the document
\usepackage{array}                  % enables arrays

%% FIGURES, GRAPHICS, TABLES
\usepackage{float}                  % allows H option in \begin{figure}[H] to force here.
\usepackage{graphicx}               % enhanced graphics support 
\usepackage[table]{xcolor}          
\usepackage{booktabs}

%% FONT, TEXT PACKAGES
\usepackage{silence}
\WarningFilter{microtype}{Font}
\usepackage[T1]{fontenc}
% \usepackage{newtxtext,newtxmath}
\usepackage{courier}                % \texttt{} - latex typewriter set to Courier
\usepackage{helvet}                 % latex sans serif set to Helvetica
\usepackage{mathpazo}               % latex roman set to Palatino and mathpazo math
\usepackage{verbatim}               % \begin{comment} %\begin{verbatim}
\usepackage{fancyvrb}               % addon for verbatim?
\usepackage{bm}                     %\bm{} bold command
\usepackage{siunitx}                % SI units

%% FONT SPACING ADJUSTMENTS
\usepackage{ifpdf}  % letterspacing with latex + dvipdf, so need the soul package. 
                    % See http://tex.stackexchange.com/a/271714/226
\ifpdf
  \usepackage[tracking = true, letterspace = 16]{microtype}
\else
  \usepackage{microtype}
  \usepackage{soul}
  \soulregister\hspace7
  \sodef\lscaps{}{.1em}{.4em plus.08em minus.06em}{.4em plus.15em minus.83em}%
  \sodef\lsbold{}{.02em}{.3em plus.08em minus.06em}{.3em plus.15em minus.83em}%
\fi

\delimitershortfall-1sp % allows decreasing size for nested parentheses in certain environment

%% BIBLIOGRAPHY
\usepackage[square,sort&compress,comma,numbers,super]{natbib}
            % options: round, square, super, sort, sort&compress, compress, comma, numbers

%% LINKS AND BOOKMARKS VIA HYPERREF
% Most packages should load before hyperref but there are exceptions
% https://tex.stackexchange.com/questions/1863/which-packages-should-be-loaded-after-hyperref-instead-of-before
\definecolor{urlblue}{RGB}{46,46,177}
\usepackage[]{hyperref}
\hypersetup{
    %pdftitle={Your title here},
    pdfauthor={Shervin Sahba},
    %pdfsubject={Your subject here},
    %pdfkeywords={keyword1, keyword2},
    bookmarksnumbered=true,     
    bookmarksopen=true,         % show bookmarks with subtrees expanded
    bookmarksopenlevel=1,       % ... up to level 1
    colorlinks=true,            % use colored links
    urlcolor=urlblue,           % color of URL
    linkcolor=blue,              % color of links
    citecolor=blue,             % color of citations
    breaklinks=true,            % allow links to break over multiple lines
    pdfstartview=Fit,           % set startup pdf page view
    pdfpagemode=UseOutlines,    % this is the option you were lookin for
    %pdfpagelayout=TwoPageRight
}
% \usepackage[colorlinks=true,      % Color Links
%             urlcolor=urlblue,
%             linkcolor=black,
%             citecolor=black,
%             breaklinks=true,      
%             bookmarks=true      % create pdf bookmarks
%             ]{hyperref} 
% \usepackage{hypcap}             % bookmarks should anchor at image not caption


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[2]] PAGE LAYOUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{empty}
\geometry{nohead,
          left=1in,right=1in,
          top=1in,bottom=1in,
          headheight=15pt,headsep=\dimexpr1.3in-48pt-15pt\relax} %% 12 pt = 1 pc; 6 pc = 1 in.
\parindent1em %% em tied to font
\parskip0pc

\newcommand{\headerfont}{\normalfont\sffamily\fontsize{7}{9}\selectfont}


% Title (headings are now sans serif; left-aligned)
\ifpdf
  % microtype only works in pdflatex
  \newcommand\OEtitle[1]{%
    {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright{#1}\par\vskip.15in}
    % {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright\textls{#1}\par\vskip.15in}
  }
\else
  \newcommand\OEtitle[1]{%
    {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright{#1}\par\vskip.15in}
    %     {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright\lsbold{#1}\par\vskip.15in}

  }
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[3]] AUTHOR INFO CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{authorcolor}{RGB}{105,105,105}
\colorlet{authorcolor}{black}
\newcommand{\@authorcolor}{black}

\newcommand\OEauthor[1]{{\raggedright\sffamily\bfseries\scshape\large \boldmath\color{authorcolor}#1\vskip1ex\par}}
\newcommand\OEaddress[1]{{\raggedright\small\itshape #1\par}}
\newcommand\authormark[1]{\textsuperscript{#1}} %% author superscripts
\newcommand\OEemail[1]{{\raggedright\footnotesize\itshape\color{urlblue}#1\par}}
\newcommand\URL[1]{\textcolor{urlblue}{\underline{#1}}}
\newcommand\homepage[1]{{\raggedright\footnotesize\itshape\color{urlblue}#1\par}}

\let\title\OEtitle
\let\author\OEauthor
\let\affil\OEaddress
\let\address\OEaddress
\let\email\OEemail

%% Copyright
\def\@copyrighttext{}
\newcommand{\setcopyright}[1]{\gdef\@copyrighttext{#1}}
\setcopyright{\myname}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[4]] ENVIRONMENTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abstract environments, with and without copyright info
\renewenvironment{abstract}{\vskip1pc\noindent\textbf{Abstract:\space}}{\\[12pt]\noindent{\fontsize{8pt}{9pt}\sffamily\copyright\, \number\year \hskip.05in\@copyrighttext}\par\vskip12pt}
\newenvironment{abstract*}{\vskip1pc\noindent\textbf{\textsf{Abstract:}\space}}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[5]] HEADER AND FOOTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}          % Enables the custom headers/footers
%   \lhead{}  \chead{}  \rhead{S. Sahba}
%   \lfoot{}  \cfoot{}  \rfoot{\thepage}
\fancyhf{}                 % Clear everything first
\renewcommand{\headrule}{}
% Journal like Header
\newcommand{\@journalname}{S. Sahba} %change in .tex via \journalname{}
\newcommand{\journalname}[1]{\def\@journalname{#1}}
\newcommand{\@articletype}{Article}  %change in .tex via \articlename{}
\newcommand{\articletype}[1]{\def\@articletype{#1}}
\fancyhead[L]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}\vrule}}\arrayrulecolor{black}
      \hline
      \cellcolor{black}\textcolor{white}{\@articletype} & \@journalname\hspace{21pt}\thepage \\
      \hline
    \end{tabular*}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[6]] TABLE STYLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\arrayrulecolor{black} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[7]] SECTION PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Authors may now use \cite \ref for section numbers
\renewcommand\@seccntformat[1]{\csname the#1\endcsname.\quad }
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}
%% Section headings are now sans serif
\renewcommand\section{\@startsection {section}{1}{0pt}
                                     {-2.5ex plus -1ex minus -.2ex}%
                                     {1.3ex plus .2ex}%
                                     {\normalsize\bfseries\sffamily}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}%
                                     {-2.25ex plus -1ex minus -.2ex}%
                                     {1ex plus .2ex}%
                                     {\normalsize\itshape\sffamily}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{0pt}%
                                     {-2.25ex plus -1ex minus -.2ex}%
                                     {1ex plus .2ex}%
                                     {\small\upshape\sffamily}}







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[ ]] NEW CAPTION COMMANDS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \newcommand\@MaxCapWidth{4.25in}
% \setlength\belowcaptionskip{1pt}
% \long\def\@makecaption#1#2{%
%   \small
%   \vskip\abovecaptionskip
%   \sbox\@tempboxa{#1. #2}%
%   \ifdim \wd\@tempboxa >\@MaxCapWidth
%     \hskip2.25pc\parbox{4.5in}{#1. #2}
%   \else
%     \global \@minipagefalse
%     \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
%   \fi
%   \vskip\belowcaptionskip\normalsize}

% %% New (more liberal than the default) float commands
% \renewcommand{\topfraction}{.85}
% \renewcommand{\bottomfraction}{.7}
% \renewcommand{\textfraction}{.15}
% \renewcommand{\floatpagefraction}{.66}
% \renewcommand{\dbltopfraction}{.66}
% \renewcommand{\dblfloatpagefraction}{.66}
% \setcounter{topnumber}{9}
% \setcounter{bottomnumber}{9}
% \setcounter{totalnumber}{20}
% \setcounter{dbltopnumber}{9}