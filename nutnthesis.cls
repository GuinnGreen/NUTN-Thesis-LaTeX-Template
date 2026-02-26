% --------------------------------------------------
% 國立臺南大學碩博士論文模板
% National University of Tainan (NUTN) Thesis LaTeX Template
% --------------------------------------------------
% Based on CCU Thesis Template by Ting-An Cheng
% Modified for NUTN format
% Last Updated  : 2026.02.25
% --------------------------------------------------

% --------------------------------------------------
% 01 類別宣告（Class Declaration）
% --------------------------------------------------

% 告知編譯器當前的 LaTeX 版本
% Must indicate what's the release of LaTeX we are using.
\NeedsTeXFormat{LaTeX2e}

% 定義類別名稱與敘述
% Define the name and description of class.
\ProvidesClass{nutnthesis}[NUTN Thesis Template]

% --------------------------------------------------
% 02 基礎設定（Basic Settings）
% --------------------------------------------------

% [引入套件]
% Include required packages for basic settings.
%
\RequirePackage{kvdefinekeys, kvsetkeys, kvoptions}
\RequirePackage{iftex}
\RequirePackage{ifthen}

% [定義變數]
% Define essential variables.

% 變數: 路徑
% Variables: Path
\newcommand{\nutn@path@font}{./fonts/english/}
\newcommand{\nutn@path@cjkfont}{./fonts/chinese/}

% 變數: 中文翻譯
% Variables: Translation (Chinese)
\newcommand{\nutn@draft@zh}{初稿}
\newcommand{\nutn@verificationletter@zh}{論文口試委員會審定書}
\newcommand{\nutn@acknowledgement@zh}{謝辭}
\newcommand{\nutn@abstract@zh}{摘要}
\newcommand{\nutn@keyword@zh}{關鍵字：}
\newcommand{\nutn@tableofcontents@zh}{目~~次}
\newcommand{\nutn@listoffigures@zh}{圖~~次}
\newcommand{\nutn@listoftables@zh}{表~~次}
\newcommand{\nutn@denotation@zh}{符號說明}
\newcommand{\nutn@bibliography@zh}{參考文獻}
\newcommand{\nutn@appendix@zh}{附錄}
\newcommand{\nutn@figurename@zh}{圖}
\newcommand{\nutn@tablename@zh}{表}
\newcommand{\nutn@kwsymbol@zh}{、}

\newcommand{\nutn@titlesection@zh}{第\CJKnumber{\thesection}章}
\newcommand{\nutn@titlesectiontoc@zh}{第\CJKnumber{\thecontentslabel}章}

% 變數: 英文翻譯
% Variables: Translation (English)
\newcommand{\nutn@draft@en}{Draft}
\newcommand{\nutn@verificationletter@en}{Verification Letter from the Oral Examination Committee}
\newcommand{\nutn@tableofcontents@en}{Contents}
\newcommand{\nutn@listoffigures@en}{List of Figures}
\newcommand{\nutn@listoftables@en}{List of Tables}
\newcommand{\nutn@denotation@en}{Denotation}
\newcommand{\nutn@bibliography@en}{References}
\newcommand{\nutn@acknowledgement@en}{Acknowledgements}
\newcommand{\nutn@abstract@en}{Abstract}
\newcommand{\nutn@keyword@en}{Keywords:~}
\newcommand{\nutn@kwsymbol@en}{,~}
\newcommand{\nutn@appendix@en}{Appendix}
\newcommand{\nutn@figurename@en}{Figure}
\newcommand{\nutn@tablename@en}{Table}

\newcommand{\nutn@titlesection@en}{Chapter~\thesection}
\newcommand{\nutn@titlesectiontoc@en}{Chapter~\thecontentslabel}

% 變數: 版面設定
% Variables: Layouts
\newcommand{\nutn@geometry@main}{top=2.5cm, bottom=2.5cm, left=3cm, right=2cm}
\newcommand{\nutn@geometry@cover}{top=2.5cm, bottom=2.5cm, left=3cm, right=2cm}

\newcommand{\nutn@tocvspace}{1em}
\newcommand{\nutn@tocsectionsize@zh}{4.5em}
\newcommand{\nutn@tocsectionsize@en}{5.5em}

\newcommand{\nutn@tocsecindent@zh}{1.5em}
\newcommand{\nutn@tocsecnumwidth@zh}{3.0em}
\newcommand{\nutn@tocsubsecindent@zh}{3.0em}
\newcommand{\nutn@tocsubsecnumwidth@zh}{3.0em}

\newcommand{\nutn@tocsecindent@en}{2.5em}
\newcommand{\nutn@tocsecnumwidth@en}{3.0em}
\newcommand{\nutn@tocsubsecindent@en}{3.0em}
\newcommand{\nutn@tocsubsecnumwidth@en}{3.0em}

% [定義命令]
% Define essential commands.

