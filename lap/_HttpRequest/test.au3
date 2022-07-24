#include <_HttpRequest.au3>


Local $result = _HttpRequest(2, 'https://vcbdigibank.vietcombank.com.vn/login?returnUrl=%2F') ;Lấy source trang abc ở dạng String
MsgBox(0, 0, $result)





