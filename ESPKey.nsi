;NSIS Modern User Interface
;ESPKey Script


;--------------------------------
;Include Modern UI

  !include "MUI.nsh"
  !include WinMessages.nsh


;--------------------------------
;General

  ;Name and file
  Name "ESPKey"
  OutFile "ESPKey_inst.exe"

  ;Default installation folder
  InstallDir "$PROGRAMFILES\ESPKey"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\ESPKey" ""


;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING


;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "license.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES

  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

  !define MUI_FINISHPAGE_RUN
  !define MUI_FINISHPAGE_RUN_TEXT "Start ESPKey now"
  !define MUI_FINISHPAGE_RUN_FUNCTION "LaunchLink"
  !insertmacro MUI_PAGE_FINISH


;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English"


;--------------------------------
;Installer Sections

Section # install base files
  KillProcDLL::KillProc "ESPKey.exe"

  SetOutPath "$INSTDIR"

  ;Store installation folder
  WriteRegStr HKCU "Software\ESPKey" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

  File ESPKey.exe
  File ESPKey.ahk
  File ESPKey.ini
  File license.txt
  File ESPKoff.ico
  File ESPKon.ico
SectionEnd


Section "Desktop Shortcut" SecDesktop
  CreateShortCut "$DESKTOP\ESPKey.lnk" "$INSTDIR\ESPKey.exe"
SectionEnd


Section "Automatic Startup" SecStartup
  CreateShortCut "$SMSTARTUP\ESPKey.lnk" "$INSTDIR\ESPKey.exe"
SectionEnd


Section "Create Group" SecGroup
  CreateDirectory "$SMPROGRAMS\ESPKey"
  CreateShortCut "$SMPROGRAMS\ESPKey\ESPKey.lnk" "$INSTDIR\ESPKey.exe"
  CreateShortCut "$SMPROGRAMS\ESPKey\Uninstall.lnk" "$INSTDIR\uninstall.exe"
SectionEnd


Section "Quick Launch" SecQuick

  CreateShortCut "$QUICKLAUNCH\ESPKey.lnk" "$INSTDIR\ESPKey.exe"

SectionEnd


Function LaunchLink
  ExecShell "" "$SMPROGRAMS\ESPKey\ESPKey.lnk"
FunctionEnd


;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDesktop ${LANG_ENGLISH} "Create a shortcut on the desktop."
  LangString DESC_SecStartup ${LANG_ENGLISH} "Automatically run ESPKey when Windows starts."
  LangString DESC_SecGroup ${LANG_ENGLISH} "Create a folder in the Programs Menu"
  LangString DESC_SecQuick ${LANG_ENGLISH} "Create a Quick Launch shortcut"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDesktop} $(DESC_SecDesktop)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecStartup} $(DESC_SecStartup)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecGroup} $(DESC_SecGroup)
    !insertmacro MUI_DESCRIPTION_TEXT ${SecQuick} $(DESC_SecQuick)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END


;--------------------------------
;Uninstaller Section

Section "Uninstall"
  KillProcDLL::KillProc "ESPKey.exe"

  Delete "$INSTDIR\Uninstall.exe"
  Delete "$INSTDIR\ESPKey.exe"
  Delete "$INSTDIR\ESPKey.ahk"
  Delete "$INSTDIR\ESPKey.ini"
  Delete "$INSTDIR\license.txt"
  Delete "$INSTDIR\ESPKoff.ico"
  Delete "$INSTDIR\ESPKon.ico"
  Delete "$DESKTOP\ESPKey.lnk"
  Delete "$SMSTARTUP\ESPKey.lnk"
  Delete "$SMPROGRAMS\ESPKey\ESPKey.lnk"
  Delete "$SMPROGRAMS\ESPKey\Uninstall.lnk"
  Delete "$QUICKLAUNCH\ESPKey\ESPKey.lnk"
  Delete "$QUICKLAUNCH\ESPKey.lnk"

  RMDir "$SMPROGRAMS\ESPKey"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\ESPKey"
SectionEnd


