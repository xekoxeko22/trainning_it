#include <WinHTTP.au3>
$hOpen = _WinHttpOpen() ; Khởi tạo Winhttp
$hConnect = _WinHttpConnect($hOpen,'hocautoit.com') ; Kết nối đến 'hocautoit.com'
$hRequest = _WinHttpOpenRequest($hConnect,'GET','/') ; khởi tạo request 'GET' tới "/" = "http://hocautoit.com"&"/"
_WinHttpSendRequest($hRequest) ; Gửi request
_WinHttpReceiveResponse($hRequest) ; Chờ nhận Respone
$Data = _WinHttpSimpleReadData($hRequest,1) ; Đọc Respone
$sHeader = _WinHttpQueryHeaders($hRequest) ; Truy vấn Respone Headers
ConsoleWrite($sHeader & @LF) ; Ghi Respone Headers
; Ghi Respone vào file
$hFile = FileOpen(@ScriptDir&"\Hocautoit.com.html",10+256)
FileWrite($hFile,$Data)
FileClose($hFile)
; Mở file xem Respone
ShellExecute(@ScriptDir&"\Hocautoit.com.html")