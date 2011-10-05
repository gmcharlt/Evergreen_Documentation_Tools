#/bin/bash

#generate 1.6 draft html
 xsltproc --xinclude --stringparam base.dir /openils/var/web/evergreen_documentation/1.6/draft/html/ ~/Evergreen-DocBook/stylesheets/evergreen_docbook_files/evergreen_xhtml.xsl ~/Evergreen-DocBook/1.6/root.xml


#Generate 1.6 PDF via FO
 xsltproc --xinclude  --output ~/Evergreen-DocBook/1.6/pdf/temp.fo ~/Evergreen-DocBook/stylesheets/evergreen_docbook_files/evergreen_fo.xsl ~/Evergreen-DocBook/1.6/root.xml

# must run fop from same directory as root.xml
cd ~/Evergreen-DocBook/1.6/

 ~/doctools/fop/fop -fo pdf/temp.fo -pdf /openils/var/web/evergreen_documentation/1.6/draft/pdf/Evergreen_Documentation.pdf 

# remove temporary .fo file
rm pdf/temp.fo
