%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Shervin Sahba LaTeX article class and style sheet.
%% Loosely based on OSA Journal style sheet shervin_article.cls
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shervin_article}

\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES - FORMATTING, LAYOUT, GRAPHICS, ETC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% LAYOUT
\usepackage[letterpaper]{geometry}  % to set page geometry
\usepackage{fancyhdr}               % custom headers/footers
\usepackage{lastpage}               % Number of pages in the document
\usepackage{array}                  % enables arrays

%% FIGURES
\usepackage{float}                  % allows H option in \begin{figure}[H] to force here.

%% GRAPHICS
\usepackage{graphicx}               % enhanced graphics support 

%% TABLES
\usepackage[table]{xcolor}          %   
\usepackage{booktabs}

%% FONT PACKAGES
\usepackage{silence}
\WarningFilter{microtype}{Font}
\usepackage[T1]{fontenc}
% \usepackage{newtxtext,newtxmath,courier}
\usepackage{helvet}
\usepackage{ifpdf}  % letterspacing with latex + dvipdf, so need the soul package. See http://tex.stackexchange.com/a/271714/226
\ifpdf
  \usepackage[tracking = true, letterspace = 16]{microtype}
\else
  \usepackage{microtype}
  \usepackage{soul}
  \soulregister\hspace7
  \sodef\lscaps{}{.1em}{.4em plus.08em minus.06em}{.4em plus.15em minus.83em}%
  \sodef\lsbold{}{.02em}{.3em plus.08em minus.06em}{.3em plus.15em minus.83em}%
\fi

%% TEXT FORMATTING PACKAGES
\usepackage{verbatim} % \begin{comment} %\begin{verbatim}
\usepackage{fancyvrb} % addon for verbatim?
\usepackage{bm}       %\bm{} bold command
\usepackage{siunitx}  % SI units

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page-layout commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright\textls{#1}\par\vskip.15in}
  }
