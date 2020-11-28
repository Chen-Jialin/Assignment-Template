\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2020/09/08 Class for assignments]

%% Load class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper, 10pt]{article} % Load article class with A4 paper and 10pt font

%% Call packages
% 数学公式 Mathematical equations
\RequirePackage{amsmath, amssymb, amsthm, bm} % 基础数学支持, 特殊数学符号, 自定义定理, 公式内加粗 Basic math support, special math symbols, theorem custom, bold in equations
\RequirePackage{mathrsfs} % 公式内花体字母 Non-CM calligraphic letters in equations
\RequirePackage{esint} % 特殊积分号 Special integral signs

% 语言 Language
% 题目和题解风格 Problem and solution style
\DeclareOption{zh}{ % 使用中文
    \providecommand{\Name}{姓名} % 页眉右“姓名”
    \providecommand{\StudentID}{学号} % 页眉右“学号”
    \providecommand{\Grade}{成绩} % 页眉右“成绩”
    \newtheoremstyle{Problem} % 定理风格名称
    {} % 定理上方空间尺寸, 留空为默认
    {} % 定理下方空间尺寸, 留空为默认
    {} % 定理主体字体
    {} % 定理缩进量
    {\bfseries} % 定理开头字体
    {.} % 定理开头后所接标点
    { } % 定理开头后所接空间尺寸, 空格为默认词间距
    {第\thmnumber{ #2}\thmname{ #1}\thmnote{ (#3)} 得分: \underline{\qquad\qquad}} % 定理开头格式, 留空为默认
    \theoremstyle{Problem} % 设定定理风格
    \newtheorem{prob}{题} % 题目
    \providecommand{\Solution}{解} % 题解环境(sol)中的“解”
    \providecommand{\Proof}{证} % 证明环境(pf)中的“证”
}
\DeclareOption{en}{ % Using English
    \PassOptionsToPackage{scheme=plain}{ctex} % 阻止ctex宏包过度汉化 Suppress excessive chinesization by ctex package
    \providecommand{\Name}{Name} % "Name" at the right of the header
    \providecommand{\StudentID}{Student ID} % "Student ID" at the right of the header
    \providecommand{\Grade}{Grade} % "Grade" at the right of the header
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
    \providecommand{\Solution}{Solution} % "Solution" in solution environment (sol)
    \providecommand{\Proof}{Proof} % "Proof" in proof environment (pf)
}
\ProcessOptions\relax
\RequirePackage[UTF8]{ctex} % 中文支持 Chinese support

\newtheoremstyle{Solution} % 定理风格名称 Theorem style name
{} % 定理上方空间尺寸, 留空为默认 Space above theorem, being left empty means default
{} % 定理下方空间尺寸, 留空为默认 Space below theorem, being left empty means default
{} % 定理主体文本字体 Theorem body font
{} % 定理缩进量 Theorem indent amount
{\bfseries} % 定理开头字体 Theorem head font
{:} % 定理开头后所接标点 Punctuation after theorem head
{ } % 定理开头后所接空间尺寸, 空格为默认词间距 % Space after theorem head, whitespace means normal interword space
{\thmname{#1}} % 定理开头格式 Theorem head spec, being left empty means default
\makeatletter
\def\@endtheorem{\qed\endtrivlist\@endpefalse} % 题解后添加qed符号(黑色空心小正方形) % Add qed symbols (black hollow small square) to the end of solutions
\makeatother
\theoremstyle{Solution} % 设定定理风格 Set theorem style
\newtheorem*{sol}{\Solution} % 题解 Solution
\newtheorem*{pf}{\Proof} % 证明 Proof

\RequirePackage[vmargin=1in,hmargin=.5in]{geometry} % 页边距 Page margin

% 自定义页眉和页脚 Header and footer customization
\RequirePackage{fancyhdr} % 页眉和页脚 Header & footer
\RequirePackage{xparse} % 多可选参数的自定义命令 Newcommand with multiple optional arguements
\RequirePackage{lastpage} % 返回末页页码 Return the page number of the last page
\RequirePackage{calc} % 返回文本宽度 Return the width of the text

% 图片 Figures
\RequirePackage{graphicx} % 图片 Graphics
\RequirePackage{float} % 强制设定图片位置 Set the positions of figures mandatorily
\RequirePackage{subfigure} % figure环境中子图 Subfigures in the figure environment

% 表格 Tables
\RequirePackage{multirow} % 表内多行单元格合并 Tables with merged multi-row cells
\RequirePackage{booktabs} % 三线表 Three-line tables
\RequirePackage{longtable} % 表格跨页 Cross-page tables
\RequirePackage{lscape} % 横排表格 Landscape tables
\RequirePackage{diagbox} % 对角线分割单元格 Cells saperated by diagonal lines

% 化学式 Chemstry formulas
\RequirePackage[version=4]{mhchem} % 基础化学式 Basic chemistry equations
\RequirePackage{chemfig} % 化学结构式 Chemistry structural formulas

\RequirePackage{listings} % 程序代码 Program code

% 其他 Others
\RequirePackage{ulem} % 各式下划线和删除标记 Various underlines & deletion notes
\normalem % 避免将意大利斜体(\emph或\em)替换为下划线 Avoiding replacing italics (\emph or \em) with underlines
\RequirePackage{color} % 文本颜色 Text color
\RequirePackage{hyperref} % 超链接 Hyperlink

% 页眉和页脚 Header & footer
\pagestyle{fancy} % 全局页眉和页脚风格 Global header and footer style
\fancyhf{} % 清除预设的页眉和页脚 Clear default header and footer
% #1 课程名称 Course name
% #2 课程代码 Course code
% #3 学期 Semeter
% #4 项目标题 Project title
% #5 项目副标题或补充信息 Project subtitle / supplementary information
% #6 姓名 Student name
% #7 学号 Student ID
\NewDocumentCommand{\ProjectInfos}{ m m m m m m m }
{
    \fancyhead[L]{#1} % 页眉左 The left of the header
    \fancyhead[C]{#4} % 页眉中 The center of the header
    \fancyhead[R]{#6} % 页眉右 The right of the header
    \setlength{\headheight}{14pt} % 页眉高 Height of the header
    \fancypagestyle{FirstPage} % 首页页眉 First-page header
    {
        \fancyhf{} % 清除预设的页眉和页脚 Clear default header and footer
        \setlength{\headheight}{38pt} % 页眉高 Height of the header
        \fancyhead[L]{#1\\
            #2\\
            #3} % 页眉左 The left of the header
        \fancyhead[C]{{\Huge\bfseries#4}\\
            #5} % 页眉中 The center of the header
            \fancyhead[R]{\Name{} : \makebox[\maxof{\widthof{#6}}{\widthof{#7}}][s]{#6}\\
                \StudentID{} : \makebox[\maxof{\widthof{#6}}{\widthof{#7}}][s]{#7}\\
                \Grade{} : \underline{\makebox[\maxof{\widthof{#6}}{\widthof{#7}}][s]{}}} % 页眉右 The right of the header
        \fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右: <当前页码> / <总页数> The right of the footer: <current page number> / <total page number>
    }
    \thispagestyle{FirstPage} % 设置首页页眉风格为FirstPage Set header style of the first page as FirstPage
}
\fancyfoot[R]{\thepage\ / \pageref{LastPage}} % 页脚右: <当前页码> / <总页数> The right of the footer: <current page number> / <total page number>

\allowdisplaybreaks[4] % 公式跨页 Cross-page equations
\providecommand{\abs}[1]{\left\lvert#1\right\rvert} % 绝对值 Absolute
\providecommand{\norm}[1]{\left\lVert#1\right\rVert} % 范数 Norm
\providecommand{\arcsinh}{\,\text{arcsinh}\,} % 反双曲正弦 Inverse hyperbolic sine
\providecommand{\arccosh}{\,\text{arccosh}\,} % 反双曲余弦 Inverse hyperbolic cosine
\providecommand{\arctanh}{\,\text{arctanh}\,} % 反双曲正切 Inverse hyperbolic tangent
\providecommand{\re}{\,\text{Re}\,} % 复数的实部 Real part of complex number
\providecommand{\im}{\,\text{Im}\,} % 复数的虚部 Imaginary part of complex number
\providecommand{\sgn}{\,\text{sgn}\,} % 符号函数 Sign function
\providecommand{\sinc}{\,\text{sinc}\,} % 辛格函数 Sinc function
\providecommand{\rect}{\,\text{rect}\,} % 矩形函数 Rectangular function
\providecommand{\bra}[1]{\left\langle#1\right\rvert} % 左矢 Bra
\providecommand{\ket}[1]{\left\lvert#1\right\rangle} % 右矢 Ket
\providecommand{\tr}{\,\text{Tr}\,} % 矩阵的迹 Trace of matrix

\providecommand{\muline}[1]{\text{\uline{$#1$}}} % 公式内下划线 Underlines in equations
\providecommand{\muuline}[1]{\text{\uuline{$#1$}}} % 公式内双下划线 Double underlines in equations
\providecommand{\muwave}[1]{\text{\wave{$#1$}}} % 公式内波浪下划线 Wavy underlines in equations
\providecommand{\msout}[1]{\text{\sout{$#1$}}} % 公式内删除线 Strickout in equations
\providecommand{\mxout}[1]{\text{\xout{$#1$}}} % 公式内删除标记(多条斜线) Deletion notes (multiple slash) in equations
\providecommand{\mdashuline}[1]{\text{dashuline{$#1$}}} % 公式内虚下划线 Dashed underlines in equations
\providecommand{\mdotuline}[1]{\text{\dotuline{$#1$}}} % 公式内点状虚下划线 Dotted underlines in equations

% 插入代码风格 Inserting code style
\lstset{
    numbers=left, % 在左侧添加行号 Add line numbers at left
    frame=single, % 用单线框围绕代码 Enclose code with single-line frames
    breaklines=true, % 自动折行 Wrap automatically
    showspaces=true, % 显示空格 Show spaces
    showtabs=true, % 显示制表符 Show tabs
    tab=\rightarrowfill % 用右箭头填充制表符 Fill tabs with right arrows
}