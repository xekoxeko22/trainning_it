#include <File.au3>

_FileCreate("Temp")
FileWrite("Temp","<Data><Values><Info>Information value 1</Info><Info>Information value 2</Info></Values><Other>Other information</Other></Data>")


Local $oXML = ObjCreate("Microsoft.XMLDOM")
$oXML.load("Temp")

$oOther = $oXML.SelectSingleNode("//Data/Other")            ; or //Other
ConsoleWrite("$oOther.text=[" & $oOther.text & "]" & @CRLF)

$oInfos = $oXML.SelectNodes("//Data/Values/Info")   ; or //Info or //Data//Info or //Values/Info
For $oInfo In $oInfos

    ConsoleWrite("$oInfo.text=[" & $oInfo.text  & "]" & @CRLF)
Next