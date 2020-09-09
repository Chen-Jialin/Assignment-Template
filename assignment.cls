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

% 数学公式 Mathematical equations
\RequirePackage{amsmath, amssymb, amsthm, bm} % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗 Basic math support, special math symbols, theorem custom, bold in equation
\allowdisplaybreaks[4]% 公式跨页 Cross-page equations

% 图片 Figures
\RequirePackage{graphicx} % 图片 Graphics
\RequirePackage{float} % 强制设定图片位置 Set the positions of figures mandatorily
\RequirePackage{subfigure} % figure环境中子图 Subfigures in the figure environment

% 表格 Tables
\RequirePackage{multirow} % 表内多行单元格合并 Tables with merged multi-row cells
\RequirePackage{booktabs} % 三线表 Three-line tables
\RequirePackage{longtable} % 表格跨页 Cross-page tables

% 化学式 Chemstry formulas
\RequirePackage[version=4]{mhchem} % 基础化学式 Basic chemistry equations
\RequirePackage{chemfig} % 化学结构式 Chemistry structural formulas

\RequirePackage{listings} % 程序代码 Program code

% 其他 Others
\RequirePackage{ulem} % 各式下划线和删除标记 Various underlines & deletion notes

% 自定义页眉、页脚、题目和题解
\pagestyle{fancy}% 全局页眉和页脚风格 Global header and footer style
\fancyhf{}% 清除预设的页眉和页脚 Clear the default header and foot
% #1 风格：缺省 - 中文风格；星号（*）- 英文风格 Style, default - Chinese style; star sign (*) - English style
% #2 课程名称 Course name
% #3 课程代码 Course code
% #4 学期 Semeter
% #5 项目标题 Project title
% #6 项目副标题或补充信息 Project subtitle / supplementary information
% #7 姓名 Student name
% #8 学号 Student ID
\NewDocumentCommand{\ProjectInfos}{ s m m m m m m m }
{
    \fancyhead[L]{#2}
    \fancyhead[C]{#5}
    \fancyhead[R]{#7}
    \setlength\headheight{14pt} % 页眉高 The height of the header
    \fancypagestyle{FirstPage} % 首页风格 First page style
    {
        \fancyhf{}
        \fancyhead[L]{#2\\
            #3\\
            #4}
        \fancyhead[C]{{\Huge\bfseries#5}\\
            #6}
        \setlength\headheight{38pt}
        \IfBooleanTF{#1}
        { % Star note (*) - English style first page header, problem and solution
            \fancyhead[R]{Name : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#7}\\
                Student ID : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#8}\\
                Grade : \underline{\makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{}}}
        }
        { % 无星号（*）- 中文风格首页页眉、题目和题解
            \fancyhead[R]{姓名 : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#7}\\
                学号 : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#8}\\
                成绩 : \underline{\makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{}}}
        }
        \fancyfoot[R]{\thepage\ / \pageref{LastPage}}
    }
    \thispagestyle{FirstPage}
}
\fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右: <当前页码> / <总页数> The right of the footer: <current page number> / <total page number>

\newtheoremstyle{Problem}% 定理风格名称
{}% 定理上方空间尺寸，留空为默认
{}% 定理下方空间尺寸，留空为默认
{}% 定理主体字体
{}% 定理缩进量
{\bfseries}% 定理开头字体
{.}% 定理开头后所接标点
{ }% 定理开头后所接空间尺寸，空格为默认词间距
{第\thmnumber{ #2}\thmname{ #1}\thmnote{ (#3)} 得分: \underline{\qquad\qquad}}% 定理开头格式，留空为默认
\theoremstyle{Problem}% 设定定理风格
\newtheorem{ti}{题}
\newtheorem{prob}{Problem}% 题目
\newtheoremstyle{Solution}% 定理风格名称
{}% 定理上方空间尺寸，留空为默认
{}% 定理下方空间尺寸，留空为默认
{}% 定理主体文本字体
{}% 定理缩进量
{\bfseries}% 定理开头字体
{:}% 定理开头后所接标点
{ }% 定理开头后所接空间尺寸，空格为默认词间距
{\thmname{#1}}% 定理开头格式
\makeatletter
\def\@endtheorem{\qed\endtrivlist\@endpefalse}% 题解后添加qed符号（黑色空心小正方形）
\makeatother
\theoremstyle{Solution}% 设定定理风格
\newtheorem*{jie}{解} % 中文风格题解
\newtheorem*{zheng}{证} % 中文风格证明
\newtheorem*{sol}{Solution}% 题解

\lstset{language=[95]Fortran,
numbers=left,
frame=single,
breaklines=true,
showtabs=true,
tab=\rightarrowfill}