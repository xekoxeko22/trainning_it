#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

;get name server
Local $serverName = IniRead("Config.ini","General","nameServer"," the nameServer config not find")
Local $currentPcname = @ComputerName

; ------------ prepare environment -----------


;If pc current is client
if $serverName <> $currentPcname Then
	MsgBox(0,0,"Game đang chạy ... ",2)
		; C:\ProgramData
	DirCopy(@ScriptDir&'\data\ProgramData', @AppDataCommonDir, $FC_OVERWRITE)
		; C:\Program Files
	DirCopy(@ScriptDir&'\data\ProgramFiles', @ProgramFilesDir, $FC_OVERWRITE)
		; C:\Users\Admin\Documents
	DirCopy(@ScriptDir&'\data\Documents', @MyDocumentsDir, $FC_OVERWRITE)
		; C:\Users\Administrator\AppData\Local
	DirCopy(@ScriptDir&'\data\LocalAppData', @LocalAppDataDir, $FC_OVERWRITE)
		;Run file reg
	runFileRegClient()
		; file shortcut
	runShortcut()
	MsgBox(0,0,"Game đang chạy ... ",5)
EndIf

;If pc current is server
If $serverName == $currentPcname Then
		; Coppy C:\ProgramData to launcher
	programDataToLauncher()
		; Coppy C:\Users\Administrator\AppData\Local to launcher to launcher
	localAppDataToLauncher()
		; Coppy C:\Program File to launcher
	programFilesToLaucher()
		; Xxport file reg to launcher
	exportReg()
	MsgBox(0,0,'Server: Create data',5)
EndIf


;--------------- library function -------------

 ;client
Func runFileRegClient()
	FileChangeDir(@ScriptDir&"\data\Reg")
	Local $fileSearch = FileFindFirstFile("*.*")
	Local $fileName =""
	While $fileSearch
		$fileName = FileFindNextFile($fileSearch)
			if @error Then ExitLoop
			if FileExists($fileName) Then RunWait('regedit.exe /s "'&$fileName&'"')
	WEnd
EndFunc

Func runShortcut()
	FileChangeDir(@ScriptDir&"\data\Run Shortcut")
	Local $fileSearch = FileFindFirstFile("*.*")
	Local $fileName =""
	While $fileSearch
		$fileName = FileFindNextFile($fileSearch)
		if @error Then ExitLoop
		ShellExecute($fileName)
	WEnd
EndFunc

; server
Func programDataToLauncher()
	$fileNum = IniRead("Config.ini","ProgramDataCoppy","fileNum","not have file coppy from programData to launcher")
	For $i = 1 To $fileNum Step +1
		$fileName = IniRead("Config.ini","ProgramDataCoppy","ProgramDataCoppy"&$i,"programData not config")
		Local $filePath = @AppDataCommonDir&"\"&$fileName
			If FileExists($filePath) And $fileName <> '' Then
				DirCopy($filePath,@ScriptDir&'\data\ProgramData\'& $fileName, $FC_OVERWRITE)
			ElseIf $fileName <> '' Then
				MsgBox(0,0,"Not find: " & $filePath)
			EndIf
	Next
EndFunc

Func localAppDataToLauncher()
	$fileNum = IniRead("Config.ini","LocalAppData","fileNum","not have file coppy from LocalAppData to launcher")
	For $i = 1 To $fileNum Step +1
		$fileName = IniRead("Config.ini","LocalAppData","LocalAppData"&$i,"LocalAppData not config")
		Local $filePath = @LocalAppDataDir&"\"&$fileName
			If FileExists($filePath) And $fileName <> '' Then
				DirCopy($filePath,@ScriptDir&'\data\LocalAppData\'& $fileName, $FC_OVERWRITE)
			ElseIf $fileName <> '' Then
				MsgBox(0,0,"Not find: " & $filePath)
			EndIf
	Next
EndFunc

Func programFilesToLaucher()
	$fileNum = IniRead("Config.ini","ProgramFiles","fileNum","not have file coppy from ProgramFiles to launcher")
	For $i = 1 To $fileNum Step +1
		$fileName = IniRead("Config.ini","ProgramFiles","ProgramFiles"&$i,"ProgramFiles not config")
		Local $filePath = @ProgramFilesDir&"\"&$fileName
			If FileExists($filePath) And $fileName <> '' Then
				DirCopy($filePath,@ScriptDir&'\data\ProgramFiles\'& $fileName, $FC_OVERWRITE)
			ElseIf $fileName <> '' Then
				MsgBox(0,0,"Not find: " & $filePath)
			EndIf
	Next
EndFunc

Func exportReg()
	$fileNum = IniRead("Config.ini","Reg","regNum","not have file export from server to launcher")
	For $i = 1 To $fileNum Step +1
		$regPath = IniRead("Config.ini","Reg","reg"&$i,"reg not config")
		if $regPath <> '' Then
			MsgBox(0,0,$regPath)
			ShellExecuteWait('REG', 'EXPORT "'&$regPath&' " "' & @ScriptDir & '\data\Reg\'& $i &'.reg"')
		EndIf
	Next
EndFunc
