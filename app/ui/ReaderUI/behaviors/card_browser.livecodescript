script "card_Browser Behavior"
on preOpenCard
   local   tURL
   #put "file://" & levureAppFolder() & "/assets/pdfjs/web/viewer.html" into tURL
   put levureAppFolder() & "/assets/test.txt" into tURL
   set the visible of graphic "placeholder" to false
   answer tURL
   set the URL of widget "Browser" to tURL
end preOpenCard
