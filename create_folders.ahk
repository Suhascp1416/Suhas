; AutoHotkey Script for Creating Folders and Subfolders
; Author: Assistant
; Description: This script provides multiple ways to create folders and subfolders

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases
#SingleInstance Force  ; Only one instance of the script can run
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory

; =============================================================================
; METHOD 1: Simple Folder Creation Function
; =============================================================================

CreateFolder(FolderPath) {
    ; Create a single folder or nested folder structure
    FileCreateDir, %FolderPath%
    if ErrorLevel
        MsgBox, 16, Error, Failed to create folder: %FolderPath%
    else
        MsgBox, 64, Success, Successfully created folder: %FolderPath%
}

; =============================================================================
; METHOD 2: Advanced Folder Creation with Error Handling
; =============================================================================

CreateFolderAdvanced(FolderPath) {
    ; Check if folder already exists
    IfExist, %FolderPath%
    {
        MsgBox, 48, Info, Folder already exists: %FolderPath%
        return false
    }
    
    ; Create the folder
    FileCreateDir, %FolderPath%
    if ErrorLevel {
        MsgBox, 16, Error, Failed to create folder: %FolderPath%`nError Level: %ErrorLevel%
        return false
    } else {
        MsgBox, 64, Success, Successfully created folder: %FolderPath%
        return true
    }
}

; =============================================================================
; METHOD 3: Create Multiple Folders from Array
; =============================================================================

CreateMultipleFolders(FoldersArray) {
    SuccessCount := 0
    FailCount := 0
    
    for index, folder in FoldersArray {
        FileCreateDir, %folder%
        if ErrorLevel
            FailCount++
        else
            SuccessCount++
    }
    
    MsgBox, 64, Batch Creation Complete, Successfully created: %SuccessCount% folders`nFailed: %FailCount% folders
}

; =============================================================================
; METHOD 4: Interactive Folder Creation
; =============================================================================

InteractiveFolderCreation() {
    InputBox, FolderName, Create Folder, Enter the folder path to create:, , 400, 150
    if ErrorLevel
        return  ; User cancelled
    
    if (FolderName = "") {
        MsgBox, 48, Warning, Please enter a valid folder name.
        return
    }
    
    CreateFolderAdvanced(FolderName)
}

; =============================================================================
; HOTKEY BINDINGS
; =============================================================================

; Ctrl+Alt+F: Interactive folder creation
^!f::
    InteractiveFolderCreation()
return

; Ctrl+Alt+1: Create example single folder
^!1::
    CreateFolder("TestFolder")
return

; Ctrl+Alt+2: Create nested folder structure
^!2::
    CreateFolder("Projects\WebDev\HTML")
    CreateFolder("Projects\WebDev\CSS")
    CreateFolder("Projects\WebDev\JavaScript")
    CreateFolder("Projects\Desktop\Python")
    CreateFolder("Projects\Desktop\CSharp")
return

; Ctrl+Alt+3: Create folder structure with current date
^!3::
    FormatTime, CurrentDate, , yyyy-MM-dd
    FolderName := "Backup_" . CurrentDate
    CreateFolder(FolderName)
    CreateFolder(FolderName . "\Documents")
    CreateFolder(FolderName . "\Images")
    CreateFolder(FolderName . "\Videos")
return

; Ctrl+Alt+4: Create multiple folders from predefined list
^!4::
    ; Define array of folders to create
    Folders := ["Documents\Reports", "Documents\Templates", "Downloads\Software", "Downloads\Media", "Projects\Active", "Projects\Archive"]
    CreateMultipleFolders(Folders)
return

; =============================================================================
; GUI METHOD: Create Folder with GUI Interface
; =============================================================================

; Ctrl+Alt+G: Show GUI for folder creation
^!g::
    Gui, Add, Text,, Enter folder path:
    Gui, Add, Edit, vFolderPath w300
    Gui, Add, Button, x10 y+10 w100 h30 gCreateBtn, Create Folder
    Gui, Add, Button, x+10 w100 h30 gCreateNestedBtn, Create Nested
    Gui, Add, Button, x+10 w100 h30 gCancelBtn, Cancel
    Gui, Show, w320 h120, Folder Creator
return

CreateBtn:
    Gui, Submit
    CreateFolderAdvanced(FolderPath)
return

CreateNestedBtn:
    Gui, Submit
    ; Create nested structure
    CreateFolderAdvanced(FolderPath)
    CreateFolderAdvanced(FolderPath . "\SubFolder1")
    CreateFolderAdvanced(FolderPath . "\SubFolder2")
    CreateFolderAdvanced(FolderPath . "\SubFolder3")
return

CancelBtn:
GuiClose:
    Gui, Destroy
return

; =============================================================================
; UTILITY FUNCTIONS
; =============================================================================

; Function to create folder structure from text file
CreateFromFile(FilePath) {
    IfNotExist, %FilePath%
    {
        MsgBox, 16, Error, File not found: %FilePath%
        return
    }
    
    Loop, Read, %FilePath%
    {
        if (A_LoopReadLine != "") {
            CreateFolderAdvanced(A_LoopReadLine)
        }
    }
}

; Function to create project template
CreateProjectTemplate(ProjectName) {
    if (ProjectName = "") {
        InputBox, ProjectName, Project Template, Enter project name:, , 300, 150
        if ErrorLevel
            return
    }
    
    ; Create main project folder
    CreateFolder(ProjectName)
    
    ; Create subfolders
    CreateFolder(ProjectName . "\src")
    CreateFolder(ProjectName . "\docs")
    CreateFolder(ProjectName . "\tests")
    CreateFolder(ProjectName . "\assets")
    CreateFolder(ProjectName . "\assets\images")
    CreateFolder(ProjectName . "\assets\css")
    CreateFolder(ProjectName . "\assets\js")
    CreateFolder(ProjectName . "\config")
    CreateFolder(ProjectName . "\build")
    
    MsgBox, 64, Success, Project template created: %ProjectName%
}

; Ctrl+Alt+P: Create project template
^!p::
    InteractiveProjectCreation()
return

InteractiveProjectCreation() {
    InputBox, ProjectName, Create Project Template, Enter project name:, , 400, 150
    if ErrorLevel
        return
    
    if (ProjectName = "") {
        MsgBox, 48, Warning, Please enter a valid project name.
        return
    }
    
    CreateProjectTemplate(ProjectName)
}

; =============================================================================
; HELP AND INSTRUCTIONS
; =============================================================================

; Ctrl+Alt+H: Show help
^!h::
    HelpText := "
    (
    AutoHotkey Folder Creation Script - Hotkeys:
    
    Ctrl+Alt+F  - Interactive folder creation
    Ctrl+Alt+G  - GUI folder creator
    Ctrl+Alt+P  - Create project template
    Ctrl+Alt+H  - Show this help
    
    Ctrl+Alt+1  - Create test folder
    Ctrl+Alt+2  - Create development folder structure
    Ctrl+Alt+3  - Create backup folders with date
    Ctrl+Alt+4  - Create multiple predefined folders
    
    Examples of folder paths:
    - SingleFolder
    - Parent\Child
    - Deep\Nested\Folder\Structure
    - C:\MyFolder (absolute path)
    - .\RelativeFolder (relative path)
    )"
    
    MsgBox, 64, Help - Folder Creation Script, %HelpText%
return

; =============================================================================
; STARTUP MESSAGE
; =============================================================================

; Show startup message
MsgBox, 64, Folder Creation Script Loaded, 
(
AutoHotkey Folder Creation Script is now active!

Press Ctrl+Alt+H for help and available hotkeys.
Press Ctrl+Alt+F for interactive folder creation.
Press Ctrl+Alt+G for GUI folder creator.
)