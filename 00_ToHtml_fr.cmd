@echo off
set lang=fr
set output_dir=htmlweb
REM set output_dir=htmlweb_%lang%
set html_config_file=configfiles/htmlweb
if [%1]==[] goto nomdef
set name=%~n1
goto suite
:nomdef
rem set name=00_test_fr
set name=main_codeblocks_%lang%
:suite
.\00_ToHtml.cmd
rem > .\00_ToHtml.log

rem Remplacement de mots "Contents" spécifiques par leur équivalent en français
cd .\%output_dir%
sed -i "s/Contents<\/a/Sommaire<\/a/g"                   %name%2.html
sed -i "s/Contents<\/h/Table des Mati\&egrave;res<\/h/g" %name%2.html
cd ..

pause