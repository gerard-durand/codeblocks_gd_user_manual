@echo off
set lang=fr
REM set output_dir=htmlweb
set output_dir=htmlweb_%lang%
set html_config_file=configfiles/htmlweb
if [%1]==[] goto nomdef
set name=%~n1
goto suite
:nomdef
rem set name=00_test_fr
set name=main_codeblocks_%lang%

:suite
REM Version with a call to htlatex
rem call .\00_ToHtml.cmd
rem > .\00_ToHtml.log 2>&1

REM Version with a call to make4ht
call .\00_MkToHtml.cmd
rem > .\00_MkToHtml.log 2>&1

rem Remplacement de mots "Contents" spécifiques par leur équivalent en français
cd .\%output_dir%
sed -i "s/Contents<\/a/Sommaire<\/a/g"                   %name%2.html
sed -i "s/Contents<\/h/Table des Mati\&egrave;res<\/h/g" %name%2.html
rem pour éviter des références sous-section et sous-sous-section, mettre simplement section
sed -i "s/>sous-sous-section/>section/g"                 %name%3.html
sed -i "s/>sous-section/>section/g"                      %name%3.html
cd ..

rem echo The End...
rem sleep 2
exit