@echo off
REM TeX Clean v1.01 [Morten Mac-Fly]
echo Cleaning folder. Please wait...
if exist *.4ct del *.4ct >nul
if exist *.4tc del *.4tc >nul
if exist *.aux del *.aux >nul
if exist *.bak del *.bak >nul
if exist *.bbl del *.bbl >nul
if exist *.blb del *.blg >nul
if exist *.blg del *.blg >nul
if exist *-blx.bib del *-blx.bib >nul
if exist *.css del *.css >nul
if exist *.dep del *.dep >nul
if exist *.dvi del *.dvi >nul
REM if exist *.env del *.env >nul
if exist *.glo del *.glo >nul
if exist *.gls del *.gls >nul
if exist *.html del *.html >nul
if exist *.idx del *.idx >nul
if exist *.idv del *.idv >nul
if exist *.ilg del *.ilg >nul
if exist *.ind del *.ind >nul
if exist *.lg  del *.lg  >nul
if exist *.lof del *.lof >nul
rem if exist *.log del *.log >nul
if exist *.lot del *.lot >nul
if exist *.nlg del *.nlg >nul
if exist *.nlo del *.nlo >nul
if exist *.nls del *.nls >nul
if exist *.out del *.out >nul
rem if exist *.pdf del *.pdf >nul
if exist *.ps  del *.ps  >nul
if exist *.prj.bak  del *.prj.bak >nul
if exist *.prj.old  del *.prj.old >nul
if exist *.run.xml  del *.run.xml >nul
if exist *.sav del *.sav >nul
if exist *.synctex* del *.synctex* >nul
if exist *.tcp del *.tcp >nul
if exist *.tex.sav del *.tex.sav >nul
if exist *.tmp del *.tmp >nul
if exist *.toc del *.toc >nul
if exist *.tps del *.tps >nul
if exist *.xref del *.xref >nul
if exist *.png del *.png >nul

if exist figures\png\*.xbb del figures\png\*.xbb >nul
if exist mystyles\*.xbb    del mystyles\*.xbb >nul

if not exist *.prj goto NoCopy
echo Backing up project file.
copy *.prj *.prj.old > nul

:NoCopy
if exist *.prj.old echo Done.
