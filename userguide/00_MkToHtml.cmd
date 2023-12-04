@echo off
REM Ajouter éventuellemnt _test (provisoire) à output_dir 
set output_dir=%output_dir%
rem _test

if exist .\%output_dir% goto output_exists
mkdir %output_dir%
goto process_png_files

:output_exists
REM if exist %output_dir% del /Q /s %output_dir%\* >nul
if exist %output_dir% (
    if exist %output_dir%\%name%*.html del /Q /s %output_dir%\%name%*.html >nul
)

:process_png_files
if not exist figures\png\*.png goto error_png
set Number_png=0
set Number_xbb=0
For %%a In ("figures\png\*.png") Do Set /A Number_png+=1
For %%a In ("figures\png\*.xbb") Do Set /A Number_xbb+=1
rem  if files *.xbb exist, and number of png files is equal to number of xbb files, work has already been done
if %Number_png% == %Number_xbb% goto process

echo Builds png bounds files with ebb
cd figures\png
@for %%i in (*.png) do ebb -x %%i >nul
@cd ..\..
cd mystyles
@for %%i in (*.png) do ebb -x %%i >nul
@cd ..

:process
rem htlatex %name%.tex "%html_config_file%,html,pic-tabular,pic-longtable" -utf8 -d%output_dir%\ "--interaction=nonstopmode"
make4ht -u -d %output_dir%\ -c %html_config_file% %name%.tex 

REM Suppress the path part of images because they are all now in the same output directory
cd .\%output_dir%
sed -i "s/mystyles\///g"     %name%3.html
sed -i "s/figures\/png\///g" %name%3.html
REM Suppress the width=* (and height=*) fields in images (they are correct but generally too small). So, it uses the full image size.
sed -i "/^width=/c\ \/>"     %name%3.html
REM replace some utf8 characters by their HTML equivalent (for a better browser compatibility)
rem sed -i "s/\xE2\x80\x99/\\\protect \\\OT1\\\textquoteright /g" %name%2.html
rem sed -i "s/relax \\\protect/relax/g" %name%2.html

rem move png files to the root folder of output_dir
move figures\png\*.png .
move mystyles\*.png .
rmdir /S/Q mystyles
rmdir /S/Q figures
cd ..

:clean
del /Q %name%.4tc*  > nul
del /Q %name%.4ct*  > nul
del /Q %name%.tmp*  > nul
del /Q %name%.xref* > nul
del /Q %name%.idv*  > nul
del /Q %name%.lg*   > nul
del /Q %name%.html* > nul
del /Q %name%.css*  > nul
del /Q %name%.glo*  > nul
del /Q %name%.dep*  > nul
del /Q %name%.dvi*  > nul
del /Q *.aux        > nul
del /Q mystyles\*.aux       > nul
rem del /Q %name%.foo   > nul
del /Q %name%.out.* > nul
del /Q %name%*.html > nul
del /Q %name%*.png  > nul