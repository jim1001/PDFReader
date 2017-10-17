script "card_Browser Behavior"
on preOpenCard
   set the visible of graphic "placeholder" to false
   set the URL of widget "Browser" to (levureAppFolder() & "/assets/pdfjs/web/viewer.html")
end preOpenCard
