WinGet, Anthem, List, Anthem
#ifWinActive Anthem
; to force the hotkeys only to Anthem

toggle1 := false
toggle2 := false
toggle3 := false

CustomColor = 000000  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop +ToolWindow -Caption ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s14 q3  ; q3 to non-antialias the text, only works in AHK_L
Gui, Add, Text, vMyText cLime w200 +Center
Gui, Add, Text, vMyText2 cLime w200 +Center
Gui, Add, Text, vMyText3 cLime w200 +Center
WinSet, TransColor, %CustomColor% 150
sw := A_ScreenWidth/100
sh := A_ScreenHeight/100
Gui, Show, % "x" . sw*44 . " y" sh*2 ;, NoActivate  ; NoActivate avoids deactivating the currently active window.
return


$F1::
	if(toggle1) {
        toggle1 := false
		SetTimer, Send1, Off
		GuiControl,, MyText,
    } else {
        toggle1 := true
			toggle2 := false
			toggle3 := false
			SetTimer, Send2, Off
			SetTimer, Send3, Off
			GuiControl,, MyText2,
			GuiControl,, MyText3,
        ; Choose a delay here!
        SetTimer, Send1, 300
		GuiControl,, MyText, AUTO-SALVAGE ON
    }
return

$F2::
	if(toggle2) {
        toggle2 := false
        SetTimer, Send2, Off
		GuiControl,, MyText2,
    } else {
        toggle2 := true
				toggle1 := false
				toggle3 := false
				SetTimer, Send1, Off
				SetTimer, Send3, Off
				GuiControl,, MyText,
				GuiControl,, MyText3,
        ; Choose a delay here!
        SetTimer, Send2, 300
		GuiControl,, MyText2, FLEXXI AUTO-SALVAGE ON
    }
return

$F3::
    if(toggle3) {
        toggle3 := false
        SetTimer, Send3, Off
		GuiControl,, MyText3,
    } else {
        toggle3 := true
			toggle1 := false
			toggle2 := false
			SetTimer, Send1, Off
			SetTimer, Send2, Off
			GuiControl,, MyText,
			GuiControl,, MyText2,
        ; Choose a delay here!
        SetTimer, Send3, 300
		GuiControl,, MyText3, CREATE CONSUMABLE ON
    }
return

Send1:
	ifWinActive, Anthem
	Send {f down}  ; Press down the up-arrow key.
	Sleep 600  ; Keep it down for 600 ms.
	Send {f up}  ; Release the up-arrow key.
return

Send2:
	ifWinActive, Anthem
	Send {f}  ; Press the F key.
	Send {Right}  ; Press right-arrow key.
	Send {f}  ; Press the F key.
	Send {Right}  ; Press right-arrow key.
	Send {f}  ; Press the F key.
	Send {Down}  ; Press down-arrow key.
	Send {f}  ; Press the F key.
	Send {Down}  ; Press down-arrow key.
	Send {f}  ; Press the F key.
	Send {Left}  ; Press left-arrow key.
	Send {f}  ; Press the F key.
	Send {Left}  ; Press left-arrow key.
	Send {f}  ; Press the F key.
	Send {Up}  ; Press up-arrow key.
	Send {f}  ; Press the F key.
	Send {Up}  ; Press up-arrow key.
return

Send3:
	ifWinActive, Anthem
	Send {space down}  ; Press down the up-arrow key.
	Sleep 1100  ; Keep it down for 1100 ms.
	Send {space up}  ; Release the up-arrow key.
return
