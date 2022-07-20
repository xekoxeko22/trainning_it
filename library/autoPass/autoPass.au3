#include <AutoItConstants.au3>
#include <Array.au3>



Global $listWin = WinList("[REGEXPTITLE:(?i)(gcafe.*|Vietcombank.*|Chuyển đổi nhân.*|Đăng nhập.*|Esale login.*)]")
;_ArrayDisplay($listWin)

If $listWin[0][0] > 0 Then
	MouseClick ($MOUSE_CLICK_LEFT, 977, 452 ,1,0)
		If titleActive() == "Chuyển đổi nhân viên" Or titleActive() == "Đăng nhập" Then
			login_gcafe()
		ElseIf titleActive() == "Esale login" Then
			loginEsale()
		ElseIf titleActive() == "Vietcombank - Google Chrome" Then
			login_vietcombank()
		ElseIf titleActive() == "GCafe+ server 1.7.38 [XEKONET054 (Staff)]" Then
			SearchHoiVien()
		EndIf
Else
			MsgBox(0,0,"Không thấy mục  Đăng nhập")
EndIf

;------------ library function -----------



Func titleActive()
	for $i = 1 To $listWin[0][0] Step +1
		Local $hWnd = WinGetState($listWin[$i][1])
			if BitAND($hWnd, $WIN_STATE_ACTIVE) Then
				Return $listWin[$i][0]
			EndIf
	Next
EndFunc

Func loginEsale()
	MouseClick ($MOUSE_CLICK_LEFT, 941, 511 ,2,0)
		Sleep(300)
		Send("xekonet054")
		Sleep(300)
		Send("{TAB}")
		Sleep(300)
		Send("xekonet054")
		Sleep(300)
		Send("{ENTER}")
EndFunc


Func login_vietcombank()
	MouseClick ($MOUSE_CLICK_LEFT, 933, 588 ,2,0)
		Send("0915500345")
		Send("{TAB}")
		Sleep(300)
		Send("Xekonet054@")
		Send("{TAB}")
EndFunc


Func login_gcafe()
	MouseClick ($MOUSE_CLICK_LEFT, 945, 507 ,2,0)
		Send("XEKONET054")
		Send("{TAB}")
		Sleep(300)
		Send("XEKONET054")
		Send("{ENTER}")

EndFunc

Func SearchHoiVien()
	;click tab tai khoan
	MouseClick ($MOUSE_CLICK_LEFT, 133, 95 ,2,0)
	Sleep(300)
	; click search taikhoan
	MouseClick ($MOUSE_CLICK_LEFT, 376, 135 ,2,0)
EndFunc

;------------------- end ---------------