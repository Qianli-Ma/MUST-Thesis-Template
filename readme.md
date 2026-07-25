
#  a $\LaTeX$ template for MUST-Thesis

[LICENSE](http://www.latex-project.org/lppl.txt)

**更新説明:**

## 2026.07.24

依据《研究生论文写作指引（2025年9月）》及计算机科学与工程学院范文格式，对模板进行以下修正：
- [x] **英文扉页改为双语范文封面**（`c.1.commTitle.sty`）：英文写作模式下扉页改为学院范文样式，顶部为「題目：」（中文，标楷体 20pt）与「Title:」（英文，Times New Roman 20pt），均为常规字重；下方为中文栏目标签（姓名／學號／學院／課程／專業／指導老師／日期），栏目数据 16pt；沿用原 `GS004en` 覆盖坐标定位，数据块整体下移，不加水印；
- [x] **中文小节标题斜体**（`b.3.setCaption.sty`）：中文 `\subsection` 由粗体改为斜体，符合规范第 4.2.5 条第三层小标题「16 标楷体、斜体」要求；
- [x] **英文扉页日期格式**（`a.1.packBase.sty`）：`\datea` 由「July 2026」改为「2026 年 7 月」（`\THEYEAR 年\THEMONTH 月`），与中文栏目一致；
- [x] **表格 colortbl 兼容性**（`a.5.packTable.sty`）：加入 `\AtBeginDocument` 保护，为 colortbl 新版本（v1.0l，TeX Live 2026）中未定义的 `\CT@row@color`／`\CT@cell@color` 等内部命令补上空定义，修正无颜色表格出现 `Undefined control sequence` 的编译错误（对使用 `\rowcolor` 等真实着色无影响）；
- [x] **参考文献样式升级为 APA 7 处理**（`apa5.bst`）：原 apalike 样式不支持 DOI 与网络资源。现作以下扩充：
  - 注册 `doi`／`url`／`urldate` 字段；新增 `format.doi`，于 `fin.entry` 中为所有条目输出 `https://doi.org/<doi>`（`doi` 字段须为裸标识符，如 `10.1002/col.20070`）；
  - DOI 优先于 URL：条目同时有 DOI 与 URL 时只输出 DOI（R-3.2）；据此 Class A（期刊／会议）条目上的出版商落地页链接（ieeexplore、sciencedirect 等）不再输出（R-3.3）；
  - URL 与访问日期仅对 `@misc` 输出（`format.url`，格式「Retrieved 〈日期〉, from \url{…}」，无 `urldate` 时仅输出网址），Class A 条目不再带 URL 或访问日期（R-2.1／R-4.1）；`@misc` 另补网站名称（`journal`）输出，符合规范第 4.1.7 条；
  - 已知限制（R-8.5）：a／b 年份后缀由「首位作者姓＋年份」自动生成，无法实现「作者列表不同则不加后缀、改以更多姓氏消歧」（R-8.2），此为 apalike 系样式固有限制，彻底修正需改用 biblatex-apa + biber。
  - 注意：须重跑 BibTeX 生成新的 `.bbl`；内容侧仍需在 `.bib` 中为 Class A 条目补齐 DOI、将纯 arXiv 条目补上刊物或改为 `@misc`、并按 R-4.3／R-4.4 决定各网络条目是否保留访问日期。
- [x] **前置部分页眉修正**（`c.4.commBody.sty`）：英文写作模式下 `\AtBeginDocument` 原将右上角页眉硬编码为「Abstract」，导致中文摘要页 (p. I) 也显示「Abstract」；且清空页眉后未恢复左上角标题，致摘要／目录／图目录／表目录等前置页缺少论文标题。现改为右上角跟随 `\leftmark`（中文摘要页显示「摘 要」、英文摘要页显示「Abstract」），并补回左上角 `\enShortTitle`，符合规范第 4.2.4 条「左上角为论文标题、右上角为本页所在章节名称」。

## 2026.06.07

依据学院论文格式规范，由 Claude Code 对模板进行以下修正：
- [x] **小节标题字体**（`b.3.setCaption.sty`）：英文 `\subsection` 字号由 16pt 改为 14pt 斜体，符合规范第 4.2.5 条要求；
- [x] **全局行距**（`a.1.packBase.sty`）：加入 `\AtBeginDocument{\singlespacing}` 确保正文单倍行距，并修正直接呼叫 `\singlespacing` 导致 pgf 箭头库出现 `\unskip in vertical mode` 编译错误的问题；
- [x] **页眉左侧标题**（`b.2.setLayout.sty`）：英文写作模式下页眉左侧由空白改为显示论文短题目（`\enShortTitle`，10pt），符合规范第 4.2.4 条要求；
- [x] **表格标题位置**（`b.3.setCaption.sty`）：加入 `\captionsetup[table]{position=above}` 设定表格标题间距为置顶模式，符合规范第 4.2.8 条要求（注意：仍需在各章节 `table` 环境中将 `\caption` 写于 `tabular` 之前）。


## 2026.06.06
按 計算機科學與工程學院«論文及開題寫作指引»範文格式.pdf
和 研究生學位論文寫作指導.pdf
進行修改，修改來自claude code

## 2025.02.21
更新支持本地运行，支持以下目录结构
├── Proposal/
│   ├── introduction.tex
│   └── references.bib
├── template/
│   ├── .def
│   └── (other files related to the template)
└── (other project files and folders)

## 2024.02.20
- Ver 2.42.20 (2024.02.20)
- [x] 修正排版細節;
  

## 2023.06.25
- Ver 2.36.25 (2023.06.25)
- [x] 修正細節,更新 texAide 輔助 texing 工具;
  
## 2023.04.16
- Ver 2.30.4 (2023.04.16)
- [x] @iihciyekub
- 通過文檔聲明 `writingLanguage=english` 切換至支持英文排版; 
- 通過文檔聲明 `writingLanguage=chinese` 切換至支持中文排版; 

## 2023.04.09
- Ver 2.30.3 (2023.04.09)
- [x] @iihciyekub 重構所有 *.cls *.sty *.tex 宏命令;
更新內容:
- 嚴格參考澳門科技大學提供的論文排版要求(見文件表);
- 增加文檔類選項,詳細見([使用幫助文檔](https://iihciyekub.github.io/must-thesis-manual/))
- 修正澳門科技大學校徽（嚴格使用學校提供的低分辨率校徽,未來期待美工加入,繪製一個嚴格一致的矢量圖）;
- 解決其它一系列bug問題;

|                    方法 | 網址/文件名/安裝包                                                                                                 | 狀態                                                                                                      | 位置                                                                                                                                 |
|------------------------:|:-------------------------------------------------------------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
| chrome 擴展程序(已發布) | [Overleaf texAide](https://chrome.google.com/webstore/detail/overleaf-s2tbib2bbl/icekiliecbhnockmfkehoebbkmhmapmo) | 安裝成功後, 使用 chrome 瀏覽器在訪問 [overleaf](https://www.overleaf.com/read/mjzpcxztzqzv)上自動加載啟用 | [Chrome 瀏覽器應用商店下載](https://chrome.google.com/webstore/detail/overleaf-s2tbib2bbl/icekiliecbhnockmfkehoebbkmhmapmo?hl=zh-CN) |





- 以下是學校提供的關於論文排版所有細節要求的附件(截止 2024-04-21 可訪問).

| NO. | 文件名                                                                                                                          | 本項目參考或使用 | 嚴格 |
|----:|:--------------------------------------------------------------------------------------------------------------------------------|------------------|------|
|   1 | [扉頁格式](https://www.must.edu.mo/images/GSO/files/sgsdocument/GS004.pdf)                                                      | 使用             | ✓    |
|   2 | [學位論文原創性聲明](https://www.must.edu.mo/images/GSO/files/S023學位論文原創性聲明BI.pdf)                                     | 使用             | ✓    |
|   3 | [論文寫作指導](https://www.must.edu.mo/images/GSO/files/sgsdocument/GS002.pdf)                                                  | 參考             | ✓    |
|   4 | [學位論文統一格式範例(Chinese)](https://www.must.edu.mo/images/GSO/files/sgsdocument/GS001.pdf)                                 | 參考             | ✓    |
|     | [學位論文統一格式範例(English)](https://www.must.edu.mo/images/GSO/files/sgsdocument/Thesis-sample-Eng.pdf)                     | 參考             | ✓    |
|   5 | [研究生論文格式參考資料(APA)](http://www.must.edu.mo/images/SGS/files/APA_7th_0710.pdf)                                         | 參考             | ✘    |
|   6 | [校徽水印](https://lib.must.edu.mo/sites/default/files/must-logo.jpg)                                                           | 使用             | ✓    |
|   7 | [國家文後參考文獻著錄規則](http://www.must.edu.mo/images/SGS/files/GBT7714_2015.pdf)                                            | 無               | ✘    |
|   8 | [MLA參考文獻格式](https://www.must.edu.mo/images/SGS/files/MLA參考文獻格式.pdf)                                                 | 無               | ✘    |
|   9 | [碩士與博士論文參考文獻格式補充説明_2022](https://www.must.edu.mo/images/MSB/files/碩士與博士論文參考文獻格式補充説明_2022.pdf) | 參考             | ✓    |


歷史版本:
## 2025.04.19
[**同步Overleaf在线项目**](https://www.overleaf.com/read/mjzpcxztzqzv#3b0b73)
LastUpdate: Feb 21, 2025 at 12:23:13
Mac上latexmk Version 4.86a编译通过

## 2020.03.29
- Ver 0.1.1.2 (2020.03.29) [不推薦使用此舊版本,已停止維護]
- ~~請使用 Texlive 2019-20190410 編譯環境, 官方鏡像下載地址: [Texlive 2019-20190410](https://mirror.bjtu.edu.cn/CTAN/systems/texlive/Images/)~~
- ~~修正編譯錯誤問題~~
- ~~修正中英文文獻格式問題,詳細可請看  [GIt 地址 iitool.exe](https://github.com/iihciyekub/MUST-iitool)~~

## 2019.07.06
- Ver 0.1.0.9 (2019.07.06) [不推薦使用此舊版本,已停止維護]
- ~~項目路徑下所有 `tex` 文件文本自動簡轉繁~~

## 2019.06.11
- Ver 0.1.0.8 (2019.06.11) [不推薦使用此舊版本,已停止維護]
- ~~添加 自動化程序: [iitool.exe](https://github.com/iihciyekub/MUST-iitool) (自動化編譯:生成 refTex --> xelatex --> xelatex :: PDF)~~
- ~~[GitHub地址]: https://github.com/iihciyekub/MUST-iitool	"iitool.exe",該工具用於自動處理特殊格式要求下的(MUST-APA)參考文獻文本;~~

## 2019.05.27
- Ver 0.1.0.7 (2019.05.27)
- [x] @iihciyekub 修改發佈
- 命令與tex分離,創建 *.cls, *.sty, *.exe 等;
- 添加 TikZ 繪製的版本説明封面;

## 2018.10.01
- Ver 0.1.0.4 (2018.10.01)
- [x] @Fan, p 創建 *.tex 
- [x] @Fang, yl 修改發佈


## 2016
- Ver 0.0.0.1 (2016)
- [x] MUST 商學院 科學決策系 [@Prof.Jenny](https://www.must.edu.mo/images/MSB/files/ChenYan_TC.pdf) Init
