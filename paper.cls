\ProvidesClass{paper}
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

\RequirePackage[margin=2cm]{geometry}

\RequirePackage{hyperref}
\hypersetup{
  pdfborder = {0 0 0},
  hyperfootnotes = true,
  colorlinks = true,
  linkcolor = linkred,
  urlcolor = blue!70!black,
  filecolor = winered,
  citecolor = winered,
	pdftitle={本科毕业论文文献翻译},
	pdfsubject={doi.org/10/dr2w2q},
	pdfauthor={任涛},
	pdfkeywords={Translation},
}
\urlstyle{rm}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\chead{\footnotesize{\textit{M.D. Eriksen, S.S. Rosenthal / Journal of Public Economics 94 (2010) 953\,–966}}}
\lhead{}
\rhead{}
\cfoot{\zihao{5} \thepage}
\renewcommand{\headrulewidth}{0.3pt}

\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{indentfirst}
\RequirePackage{booktabs}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{linegoal}
\RequirePackage{graphicx}
\RequirePackage{fancyvrb}
\RequirePackage{abstract}
\RequirePackage{hologo}
\RequirePackage{threeparttable}
\RequirePackage{subfigure}
\RequirePackage{fontawesome}

\linespread{1.3}
\graphicspath{{images/}{figures/}{fig/}{img/}}

% caption settings 
\RequirePackage[font=footnotesize,labelfont={bf}]{caption}
\captionsetup[table]{skip=3pt}
\captionsetup[figure]{skip=3pt}

\RequirePackage[round,sort&compress]{natbib}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\footnotesize}
\bibliographystyle{plainnat}

% define the hyperref color 
\RequirePackage{xcolor}
\definecolor{winered}{rgb}{0.5,0,0}
\definecolor{linkred}{rgb}{.5,0,.5}

% add the email cmd 
\newcommand\email[1]{\href{mailto:#1}{#1}}

\ifdefstring{\ELEGANT@lang}{cn}{%
  \RequirePackage[UTF8, scheme=plain]{ctex}
}{\relax}
\setCJKmainfont[BoldFont = SourceHanSerifSC-Bold]
        {SourceHanSerifSC-Regular} % 全局中文字体为思源宋体和楷体

\RequirePackage{libertine}
\RequirePackage[libertine]{newtxmath}
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
  \renewcommand{\theequation}{\arabic{section}.\arabic{equation}} % 公式按 section 编号
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

\usepackage{scrextend}
\deffootnote[1em]{0em}{1em}{\textsuperscript{\thefootnotemark}\,}