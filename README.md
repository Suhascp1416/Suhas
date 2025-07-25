# AutoHotkey Folder Creation Scripts

This repository contains AutoHotkey (AHK) scripts for creating folders and subfolders with various methods and automation features.

## Files Included

1. **`create_folders.ahk`** - Advanced script with GUI, multiple methods, and comprehensive features
2. **`simple_folder_creator.ahk`** - Basic script for beginners with simple examples

## Prerequisites

- Windows operating system
- AutoHotkey installed ([Download from autohotkey.com](https://www.autohotkey.com/))

## Quick Start

1. Download and install AutoHotkey
2. Download one of the `.ahk` scripts
3. Double-click the script file to run it
4. Use the keyboard shortcuts or GUI to create folders

## Script Features

### Advanced Script (`create_folders.ahk`)

**Keyboard Shortcuts:**
- `Ctrl+Alt+F` - Interactive folder creation dialog
- `Ctrl+Alt+G` - GUI folder creator with buttons
- `Ctrl+Alt+P` - Create project template structure
- `Ctrl+Alt+H` - Show help dialog
- `Ctrl+Alt+1` - Create test folder
- `Ctrl+Alt+2` - Create development folder structure
- `Ctrl+Alt+3` - Create backup folders with current date
- `Ctrl+Alt+4` - Create multiple predefined folders

**Features:**
- Error handling and validation
- Check for existing folders
- GUI interface for easy use
- Project template creation
- Batch folder creation
- Date-based folder naming

### Simple Script (`simple_folder_creator.ahk`)

**Keyboard Shortcuts:**
- `Ctrl+1` - Create a single folder
- `Ctrl+2` - Create nested folders
- `Ctrl+3` - Create multiple folders
- `Ctrl+4` - Create project structure
- `Ctrl+5` - Interactive folder creation
- `Ctrl+H` - Show help

**Features:**
- Easy to understand code
- Basic folder creation examples
- Interactive input prompts
- Simple error handling

## Usage Examples

### Creating Single Folders
```autohotkey
FileCreateDir, MyNewFolder
```

### Creating Nested Folder Structure
```autohotkey
FileCreateDir, Parent\Child\GrandChild
```

### Creating Project Structure
```autohotkey
FileCreateDir, MyProject
FileCreateDir, MyProject\src
FileCreateDir, MyProject\docs
FileCreateDir, MyProject\tests
```

### Interactive Creation
The scripts include interactive dialogs where you can:
- Enter custom folder names
- Choose creation options
- Get feedback on success/failure

## Folder Path Examples

- `SingleFolder` - Creates folder in script directory
- `Parent\Child` - Creates nested structure
- `C:\MyFolder` - Creates folder at specific absolute path
- `.\RelativeFolder` - Creates folder relative to script location
- `%A_Desktop%\NewFolder` - Creates folder on Desktop
- `%A_MyDocuments%\NewFolder` - Creates folder in Documents

## Customization

You can modify the scripts to:
- Change keyboard shortcuts
- Add your own folder templates
- Modify default folder names
- Add more predefined structures
- Change the GUI appearance

### Example Customization
```autohotkey
; Add your own hotkey
^!x::
    FileCreateDir, MyCustomFolder\SubFolder1
    FileCreateDir, MyCustomFolder\SubFolder2
    MsgBox, Custom folder structure created!
return
```

## Error Handling

The scripts include error handling for:
- Invalid folder names
- Permission issues
- Existing folders
- Path length limitations
- Special characters in names

## Advanced Features

### GUI Interface
The advanced script includes a graphical interface with:
- Text input fields
- Create buttons
- Cancel options
- Visual feedback

### Project Templates
Automatically create common project structures:
- Web development folders
- Software project layout
- Documentation structure
- Asset organization

### Batch Operations
Create multiple folders at once from:
- Predefined arrays
- Text files
- User input lists

## Troubleshooting

**Script won't run:**
- Ensure AutoHotkey is installed
- Check file extension is `.ahk`
- Run as administrator if needed

**Folders not created:**
- Check folder path is valid
- Ensure you have write permissions
- Verify disk space is available

**Hotkeys not working:**
- Check if other programs use same shortcuts
- Modify hotkey combinations if needed
- Ensure script is running (check system tray)

## Tips

1. **Test First**: Try creating folders in a test directory first
2. **Backup**: Always backup important data before running scripts
3. **Permissions**: Run as administrator for system directories
4. **Paths**: Use absolute paths for specific locations
5. **Organization**: Plan your folder structure before creating

## License

These scripts are provided as-is for educational and practical use. Feel free to modify and distribute according to your needs.

## Support

For AutoHotkey documentation and community support:
- [AutoHotkey Documentation](https://www.autohotkey.com/docs/)
- [AutoHotkey Community](https://www.autohotkey.com/community/)