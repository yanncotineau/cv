# CV - Yann Cotineau

Versioned history of my CV in French and English. PDFs are built automatically on push via GitHub Actions.

You can download the latest version of my CV here:

| Langue / Language | Download |
|---|---|
| Français | [COTINEAU_Yann_CV_fr.pdf](https://github.com/yanncotineau/cv/releases/latest/download/COTINEAU_Yann_CV_fr.pdf) |
| English | [COTINEAU_Yann_CV_en.pdf](https://github.com/yanncotineau/cv/releases/latest/download/COTINEAU_Yann_CV_en.pdf) |

## Build locally

```bash
# Install TeX Live (Ubuntu/Debian)
sudo apt-get install texlive texlive-fonts-extra texlive-latex-extra

# Compile (outputs PDF next to the .tex)
./build.sh 2026/04/fr.tex
```

## CLI reference

```
Usage: ./build.sh [options] <path/to/file.tex>
       ./build.sh [options] --all

Options:
  -v    Verbose: print full pdflatex output (silent by default)

Examples:
  ./build.sh 2026/04/fr.tex        # build a single CV
  ./build.sh --all                 # delete and rebuild every CV in the project
  ./build.sh -v --all              # same, with full pdflatex output
```
