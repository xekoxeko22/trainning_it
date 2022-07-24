#include <_HttpRequest.au3>


local $result= _HttpRequest(2, 'https://vcbdigibank.vietcombank.com.vn/login?returnUrl=%2F') ;Lấy source trang abc ở dạng String
local $result1= _HttpRequest(2, 'https://vietcombank.com.vn') ;Lấy source trang abc ở dạng String
MsgBox(0,0,$result)
MsgBox(0,0,$result1)





