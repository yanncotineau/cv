# Releases

The sources live in `src/fr.tex` and `src/en.tex`. Each one carries a version date in its header:

```tex
% Version : 2026-04-11 (FR)
```

To publish a new version, set the same `YYYY-MM-DD` date in both files and push to `main`.

The [workflow](../.github/workflows/build-cv.yml) then takes over. It reads the date from both files and fails if they differ or don't parse. It compiles both PDFs, tags the commit with the date (e.g. `2026-04-11`), and publishes a release named after it (e.g. "CV - April 11th, 2026") with the two PDFs attached.

Pushing again with the same date replaces that release: the old tag and release are deleted and recreated on the new commit, so same-day fixes just work.

The newest release is always marked as latest, which keeps the permanent download links in the [README](../README.md) pointing at the current PDFs.
