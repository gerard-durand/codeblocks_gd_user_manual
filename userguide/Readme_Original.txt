Requirements:
Installation of ImageMagick, inkscape, tex4ht (http://tug.org/applications/tex4ht/bugfixes.html) (for html-version of the document). It is recommended to use an official TeXLive system and not
a version that is included in standard Linux system.

Installation of TeXLive 2008:
1. Download http://tug.org/texlive/acquire.html TeXLive ISO Image
2. Unpack the image: lzmadec <texlive2008.iso.lzma >texlive2008.iso
3. Mount ISO image: mount -t iso9660 -o ro,loop,noauto /your/texlive2008.iso /mnt
4. Change directory to /mnt and execute ./install-tl
5. Choose full installation scheme

Hint:
If you want to install a TeXLive system on one PC and share the binaries and styles
within a network you will have to modify the file texmf.cnf in the directory
<Tex-Install-directory>/texmf/web2c. Change the variables TEXMFVAR and TEXMFCONFIG like this.

TEXMFVAR = $TEXMFMAIN
TEXMFCONFIG = $TEXMFMAIN

Other users in the network only need to mount the shared directory <Tex-Install-directory> and
then add the binaries of <Tex-Install-directory>/bin/<platform> to your PATH variable.

The user defined macros for the CB documentation are located in the subdirectory mystyles.
To add new search directories to the TeX system you can export the predefined environment
variable TEXINPUTS: (In a Linux or MINGW shell)
export TEXINPUTS=<directory>/mystyles:$TEXINPUTS

Alternatively you may copy the files to <Tex-Install-directory>/texmf-local/tex/latex/mystyles

For html-version copy the files for tex4ht in <Tex-Installation-directory>/texmf-local
and update tex database using command

texhash <Tex-Install-directory>/texmf-local

If you have question regarding installation or generating the document
please contact codeblocks@hightec-rt.com.

Generating documentation under linux or mingw shell:
pdf-version:
german version:

make -f makefiles/gendocu.mak pdf MAINFILE=main_codeblocks_fr

english version:
make -f makefiles/gendocu.mak pdf MAINFILE=main_codeblocks_en

The output file will be generated in the directory output.

html-version:
Use the command
make -f makefiles/gendocu.mak html MAINFILE=main_codeblocks_en

html-version for the CB webpage:
make -f makefiles/gendocu.mak htmlweb MAINFILE=main_codeblocks_en

How to write a tex document:
Escape Character in Latex:

special character must be escaped within the text

\&, \$, \#, \_, \^{}, \~{} \}, \{, \%,

Sections:

\part{name} Add a part to the document
\chapter{name} Add a chapter to the document
\section{name} Add a section to the document
\subsection{name} Add a subsection to the document
\genterm{name} Add a section entry without enumerating (e.g. for examples)

Labels:

\label{sec:name} labels of sections
\label{fig:name} labels of graphics. Use the as entry the name of the graphic.
\label{tab:name} label of tables
\label{eqn:name} label of equations
\label{lbl:name} label of hyperlinks within a document

Reference of labels:
\pxref{labelname} e.g. \pxref{sec:name}

Reference of urls:
\cite{url:name}. The file url_codeblocks.bbl contains the reference key.

Include graphics:

The label of graphics will be auto generated \label{fig:filename}. It can be reference within
the document with \pxref{fig:filename}. The search path of figures are figures/png, figures/eps, figures/pdf

\figures{filename without extension}{caption}

The following macro scales the graphic to 70% of the textwidth
\screenshot{filename without extension}{caption}

Tables:

Put tables in own files under the directory tables. The are include with the macro:

\tables{filename}{caption}

This macro support long tables (splitting tables across pages)
\longtables{format}{filename}

Macros:
\codeblocks is a macro for the name CodeBlocks
\menu{item1, item2, ..., itemn} Format for menu entries
\opt{name} Add formating for options
\optional{name} Specify optional parameters
\var{name} Variables that have to be substituted
\file{name} Formating file names
\samp{name} Add quote to name
\cmdline{name} Highlight command line entries.
\codeline{name} Highlight code within text.

Environments

For example cmdline output (e.g. excerpt of shell script)

\begin{cmd}
...
\end{cmd}

Include code snippets

\begin{code}
int main (void)
{
}
\end{code}

Include command files

\cmdinput{rel. path/filename}

Include source files

\codeinput{rel. path/filename}

Description:

\begin{description}
\item[item1] description
\item[item2] description
\end{description}

Itemize List:

\begin{itemize}
\item Option1
\item Option2
\end{itemize}

Enumeration:

\begin{enumerate}
\item first item
\item second item
\end{enumerate}

Description of code keywords (e.g. CB builtin variables etc.)
\begin{codeentry}
\item[.abort] Directive ...
\item[.dim] Directive ...
\end{codeentry}

Description for commands or options
\begin{optentry}
\item[--gstabs] option1 ...
\item[--help] option2 ...
\end{optentry}

Hyperlink to a document or url:

\href{name.pdf}{name in text}

This command will launch application for a file:

\launch{name der Datei}{name im Text}

Attach file in pdf document:

\attach{name der Datei}

Adding internal links:
\hyperlink{lbl:Text of anchor}{Name in text}

\hypertarget{lbl:Text of anchor}{Name in text}

Add hints:

\hint{Text}

Some additional information:
Since TeXLive 2008 the pdf compiler pdflatex supports the generation of sync information between
the generated file and the tex source. If you want to generate the sync information just invoke the
pdflatex --synctex=-1 texfile.tex

Different pdf viewer like sumatrapdf, different MAC pdf viewer and in the future evince and okular will support this feature. For example you can configure sumatrapdf for the so-called inverse search e.g.
<codeblocks-installation-direcotry>\codeblocks.exe --file=%f:%l

then a double click in the pdf file will result in a jump in the tex source in Code::Blocks.

Inkscape can be started in the command line without GUI and it is used for generation of the CB documentation to convert different from a vector format (e.g. svg, eps) to png.

ImageMagick is used for converting and resizing images.

If you call the makefile with
make -f makefiles/gendocu.mak help

will you see the available targets.

The tex input can be converted to different formats like pdf, html, xml, docbook, OpenOffice (odt) format, javahelp format etc.

