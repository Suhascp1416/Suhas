AutoHotkey Screenshot Tool - Instructions
=========================================

This AutoHotkey script will take screenshots and save them in the "Suhas" folder.

SETUP:
1. Make sure AutoHotkey is installed on your Windows system
2. Double-click on "simple_screenshot.ahk" to run the script
3. The script will run in the background (you'll see it in the system tray)

USAGE:
- Press F12: Take a full screen screenshot
- Press Ctrl+F12: Take a screenshot of the active window
- Press Ctrl+Shift+S: Alternative full screen screenshot hotkey
- Press Ctrl+Alt+Q: Exit the script

SCREENSHOTS LOCATION:
All screenshots will be saved in the "Suhas" folder with timestamps:
- Full screen: fullscreen_YYYY-MM-DD_HH-MM-SS.png
- Window: window_YYYY-MM-DD_HH-MM-SS.png
- Alternative: screenshot_YYYY-MM-DD_HH-MM-SS.png

The script will automatically create the "Suhas" folder if it doesn't exist.

NOTES:
- The script uses PowerShell commands for taking screenshots (no additional libraries needed)
- Screenshots are saved as PNG files
- You'll see a notification when a screenshot is taken
- The script works on Windows 10/11 systems