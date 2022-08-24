#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Main()
Func Main()
	Dim $Obj_WMIService = ObjGet("winmgmts:\\" & "localhost" & "\root\cimv2")
	Dim $Obj_Services = $Obj_WMIService.ExecQuery("Select * from Win32_ComputerSystem")
	Local $Obj_Item
		For $Obj_Item In $Obj_Services
			$manufacturer =  $Obj_Item.Manufacturer
			$model = $Obj_Item.Model
		Next
	$main = $manufacturer
	FileChangeDir(@ScriptDir)
	$main_config = IniRead("config.ini","General","main","Not find Gpu")
		If $main == $main_config Then
			MsgBox(0,0,$main)
		EndIf
EndFunc