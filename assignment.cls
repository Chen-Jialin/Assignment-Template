\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2020/09/08 Class for notes]

% load article class
\LoadClass[10pt, a4paper]{article}

% call package
\RequirePackage[UTF8]{ctex} % Chinese support

\RequirePackage[vmargin=1in,hmargin=.5in]{geometry} % page margin

\RequirePackage{fancyhdr} % header and footer
\usepackage{xparse} % multiple optional arguement for newcommand
\RequirePackage{lastpage} % return the page number of the last page
\RequirePackage{calc} % return the width of the text

\RequirePackage{amsmath, amssymb, amsthm, bm} % basic math support, special math symbols, theorem custom, bold in equation

\RequirePackage{graphicx} % graphics
\RequirePackage{float} % set the position of figure mandatorily
\RequirePackage{subfigure} % subfigures
\RequirePackage{multirow} % tables with merged multi-row cells
\RequirePackage{booktabs} % three-line tables
\RequirePackage{longtable} % cross-page tables
\RequirePackage[version=4]{mhchem} % chemistry equations

\pagestyle{fancy}% global header and foot style
\fancyhf{}% clear the default header and foot
% #1 课程名称 Course name
% #2 课程代码 Course code
% #3 学期 Semeter
% #4 项目名称 Project name
% #5 日期和/或时间类型 Date and / or time type
% #6 日期和/或时间 Date and / or Time type
% #7 姓名 Student name
% #8 学号 Student ID
\NewDocumentCommand{\ProjectInfos}{ m m m m m m m m }{
    \fancyhead[L]{#1}
    \fancyhead[C]{#2}
    \fancyhead[R]{#3}
    \setlength\headheight{14pt}% 页眉高
    \fancypagestyle{FirstPage}{ % 第一面的风格 First page style
        \fancyhf{}
        \fancyhead[L]{#1\\
            #2\\
            #3}
        \fancyhead[C]{{\Huge\bfseries#4}\\
            #5 : #6}
        \fancyhead[R]{Name : \makebox[\widthof{#8}][s]{#7}\\
            Student ID : #8\\
            Grade : \underline{\makebox[\widthof{#8}]{}}}
        \fancyfoot[R]{\thepage\ / \pageref{LastPage}}
        \setlength\headheight{38pt}
    }
}
\fancyfoot[R]{\thepage\ / \pageref{LastPage}} % the right of the footer: <current page number> / <total page number>