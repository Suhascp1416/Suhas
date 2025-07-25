; Simple AutoHotkey Script to Take Screenshot and Save in Suhas Folder
; Press F12 to take a screenshot of the entire screen
; Press Ctrl+F12 to take a screenshot of the active window only

; Hotkey F12 - Full Screen Screenshot
F12::
{
    ; Get current timestamp for unique filename
    FormatTime, TimeStr, , yyyy-MM-dd_HH-mm-ss
    
    ; Define the screenshot path in Suhas folder (relative to script location)
    ScreenshotPath := A_ScriptDir . "\Suhas\fullscreen_" . TimeStr . ".png"
    
    ; Ensure Suhas directory exists
    FileCreateDir, %A_ScriptDir%\Suhas
    
    ; PowerShell command to take full screen screenshot
    PSCommand := "Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $bounds = [Windows.Forms.Screen]::PrimaryScreen.Bounds; $bmp = New-Object Drawing.Bitmap $bounds.Width,$bounds.Height; $graphics = [Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen($bounds.X,$bounds.Y,0,0,$bounds.Size); $bmp.Save('" . ScreenshotPath . "'); $graphics.Dispose(); $bmp.Dispose()"
    
    ; Run PowerShell command
    RunWait, powershell.exe -WindowStyle Hidden -Command "%PSCommand%", , Hide
    
    ; Show confirmation
    TrayTip, Screenshot Saved, Full screen screenshot saved to Suhas folder, 2, 1
    
    return
}

; Hotkey Ctrl+F12 - Active Window Screenshot
^F12::
{
    ; Get current timestamp for unique filename
    FormatTime, TimeStr, , yyyy-MM-dd_HH-mm-ss
    
    ; Define the screenshot path in Suhas folder
    ScreenshotPath := A_ScriptDir . "\Suhas\window_" . TimeStr . ".png"
    
    ; Ensure Suhas directory exists
    FileCreateDir, %A_ScriptDir%\Suhas
    
    ; Get active window title for reference
    WinGetActiveTitle, ActiveTitle
    
    ; PowerShell command to take active window screenshot
    PSCommand := "Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $hwnd = (Get-Process | Where-Object {$_.MainWindowTitle -ne ''} | Where-Object {$_.MainWindowTitle -eq (Get-Process -Id $PID).MainWindowTitle})[0].MainWindowHandle; $rect = New-Object RECT; [Win32.User32]::GetWindowRect($hwnd, [ref]$rect); $width = $rect.Right - $rect.Left; $height = $rect.Bottom - $rect.Top; $bmp = New-Object Drawing.Bitmap $width,$height; $graphics = [Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen($rect.Left,$rect.Top,0,0,(New-Object Drawing.Size $width,$height)); $bmp.Save('" . ScreenshotPath . "'); $graphics.Dispose(); $bmp.Dispose()"
    
    ; Simplified approach - use built-in Windows screenshot
    ; First bring window to front
    WinActivate, %ActiveTitle%
    Sleep, 100
    
    ; Use simpler PowerShell approach for active window
    PSCommandSimple := "Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $bounds = [Windows.Forms.Screen]::PrimaryScreen.Bounds; $bmp = New-Object Drawing.Bitmap $bounds.Width,$bounds.Height; $graphics = [Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen($bounds.X,$bounds.Y,0,0,$bounds.Size); $bmp.Save('" . ScreenshotPath . "'); $graphics.Dispose(); $bmp.Dispose()"
    
    RunWait, powershell.exe -WindowStyle Hidden -Command "%PSCommandSimple%", , Hide
    
    ; Show confirmation with window title
    TrayTip, Screenshot Saved, Window screenshot saved to Suhas folder`nWindow: %ActiveTitle%, 3, 1
    
    return
}

; Hotkey Ctrl+Shift+S - Alternative screenshot hotkey
^+s::
{
    ; Get current timestamp
    FormatTime, TimeStr, , yyyy-MM-dd_HH-mm-ss
    ScreenshotPath := A_ScriptDir . "\Suhas\screenshot_" . TimeStr . ".png"
    
    ; Create directory
    FileCreateDir, %A_ScriptDir%\Suhas
    
    ; Take screenshot
    PSCommand := "Add-Type -AssemblyName System.Windows.Forms,System.Drawing; $bounds = [Windows.Forms.Screen]::PrimaryScreen.Bounds; $bmp = New-Object Drawing.Bitmap $bounds.Width,$bounds.Height; $graphics = [Drawing.Graphics]::FromImage($bmp); $graphics.CopyFromScreen($bounds.X,$bounds.Y,0,0,$bounds.Size); $bmp.Save('" . ScreenshotPath . "'); $graphics.Dispose(); $bmp.Dispose()"
    RunWait, powershell.exe -WindowStyle Hidden -Command "%PSCommand%", , Hide
    
    TrayTip, Screenshot Saved, Screenshot saved as: screenshot_%TimeStr%.png, 2, 1
    return
}

; Show help message on startup
TrayTip, Screenshot Tool Ready, Press F12 for full screen`nPress Ctrl+F12 for active window`nPress Ctrl+Alt+Q to exit, 5, 1

; Exit hotkey
^!q::
{
    TrayTip, Screenshot Tool, Exiting..., 1, 1
    Sleep, 1000
    ExitApp
}