script "card_Browser Behavior"
on preOpenCard
   local   tFile
   put levureAppFolder() & "/assets/pdfjs/web/viewer.html" into tFile
   set the visible of graphic "placeholder" to false
   set the URL of widget "Browser" to ("file:" &  tFile)
end preOpenCard
