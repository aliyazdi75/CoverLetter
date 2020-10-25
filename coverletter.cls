% !TEX TS-program = xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% coverletter.tex
%% <https://github.com/aliyazdi75/CoverLetter>
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{coverletter}[2020/10/25 Cover Letter https://github.com/aliyazdi75/CoverLetter]

\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{letterpaper}{\PassOptionsToClass{\CurrentOption}{article}}

% Run in non-stop mode.
\DeclareOption{nonstopmode}{\nonstopmode}

% Draft mode.
\newcommand{\TypesetInDraftMode}{0}
\DeclareOption{draftmode}{\renewcommand{\TypesetInDraftMode}{1}}

\ProcessOptions\relax

% Use article class as the base class.
\LoadClass[10pt,oneside]{article}

% Geometry package for page margins.
\RequirePackage[
left=0.70in,
right=0.70in,
top=0.60in,
bottom=0.45in,
nohead,
includefoot]{geometry}

% PDF settings and properties.
\RequirePackage{hyperref}

% Hyphenation: Disabled.
\RequirePackage[none]{hyphenat}

% Colors.
\RequirePackage[usenames]{color}
% \definecolor{MyDarkBlue}{RGB}{0,90,160}
% {\color{MyDarkBlue}This text is dark blue}

% Current date and time.
\RequirePackage{datetime2}

% Timestamp.
\newcommand{\Timestamp}{{\DTMnow}}

% XeLaTeX packages.
\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures=TeX}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}

% Font: Use "Tinos" as the main typeface (\textnormal{}, \normalfont).
% The "Tinos" fonts are released under the Apache License Version 2.0,
% and can be downloaded for free at <http://www.fontsquirrel.com/fonts/tinos>.
% Symbol table: <http://www.fileformat.info/info/unicode/font/tinos/grid.htm>
\setmainfont
[Path=./Fonts/Tinos/,
ItalicFont=Tinos-Italic,
BoldFont=Tinos-Bold,
BoldItalicFont=Tinos-BoldItalic]
{Tinos-Regular.ttf}

% Secondary font: "GNU FreeFont".
% The "GNU FreeFont" fonts are released under the
% GNU General Public License Version 3, and can be downloaded
% for free at <https://savannah.gnu.org/projects/freefont/>.
\newcommand{\UseSecondaryFont}{\fontspec
[Path=./Fonts/GNUFreeFont/,
ItalicFont=FreeSerifItalic,
BoldFont=FreeSerifBold,
BoldItalicFont=FreeSerifBoldItalic]
{FreeSerif.otf}}

% Sans-serif font: Changed to "Tinos".
\renewcommand{\sffamily}{\rmfamily}

% Typewriter (monospace) font: Changed to "Tinos".
\renewcommand{\ttfamily}{\rmfamily}

% Small caps font: Changed to "Tinos".
\renewcommand{\scshape}{\rmfamily}
%\renewcommand{\textsc}[1]{\textbf{\MakeUppercase{#1}}}

% Font styles.
\newcommand{\UseTitleFont}{\UseSecondaryFont\fontsize{20pt}{33.6pt}\selectfont\bfseries}
\newcommand{\UseSubTitleFont}{\normalfont\fontsize{8.6pt}{10.3pt}\selectfont}
\newcommand{\UseCompanyFont}{\normalfont\fontsize{13pt}{15pt}\selectfont\bfseries}
\newcommand{\UseDetailFont}{\normalfont\fontsize{12pt}{14pt}\selectfont}

% Symbols (Unicode).
% See: https://unicode-table.com/en/
\newcommand{\BulletSymbol}{{\normalfont\fontsize{6.5}{7.8}\selectfont\raisebox{0.17em}{\char"25A0}}}
\newcommand{\SubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CF}}}
\newcommand{\SubSubBulletSymbol}{{\normalfont\fontsize{6}{7.2}\selectfont\raisebox{0.17em}{\char"25CB}}}
\newcommand{\TildeSymbol}{{\normalfont\char"007E}}

% Headers and footers: Blank header, page number in footer.
\AtEndDocument{\null\label{LastPage}}
\newcommand{\PageKOfN}{{\UseHeaderFooterFont{Page}~\thepage~of~\pageref{LastPage}}}
\newcommand{\DraftStamp}{{\UseHeaderFooterFont\color{red}DRAFT~\Timestamp}}

\ifnum\TypesetInDraftMode=0
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{}
\else
\newcommand{\HeaderText}{}
\newcommand{\FooterText}{\null\hphantom{\DraftStamp}\hfill%
\PageKOfN\hfill%
\DraftStamp\null}
\fi

\def\ps@plain{%
\def\@oddhead{\HeaderText}%
\def\@evenhead{\HeaderText}%
\def\@oddfoot{\FooterText}%
\def\@evenfoot{\FooterText}}

\pagestyle{plain}

% Paragraph style.
\setlength{\parindent}{0in} % No indentation at the beginning of each paragraph.
\setlength{\parskip}{0in} % No vertical space between paragraphs

% Macro: BigGap (big vertical gap between items in the same section).
\newcommand{\BigGap}{\par\vspace{4mm}\par}

% Footnotes: Use symbols instead of numbers for labels.
\renewcommand{\thefootnote}{\fnsymbol{footnote}}

% Macro: Title (name).
\newcommand{\Title}[1]{%
\par\pdfbookmark[1]{#1}{#1}%
\begingroup%
\UseTitleFont\UseSecondaryFont\textsc{#1}%
\par\endgroup\par}

% Macro: SubTitle (personal information below name).
\newenvironment{SubTitle}
{\par\vspace{0.25\baselineskip}%
\begingroup%
\UseSubTitleFont}
{\par\endgroup\par}

% Cover Letter
\newcommand{\companyname}[1]{\raggedright\UseCompanyFont\selectfont {#1 \\} \normalfont}

\newcommand{\companyaddress}[1]{\raggedright\UseDetailFont\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

% Letter content command
\newcommand{\lettercontent}[1]{\raggedright\UseDetailFont\selectfont {#1 \\}\mbox{}\\ \normalfont}

\newcommand{\closing}[1]{\raggedright\UseDetailFont\selectfont {#1 \\}\mbox{}\\\mbox{}\\ \normalfont}

\newcommand{\signature}[1]{\raggedright\UseDetailFont\selectfont {#1 \\} \normalfont}

% End of class file.
\endinput