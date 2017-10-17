script "card_Browser Behavior"
on preOpenCard
   local  sBrowserID,tFile
   put levureAppFolder() & "/assets/pdfjs/web/viewer.html" into tFile
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   answer "tFile:" && tFile
   mobileControlSet sBrowserId, "url", ("file:" &  tFile)    
 end preOpenCard
