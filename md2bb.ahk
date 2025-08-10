;@Ahk2Exe-ConsoleApp
#Requires AutoHotKey v2.0.19
#Include <convert>
#ErrorStdOut
#Warn All, StdOut

A_Args.Repo  := lastRepo
A_Args.Sep   := '`n'
A_Args.Post  := ''
A_Args.Save  := ''
ParseCommandLine()

saved     := SaveRepository(A_Args.Repo)
converted := ParsePost(A_Args.Post)

if converted {
    if A_Args.Save
        SaveFile(converted, A_Args.Save)
    else
        StdOut(converted)
} else if saved {
    StdOut('Repository has been saved')
}


ParseCommandLine() {
    while A_Args.length {
        NextArgValue() {
            if !A_Args.Length {
                StdErr('Parameter error: Missing value for "' arg '".')
                ExitApp 1
            }
            return A_Args.RemoveAt(1)
        }

        arg := NextArgValue()
        if !(SubStr(arg,1,2) ~= '[\/-]+\w') {
            A_Args.Post .= '|' arg 
            continue
        }

        arg := Trim(arg, '/-`t`'`" ')
        switch arg, false { ; case-insensitive comparison
            case 'domain', 'repo', 'repository':
                A_Args.Repo := NextArgValue()
            case 'save', 'write':
                A_Args.Save := NextArgValue()
            case 'sep', 'separator', 'delimiter':
                A_Args.Sep  := NextArgValue()
            default:
                StdErr('Parameter error: Unknown parameter "' arg '".')
        }

    } else {
        StdErr('Parameter error: ' A_ScriptName ' requires at least one parameter')
        ExitApp 1
    }
    
    A_Args.Post := LTrim(A_Args.Post, '|')
}


ParsePost(string) {
    post := ''
    
    loop parse, string, '|' {
        ; List file
        if (SubStr(A_LoopField, 1, 1) = '@') {
            f := SubStr(A_LoopField, 2)
            if FileExist(f) {
                post .= A_Args.Sep . ParseFile(f)
                continue
            }
        
        }

        if FileExist(A_LoopField)
            post .= A_Args.Sep . OpenFile(A_Args.Repo, A_LoopField)    
        else
            post .= A_Args.Sep . Convert(A_LoopField, A_Args.Repo)    
    }
    
    return Trim(post, A_Args.Sep)
}

ParseFile(path) {
    post := ''
    loop read, path
        post .= A_Args.Sep . ParsePost(A_LoopReadLine)
        
    return Trim(post, ' `r`n`t')
}