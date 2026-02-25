# National University of Tainan (NUTN) Thesis LaTeX Template

A LaTeX template for master's and doctoral theses at National University of Tainan, designed according to the official NUTN thesis formatting guidelines. Includes Docker and GitHub Codespaces integration for a zero-configuration writing environment.

> 中文版請參閱 [README.md](README.md)

## Table of Contents

- [⚡ Get The Template](#-get-the-template)
- [🚀 Quick Start](#-quick-start)
- [🐳 Local DevContainer](#-local-devcontainer)
- [☁️ Auto Build & Backup](#️-auto-build--backup)
- [📂 Template Structure](#-template-structure)
- [📖 User Guide](#-user-guide)
- [⚠️ Disclaimer](#️-disclaimer)
- [📄 License](#-license)

## ⚡ Get The Template

Click the green **`[Use this template]`** button above and select **Private** to create your thesis repository.

> [!WARNING]\
> Do not fork this repository directly!\
> Your thesis should remain confidential — forked repos are public by default.

## 🚀 Quick Start

**For:** Users who don't want to install anything locally or just want a quick preview.

1. Click the green **`Code`** button > switch to the **`Codespaces`** tab.
2. Click **`Create codespace on branch-name`**.
3. Wait for the environment to load (first time ~10–15 min).
4. **Done!**

> [!TIP]\
> Open `main.tex` and press `Ctrl+S` to trigger compilation.\
> The compiled PDF will appear in the preview pane.

## 🐳 Local DevContainer

**For:** Users who need offline access or prefer working with local VS Code.

### Setup
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop) and restart your computer.
2. Install VS Code with `Remote Explorer` and `Dev Containers` extensions.

### Launch
1. `git clone` your thesis repository.
2. Open the folder in VS Code.
3. Click **"Reopen in Container"** when prompted (or press `F1` > `Dev Containers: Reopen in Container`).
4. Wait for the container to build (~10–15 min first time). **Done!**

### Overleaf
You can also upload the template to [Overleaf](https://www.overleaf.com/). Make sure to set the compiler to **XeLaTeX**.

## ☁️ Auto Build & Backup

Every push to GitHub automatically compiles your thesis in the cloud, providing a PDF backup.

1. Go to the **`Actions`** tab in your repository.
2. Click the latest workflow run.
3. Download the PDF from the **`Artifacts`** section at the bottom.

> [!NOTE]\
> Cloud-generated PDFs are retained for **5 days**.

## 📂 Template Structure

```
NUTN-Thesis-LaTeX-Template
├── main.tex                            // Main document
├── nutnsetup.tex                       // Thesis configuration (edit your info here)
├── nutnthesis.cls                      // Template class file
├── watermark.jpg                       // NUTN logo watermark
├── frontpages
│   ├── abstract.tex                    // Chinese/English abstract
│   ├── acknowledgement.tex             // Acknowledgement
│   ├── denotation.tex                  // Symbol definitions
│   └── verification.pdf                // Verification letter (scanned PDF)
├── sections
│   ├── 01introduction.tex              // Chapter 1: Introduction
│   ├── 02related_work.tex              // Chapter 2: Literature Review
│   ├── 03method.tex                    // Chapter 3: Methodology
│   ├── 04experiments.tex               // Chapter 4: Results
│   └── 05conclusion.tex                // Chapter 5: Conclusion
├── backpages
│   ├── appendix.tex                    // Appendix
│   └── references.bib                  // Bibliography database
├── figures                             // Figures directory
└── .github/workflows/build.yml         // GitHub Actions CI
```

## 📖 User Guide

### 1. Configure Thesis Information

Edit `nutnsetup.tex` with your thesis details:

```latex
\nutnsetup{
  university    = {國立臺南大學},
  college       = {教育學院},              % College name
  institute     = {教育學系},              % Department name
  program       = {教育經營與管理碩士班},   % Program (leave empty if N/A)
  title         = {您的論文標題},           % Chinese title
  title*        = {Your Thesis Title},     % English title
  author        = {王大明},                % Chinese name
  author*       = {Da-Ming Wang},          % English name
  advisor       = {陳教授},                % Advisor Chinese name
  advisor*      = {Professor Chen},        % Advisor English name
  date          = {一百一十五年~二月},      % ROC date
  date*         = {February~2026},         % Western date
  keywords      = {關鍵字一, 關鍵字二},
  keywords*     = {Keyword1, Keyword2},
}
```

### 2. Set Degree and Language

In `main.tex`:

```latex
\documentclass[
  degree    = master,     % master | doctor
  language  = chinese,    % chinese | english
  fontset   = template,   % default | template
]{nutnthesis}
```

### 3. Thesis Page Order

Per NUTN regulations, pages are ordered as follows:

| # | Item | Command/File |
|---|------|-------------|
| 1 | Cover | `\makecover` |
| 2 | Title Page | `\maketitlepage` |
| 3 | Verification Letter | `\makeverification` or `\renderverification{path}` |
| 4 | Chinese Abstract | `frontpages/abstract.tex` |
| 5 | English Abstract | `frontpages/abstract.tex` (`abstract*` environment) |
| 6 | Acknowledgement | `frontpages/acknowledgement.tex` |
| 7 | Table of Contents | `\maketableofcontents` |
| 8 | List of Tables | `\makelistoftables` |
| 9 | List of Figures | `\makelistoffigures` |
| 10 | Symbol Definitions | `frontpages/denotation.tex` (optional) |
| 11 | Thesis Body | `sections/` directory |
| 12 | References | APA format (College of Education) |
| 13 | Appendix | `backpages/appendix.tex` |

### 4. Format Specifications

This template follows NUTN guidelines with the following defaults:

- **Margins**: Left 3cm, Right 2cm, Top/Bottom 2.5cm (single-sided)
- **Chinese Font**: PMingLiU (新細明體)
- **English Font**: Times New Roman
- **Heading Sizes**: Chapter 20pt, Section 18pt, Subsection 16pt, Paragraph 14pt, Body 12pt
- **Page Numbers**: Roman numerals for front matter, Arabic for body; centered at footer
- **Watermark**: NUTN logo, 6.5cm × 6.5cm
- **Citations**: APA format (College of Education)
- **Figure/Table Numbering**: Chapter-based (e.g., Table 3-1, Figure 3-1)

## ⚠️ Disclaimer

This is an **unofficial** template. While it follows the official NUTN thesis formatting guidelines, there may be discrepancies. Please verify against your department's requirements.

Based on [anlit75/CCU-Thesis-LaTeX-Template](https://github.com/anlit75/CCU-Thesis-LaTeX-Template). Thanks to the original author for their contribution.

## 📄 License

This template is licensed under the MIT License. See [LICENSE](LICENSE) for details.
