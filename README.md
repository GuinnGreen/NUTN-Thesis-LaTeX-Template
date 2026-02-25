# 國立臺南大學碩博士論文 LaTeX 模板

整合 Docker 與 GitHub Codespaces 的國立臺南大學學位論文 LaTeX 模板，依據「國立臺南大學學位論文格式規範」設計，提供開箱即用的寫作環境。

## 目錄

- [⚡ 獲取本模板](#-獲取本模板)
- [🚀 快速開始](#-快速開始)
- [🐳 本地環境建置](#-本地環境建置)
- [☁️ 自動編譯與備份](#️-自動編譯與備份)
- [📂 模板檔案結構](#-模板檔案結構)
- [📖 模板使用說明](#-模板使用說明)
- [⚠️ 免責聲明](#️-免責聲明)
- [📄 License](#-license)

## ⚡ 獲取本模板

請點擊上方綠色的 **`[Use this template]`** 按鈕，並選擇 **Private** 來建立您的論文儲存庫。

> [!WARNING]\
> 建議不要直接 Fork 本儲存庫！\
> 論文應保持機密，Fork 的儲存庫預設為公開。

## 🚀 快速開始

**適合：** 不想安裝任何軟體、或只是想快速預覽的使用者。

1. 點擊頁面右上角的綠色 **`Code`** 按鈕 > 切換到 **`Codespaces`** 分頁。
2. 點擊 **`Create codespace on branch-name`**。
3. 等待瀏覽器載入環境（首次約需 10-15 分鐘）。
4. **完成!**

> [!TIP]\
> 打開 `main.tex` 檔案，按下 `Ctrl+S` 即可自動觸發編譯。\
> 編譯完成後，PDF 檔會自動顯示在右側預覽視窗中。

## 🐳 本地環境建置

**適合：** 需要長期離線寫作、習慣本地 VS Code 的使用者。

### Docker 環境設置
1. 安裝 [Docker Desktop](https://www.docker.com/products/docker-desktop)，安裝後須重新啟動電腦。
2. 安裝 VS Code，並安裝 `Remote Explorer`、`Dev Containers` 擴充程式。

### 啟動步驟
1. `git clone` 您的論文儲存庫。
2. 使用 VS Code 開啟儲存庫資料夾。
3. 點擊視窗右下角的提示 **"Reopen in Container"** (或按 `F1` 搜尋 `Dev Containers: Reopen in Container`)。
4. 等待容器啟動（首次約需 10-15 分鐘），**完成!**

### Overleaf 使用
您也可以將模板上傳至 [Overleaf](https://www.overleaf.com/) 進行線上編輯，請確保編譯器設定為 **XeLaTeX**。

## ☁️ 自動編譯與備份

當您將進度推送 (Push) 到 GitHub 時，系統會自動在雲端執行編譯，為您的論文提供 PDF 備份。

1. 點擊儲存庫上方的 **`Actions`** 分頁。
2. 點擊最新的 Workflow 紀錄。
3. 在頁面底部的 **`Artifacts`** 區域下載 PDF。

> [!NOTE]\
> 雲端生成的 PDF 檔案僅會保留 **5 天**。

## 📂 模板檔案結構

```
NUTN-Thesis-LaTeX-Template
├── main.tex                            // 主文件
├── nutnsetup.tex                       // 模板設定（論文資訊在此修改）
├── nutnthesis.cls                      // 模板類別檔
├── watermark.jpg                       // 臺南大學 logo 浮水印
├── frontpages
│   ├── abstract.tex                    // 中/英文摘要
│   ├── acknowledgement.tex             // 謝辭
│   ├── denotation.tex                  // 符號說明
│   └── verification.pdf                // 口試審定書 PDF（掃描檔）
├── sections
│   ├── 01introduction.tex              // 第一章 緒論
│   ├── 02related_work.tex              // 第二章 文獻探討
│   ├── 03method.tex                    // 第三章 研究方法
│   ├── 04experiments.tex               // 第四章 研究結果
│   └── 05conclusion.tex                // 第五章 結論
├── backpages
│   ├── appendix.tex                    // 附錄
│   └── references.bib                  // 參考文獻資料庫
├── figures                             // 圖片資料夾
└── .github/workflows/build.yml         // GitHub Actions 自動編譯
```

## 📖 模板使用說明

### 1. 設定論文資訊

開啟 `nutnsetup.tex`，填入您的論文資訊：

```latex
\nutnsetup{
  university    = {國立臺南大學},
  college       = {教育學院},              % 學院名稱
  institute     = {教育學系},              % 系所名稱
  program       = {教育經營與管理碩士班},   % 學程/班別（若無可留空）
  title         = {您的論文標題},
  title*        = {Your Thesis Title},
  author        = {王大明},
  author*       = {Da-Ming Wang},
  advisor       = {陳教授},
  advisor*      = {Professor Chen},
  date          = {一百一十五年~二月},      % 中華民國年月
  date*         = {February~2026},
  keywords      = {關鍵字一, 關鍵字二},
  keywords*     = {Keyword1, Keyword2},
}
```

### 2. 設定學位與語言

在 `main.tex` 的 `\documentclass` 中設定：

```latex
\documentclass[
  degree    = master,     % master（碩士）| doctor（博士）
  language  = chinese,    % chinese | english
  fontset   = template,   % default | template
]{nutnthesis}
```

### 3. 論文編印順序

依台南大學規範，`main.tex` 中的頁面順序為：

| 順序 | 項目 | 說明 |
|------|------|------|
| 1 | 封面 | `\makecover` |
| 2 | 書名頁 | `\maketitlepage` |
| 3 | 口試審定書 | `\makeverification` 或 `\renderverification{path}` |
| 4 | 中文摘要 | `frontpages/abstract.tex` |
| 5 | 英文摘要 | 同上（`abstract*` 環境） |
| 6 | 謝辭 | `frontpages/acknowledgement.tex` |
| 7 | 目次 | `\maketableofcontents` |
| 8 | 表次 | `\makelistoftables` |
| 9 | 圖次 | `\makelistoffigures` |
| 10 | 符號說明 | `frontpages/denotation.tex`（可選） |
| 11 | 論文本文 | `sections/` 資料夾 |
| 12 | 參考文獻 | APA 格式（教育學院） |
| 13 | 附錄 | `backpages/appendix.tex` |

### 4. 格式規範

本模板已依照台南大學規範預設以下格式：

- **版面邊界**：左 3cm、右 2cm、上下 2.5cm（單面印刷）
- **中文字體**：新細明體
- **英文字體**：Times New Roman
- **章節字體大小**：章次 20pt、節次 18pt、段次 16pt、小段次 14pt、內文 12pt
- **頁碼**：摘要～圖表目錄用小寫羅馬數字、本文用阿拉伯數字，頁尾置中
- **浮水印**：臺南大學 logo 6.5cm × 6.5cm
- **參考文獻**：APA 格式（教育學院）
- **圖表編號**：以章節-序號格式（如：表3-1、圖3-1）

> [!NOTE]\
> 如需增減章節，可在 `sections` 資料夾中增加/移除 `.tex` 檔，並在 `main.tex` 中用 `\input{sections/filename}` 語法進行調整。

## ⚠️ 免責聲明

本模板為非官方版本，格式係依據「國立臺南大學學位論文格式規範」製作，但可能有誤差，僅供參考。建議使用者根據系所要求自行調整，若有任何問題請提 Issues。

本模板基於 [anlit75/CCU-Thesis-LaTeX-Template](https://github.com/anlit75/CCU-Thesis-LaTeX-Template) 修改而成，感謝原作者的貢獻。

## 📄 License

本模板採用 MIT 授權，有關詳細信息請參閱 [LICENSE](LICENSE)。
