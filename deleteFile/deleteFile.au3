#include <WinAPIFiles.au3>

Local $nox = ("C:\Users\Public\Desktop\" & "Nox.lnk")

	FileDelete($nox)
	Sleep(5000)
	FileDelete($nox)
	Sleep(5000)
	FileDelete($nox)

