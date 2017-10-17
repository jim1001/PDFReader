script "card_Browser Behavior"
local sBrowserID
on preOpenCard
   local   tFile, tFile2
   put "/sdcard/DemPowerAssets/pdfjs/web/viewer.html" into tFile
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   answer "file1:" && tFile
   mobileControlSet sBrowserId, "url", ("file:" &  tFile) 
   put "/sdcard/DemPowerAssets/test.txt" into tFile2
   answer "file2:" && tFile2
   set the text of the field "fileContents" to URL ("file:" &  tFile2)
end preOpenCard
