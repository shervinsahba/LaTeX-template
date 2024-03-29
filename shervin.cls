% LaTeX article class by Shervin Sahba
% shervin@tuta.io
%
% CONTENTS:
% [[0]] AUTHOR SETTINGS
% [[1]] PACKAGES
% [[2]] PAGE LAYOUT
% [[3]] AUTHOR INFO CODE
% [[4]] ENVIRONMENTS
% [[5]] HEADER FOOTER
% [[6]] TABLE STYLE
% [[7]] SECTION PARAMETERS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shervin}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[0]] AUTHOR SETTINGS

\newcommand{\myname}{Shervin Sahba}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[1]] PACKAGES - GENERAL


%% LAYOUT
\usepackage[letterpaper]{geometry}  % to set page geometry
\usepackage{fancyhdr}               % custom headers/footers
\usepackage{lastpage}               % Number of pages in the document

%% FONT, TEXT PACKAGES
\usepackage[table]{xcolor}
% \usepackage{silence}
% \WarningFilter{microtype}{Font}
\usepackage[T1]{fontenc}
% \usepackage{courier}                % \texttt{} - latex typewriter set to Courier
% \usepackage{helvet}                 % latex sans serif set to Helvetica
\usepackage{mathpazo}               % latex roman set to Palatino and mathpazo math


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[2]] PAGE LAYOUT


\pagestyle{empty}
\geometry{nohead,
          left=1in,right=1in,
          top=1in,bottom=1in,
          headheight=15pt,headsep=\dimexpr1.3in-48pt-15pt\relax} %% 12 pt = 1 pc; 6 pc = 1 in.
\parindent1em %% em tied to font
\parskip0pc

\newcommand{\headerfont}{\normalfont\fontsize{7}{9}\selectfont}


% Title (headings are now sans serif; left-aligned)
\newcommand\OEtitle[1]{{\fontsize{16pt}{18.5pt}\bfseries\selectfont\raggedright{#1}}\par}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[3]] AUTHOR INFO CODE


\definecolor{authorcolor}{RGB}{105,105,105}
\colorlet{authorcolor}{black}
\newcommand{\@authorcolor}{black}

\newcommand\OEauthor[1]{{\raggedright\bfseries\boldmath\color{authorcolor}#1}\par}
\newcommand\OEaddress[1]{\vskip-6pt{\raggedright\smaller #1}\par}
\newcommand\authormark[1]{\textsuperscript{#1}} %% author superscripts
\newcommand\OEemail[1]{\vskip-6pt{\raggedright\footnotesize\color{urlblue}#1\par}}
\newcommand\URL[1]{\textcolor{urlblue}{\underline{#1}}}
\newcommand\homepage[1]{\vskip-6pt{\raggedright\footnotesize\color{urlblue}#1\par}}

\let\title\OEtitle
\let\author\OEauthor
\let\affil\OEaddress
\let\address\OEaddress
\let\email\OEemail

%% Copyright
\def\@copyrighttext{}
\newcommand{\setcopyright}[1]{\gdef\@copyrighttext{#1}}
\setcopyright{\myname}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[4]] ENVIRONMENTS

% Abstract environments, with and without copyright info
\renewenvironment{abstract}{\vskip1pc\noindent\textbf{Abstract:\space}}{\\[12pt]\noindent{\fontsize{8pt}{9pt}\copyright\, \number\year \hskip.05in\@copyrighttext}\par\vskip12pt}

\newenvironment{abstract*}{\vskip1pc\noindent\textbf{{Abstract:}\space}}{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[5]] HEADER AND FOOTER

\pagestyle{fancy}          % Enables the custom headers/footers
%   \lhead{}  \chead{}  \rhead{}
%   \lfoot{}  \cfoot{}  \rfoot{}
\fancyhf{}                 % Clear everything first
\renewcommand{\headrule}{}

% Journal like Header
\newcommand{\@setheadertopright}{\today} % default, can change via \setheadertopright{}
\newcommand{\setheadertopright}[1]{\def\@setheadertopright{#1}}

\newcommand{\@setheadertopleft}{Notes}  % default, can change \via setheadertopleft{}
\newcommand{\setheadertopleft}[1]{\def\@setheadertopleft{#1}}

% Header bar setup
\fancyhead[L]{\headerfont \begin{tabular*}{\textwidth}{!{\color{black}\vrule}c!{\color{black}\vrule} @{\extracolsep{\fill}} c!{\color{black}}}\arrayrulecolor{black}
      % \hline
      \cellcolor{black}\textcolor{white}{\@setheadertopleft} & \@setheadertopright\hspace{21pt}\thepage \\
      \hline
    \end{tabular*}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[6]] TABLE STYLE

\arrayrulecolor{black} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.1} % array spacing


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% [[7]] SECTION PARAMETERS

%% Authors may now use \cite \ref for section numbers
\renewcommand\@seccntformat[1]{\csname the#1\endcsname\quad }
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}

% Section headings take less room than normal.
\renewcommand\section{\@startsection {section}{1}{0pt}
                                     {-2.5ex plus -1ex minus -.2ex}%
                                     {1.3ex plus .2ex}%
                                     {\large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{0pt}%
                                     {-2.25ex plus -1ex minus -.2ex}%
                                     {1ex plus .2ex}%
                                     {\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{0pt}%
                                     {-2.25ex plus -1ex minus -.2ex}%
                                     {1ex plus .2ex}%
                                     {\normalsize\bfseries}}

