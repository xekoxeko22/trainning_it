
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#include <ButtonConstants.au3>


Local $my_gui = GUICreate("Menu",800,500)
Local $myGr = GUICtrlCreateGroup("game",10,10,250,150,$WS_GROUP)
GUICtrlCreateIcon("zing-speed.ico","NgocLoi",50,50,70,60,0x0100)
GUICtrlCreateButton("zing",150,50,70,60)
GUISetCursor(4,0,$myGr)

GUISetState(@SW_SHOW,$my_gui)


While 1
	Local $idMsg = GUIGetMsg()

	Select
		Case $idMsg = $gui_event_close
			ExitLoop
	EndSelect
WEnd
