; AutoHotkey Script to Take Screenshot and Save in Suhas Folder
; Press F12 to trigger screenshot

F12::
{
    ; Get current timestamp for unique filename
    FormatTime, TimeStr, , yyyy-MM-dd_HH-mm-ss
    
    ; Define the screenshot path in Suhas folder
    ScreenshotPath := A_ScriptDir . "\Suhas\screenshot_" . TimeStr . ".png"
    
    ; Ensure Suhas directory exists
    FileCreateDir, %A_ScriptDir%\Suhas
    
    ; Take screenshot of entire screen
    ; You can change this to capture active window only by using "A" instead of ""
    WinGetActiveTitle, ActiveTitle
    
    ; Method 1: Using built-in screenshot capability (Windows 10/11)
    ; This captures the entire screen
    DllCall("gdi32.dll\CreateCompatibleDC", "Ptr", 0, "Ptr")
    
    ; Alternative method using Windows API
    ; Get screen dimensions
    SysGet, VirtualWidth, 78
    SysGet, VirtualHeight, 79
    SysGet, VirtualX, 76
    SysGet, VirtualY, 77
    
    ; Create bitmap and save
    pToken := Gdip_Startup()
    pBitmap := Gdip_BitmapFromScreen(VirtualX "|" VirtualY "|" VirtualWidth "|" VirtualHeight)
    Gdip_SaveBitmapToFile(pBitmap, ScreenshotPath)
    Gdip_DisposeImage(pBitmap)
    Gdip_Shutdown(pToken)
    
    ; Show confirmation message
    TrayTip, Screenshot Saved, Screenshot saved to: %ScreenshotPath%, 3
    
    return
}

; Alternative hotkey Ctrl+Shift+S for screenshot
^+s::
{
    ; Get current timestamp for unique filename
    FormatTime, TimeStr, , yyyy-MM-dd_HH-mm-ss
    
    ; Define the screenshot path in Suhas folder
    ScreenshotPath := A_ScriptDir . "\Suhas\screenshot_" . TimeStr . ".png"
    
    ; Ensure Suhas directory exists
    FileCreateDir, %A_ScriptDir%\Suhas
    
    ; Simple method using Windows Snipping Tool API
    Run, powershell.exe -Command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds; $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height; $graphics = [System.Drawing.Graphics]::FromImage($bitmap); $graphics.CopyFromScreen($bounds.X, $bounds.Y, 0, 0, $bounds.Size); $bitmap.Save('%ScreenshotPath%'); $graphics.Dispose(); $bitmap.Dispose()", , Hide
    
    ; Wait a moment for the screenshot to be saved
    Sleep, 1000
    
    ; Show confirmation message
    TrayTip, Screenshot Saved, Screenshot saved to: %ScreenshotPath%, 3
    
    return
}

; Function to include GDI+ library (copy this if you have Gdip.ahk)
; If you don't have Gdip.ahk, the PowerShell method above will work
#Include <Gdip_All>

; Exit script with Ctrl+Alt+Q
^!q::ExitApp