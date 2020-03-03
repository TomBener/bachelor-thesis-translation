% Author: Dongsheng Deng
% Homepage: https://ddswhu.me/
% Email: elegantlatex2e@gmail.com
% Lastest Version: https://github.com/ElegantLaTeX/ElegantPaper

% --- Class structure: identification part
\ProvidesClass{elegantpaper}[2019/10/17 v0.08 ElegantLaTeX Paper class]
\NeedsTeXFormat{LaTeX2e} 

\RequirePackage{kvoptions}
\RequirePackage{ifthen}
\RequirePackage{ifxetex}
\RequirePackage{etoolbox}
\RequirePackage{calc}
\RequirePackage{tcolorbox}

\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}

\DeclareStringOption[cn]{lang}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% settings for the hyperref and geometry
\RequirePackage[
  margin=2cm,
  headheight=0pt,
  headsep=0pt]{geometry}
\setlength{\headsep}{5pt}

\RequirePackage{hyperref}
\hypersetup{
  pdfborder = {0 0 0},
  hyperfootnotes = true,
  colorlinks = true,
  linkcolor = blue,
  urlcolor = winered,
  filecolor = winered,
  citecolor = winered,
  linktoc=all,
	%pdfproducer={},
	%pdfcreator={LaTeX with myart class},
	pdftitle={本科毕业论文文献翻译},
	pdfsubject={https://www.sciencedirect.com/science/article/pii/S0047272710000885},
	pdfauthor={任涛},
	pdfkeywords={Translation},
}
\urlstyle{rm}

\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{linegoal}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{abstract}
\RequirePackage{hologo}

\linespread{1.35}
\graphicspath{{image/}{figure/}{fig/}{img/}}

% caption settings 
\RequirePackage[font=small,labelfont={bf}]{caption}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

% list/itemize/enumerate setting
\RequirePackage[shortlabels,inline]{enumitem}
\setlist{nolistsep}

\RequirePackage[round,comma,sort&compress]{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}
\bibliographystyle{plainnat}

% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{lightgrey}{rgb}{0.95,0.95,0.95}
\definecolor{commentcolor}{RGB}{0,100,0}
\definecolor{frenchplum}{RGB}{190,20,83}


% add the email cmd 
\newcommand\email[1]{\href{mailto:#1}{#1}}

% font settings
\PassOptionsToPackage{no-math}{fontspec}

\ifdefstring{\ELEGANT@lang}{cn}{%
  \RequirePackage[UTF8, scheme=plain]{ctex}
  %\AfterEndPreamble{\renewcommand{\itshape}{\kaishu}}
}{\relax}
\setCJKmainfont[BoldFont = SourceHanSerifSC-Bold,
        %ItalicFont = KaiTi
        ]
        {SourceHanSerifSC-Regular} % 全局中文字体为思源宋体和楷体

% newtxtext and newtxmath pkg
\RequirePackage{libertine}
%\RequirePackage{newtxtext}
\RequirePackage{newtxmath}
\RequirePackage{esint}

\ifxetex
  \RequirePackage{fontenc}
\else
  \RequirePackage[T1]{fontenc}
  \AtEndOfClass{%
    \RequirePackage{microtype}}
\fi

\DeclareSymbolFont{CMlargesymbols}{OMX}{cmex}{m}{n}
\let\sumop\relax\let\prodop\relax
\DeclareMathSymbol{\sumop}{\mathop}{CMlargesymbols}{"50}
\DeclareMathSymbol{\prodop}{\mathop}{CMlargesymbols}{"51}

\ifdefstring{\ELEGANT@lang}{cn}{
  \theoremstyle{plain}% default
  \newtheorem{theorem}{定理}[section] %
  \newtheorem{lemma}[theorem]{引理} %
  \newtheorem{proposition}[theorem]{命题} %
  \newtheorem*{corollary}{推论} %
  \theoremstyle{definition} %
  \newtheorem{definition}{定义}[section] %
  \newtheorem{conjecture}{猜想}[section] %
  \newtheorem{example}{例}[section] %
  \theoremstyle{remark} %
  \newtheorem*{remark}{\normalfont\bfseries 评论} %
  \newtheorem*{note}{\normalfont\bfseries 注} %
  \newtheorem{case}{\normalfont\bfseries 案例} %
  \renewcommand*{\proofname}{\normalfont\bfseries 证明} %
  \renewcommand\contentsname{目录}
  \renewcommand\refname{参考文献} %
  \renewcommand\figurename{图} %
  \renewcommand\tablename{表}%
  \newcommand\versiontext{版本：}%
  \newcommand\updatetext{}%
  \renewcommand\abstractname{摘\hspace{1em}要}
  \setlength\parindent{2\ccwd}
  \renewcommand{\abstracttextfont}{\small\upshape\kaishu\noindent\ignorespaces}
  \newcommand{\keywords}[1]{\vskip2ex\par\noindent\normalfont{\bfseries 关键词: } #1}
  \newcommand\figref[1]{{图~\ref{#1}~}}
  \newcommand\tabref[1]{{表~\ref{#1}~}}
}{\relax}

\AtBeginEnvironment{verbatim}{\microtypesetup{activate=false}}
\BeforeBeginEnvironment{tabular}{\small}
\AfterEndEnvironment{tabular}{}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{3pt}
  \setlength{\belowdisplayskip}{3pt}
  \setlength{\footnotesep}{12pt}
}

\def\IfEmpty#1{%
  \edef\1{\the#1}
  \ifx\1\empty
}
\newtoks\version
\newtoks\translator

\def\@maketitle{%
  \newpage
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE\bfseries \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author\\[1.5ex]
      \end{tabular}\par}
      \small\the\translator%
\vskip 0.5ex%
\IfEmpty\version
\else 
{\small\normalfont\itshape\versiontext\the\version}
\fi
\ifx\@date\empty
\else
\vskip 0.1em%
 {\small\normalfont\kaishu\updatetext\@date}%
\fi
  \end{center}%
  \par
}

\usepackage{appendix}
\renewcommand{\appendixtocname}{附录}
\renewcommand{\appendixpagename}{附录}