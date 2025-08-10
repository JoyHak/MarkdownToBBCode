;@Ahk2Exe-ConsoleApp
#Requires AutoHotKey v2.0.19
#Include <convert>
#ErrorStdOut
#Warn All, StdOut


StdOutHelp() {
    StdOut
    (
        "Md2bb is a command line interface to convert text with Markdown markup language to BBcode markup language.
        Copyright (c) 2025 Rafaello
        
        Usage: md2bb (<file_name> | <text> | @listfile) [<parameters> <switches>]
                
        Parameters order doesn't matter:
            md2bb -save 'forum.md' 'readme.md'
            md2bb 'readme.md' -save 'forum.md'
        Text can be combined:
            md2bb 'readme.md' 'add text' 'another text' 'license.md' -sep ' '
                    
        Parameters:            
            -save, -write                       The name / path of the file where to write the result. The result will be appended at the end of the file if it already exists.                                      
            -repo, -repository, -domain         Url to the repository for resolving relative links and references: #26 -> repo/issues/26, ![](relative path) -> ![](repo/relative path) .
            -sep, -separator, -delimiter        Separator for text parameters concatenation: 'Text' Sep 'Another Text' ...
            
        Switches:
            -h, -help                           Displays this help message.
            -overwrite                          Overwrite the file where to write the result.
        
        The value of '-repo' is stored on the disk, so it can be passed once. After that its value will be used for each md2bb usage:
            md2bb -repo 'https://github.com/JoyHak/MarkdownToBBCode' -> 'Repository has been saved'
            md2bb 'issue #1' -> issue [url=https://github.com/JoyHak/MarkdownToBBCode/issues/1]#1[/url]
        
        Parameters prefix can be / - --
        Parameter without prefix will be treated as file name / text / listfile to convert:
            md2bb 'readme.md' 'add text' '@listfile.md'
            Reads and converts contents of 'readme.md', then converts 'add text', then reads and converts contents of 'listfile.md' line by line.
        
        @listfile can be '@filename.ext' or '@path' and it can contain anything. It will be readed and each line will be converted as the text. If line contains file name / path, it's contents will be converted (if it exists). 
        Also it can be used to convert individual lines, combine them into one text and separate using symbol passed via '-sep' .
        
        You can pass the '|' symbol as a text to force the separation of parts of the text from each other:
            md2bb 'readme.md|@listfile.md'
            Reads and converts 'readme.md' file, then reads and converts 'listfile.md' line by line.
            
            md2bb 'sentence|will be|splitted'
            Convert 'sentence' 'will be' 'splitted' separately.
        
        Pass '-sep' symbol to concatenate different parts:
            md2bb 'sentence|will be|splitted'     -sep '_' -> 'sentence_will be_splitted'
            md2bb 'sentence' 'will be' 'splitted' -sep '_' -> 'sentence_will be_splitted'
        
            md2bb 'readme.md' 'add text' -sep '_' -save 'forum.md'
            Concatenates converted contents of 'readme.md' with 'add text' using '_' symbol and appends it to the 'forum.md'.
        
        You can pass multi-line text and '-sep' value:
            md2bb ' > Multi-line            ->  [quote]Multi-line
            > text'                             text[/quote]
            
            md2bb '*New*' '*line*' -sep '   ->  [i]New[/i]
            +'                                  [i]+line[/i]
            
        You can also pass any line break '<br>' or '<br/>' tags to get several lines of the text:
            md2bb '_New_<br>_line_'         ->  [i]New[/i]
                                                [i]line[/i]
        "
    )
}


A_Args.Repo  := lastRepo
A_Args.Sep   := '`n'
A_Args.Post  := ''
A_Args.Save  := ''
A_Args.Overwrite := false
ParseCommandLine()

saved     := SaveRepository(A_Args.Repo)
converted := ParsePost(A_Args.Post)

if converted {
    if A_Args.Save {
        if (A_Args.Overwrite && FileExist(A_Args.Save))
            try FileDelete A_Args.Save
            
        SaveFile(converted, A_Args.Save)
    } else {
        StdOut(converted)
    }
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
            case 'h', 'help':
                StdOutHelp()
            case 'save', 'write':
                A_Args.Save := NextArgValue()
            case 'overwrite':
                A_Args.Overwrite := true
            case 'domain', 'repo', 'repository':
                A_Args.Repo := NextArgValue()
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