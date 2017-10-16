script "card_Browser Behavior"
local sBrowserID
on preOpenCard
   local   tURL
   #put "file://" & levureAppFolder() & "/assets/pdfjs/web/viewer.html" into tURL
   put "file://" & levureAppFolder() & "/assets/test.txt" into tURL
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   answer tURL
   mobileControlSet sBrowserId, "url", tURL
end preOpenCard
