# LaTeX build

The CVs are plain `pdflatex` documents, one per language, in `src/`. Build them locally with:

```bash
./build.sh src/fr.tex   # one file
./build.sh --all        # every .tex in the repo
./build.sh -v src/fr.tex  # with full pdflatex output
```

The PDF lands next to the source, and the script cleans up the `.aux`/`.log`/`.out` files. You need TeX Live installed:

```bash
sudo apt-get install texlive texlive-fonts-extra texlive-latex-extra
```

CI uses the same sources with [xu-cheng/latex-action](https://github.com/xu-cheng/latex-action), so a file that builds locally builds there too.

One quirk: both documents disable PDF stream compression (`\pdfcompresslevel=0`). Some GDI-based printer drivers silently drop compressed content, which made printed pages come out mostly blank. The PDFs are a bit larger, but they print reliably.
