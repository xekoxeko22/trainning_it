#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>


FileChangeDir(@ScriptDir&"\image_old")
	Local $fileSearch = FileFindFirstFile("*.*")
	Local $fileName =""
	Local $i = 1
	While $fileSearch
		$fileName = FileFindNextFile($fileSearch)
			if @error Then
				MsgBox(0,0,"Done")
				ExitLoop
			EndIf
			if FileExists($fileName) Then
				FileMove(@ScriptDir&"\image_old\"&$fileName,@ScriptDir&"\image_new\"&$i&".jpg",8)
				$i+=1
			EndIf
	WEnd