% 命令: 錯誤訊息
% Command: Error and Warning Messages
%
\newcommand{\nutn@error}[1]{
  \ClassError{nutnthesis}{#1}{}
}

\newcommand{\nutn@warning}[1]{
  \ClassWarning{nutnthesis}{#1}
}

% 命令: 鍵值設定
% Command: Key Value Options
%
\SetupKeyvalOptions{
  family=nutn,
  prefix=nutn@,
  setkeys=\kvsetkeys
}

\newcommand{\nutnsetup}{
  \kvsetkeys{nutn}
}

\newcommand{\nutn@define@key}[1]{
  \kvsetkeys{nutn@key}{#1}
}

\kv@set@family@handler{nutn@key}{%
  \@namedef{nutn@#1@@name}{#1}%
  \def\nutn@@default{}%
  \def\nutn@@choices{}%
  \kv@define@key{nutn@value}{name}{%
    \@namedef{nutn@#1@@name}{##1}%
  }%
  \kv@define@key{nutn@value}{code}{%
    \@namedef{nutn@#1@@code}{##1}%
  }%
  \@namedef{nutn@#1@@check}{}%
  \@namedef{nutn@#1@@code}{}%
  \@namedef{nutn@#1@@hook}{%
    \expandafter\ifx\csname\@currname.\@currext-h@@k\endcsname\relax
      \@nameuse{nutn@#1@@code}%
    \else
      \AtEndOfClass{%
        \@nameuse{nutn@#1@@code}%
      }%
    \fi
  }%
  \kv@define@key{nutn@value}{choices}{%
    \def\nutn@@choices{##1}%
    \@namedef{nutn@#1@@reset}{}%
    \@namedef{nutn@#1@@check}{%
      \@ifundefined{%
        ifnutn@\@nameuse{nutn@#1@@name}@\@nameuse{nutn@\@nameuse{nutn@#1@@name}}%
      }{%
        \nutn@error{Invalid value "#1 = \@nameuse{nutn@\@nameuse{nutn@#1@@name}}"}%
      }%
      \@nameuse{nutn@#1@@reset}%
      \@nameuse{nutn@\@nameuse{nutn@#1@@name}@\@nameuse{nutn@\@nameuse{nutn@#1@@name}}true}%
    }%
  }%
  \kv@define@key{nutn@value}{default}{%
    \def\nutn@@default{##1}%
  }%
  \kvsetkeys{nutn@value}{#2}%
  \@namedef{nutn@\@nameuse{nutn@#1@@name}}{}%
  \kv@set@family@handler{nutn@choice}{%
    \ifx\nutn@@default\@empty
      \def\nutn@@default{##1}%
    \fi
    \expandafter\newif\csname ifnutn@\@nameuse{nutn@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname nutn@#1@@reset\endcsname{%
      \@nameuse{nutn@\@nameuse{nutn@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{nutn@choice}{\nutn@@choices}%
  \expandafter\let\csname nutn@\@nameuse{nutn@#1@@name}\endcsname\nutn@@default
  \expandafter\ifx\csname nutn@\@nameuse{nutn@#1@@name}\endcsname\@empty\else
    \@nameuse{nutn@#1@@check}%
    \@nameuse{nutn@#1@@hook}%
  \fi
  \kv@define@key{nutn}{#1}{%
    \@namedef{nutn@\@nameuse{nutn@#1@@name}}{##1}%
    \@nameuse{nutn@#1@@check}%
    \@nameuse{nutn@#1@@hook}%
  }%
}

\newcommand\nutn@option@hook[2]{
  \expandafter\g@addto@macro\csname nutn@#1@@code\endcsname{#2}
}

% 命令: 鍵值陣列使用
% Command: Retrieve the array value with key-value pair.
%
\newcommand\nutn@clist@use[2]{%
  \def\nutn@@tmp{}%
  \kv@set@family@handler{nutn@clist}{%
    \ifx\nutn@@tmp\@empty
      \def\nutn@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \kvsetkeys@expandafter{nutn@clist}{#1}%
}

\newcommand{\nutn@setgeometry}[1]{\expandafter\newgeometry\expandafter{#1}}

% --------------------------------------------------
% 03 編譯檢查（Compile Checking）
% --------------------------------------------------

\ifXeTeX\else
  \nutn@error{XeLaTeX is required to compile this document.}
\fi

% --------------------------------------------------
% 04 論文設定（Document Configs）
% --------------------------------------------------

% [文檔選項]
% Configs from options
%
\nutn@define@key{
  degree = {
    choices = {
      master,
      doctor,
    },
    default = master,
    name    = degreeset
  },
  language = {
    choices = {
      chinese,
      english,
    },
    default = chinese,
  },
  fontset = {
    choices = {
      default,
      template,
    },
    default = default,
  },
}

% [設定檔案]
% Configs from nutnsetup.tex
%
\nutn@define@key{
  university = {
    default = {國立臺南大學},
  },
  university* = {
    default = {National University of Tainan},
    name    = university@en,
  },
  college = {
    default = {教育學院},
  },
  college* = {
    default = {College of Education},
    name    = college@en,
  },
  institute = {
    default = {教育學系},
  },
  institute* = {
    default = {Department of Education},
    name    = institute@en,
  },
  program = {
    default = {},
  },
  program* = {
    default = {},
    name    = program@en,
  },
  title = {
    default = {論文標題},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {論文作者},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  advisor = {
    default = {指導教授},
  },
  advisor* = {
    default = {Name of supervisor},
    name    = advisor@en,
  },
  keywords = {
    default = {關鍵字},
  },
  keywords* = {
    default = {Keywords},
    name    = keywords@en,
  },
  date = {
    default = {一百一十五年~二月},
  },
  date* = {
    default = {February~2026},
    name    = date@en,
  },
}

% --------------------------------------------------
% 05 選項設定（Options Settings）
% --------------------------------------------------

% 繼承類別選項（將未定義的傳給基礎文檔）
% Option Declaration (pass tundefined options to father class)
\DeclareDefaultOption{
  \PassOptionsToClass{\CurrentOption}{article}
}

% 處理選項並載入基礎文檔
% Terminates the options processing and loads the basic class.
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper, 12pt]{article}


% 根據設定值賦值變數
% Assign variables according to configs.
\ifthenelse{\equal{\nutn@degreeset}{master}}{
  \newcommand{\nutn@degree}{碩士}
  \newcommand{\nutn@degree@en}{Master}
  \newcommand{\nutn@type}{論文}
  \newcommand{\nutn@type@en}{Thesis}
}{
  \newcommand{\nutn@degree}{博士}
  \newcommand{\nutn@degree@en}{Doctoral}
  \newcommand{\nutn@type}{論文}
  \newcommand{\nutn@type@en}{Dissertation}
}

\ifthenelse{\equal{\nutn@language}{chinese}}{
  % 設定中文
  \newcommand{\nutn@titlesection}{\nutn@titlesection@zh}
  \newcommand{\nutn@titlesectiontoc}{\nutn@titlesectiontoc@zh}
  \newcommand{\nutn@tocsectionsize}{\nutn@tocsectionsize@zh}
  \newcommand{\nutn@tocsectionindent}{\nutn@tocsectionindent@zh}
  \newcommand{\nutn@tocsubsectionindent}{\nutn@tocsubsectionindent@zh}
  \newcommand{\nutn@acknowledgement}{\nutn@acknowledgement@zh}
  \newcommand{\nutn@tableofcontents}{\nutn@tableofcontents@zh}
  \newcommand{\nutn@listoffigures}{\nutn@listoffigures@zh}
  \newcommand{\nutn@listoftables}{\nutn@listoftables@zh}
  \newcommand{\nutn@denotation}{\nutn@denotation@zh}
  \newcommand{\nutn@verificationletter}{\nutn@verificationletter@zh}
  \newcommand{\nutn@bibliography}{\nutn@bibliography@zh}
  \newcommand{\nutn@appendix}{\nutn@appendix@zh}
  \newcommand{\nutn@figurename}{\nutn@figurename@zh}
  \newcommand{\nutn@tablename}{\nutn@tablename@zh}
  \newcommand{\nutn@draft}{\nutn@draft@zh}

  % 設定單位
  \newcommand{\nutn@tocsecindent}{\nutn@tocsecindent@zh}
  \newcommand{\nutn@tocsecnumwidth}{\nutn@tocsecnumwidth@zh}
  \newcommand{\nutn@tocsubsecindent}{\nutn@tocsubsecindent@zh}
  \newcommand{\nutn@tocsubsecnumwidth}{\nutn@tocsubsecnumwidth@zh}
}{
  % 設定英文
  \newcommand{\nutn@titlesection}{\nutn@titlesection@en}
  \newcommand{\nutn@titlesectiontoc}{\nutn@titlesectiontoc@en}
  \newcommand{\nutn@tocsectionsize}{\nutn@tocsectionsize@en}
  \newcommand{\nutn@tocsectionindent}{\nutn@tocsectionindent@en}
  \newcommand{\nutn@tocsubsectionindent}{\nutn@tocsubsectionindent@en}
  \newcommand{\nutn@acknowledgement}{\nutn@acknowledgement@en}
  \newcommand{\nutn@tableofcontents}{\nutn@tableofcontents@en}
  \newcommand{\nutn@listoffigures}{\nutn@listoffigures@en}
  \newcommand{\nutn@listoftables}{\nutn@listoftables@en}
  \newcommand{\nutn@denotation}{\nutn@denotation@en}
  \newcommand{\nutn@verificationletter}{\nutn@verificationletter@en}
  \newcommand{\nutn@bibliography}{\nutn@bibliography@en}
  \newcommand{\nutn@appendix}{\nutn@appendix@en}
  \newcommand{\nutn@figurename}{\nutn@figurename@en}
  \newcommand{\nutn@tablename}{\nutn@tablename@en}
  \newcommand{\nutn@draft}{\nutn@draft@en}

  % 設定單位
  \newcommand{\nutn@tocsecindent}{\nutn@tocsecindent@en}
  \newcommand{\nutn@tocsecnumwidth}{\nutn@tocsecnumwidth@en}
  \newcommand{\nutn@tocsubsecindent}{\nutn@tocsubsecindent@en}
  \newcommand{\nutn@tocsubsecnumwidth}{\nutn@tocsubsecnumwidth@en}
}

% --------------------------------------------------
% 06 載入套件 (Include Packages)
% --------------------------------------------------

% [載入套件]
% - xparse                      定義命令
% - xeCJK                       排版中日韓(CJK)字符
% - indentfirst                 首行縮進
% - fontspec                    設定中英文字體
% - xcolor, colortbl            設定顏色
% - geometry                    設定版面大小
% - titlesec                    設定章節格式
% - titletoc, tocloft           設定目錄格式
% - fancyhdr                    設定頁首頁尾
% - setspace                    設定行距（標題內文分別設定）
% - graphicx                    插入圖片
% - tikz                        繪圖
% - eso-pic                     插入圖片於文字下方
% - pdfpages                    插入 pdf 檔案
% - tabularx                    插入表格
% - booktabs                    改善表格設置
% - array                       調整表格高度
% - longtable                   支援跨頁長表格
% - diagbox                     插入表格反斜線
% - multirow                    合併儲存格
% - amsmath, amsthm, amssymb    引入 AMS 數學環境
% - datetime                    日期格式轉換
% - CJKnumb                     中文數字轉換
% - zhnumber                    中文數字
% - fp, calc                    計算功能
% - hyperref                    超連結
% - paralist, enumitem          列表環境
% - footmisc                    自訂腳註符號
% - caption, subcaption         插入圖片、表格標題
% - chemfig                     繪製化學結構式
% - circuitikz                  繪製電路圖
% - listings                    插入程式碼
%
\RequirePackage{xparse}                     % 定義命令
\RequirePackage{xeCJK}                      % 排版中日韓(CJK)字符
\RequirePackage{indentfirst}                % 首行縮進
\RequirePackage{fontspec}                   % 設定中英文字體
\RequirePackage{xcolor, colortbl}           % 設定顏色
\RequirePackage{geometry}                   % 設定版面大小
\RequirePackage{titlesec}                   % 設定章節格式
\RequirePackage{titletoc, tocloft}          % 設定目錄格式
\RequirePackage{fancyhdr}                   % 頁首頁尾
\RequirePackage{setspace}                   % 設定行距
\RequirePackage{graphics, graphicx}         % 插入圖片
\RequirePackage{tikz}                       % 繪圖
\RequirePackage{eso-pic}                    % 插入圖片於文字下方
\RequirePackage{pdfpages}                   % 插入 pdf 檔案
\RequirePackage{tabularx}                   % 插入表格
\RequirePackage{booktabs}                   % 改善表格設置
\RequirePackage{array}                      % 調整表格高度
\RequirePackage{longtable}                  % 支援跨頁長表格
\RequirePackage{diagbox}                    % 插入表格反斜線
\RequirePackage{multirow}                   % 合併儲存格
\RequirePackage{amsmath, amsthm, amssymb}   % 數學環境
\RequirePackage{bm}                         % 數學符號加粗
\RequirePackage{datetime}                   % 日期格式轉換
\RequirePackage{CJKnumb}                    % 中文數字轉換
\RequirePackage{zhnumber}                   % 中文數字
\RequirePackage{fp, calc}                   % 計算功能
\RequirePackage{hyperref}                   % 超連結
\RequirePackage{paralist, enumitem}         % 列表環境
\RequirePackage{footmisc}                   % 自訂腳註符號
\RequirePackage{caption}                    % 標題環境
\RequirePackage[labelformat=simple]{subcaption} % 子標題環境
\RequirePackage{chemfig}                    % 化學結構式
\RequirePackage{circuitikz, siunitx}        % 電路圖
\RequirePackage{listings}                   % 程式碼
\RequirePackage{threeparttable}             % 表格加註解
\RequirePackage{algorithm, algpseudocode}   % 演算法
\RequirePackage{rotating}                   % 旋轉圖片
\RequirePackage{notoccite}                  % 避免文獻引用標號順序錯亂

\usetikzlibrary{
  positioning,
  shapes.geometric,
  arrows.meta,
  chains,
  matrix,
  calc,
  fit,
  quotes
}

% --------------------------------------------------
% 07 套件設定 (Package Settings)
% --------------------------------------------------

% [圖表目錄]
%
\graphicspath{{./figures/}}

% [圖表格式]
% 將圖，表，與公式的編號加上章節編號，並改為 - 分隔符號
%
\counterwithin{figure}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\counterwithin{table}{section}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\counterwithin{equation}{section}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

% [文章排版]
%
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt
\setlength{\parskip}{10pt}
\setlength{\parindent}{2em}

% [字體設定]
% 本地端使用系統字體(Times/標楷)，CI環境使用開源替代字體(TeX Gyre/Fandol)
% - \setmainfont{}          	襯線字體
% - \setsansfont{}          	非襯字體
% - \setmonofont{}          	等寬字體
% - \setCJKmainfont{}			中文襯線字體
% - \setCJKsansfont{}			中文非襯字體
% - \setCJKmonofont{}			中文等寬字體
%
% 定義英文 Fallback 邏輯
\newcommand{\nutn@setmainfont}{
  \IfFontExistsTF{Times New Roman}{
    % 情況 1: 系統有 Times New Roman (Windows/Mac)
    \setmainfont{Times New Roman}[
      BoldFont = *,
      BoldFeatures = {FakeBold=2}
    ]
  }{
    % 情況 2: CI 環境 (使用 TeX Gyre Termes 替代)
    \setmainfont{TeX Gyre Termes}
  }
}

% 定義中文 Fallback 邏輯
% 台南大學規定：中文字體以新細明體為原則
% 參數 #1: 粗體加重程度
\newcommand{\nutn@setcjkfont}[1]{
  % 透過檢查 /proc/meminfo 來判定是否為 Linux (CI 環境)
  \IfFileExists{/proc/meminfo}{
    % 情況 A: CI 環境 (Linux)
    % 避免觸發 mktextfm 導致 latexmk 誤判編譯錯誤，直接採用開源字體
    \IfFontExistsTF{cwTeX Q Ming}{
      \setCJKmainfont{cwTeX Q Ming}[AutoFakeBold=#1, AutoFakeSlant=.2]
    }{
      \setCJKmainfont{FandolSong}[AutoFakeBold=#1, AutoFakeSlant=.2]
    }
  }{
    % 情況 B: 本地環境 (Mac / Windows)
    \IfFontExistsTF{PMingLiU}{
      % 情況 B-1: Windows (新細明體)
      \setCJKmainfont{PMingLiU}[AutoFakeBold=#1, AutoFakeSlant=.2]
    }{
      \IfFontExistsTF{LiSong Pro}{
        % 情況 B-2: Mac (儷宋 Pro，類新細明體)
        \setCJKmainfont{LiSong Pro}[AutoFakeBold=#1, AutoFakeSlant=.2]
      }{
        \IfFontExistsTF{Songti SC}{
          % 情況 B-3: Mac (宋體-簡，備選)
          \setCJKmainfont{Songti SC}[AutoFakeBold=#1, AutoFakeSlant=.2]
        }{
          % 情況 B-4: 本地找不到系統字體的 Fallback
          \setCJKmainfont{cwTeX Q Ming}[AutoFakeBold=#1, AutoFakeSlant=.2]
        }
      }
    }
  }
}

% --- 實際套用設定 ---
%
\ifthenelse{\equal{\nutn@fontset}{template}}{
  \nutn@setmainfont
  \nutn@setcjkfont{4}
}{
  \nutn@setmainfont
  \nutn@setcjkfont{2.5}
}

% [版面大小]
% 台南大學規範：左3cm、右2cm、上下2.5cm（單面印刷）
%
\geometry{
  top=2.5cm,
  bottom=2.5cm,
  left=3cm,
  right=2cm
}

% [連結設定]
%
\hypersetup{
  colorlinks=true,           % false: boxed links; true: colored links
  linkcolor=black,           % color of internal links
  urlcolor=black,            % color of external links
  filecolor=black,           % color of file links
  anchorcolor=black,         % color of anchor links
  citecolor=black            % color of links to bibliography
}

% [目錄格式]
% \titlecontents{標題名稱}[左間距]{標題格式}{標題內容}{無序號標題}{指引線與頁碼}[下間距]
%
\addtocontents{toc}

\titlecontents{section}[0em]                                              % 修改目錄樣式
{\addvspace{0.5em}\normalsize\bfseries\protect}
{\fboxrule=0pt\fboxsep=0pt\framebox[\nutn@tocsectionsize][l]{\nutn@titlesectiontoc}}
{}
{\hfill\contentspage}

\setlength{\cftbeforesecskip}{8pt}                                        % 修改目錄間距
\setlength{\cftbeforesubsecskip}{0pt}                                     % 修改子目錄間距

\setcounter{tocdepth}{3}                                                  % 設定目錄深度
\setcounter{secnumdepth}{3}                                               % 設定編號深度

\cftsetindents{section}{\nutn@tocsecindent}{\nutn@tocsecnumwidth}           % 設定目錄縮排
\cftsetindents{subsection}{\nutn@tocsubsecindent}{\nutn@tocsubsecnumwidth}  % 設定子目錄縮排

% [標題格式]
% 載入套件包 titlesec 設定各層標題格式
% \titleformat{command}[shape]{format}{label}{sep}{before}[after]
% - command: 代表欲重新定義之標題階層，包含 \part, \chapter, \section, \paragraph
% - shape: 設定段落形狀，可選參數有 hang, block, display
% - format: 定義標題外觀，如：位置、字體大小粗細…
% - label: 定義標籤前綴標號
% - sep: 定義標號與標題內容間隔距離
% - before: 標題內容前增加文字
% - after: 標題內容後增加文字
%
\titleformat{\section}                                 % 設置 section 格式（章次 20pt）
{\centering\fontsize{20pt}{30pt}\selectfont\bfseries}  % 台南大學規範：章次 20pt
{\nutn@titlesection}                                    % 定義 label
{1em}                                                  % 定義 sep
{}                                                     % before

\titleformat{\subsection}                              % 設置 subsection 格式（節次 18pt）
{\centering\fontsize{18pt}{27pt}\selectfont\bfseries}  % 台南大學規範：節次 18pt
{\thesubsection}
{1em}
{}

\titleformat{\subsubsection}                           % 設置 subsubsection 格式（段次 16pt）
{\fontsize{16pt}{24pt}\selectfont\bfseries}            % 台南大學規範：段次 16pt
{\thesubsubsection}
{1em}
{}

\titleformat{\paragraph}[hang]                         % 設置 paragraph 格式（小段次 14pt）
{\fontsize{14pt}{21pt}\selectfont\bfseries}            % 台南大學規範：小段次 14pt
{\theparagraph}
{1em}
{}

% [間距設定]
% \titleformat{command}{left}{top}{bottom}
%
\titlespacing*{\section}{0pt}{0pt}{12pt}               % 設置 section 間距（章名下留雙倍行距）
\titlespacing*{\subsection}{0pt}{6pt}{6pt}             % 設置 subsection 間距
\titlespacing*{\subsubsection}{0pt}{6pt}{6pt}          % 設置 subsubsection 間距
\titlespacing*{\paragraph}{0pt}{6pt}{6pt}              % 設置 paragraph 間距

% [列表設定]
%
\setlist[itemize]{noitemsep, topsep=0pt}               % 設定列表間距
\setlist[enumerate]{noitemsep, topsep=0pt}             % 設定編號間距

% [圖表標題]
%
\setlength{\intextsep}{12bp \@plus4pt \@minus2pt}
\captionsetup{}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{skip=6bp}

% [引用格式]
%
\renewcommand\thesubfigure{~(\alph{subfigure})}

% --------------------------------------------------
% 08 自訂命令（Custom Commands）
% --------------------------------------------------

% [添加路徑]
\newcommand\appendgraphicspath[1]{
  \g@addto@macro\Ginput@path{#1}
}

% [中文縮進]
% - \Eindent                    縮進
% - \Enoindent                  不縮進
%
% 獲取並定義 CJK 字符寬度
\newcommand{\nutn@CJKChar@size}{\hskip \f@size \p@}
\newdimen{\nutn@CJKChar@size@dimen}
\settowidth{\nutn@CJKChar@size@dimen}{\nutn@CJKChar@size\CJKglue}

% 定義命令
\newcommand{\CJKsetfontspace}{
  \settowidth\nutn@CJKChar@size@dimen{\nutn@CJKChar@size\CJKglue}
  \ifthenelse{\parindent=0pt}{\relax}{\parindent2\nutn@CJKChar@size@dimen}
}

% 縮進
\newcommand{\Eindent}{
  \CJKsetfontspace\parindent2\nutn@CJKChar@size@dimen
}

% 不縮進
\newcommand{\Enoindent}{
  \parident\z@
}

% [插入浮水印]
% - \makewatermark{#1}          生成浮水印
%   #1 Logo Path                校徽路徑
% 台南大學規範：浮水印 6.5cm x 6.5cm
%
\newcommand{\makewatermark}[1]{
  \AddToShipoutPicture{
    \put(-\paperwidth/2,-\paperheight/2){
      \parbox[b][\paperheight]{\paperwidth}{
        \vfill
        \centering
        \begin{tikzpicture}[remember picture, overlay]
          \coordinate (WM) at (current page.center);
          \node [opacity=0.15] at (WM) {\includegraphics[width=6.5cm, height=6.5cm]{#1}};
        \end{tikzpicture}
        \vfill
}}}}

% [生成封面]
% Generate the cover page (依台南大學附件一格式)
%
\newcommand{\makecover}[1][]{
  \nutn@setgeometry{\nutn@geometry@cover}

  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        % 校名 (28pt)
        \fontsize{28}{42}\selectfont
        \nutn@university\par
        \vspace{0.8cm}

        % 系所名稱 (24pt)
        \fontsize{24}{36}\selectfont
        \nutn@institute\par
        \ifx\nutn@program\empty\else
          \nutn@program\par
        \fi
        \vspace{0.8cm}

        % 學位別 (24pt)
        \fontsize{24}{36}\selectfont
        \nutn@degree\nutn@type\par

        % 初稿字樣
        \ifthenelse{\equal{#1}{draft}}{
          \vspace{5pt}
          \fontsize{18}{27}\selectfont
          (\nutn@draft)\par
        }{}

        % 中文論文題目 (18pt)
        \vfill
        \fontsize{18}{27}\selectfont
        \nutn@title\par
        \vspace{1cm}

        % 西文論文題目 (18pt)
        \nutn@title@en\par

        % 指導教授與研究生 (18pt)
        \vfill
        \fontsize{18}{27}\selectfont
        \begin{tabular}{rl}
          指\hspace{0.5em}導\hspace{0.5em}教\hspace{0.5em}授： & \nutn@advisor \par\\
          研\hspace{1em}究\hspace{1em}生： & \nutn@author \par
        \end{tabular}\par

        % 論文撰寫日期 (18pt)
        \vfill
        \fontsize{18}{27}\selectfont
        中華民國~~\nutn@date
      \end{center}
    \end{singlespace}
  \end{titlepage}

  % 清除頁碼
  \clearpage
  \restoregeometry
}

% [生成書名頁]
% Generate the title page (依台南大學附件二格式)
%
\newcommand{\maketitlepage}{
  \clearpage
  \nutn@setgeometry{\nutn@geometry@main}
  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        % 中文論文名稱 (18pt)
        \fontsize{18}{27}\selectfont
        \nutn@title\par
        \vspace{0.5cm}
        % 西文論文名稱 (16pt)
        \fontsize{16}{24}\selectfont
        \nutn@title@en\par

        \vspace{2cm}
        \fontsize{14}{21}\selectfont
        by\par
        \vspace{1cm}
        \fontsize{14}{21}\selectfont
        \nutn@author@en~~(\nutn@author)\par

        \vfill
        \fontsize{12}{18}\selectfont
        \ifthenelse{\equal{\nutn@degreeset}{master}}{
          A thesis submitted in partial fulfillment of the requirements\par
          for the Master's degree\par
        }{
          A dissertation submitted in partial fulfillment of the requirements\par
          for the Doctor of Philosophy degree\par
        }
        \ifx\nutn@program@en\empty
          in \nutn@institute@en\par
        \else
          in \nutn@program@en\par
        \fi
        in the \nutn@college@en\par
        at the \nutn@university@en\par
        Tainan, Taiwan\par

        \vspace{2cm}
        Advisor: Professor~\nutn@advisor@en~~(\nutn@advisor)\par
        \vspace{0.5cm}
        \nutn@date@en\par
        中華民國~~\nutn@date
      \end{center}
    \end{singlespace}
  \end{titlepage}
  \restoregeometry
}

% [生成口委審定書]
% Generate the verification letter page (依台南大學附件四格式)
%
\newcommand{\makeverification}{
  \clearpage
  \nutn@setgeometry{\nutn@geometry@main}
  \begin{titlepage}
    \begin{singlespace}
      \begin{center}
        % 審定書標題 (24pt)
        \fontsize{24}{36}\selectfont
        {\nutn@university}\nutn@verificationletter\par
        \vspace{1.5cm}

        % 內文 (16pt)
        \fontsize{16}{30}\selectfont
        \begin{flushleft}
          本校~\nutn@institute~\nutn@degree{}班~\nutn@author~君\par
          所提之論文:\par
          \underline{\hspace{\textwidth}}\par
          \underline{\nutn@title}\par
          經本委員會審查，符合\nutn@degree{}學位論文標準。
        \end{flushleft}
      \end{center}
    \end{singlespace}

    \begin{doublespace}
      \begin{flushleft}
        \vfill
        \fontsize{16}{28}\selectfont
        召集人：~~\underline{\hspace{8cm}}簽章\par
        \vspace{0.5cm}
        委~~員：~~\underline{\hspace{8cm}}\par
        \hspace{4.5em}\underline{\hspace{8cm}}\par
        \hspace{4.5em}\underline{\hspace{8cm}}\par
        \vspace{0.5cm}
        指導教授：\underline{\hspace{8cm}}簽章\par
        \hspace{5.5em}\underline{\hspace{8cm}}\par
        \vspace{0.5cm}
        系主任/所長：\underline{\hspace{7.5cm}}簽章\par
        \vspace{1cm}
        \centering
        中華民國\underline{\hspace{3cm}}年\underline{\hspace{3cm}}月\underline{\hspace{3cm}}日
        \vfill
      \end{flushleft}
    \end{doublespace}
  \end{titlepage}

  % 恢復預設板型
  \restoregeometry
}

% [渲染口委審定書掃描檔]
% Render the verification letter scan pdf file
%
\newcommand{\renderverification}[1]{
  \clearpage
  \includepdf[pages=-, pagecommand={\thispagestyle{empty}}, offset=0 0, width=\paperwidth, height=\paperheight]{#1}
}

% 定義 \cleardoublepage 命令，讓它的行為與 \clearpage 相同
\let\cleardoublepage\clearpage

% [生成目錄]
% Generate table of contents page.
%
% 目錄
\renewcommand{\contentsname}{\centerline{\fontsize{20}{24}\selectfont\nutn@tableofcontents}}
\newcommand{\maketableofcontents}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\nutn@tableofcontents}
  \tableofcontents
}

% 圖目錄
\let\oldnumberline\numberline
\renewcommand{\listfigurename}{\centerline{\nutn@listoffigures}}
\newcommand{\makelistoffigures}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\nutn@listoffigures}
  \renewcommand{\numberline}{\figurename~\oldnumberline}
  \listoffigures
}

% 表目錄
\renewcommand{\listtablename}{\centerline{\nutn@listoftables}}
\newcommand{\makelistoftables}{
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{\nutn@listoftables}
  \renewcommand{\numberline}{\tablename~\oldnumberline}
  \listoftables
}

% [致謝與論文摘要]
% \frontmatter
% 台南大學規範：自中文摘要至圖表目錄，以小寫羅馬數字連續編頁
%
\newcommand{\frontmatter}{
  \cleardoublepage
  \nutn@setgeometry{\nutn@geometry@main}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \pagenumbering{roman}
  \fontsize{12}{18}\selectfont
}

% [正文開始]
% \mainmatter
% 台南大學規範：第一章至附錄用阿拉伯數字連續編頁，頁尾置中
%
\newcommand{\mainmatter}{
  \cleardoublepage
  \nutn@setgeometry{\nutn@geometry@main}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \pagenumbering{arabic}
  \fontsize{12}{18}\selectfont
}

% [參考文獻]
% \refmatter
%
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \oldbibliography{#1}%
  \setlength{\itemsep}{0pt}%
}

\newcommand{\refmatter}{
  \cleardoublepage
  \phantomsection
  \renewcommand{\refname}{\nutn@bibliography}
  \addcontentsline{toc}{section}{\nutn@bibliography}
}

% [附錄]
% \appendix{NUM}{TITLE}
%
\renewcommand{\appendix}[2]{
  \cleardoublepage
  \phantomsection
  \section*{\nutn@appendix~{#1}~---~#2}
  \addcontentsline{toc}{section}{\nutn@appendix~{#1}~---~#2}

  \renewcommand{\thesection}{\nutn@appendix}
  \renewcommand{\thefigure}{\roman{figure}}
  \renewcommand{\theequation}{\roman{equation}}
  \renewcommand{\thetable}{\roman{table}}

  \setcounter{equation}{0}
  \setcounter{figure}{0}
  \setcounter{footnote}{0}
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \setcounter{table}{0}
}

% [自訂表格]
%
\renewcommand{\arraystretch}{1.2}                  % 設定行間距為原來的1.2倍

\setlength{\aboverulesep}{0pt}                     % rules 上方間距
\setlength{\belowrulesep}{0pt}                     % rules 下方間距

% 漸層背景表格
% Reference: https://www.siavoosh.com/blog/2019/01/05/latex-table-cell-coloring-based-on-values-in-the-cell/
%
\definecolor{high}{HTML}{f8696b}                   % the color for the highest number in your data set
\definecolor{mid}{HTML}{ffffff}                    % the color for the middle number in your data set
\definecolor{low}{HTML}{5a8ac6}                    % the color for the lowest number in your data set
\newcommand*{\opacity}{90}                         % here you can change the opacity of the background color!

\newcommand*{\minval}{0.0}                         % define the minimum value in your data set!
\newcommand*{\midval}{0.5}                         % define the middle value in your data set!
\newcommand*{\maxval}{1.0}                         % define the maximum value in your data set!

% The values are calculated linearly between \minval, \midval and \maxval
% \gardient{VALUE}
%
\newcommand{\gradient}[1]{
  \ifdimcomp{#1pt}{>}{\maxval pt}{#1}{
  \ifdimcomp{#1pt}{<}{\minval pt}{#1}{
  \ifdimcomp{#1pt}{<}{\midval pt}{
    \pgfmathparse{int(round(100*(#1/(\midval-\minval))-(\minval*(100/(\midval-\minval)))))}
    \xdef\tempa{\pgfmathresult}
    \cellcolor{mid!\tempa!low!\opacity} #1
  }{
    \pgfmathparse{int(round(100*(#1/(\maxval-\midval))-(\midval*(100/(\maxval-\midval)))))}
    \xdef\tempa{\pgfmathresult}
    \cellcolor{high!\tempa!mid!\opacity} #1
  }}}
}

% [自訂顏色]
%
\definecolor{coral}{RGB}{191, 74, 116}             % 珊瑚紅

% --------------------------------------------------
% 09 自訂環境（Custom Environments）
% --------------------------------------------------

% [符號列表]
% Denotation Environment
%
\newenvironment{denotation}[1][2.5cm]{
  \clearpage
  \phantomsection
  \section*{\centering \nutn@denotation}
  \addcontentsline{toc}{section}{\nutn@denotation}
  \noindent
  \begin{list}{}{
    \renewcommand\makelabel[1]{##1\hfill}
    \setlength{\labelwidth}{#1}                     % 符號欄寬度
    \setlength{\labelsep}{0.5cm}                    % 標籤與列表文字距離
    \setlength{\leftmargin}{\labelwidth+\labelsep}  % 標籤左邊界
    \setlength{\rightmargin}{0cm}                   % 標籤右邊界
}}{\end{list}}

% [致謝環境]
% Acknowledgement Environment
%
\newenvironment{acknowledgement}{
  \phantomsection
  \section*{\centering \nutn@acknowledgement}
  \addcontentsline{toc}{section}{\nutn@acknowledgement}
  \fontsize{12}{18}\selectfont
}

% [摘要環境]
% Abstract Environment (依台南大學附件六、附件七格式)
%
\renewenvironment{abstract}{
  \fontsize{12}{18}\selectfont
  \phantomsection
  \section*{\centering \nutn@abstract@zh}
  \addcontentsline{toc}{section}{\nutn@abstract@zh}
  % 論文題目、學生、指導教授、系所
  \begin{center}
    \fontsize{14}{21}\selectfont
    \nutn@title\par
    \vspace{0.5cm}
    \fontsize{12}{18}\selectfont
    學生：\nutn@author\hspace{3cm}指導教授：\nutn@advisor\par
    \vspace{0.3cm}
    \nutn@university\nutn@institute\par
  \end{center}
  \vspace{0.5cm}
}{
  \bigbreak
  \noindent \textbf{\nutn@keyword@zh}
  \nutn@clist@use{\nutn@keywords}{\nutn@kwsymbol@zh}
}

\newenvironment{abstract*}{
  \fontsize{12}{24}\selectfont
  \phantomsection
  \section*{\centering \nutn@abstract@en}
  \addcontentsline{toc}{section}{\nutn@abstract@en}
  % 英文論文題目、Student、Advisor、系所
  \begin{center}
    \fontsize{14}{21}\selectfont
    \nutn@title@en\par
    \vspace{0.5cm}
    \fontsize{12}{18}\selectfont
    Student：\nutn@author@en\hspace{2cm}Advisor(s)：\nutn@advisor@en\par
    \vspace{0.3cm}
    \nutn@institute@en, \nutn@university@en\par
  \end{center}
  \vspace{0.5cm}
}{
  \bigbreak
  \noindent \textbf{\nutn@keyword@en}
  \nutn@clist@use{\nutn@keywords@en}{\nutn@kwsymbol@en}
}

% --------------------------------------------------
% 10 文檔處理（Document Processing）
% --------------------------------------------------
% 章節之間加入分頁符號
\let\oldsection\section
\renewcommand{\section}{\clearpage\oldsection}

% 設定行距
% 1.2：1.5 倍行距
% 1.6：2.0 倍行距
\setstretch{1.5}

% 套用翻譯
\renewcommand{\figurename}{\nutn@figurename}
\renewcommand{\tablename}{\nutn@tablename}