script "card_Browser Behavior"
local sBrowserID
on preOpenCard
   local   tFile
   put levureAppFolder() & "/assets/pdfjs/web/test.txt" into tFile
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   answer tFile
   mobileControlSet sBrowserId, "url", ("file:" &  tFile) 
end preOpenCard
