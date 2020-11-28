# 作业模板 Assignment Template

可爱而优雅、功能齐全而稳定的$\LaTeX$模板，适用于
- 作业
- 实验报告
- 课程项目
- 课程论文

等各种场景，支持
- 中英双语
- 数学公式
- 图表
- 化学式
- 程序代码
- 文献引用
等功能.

Cute and elegant, poly-functional and robust LaTeX template, applicable to various scenarios such as
- assignments
- experiment reports
- course projects
- course essays

It is bilingual and supporting functions including
- mathematical formulas
- figures
- tables
- chemistry formulas
- program code
- reference citing

同时支持pdf$\LaTeX$和Xe$\LaTeX$.

Both pdf$\LaTeX$ and Xe$\LaTeX$ work.

自定义题目、题解、证明环境，自定义绝对值（`\abs{}`）、左矢（`\bra{}`）、右矢（`\ket{}`）等数学、物理专业常用符号.

Customized environments of problems, solutions and proofs; customized operators common used in mathematics and physics such as absolute value (`\abs{}`), bra (`\bra{}`), ket (`\ket{}`), etc.

## 基本用法 Basic usage

#### 中文版：
0. 将类文件`assignment.cls` 与 `*.tex`文件置于同一路径下；
1. `*.tex`文件开头用`\documentclass{assignment}`调用本作业模板类；
2. 导言区用`\ProjectInfos{<课程名称>}{<课程代码>}{<学期>}{<项目名称>}{<项目副标题或补充信息>}{<姓名>}[<姓名上的超链接>]{<学号>}`设置页眉、页脚；
3. 分别用`\begin{prob}...\end{prob}`、`\begin{sol}...\end{sol}` 和 `\begin{pf}...\end{pf}`调用题目、题解、证明环境；
4. 已添加支持数学公式、图表、化学式、程序代码、文献引用等的宏包，仿照示例文件`Assignment-zh*`使用即可；
5. 用pdf$\LaTeX$或Xe$\LaTeX$编译. 因引用了末页页码，因此需连续编译两次. 如有文献引用，按照pdf$\LaTeX\rightarrow$bib$\TeX\rightarrow$pdf$\LaTeX\rightarrow$pdf$\LaTeX$ 或 Xe$\LaTeX\rightarrow$bib$\TeX\rightarrow$Xe$\LaTeX\rightarrow$Xe$\LaTeX$顺序编译.

#### English version:
0. Make sure that this class file `assignment.cls` is in the same path as `*.tex` file;
1. call the assignment template class with `\documentclass[en]{assignment}` at the beginning of `*.tex` file;
2. Set the headers and the footers with `\ProjectInfos{<Course Name>}{<Course Code>}{<Semester>}{<Project Title>}{<Project Subtitle or supplementary information>}{<Student Name>}[<Hyperlink on Student Name>]{<Student ID>}` and suppress Chinese name of figure, table, etc. with `\UsingEnglish` at the preamble region;
3. Call environments of problems, solutions and proofs with `\begin{prob}...\end{prob}`, `\begin{sol}...\end{sol}` and `\begin{pf}...\end{pf}`, respectively;
4. Packages for mathematical formulas, figures, tables, chemistry formulas, reference citing have been included. See their usages in example files `Assignment-en.*`;
5. Compile with pdf$\LaTeX$ or Xe$\LaTeX$. Need to compile for twice because of references to the page number of the last page. Compile in the order of pdf$\LaTeX\rightarrow$bib$\TeX\rightarrow$pdf$\LaTeX\rightarrow$pdf$\LaTeX$ or Xe$\LaTeX\rightarrow$bib$\TeX\rightarrow$Xe$\LaTeX\rightarrow$Xe$\LaTeX$, if there is any reference citing.

## 效果展示 Examples

![中文版效果图](Examples/AssignmentExample-Zh.jpg)

![English example](Examples/AssignmentExample-En.jpg)

## 注意 Note

文件夹`作业模板(中文版)`和`AssignmentTemplate(En-ver)`是已不再维护的旧版本.

In folder `作业模板(中文版)` and `AssignmentTemplate(En-ver)` are the old-version templates which are not maintained anymore.

## 待做 TODO

暂无.

Null for now.