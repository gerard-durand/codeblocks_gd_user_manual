@echo off 
if exist .\%output_dir% goto output_exists
mkdir %output_dir%
goto process_png_files

:output_exists
REM if exist %output_dir% del /Q /s %output_dir%\* >nul
if exist %output_dir% del /Q /s %output_dir%\%name%*.html >nul

:process_png_files
if not exist figures\png\*.png goto error_png
if exist figures\png\*.xbb goto process
rem  if files *.xbb exist, work has already been done
echo Builds png bounds files with ebb
cd figures\png
@for %%i in (*.png) do ebb -x %%i >nul
@cd ..\..
cd mystyles
@for %%i in (*.png) do ebb -x %%i >nul
@cd ..

:process

rem htlatex %name%.tex html "" -d%output_dir% "--interaction=nonstopmode"
rem htlatex %name%.tex "html,3,sections+,info,next,refcaption,fn-in" -utf8 -d%output_dir% "--interaction=nonstopmode"
rem htlatex %name%.tex "configfiles/html,html,3,sections+,info,next,refcaption,fn-in" -utf8 -d%output_dir% "--interaction=nonstopmode"

htlatex %name%.tex "%html_config_file%,html,pic-tabular,pic-longtable" -utf8 -d%output_dir%\ "--interaction=nonstopmode"

REM Move png converted tables to the output directory
move %name%*.png .\%output_dir%
REM Suppress the path part of images because they are all now in the same output directory
cd .\%output_dir%
sed -i "s/mystyles\///g"     %name%3.html
sed -i "s/figures\/png\///g" %name%3.html
REM Suppress the width=* (and height=*) fields in images (they are correct but generally too small). So, it uses the full image size.
sed -i "/^width=/c\ \/>"     %name%3.html
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

rem Reset_png no more useful: same job done by unix tool sed!
rem Reset_png %lang%

goto end

:usage

echo Usage: %0 file.tex
echo *** Caution *** If there is a html directory it will be deleted.
echo.
 
:end
rem pause
