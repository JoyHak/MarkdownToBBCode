;@Ahk2Exe-ConsoleApp
#Requires AutoHotKey v2.0.19
#Include '%A_ScriptDir%\source.ahk'
#ErrorStdOut
#Warn All, StdOut

A_Args.Repository := lastRepo
A_Args.Files := ''
A_Args.Save  := ''

while A_Args.length {
    NextArgValue() {
        if !A_Args.Length {
            MsgBox('Parameter error: Missing value for `'' arg '`'.')
            ExitApp 1
        }
        return A_Args.RemoveAt(1)
    }
        
    arg := NextArgValue()
    if !(SubStr(arg,1,2) ~= '[\/-]\w') {
        A_Args.Files .= arg . A_Space
        continue
    }

    arg := Trim(arg, '/-`t`'`' ')
    switch arg, false { ; case-insensitive comparison            
        case 'domain', 'repo', 'repository':
            A_Args.Repository := NextArgValue()
        case 'open', 'file':
            A_Args.Files .= NextArgValue() . A_Space
        case 'save', 'write':
            A_Args.Save := NextArgValue()
            
        default:                
            MsgBox('Parameter error: Unknown parameter `'' arg '`'.')
    }
    
} else {
    output("Parameter error: " A_ScriptName " requires at least one parameter")
    ExitApp 1
}

converted := ''
loop parse, A_Args.Files, A_Space {
    if FileExist(A_LoopField)       
        converted .= OpenFile(A_Args.Repository, A_LoopField)
    else
        converted .= Convert(A_LoopField, A_Args.Repository)
}

if A_Args.Save
    SaveFile(converted, A_Args.Save)