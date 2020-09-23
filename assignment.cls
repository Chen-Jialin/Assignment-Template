\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2020/09/08 Class for assignments]

%% Load class
\LoadClass[a4paper, 10pt]{article} % Load article class with A4 paper and 10pt font

%% Call packages
\RequirePackage[UTF8]{ctex} % 中文支持 Chinese support

\RequirePackage[vmargin=1in,hmargin=.5in]{geometry} % 页边距 Page margin

% 自定义页眉和页脚 Header and footer customization
\RequirePackage{fancyhdr} % 页眉和页脚 Header & footer
\usepackage{xparse} % 多可选参数的自定义命令 Newcommand with multiple optional arguements
\RequirePackage{lastpage} % 返回末页页码 Return the page number of the last page
\RequirePackage{calc} % 返回文本宽度 Return the width of the text

% 数学公式 Mathematical equations
\RequirePackage{amsmath, amssymb, amsthm, bm} % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗 Basic math support, special math symbols, theorem custom, bold in equation
\usepackage{mathrsfs} % 公式内花体字母 Non-CM calligraphic letters in equations
\usepackage{esint} % 特殊积分号 Special integral signs

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
\RequirePackage{hyperref} % 超链接 Hyperlink

\providecommand{\UsingEnglish}{\ctexset{today={old},contentsname={Content}, listfigurename={Figure List}, listtablename={Table List}, figurename={Figure}, tablename={Table}, abstractname={Abstract}, indexname={Index}, appendixname={Appendix}, bibname={References}, proofname={Proof}}} % 阻止ctex宏包过度汉化 Suppress excessive chinesization by ctex package

% 页眉和页脚 Header & footer
\pagestyle{fancy} % 全局页眉和页脚风格 Global header and footer style
\fancyhf{} % 清除预设的页眉和页脚 Clear default header and footer
% #1 风格：缺省 - 中文风格；星号（*）- 英文风格 Style: default - Chinese style; star sign (*) - English style
% #2 课程名称 Course name
% #3 课程代码 Course code
% #4 学期 Semeter
% #5 项目标题 Project title
% #6 项目副标题或补充信息 Project subtitle / supplementary information
% #7 姓名 Student name
% #8 学号 Student ID
\NewDocumentCommand{\ProjectInfos}{ s m m m m m m m }
{
    \fancyhead[L]{#2} % 页眉左 Left of the header
    \fancyhead[C]{#5} % 页眉中 Center of the header
    \fancyhead[R]{#7} % 页眉右 Right of the header
    \setlength\headheight{14pt} % 页眉高 Height of the header
    \fancypagestyle{FirstPage} % 首页页眉 First-page header
    {
        \fancyhf{} % 清除预设的页眉和页脚 Clear default header and footer
        \fancyhead[L]{#2\\
            #3\\
            #4} % 页眉左 Left of the header
        \fancyhead[C]{{\Huge\bfseries#5}\\
            #6} % 页眉中 Center of the header
        \setlength\headheight{38pt} % 页眉高 Height of the header
        \IfBooleanTF{#1}
        { % Star note (*) - English-style first-page header
            \fancyhead[R]{Name : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#7}\\
                Student ID : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#8}\\
                Grade : \underline{\makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{}}} % Right of the header
        }
        { % 无星号（*）- 中文风格首页页眉
            \fancyhead[R]{姓名 : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#7}\\
                学号 : \makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{#8}\\
                成绩 : \underline{\makebox[\maxof{\widthof{#7}}{\widthof{#8}}][s]{}}} % 页眉右
        }
        \fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右：<当前页码> / <总页数>
    }
    \thispagestyle{FirstPage} % 设置首页页眉风格为FirstPage Set header style of first page to be FirstPage
}
\fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右：<当前页码> / <总页数> The right of the footer: <current page number> / <total page number>

\allowdisplaybreaks[4] % 公式跨页 Cross-page equations
\providecommand{\abs}[1]{\left\lvert#1\right\rvert} % 绝对值 Absolute
\providecommand{\norm}[1]{\left\lVert#1\right\rVert} % 范数 Norm
\providecommand{\re}{\,\text{Re}\,} % 复数的实部 Real part of complex number
\providecommand{\im}{\,\text{Im}\,} % 复数的虚部 Imaginary part of complex number
\providecommand{\sgn}{\,\text{sgn}\,} % 符号函数 Sign function
\providecommand{\sinc}{\,\text{sinc}\,} % 辛格函数 sinc function
\providecommand{\bra}[1]{\left\langle#1\right\rvert} % 左矢 Bra
\providecommand{\ket}[1]{\left\lvert#1\right\rangle} % 右矢 Ket
\providecommand{\braket}[2]{\left\langle#1\left\vert\right.#2\right\rangle} % 右矢接左矢 Contiguous ket after bra

% 题目和题解风格 Problem and solution style
\newtheoremstyle{Ti} % 定理风格名称
{} % 定理上方空间尺寸，留空为默认
{} % 定理下方空间尺寸，留空为默认
{} % 定理主体字体
{} % 定理缩进量
{\bfseries} % 定理开头字体
{.} % 定理开头后所接标点
{ } % 定理开头后所接空间尺寸，空格为默认词间距
{第\thmnumber{ #2}\thmname{ #1}\thmnote{ (#3)} 得分: \underline{\qquad\qquad}} % 定理开头格式，留空为默认
\theoremstyle{Ti} % 设定定理风格
\newtheorem{ti}{题} % 题目

\newtheoremstyle{Problem} % Theorem style name
{} % Space above theorem, being left empty means default
{} % Space below theorem, being left empty means default
{} % Theorem body font
{} % Theorem indent amount
{\bfseries} % Theorem head font
{.} % Punctuation after theorem head
{ } % Space after theorem head, whitespace means normal interword space
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)} Score: \underline{\qquad\qquad}} % Theorem head spec, being left empty means default
\theoremstyle{Problem} % Set theorem style
\newtheorem{prob}{Problem} % Problem

\newtheoremstyle{Solution} % 定理风格名称 Theorem style name
{} % 定理上方空间尺寸，留空为默认 Space above theorem, being left empty means default
{} % 定理下方空间尺寸，留空为默认 Space below theorem, being left empty means default
{} % 定理主体文本字体 Theorem body font
{} % 定理缩进量 Theorem indent amount
{\bfseries} % 定理开头字体 Theorem head font
{:} % 定理开头后所接标点 Punctuation after theorem head
{ } % 定理开头后所接空间尺寸，空格为默认词间距 % Space after theorem head, whitespace means normal interword space
{\thmname{#1}} % 定理开头格式 Theorem head spec, being left empty means default
\makeatletter
\def\@endtheorem{\qed\endtrivlist\@endpefalse} % 题解后添加qed符号（黑色空心小正方形） % Add qed symbols (black hollow small square) to the end of solutions
\makeatother
\theoremstyle{Solution} % 设定定理风格 Set theorem style
\newtheorem*{jie}{解} % 中文风格题解
\newtheorem*{zheng}{证} % 中文风格证明
\newtheorem*{sol}{Solution} % Solution
\newtheorem*{pf}{Proof} % Proof

% 插入代码风格 Inserting code style
\lstset{numbers=left, % 在左侧添加行号 Add line numbers at left
frame=single, % 用单线框围绕代码 Enclose code with single-line frame
breaklines=true, % 自动折行 Wrap automatically
showspaces=true, % 显示空格 Show spaces
showtabs=true, % 显示制表符 Show tabs
tab=\rightarrowfill} % 用右箭头填充制表符 Fill tabs with right arrows