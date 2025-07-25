; Simple AutoHotkey Script for Creating Folders and Subfolders
; This is a basic version for beginners

#NoEnv
#SingleInstance Force

; =============================================================================
; BASIC FOLDER CREATION EXAMPLES
; =============================================================================

; Example 1: Create a single folder
CreateSingleFolder() {
    FolderName := "MyNewFolder"
    FileCreateDir, %FolderName%
    
    if ErrorLevel
        MsgBox, Error creating folder!
    else
        MsgBox, Folder created successfully: %FolderName%
}

; Example 2: Create nested folders (parent and child)
CreateNestedFolders() {
    ; This will create the full path, including parent folders if they don't exist
    FileCreateDir, ParentFolder\ChildFolder\GrandChildFolder
    
    if ErrorLevel
        MsgBox, Error creating nested folders!
    else
        MsgBox, Nested folders created successfully!
}

; Example 3: Create multiple separate folders
CreateMultipleFolders() {
    ; Create several folders one by one
    FileCreateDir, Folder1
    FileCreateDir, Folder2
    FileCreateDir, Folder3
    
    MsgBox, Multiple folders created: Folder1, Folder2, Folder3
}

; Example 4: Create a project structure
CreateProjectStructure() {
    ProjectName := "MyProject"
    
    ; Create main project folder
    FileCreateDir, %ProjectName%
    
    ; Create subfolders within the project
    FileCreateDir, %ProjectName%\Documents
    FileCreateDir, %ProjectName%\Images
    FileCreateDir, %ProjectName%\Videos
    FileCreateDir, %ProjectName%\Code
    FileCreateDir, %ProjectName%\Code\HTML
    FileCreateDir, %ProjectName%\Code\CSS
    FileCreateDir, %ProjectName%\Code\JavaScript
    
    MsgBox, Project structure created for: %ProjectName%
}

; Example 5: Interactive folder creation
CreateCustomFolder() {
    ; Ask user for folder name
    InputBox, UserFolder, Create Folder, What folder would you like to create?
    
    if ErrorLevel  ; User pressed Cancel
        return
    
    if (UserFolder = "")  ; User entered nothing
    {
        MsgBox, Please enter a folder name!
        return
    }
    
    ; Create the folder
    FileCreateDir, %UserFolder%
    
    if ErrorLevel
        MsgBox, Failed to create folder: %UserFolder%
    else
        MsgBox, Successfully created folder: %UserFolder%
}

; =============================================================================
; HOTKEY ASSIGNMENTS (Keyboard Shortcuts)
; =============================================================================

; Press Ctrl+1 to create a single folder
^1::CreateSingleFolder()

; Press Ctrl+2 to create nested folders
^2::CreateNestedFolders()

; Press Ctrl+3 to create multiple folders
^3::CreateMultipleFolders()

; Press Ctrl+4 to create project structure
^4::CreateProjectStructure()

; Press Ctrl+5 for interactive folder creation
^5::CreateCustomFolder()

; Press Ctrl+H to show help
^h::
MsgBox, 64, Help, 
(
Simple Folder Creator - Keyboard Shortcuts:

Ctrl+1 - Create a single folder
Ctrl+2 - Create nested folders
Ctrl+3 - Create multiple folders  
Ctrl+4 - Create project structure
Ctrl+5 - Interactive folder creation
Ctrl+H - Show this help

The script will create folders in the same directory as the script file.
)

; =============================================================================
; STARTUP
; =============================================================================

; Show welcome message when script starts
MsgBox, 64, Simple Folder Creator, 
(
Simple Folder Creator is ready!

Press Ctrl+H for help and available shortcuts.
Press Ctrl+5 for interactive folder creation.
)

; =============================================================================
; ADDITIONAL EXAMPLES (commented out - remove ; to use)
; =============================================================================

/*
; Create folders with current date
CreateDateFolders() {
    FormatTime, Today, , yyyy-MM-dd
    FolderName := "Backup_" . Today
    FileCreateDir, %FolderName%
    MsgBox, Created date folder: %FolderName%
}

; Create folders on Desktop
CreateDesktopFolder() {
    FileCreateDir, %A_Desktop%\MyNewFolder
    MsgBox, Created folder on Desktop
}

; Create folders in Documents
CreateDocumentsFolder() {
    FileCreateDir, %A_MyDocuments%\MyNewFolder
    MsgBox, Created folder in Documents
}
*/