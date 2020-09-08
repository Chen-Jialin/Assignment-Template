\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2020/09/08 Class for notes]

% Load article class with A4 paper and 10pt font
\LoadClass[a4paper, 10pt]{article}

% Call packages

\RequirePackage[UTF8]{ctex} % Chinese support

\RequirePackage[vmargin=1in,hmargin=.5in]{geometry} % page margin

% 自定义页眉和页脚 Header and footer customization
\RequirePackage{fancyhdr} % 页眉和页脚 Header and footer
\usepackage{xparse} % 多可选参数的自定义命令 Newcommand with multiple optional arguements
\RequirePackage{lastpage} % 返回末页页码 Return the page number of the last page
\RequirePackage{calc} % 返回文本宽度 Return the width of the text

\pagestyle{fancy}% 全局页眉和页脚风格 Global header and footer style
\fancyhf{}% 清除预设的页眉和页脚 Clear the default header and foot
% #1 课程名称 Course name
% #2 课程代码 Course code
% #3 学期 Semeter
% #4 项目名称 Project name
% #5 日期和/或时间类型 Date and / or time type
% #6 日期和/或时间 Date and / or time
% #7 姓名 Student name
% #8 学号 Student ID
\NewDocumentCommand{\ProjectInfos}{ s m m m m m m m m }
{
    \fancyhead[L]{#2}
    \fancyhead[C]{#3}
    \fancyhead[R]{#4}
    \setlength\headheight{14pt} % 页眉高 The height of the header
    \IfBooleanTF{#1}
    {
        \fancypagestyle{FirstPage} % 首页风格 First page style
        {
            \fancyhf{}
            \fancyhead[L]{#2\\
                #3\\
                #4}
            \fancyhead[C]{{\Huge\bfseries#4}\\
                #6 : #7}
            \fancyhead[R]{姓名 : \makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{#8}\\
                学号 : \makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{#9}\\
                成绩 : \underline{\makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{}}}
            \fancyfoot[R]{\thepage\ / \pageref{LastPage}}
            \setlength\headheight{38pt}
        }
    }
    {
        \fancypagestyle{FirstPage} % 首页风格 First page style
        {
            \fancyhf{}
            \fancyhead[L]{#2\\
                #3\\
                #4}
            \fancyhead[C]{{\Huge\bfseries#4}\\
                #6 : #7}
            \fancyhead[R]{Name : \makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{#8}\\
                Student ID : \makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{#9}\\
                Grade : \underline{\makebox[\maxof{\widthof{#8}}{\widthof{#9}}][s]{}}}
            \fancyfoot[R]{\thepage\ / \pageref{LastPage}}
            \setlength\headheight{38pt}
        }
    }
    \thispagestyle{FirstPage}
}
\fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右: <当前页码> / <总页数> The right of the footer: <current page number> / <total page number>

\RequirePackage{amsmath, amssymb, amsthm, bm} % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗 Basic math support, special math symbols, theorem custom, bold in equation

% 图片 Figures
\RequirePackage{graphicx} % graphics
\RequirePackage{float} % set the position of figure mandatorily
\RequirePackage{subfigure} %  Subfigures

% 表格 Tables
\RequirePackage{multirow} % 表内多行单元格合并 Tables with merged multi-row cells
\RequirePackage{booktabs} % 三线表 Three-line tables
\RequirePackage{longtable} % 表格跨页 Cross-page tables

% 化学式 Chemstry formulas
\RequirePackage[version=4]{mhchem} % 基础化学式 Basic chemistry equations
\RequirePackage{chemfig} % 化学结构式 Chemistry structural formulas

% 其他 Others
\RequirePackage{ulem} % 各式下划线和删除标记 Various underlines & deletion notes