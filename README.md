# pass-extension-wsl-clip
Get --clip functionality with ```pass``` when using wsl/windows bash  
  
Uses powershell to copy the contents to the clipboard  

*Note: this has no protection against any sort of clipboard management software and passwords will get captured by them if you use one*
## Usage
```
pass psclip pass-name 
```

**Requirements:**
* Latest password store <https://www.passwordstore.org/>

## Installation
Either:
- ```export PASSWORD_STORE_ENABLE_EXTENSIONS=true``` (place in .bashrc or equivalent )
- Place psclip.bash in ~/.password-store/.extensions
  
or

- Place psclip.bash in ```/usr/lib/password-store/extensions```

##Assumtions
This script assumed Windows is installed on C:\  
If you have windows installed on another drive you can set the location of powershell via  
```export POWERSHELL_EXE_LOCATION=/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe``` (change as needed)

