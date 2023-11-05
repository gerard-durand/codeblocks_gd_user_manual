@echo off
set lang=en
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

cd .\%output_dir%
rem to avoid references to subsection and subsubsection, replace simply by section
sed -i "s/>subsubsection/>section/g" %name%3.html
sed -i "s/>subsection/>section/g"    %name%3.html
cd ..
