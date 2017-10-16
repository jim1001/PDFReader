script "card_Browser Behavior"
local sBrowserID
on preOpenCard
   local   tFile
   #put "file://" & levureAppFolder() & "/assets/pdfjs/web/viewer.html" into tURL
   put levureAppFolder() & "/assets/test.txt" into tFile
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   answer tFile
   mobileControlSet sBrowserId, "url", URL ("file:" &  tFile) 
   set the text of the field "fileContents" to URL ("file:" &  tFile) --fails without the bracket 
end preOpenCard
