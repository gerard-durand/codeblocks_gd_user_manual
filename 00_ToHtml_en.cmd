@echo off
set lang=en
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
call .\00_ToHtml.cmd
rem > .\00_ToHtml.log
