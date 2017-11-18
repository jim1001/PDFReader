script "card_Browser Behavior"
local sViewerFile, sBrowserID
--
on preOpenCard
   put levureAppFolder() & "/assets/pdfjs/web/viewer.html" into sViewerFile
   if there is no file sViewerFile then
      answer "File does not exist:" && sViewerFile
      exit preOpenCard
   end if
   mobileControlCreate "browser"
   put the result into sBrowserId
   set the visible of graphic "placeholder" to false
   mobileControlSet sBrowserId, "rect", the rect of graphic "placeholder"
   mobileControlSet sBrowserId, "visible", "true"
   mobileControlSet sBrowserId, "url", ("file:" &  sViewerFile) -- show current test.pdf in browser
  end preOpenCard

--
-- buttonPDF
--
-- pFile: test1/test2.pdf passed by button mouseUp handler
--
command buttonPDF pFile
   local tSrcFile, tDestFile, tDestFolder
   -- Test we can write to dest folder first
   put levureAppFolder() & "/assets/pdfjs/web" into tDestFolder
   if canWriteFileTo(tDestFolder) is false then
      answer "Folder not writable:" &  tDestFolder
      exit buttonPDF
   end if
  put levureAppFolder() & "/assets/" & pFile into tSrcFile
   if there is no file tSrcFile then
      answer "File does not exist:" && tSrcFile
      exit buttonPDF
   end if
   put levureAppFolder() & "/assets/pdfjs/web/test.pdf" into tDestFile
   answer "Src:" && tSrcFile & cr & "Dest:" && tDestFile
   
   put URL ("binfile:" & tSrcFile) into URL ("binfile:" & tDestFile)
   mobileControlSet sBrowserId, "url", ("file:" &  sViewerFile)   
end buttonPDF

--
-- canWriteFileTo
--
-- Re: http://lessons.livecode.com/m/2592/l/125989-check-whether-a-directory-is-drive-or-write-protected
--
function canWriteFileTo pFolder
   local tRandomFileName
   put pFolder & "/temp" & random(9999) into tRandomFileName
   -- try creating a file
   open file tRandomFileName for write
   if the result is empty then
      -- success - get rid of the test file
      close file tRandomFileName
      delete file tRandomFileName
      return true
   else
      -- failed - couldn't create a file there
      return false
   end if
end canWriteFileTo
