#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

closeProcess()
Func closeProcess()
	Local $n=IniRead("config.ini","General","num","none process want close")
		for $i= 1 To $n
			Local $name = IniRead("config.ini","General","nameProcess"&$i,"No find name process "&$i)
				if $name <>"" Then
					If ProcessExists($name) Then
						MsgBox(0,0,"Close process: " & $name)
						ProcessClose($name)
					ElseIf @error Then
						MsgBox(0,0,"Close process fail")
					EndIf
				EndIf
		Next
EndFunc