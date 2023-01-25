# codeblocks_gd_user_manual

Sources in tex to build CodeBlocks User Manual, in english and in french are in the folder userguide.
manual_codeblocks_\*.tex is the main entry to build a pdf file via Miktex (_\*=en for english version and fr for a french one)
main_codeblocks_\*.tex is a small variation of the previous one, more adapted for html and chm versions.
manual_codeblocks_fr.pdf and manual_codeblocks_en.pdf are produced by Miktex inside userguide. They can be copied in htmlweb folder.

00_ToHtml_en.cmd is a batch Windows file to build an english version of the documentation in html.
00_ToHtml_fr.cmd is the same as previous, but for a french version
They both call 00_ToHtml.cmd which really produces the files.

Depending on parameters set in cmd files, html files are stored in a local htmlweb, htmlweb_en or htmlweb_en folder.
These contents can be copied in the root htmlweb folder.

In userguide folder, there is a slighly modified version of text4ht.env, normally used by Miktex to produce html version from tex files, to avoid 
some problems with move and copy commands. I prefer their equivallent, mv and cp, as may be found in Msys2 distribution.