\else
  \newcommand\OEtitle[1]{%
    {\fontsize{16pt}{18.5pt}\sffamily\bfseries\selectfont\raggedright\lsbold{#1}\par\vskip.15in}
  }
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

% Copyright
\def\@copyrighttext{}
\newcommand{\setcopyright}[1]{\gdef\@copyrighttext{#1}}
\setcopyright{Shervin Sahba}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Abstract environments, with and without copyright info
\renewenvironment{abstract}{\vskip1pc\noindent\textbf{Abstract:\space}}{\\[12pt]\noindent{\fontsize{8pt}{9pt}\sffamily\copyright\, \number\year \hskip.05in\@copyrighttext}\par\vskip12pt}
\newenvironment{abstract*}{\vskip1pc\noindent\textbf{\textsf{Abstract:}\space}}{}



% BOXER - draws a box around whatever you put in it
\newenvironment{boxer}
    {\begin{center}
    \begin{tabular}{|p{0.9\textwidth}|}
    \hline
    \smallskip
    }
    { 
  \\\hline
    \end{tabular} 
    \end{center}
    }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Headers and footers setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\arrayrulecolor{black} % Set the color of the horizontal rules
\renewcommand{\arraystretch}{1.5} % Increased line spacing

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %% New caption commands
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% New section parameters 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES - MATH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{amsmath}  
\let\openbox\relax
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{mathtools} % for \Aboxed{}

\usepackage{physics}  
            %\bra{} \ket{} \expval{}{}
            %commutator{}{}     
            %anticommutator{}{}
            % % reminder on derivates
            % \dv{Q}{t} = \dv{s}{t}  \quad
            % \dv[n]{Q}{t} = \dv[n]{s}{t}  \quad
            % \pdv{Q}{t} = \pdv{s}{t}  \quad
            % \pdv[n]{Q}{t} = \pdv[n]{s}{t}  \quad
            % \pdv{Q}{x}{t} = \pdv{s}{x}{t}  \quad

\usepackage[makeroom]{cancel}
            %\cancel{} \bcancel{}
            %\xcancel \cancelto{val}{}  

\usepackage{tensor}   
            %\indices and \tensor command
            %e.g. M\indices{^a_b^{cd}} gives M with raised a, lowered b, raised cd, in order.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACKAGES - CODE MARKUP LISTINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[ruled,vlined]{algorithm2e}    % for cool looking algorithm tables

\usepackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\usepackage{listings}              %  code listing: https://en.wikibooks.org/wiki/LaTeX/Source_Code_Listings
% Basic shared code listing settings
\lstset{ 
  basicstyle=\ttfamily             % the size/style of the fonts that are used for the code
    \lst@ifdisplaystyle\footnotesize\fi,  %switch to footnotesize font for display code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  stringstyle=\color{mauve},       % string literal style
  commentstyle=\color{dkgreen},    % comment style
  keywordstyle=\color{blue},       % keyword style
  morekeywords={*,...},            % if you want to add more keywords to the set
  deletekeywords={...},            % if you want to delete keywords from the given language
  escapeinside={\%*}{*},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  firstnumber=1,                   % start line enumeration with line 1000
  frame=L,                         % adds a frame around the code, L=double left bar
  framesep=\fboxsep,
  framerule=\fboxrule,
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  columns=flexible,
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=1.5em,                 % how far the line-numbers are from the code
  numberstyle=\tiny\color{gray},   % the style that is used for the line-numbers
  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  tabsize=2,                       % sets default tabsize to 2 spaces
  % title=\lstname,                  % show the filename of files included with \lstinputlisting; also try caption instead of title
  xleftmargin=\dimexpr\fboxsep+\fboxrule\relax,
  xrightmargin=\dimexpr\fboxsep+\fboxrule\relax,
  backgroundcolor=\color{cyan!3}   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
}


\newcommand{\inlinecode}[1]{\colorbox{gray!10}{\lstinline{#1}}}


% Python Style
\lstdefinestyle{python}{
    language={Python},
    % basicstyle=\small\tt,
    commentstyle=\color[rgb]{0.13,0.54,0.13},
    morekeywords={
        Console,  
        WriteLine,
        int,
    },
}
\lstnewenvironment{python}
{\lstset{style=python}}
{}


% Matlab Style
\lstdefinestyle{matlab}{
    language={matlab},
    commentstyle=\color[rgb]{0.13,0.54,0.13},
    morekeywords={
        Console,  
        WriteLine,
        int,
    },
}
\lstnewenvironment{matlab}
{\lstset{style=matlab}}
{}


% % MATLAB style alternate, use a different package
% \usepackage[numbered,framed]{matlab-prettifier} % https://tex.stackexchange.com/questions/75116/what-can-i-use-to-typeset-matlab-code-in-my-document
% \usepackage{filecontents}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MACROS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% MATH SYMBOLS AND OBJECTS

\newcommand{\twonorm}[1]{\norm{#1}_2^2}     % twonorm squared
\renewcommand{\vec}[1]{\boldsymbol{#1}}     % vector
\newcommand{\uvec}[1]{\vec{\hat{#1}}}       % unit vector
\newcommand{\mat}[1]{\boldsymbol{#1}}       % matrix
\newcommand{\T}{^{\textrm T}}               % transpose
\newcommand{\cst}[1]{\mathsf{#1}}           % constant
\newcommand{\indicator}[1]{\mathbf{1}\left\{#1\right\}} % indicator function
\def\E{\mathbb{E}}    % expectation
\def\P{\mathbb{P}}    % probability
\def\R{\mathbb{R}}    % reals

%% LONG DASHES GOOD FOR MATRIX OF VECTORS
% \makeatletter
% \newcommand{\longdash}[1][2em]{%
%   \makebox[#1]{$\m@th\smash-\mkern-7mu\cleaders\hbox{$\mkern-2mu\smash-\mkern-2mu$}\hfill\mkern-7mu\smash-$}}
% \makeatother
% \newcommand{\omitskip}{\kern-\arraycolsep}
% \newcommand{\llongdash}[1][2em]{\longdash[#1]\omitskip}
% \newcommand{\rlongdash}[1][2em]{\omitskip\longdash[#1]}

%% QUANTUM SYMBOLS

\newcommand{\bk}[3][]{\bra{#2}#1\ket{#3}}       % braket
\newcommand{\kb}[2]{\ket{#1}\bra{#2}}           % ketbra
\newcommand{\com}[2]{\commutator{#1}{#2}}       % commutator
\newcommand{\acom}[2]{\anticommutator{#1}{#2}}  % anticommutator
\newcommand{\exv}[1]{\expval{#1}}               % expectation value (physics)


%% ABBREVIATIONS FOR MATH COMMANDS

\newcommand{\mb}[1]{\mathbf{#1}}  % quick math bold
\newcommand{\mc}[1]{\mathcal{#1}} % quick math caligraphic
\newcommand{\lp}{\left}           % quick \left
\newcommand{\rp}{\right}          % quick \right
\newcommand{\idx}{\indices}       % quick \indices


%% MISC

\newcommand{\todo}[1]{\text{\color{red}{TODO #1}}}            % RED TODO FLAG
\newcommand{\tagg}{\stepcounter{equation}\tag{\theequation}}  % add a Eq. (tag)



%% MORE MACROS... DO I NEED THESE MACROS?

\newcommand{\trix}[5][p]{\begin{#1matrix} #2 & #3 \\ #4 & #5\end{#1matrix}} %2x2 matrices
\newcommand{\trixx}[9]{\begin{pmatrix} #1 & #2 & #3 \\ #4 & #5 & #6 \\ #7 & #8 & #9\end{pmatrix}} % 3x3 matrices
\newcommand{\diag}[1]{\operatorname{diag}\lp(#1\rp)}
\newcommand{\dash}{\rule[.5ex]{1.5em}{0.4pt}}
%change vector command to bolded vectors
%\renewcommand{\vec}[1]{\bm{#1}}
% \let\oldhat\hat
%\renewcommand{\hat}[1]{\oldhat{\mathbf{#1}}}
% \renewcommand\arraystretch{1.2}
\delimitershortfall-1sp

%inline image character
% inline image!
\newcommand{\mychar}[1]{%
  \begingroup\normalfont
  \includegraphics[height=\fontcharht\font`\B]{#1}%
  \endgroup
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AUTOMATIC LEFT AND RIGHT FOR PARENTHESIS
% https://tex.stackexchange.com/questions/31526/macro-for-left-and-right/58641
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% \usepackage{mleftright}  % \mleft and \mright fix some spacing issues
% can change \left to \mleft below and so on

\makeatletter
\def\resetMathstrut@{%
  \setbox\z@\hbox{%
    \mathchardef\@tempa\mathcode`\[\relax
    \def\@tempb##1"##2##3{\the\textfont"##3\char"}%
    \expandafter\@tempb\meaning\@tempa \relax
  }%
  \ht\Mathstrutbox@\ht\z@ \dp\Mathstrutbox@\dp\z@}
\makeatother
\begingroup
  \catcode`(\active \xdef({\left\string(}    % 
  \catcode`)\active \xdef){\right\string)}   % 
\endgroup
\mathcode`(="8000 \mathcode`)="8000