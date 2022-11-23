To build the documentation with MikTex :
You need a MikTex installation (a personnal one is OK, it will be installed in your User's AppData subdirectory)
Associate .tex files with Miktex (if not done already)

Use manual_en.tex to build the english pdf version
Use manual_fr.tex to build the french  pdf version

Use 00_ToHtml_en.cmd to build the english html version
Use 00_ToHtml_fr.cmd to build the french  html version
Both results are mixed in a single htmlweb directory. It's possible to separate versions by languages (see 00_ToHtml_en.cmd or 00_ToHtml_fr.cmd moving the REM of output_dir).

Note manual_en.tex and main_codeblocks_en.tex file have only a small difference (idem for manual_fr.tex and main_codeblocks_fr.tex).
- The first one builds the doc with a Table of contents, useful for the pdf version.
- The second one does not build the table of contents, usefull for the html version.

To build html version, you need a slightly modified version of tex4ht.env (replace copy and move by their equivalent unix cp and mv because problems with / and \.
You need also some unix tools : sed, cp and mv (you have them if you use msys2 under Windows. They must be accessible through your PATH environment variable)

To obtain a chm version, I use the freeware HelpNDoc (version 8 in november 2022). Some manual work is needed.

Import directly the file *3.html produced in htmlweb, and choose the option to "try to split the document into multiple chapters". Keep only levels 1 to 4. This gives quite good results except that chapters need to contain at least one line of text. It's why some lines have been added from here to here in tex files.

It's possible to add text directly in pages, if needed.

The result is quite OK, but there are still a few problems: 
- images and their legends are not centered : does not give a nice look, but it works. It's possible to correct this image by image and legend by legend.
- internal links in the chm file does not work (but they worked in the html files), as for example link to a specific figure or chapter. No problems with externals links, they work. Here too, it's possible in HelpNDoc to correct this manually by creating new links, but it's quite a lot of work. Is it a bug or a limitation of the free version of HelpNDoc ?

