/*

    "ESPKey"
    Copyright 2005, 2011 David M. Bradford

    This file is part of ESPKey.

    ESPKey is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ESPKey is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ESPKey.  If not, see <http://www.gnu.org/licenses/>.

    The author can be contacted at: davembradford@gmail.com
    The author's website is: http://www.tinypig.com

    This program was written using "AutoHotkey", which can be found at:
    http://www.autohotkey.com/

*/

#HotkeyInterval 99
#SingleInstance ignore
StringCaseSense, On

IniFile = %A_ScriptDir%\ESPKey.ini
IniRead, MainMenuKey, %IniFile%, Hotkeys, MainMenuKey
if MainMenuKey = ERROR
{
  IniWrite, ^', %IniFile%, Hotkeys, MainMenuKey
  IniRead, MainMenuKey, %IniFile%, Hotkeys, MainMenuKey
}
Hotkey, %MainMenuKey%, MainMenu

IfExist, %A_ScriptDir%\ESPKoff.ico
  menu,tray,icon,%A_ScriptDir%\ESPKoff.ico
menu,tray,add
menu,tray,add,About,about
menu,tray,add,Help,help

return

MainMenu:
IfExist, %A_ScriptDir%\ESPKon.ico
  menu,tray,icon,%A_ScriptDir%\ESPKon.ico
Input, buffer_key, L1T60
IfExist, %A_ScriptDir%\ESPKoff.ico
  menu,tray,icon,%A_ScriptDir%\ESPKoff.ico
if buffer_key = 0
  esp_key("0")
else if buffer_key = A
  esp_key("Á")
else if buffer_key = a
  esp_key("á")
else if buffer_key = E
  esp_key("É")
else if buffer_key = e
  esp_key("é")
else if buffer_key = i
  esp_key("í")
else if buffer_key = I
  esp_key("Í")
else if buffer_key = N
  esp_key("Ñ")
else if buffer_key = n
  esp_key("ñ")
else if buffer_key = O
  esp_key("Ó")
else if buffer_key = o
  esp_key("ó")
else if buffer_key = U
  esp_key("Ú")
else if buffer_key = u
  esp_key("ú")
else if buffer_key = !
  esp_key("¡")
else if buffer_key = ?
  esp_key("¿")
else if buffer_key = `;
  esp_key("ü")
else if buffer_key = :
  esp_key("Ü")
else if buffer_key = 1
  Reload
return

esp_key(key)
{
  ClipSaved := ClipboardAll
  Clipboard = %key%
  Send, ^v
  Clipboard := ClipSaved
  ClipSaved = 
}

help:
MsgBox,,ESP Help,
(
ESP is a simple program that makes it easier to type characters
for the Spanish language.  Simply press control-' (single quote)
followed by one of the following keys to produce an accented letter
or other special character:

control-'	followed by	!	yeilds	¡
control-'	followed by	?	yeilds	¿
control-'	followed by	a	yeilds	á
control-'	followed by	e	yeilds	é
control-'	followed by	i	yeilds	í
control-'	followed by	n	yeilds	ñ
control-'	followed by	o	yeilds	ó
control-'	followed by	u	yeilds	ú
control-'	followed by	;	yeilds	ü

The key combination that triggers the special characters can be modified
if you wish.  In the text file ESPKey.ini which is in the installation
directory, change the sequence ^' to something else using the
convention (control keys)(key) where control keys are one or more of
the following:

^	represents the control key
#	represents the windows key
+	represents the shift key
!	represents the alt key
)
return

about:
MsgBox,,About ESP,
(
"ESPKey"
Copyright 2005, 2011 David M. Bradford

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>

The author can be contacted at: davembradford@gmail.com
The author's website is: http://www.tinypig.com

This program was written using "AutoHotkey", which can be found at:
http://www.autohotkey.com/
)

return

