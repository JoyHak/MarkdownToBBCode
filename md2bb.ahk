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
ParseCommandLine(A_Args)
 
ExitApp(
    Output(
        ParsePost(A_Args.Post, A_Args.Repo, A_Args.Sep), 
        A_Args
    )
)


ParseCommandLine(args) {
    ParamErr(msg) => ExitApp(StdErr('Parameter error: ' msg '.'))
    
    if !args.length
        ParamErr('md2bb requires at least one parameter')
    
    unknownArgs := ''
    while args.length {
        NextArgValue() {
            if !args.Length                
                ParamErr('Missing value for "' arg '"')
                
            return args.RemoveAt(1)
        }

        arg := NextArgValue()
        if !(SubStr(arg,1,2) ~= '[\/-]+\w') {
            args.Post .= '|' arg 
            continue
        }

        arg := Trim(arg, '/-`t`'`" ')
        switch arg, false { ; case-insensitive comparison
            case 'h', 'help':
                StdOutHelp()
            case 'domain', 'repo', 'repository':
                args.Repo := NextArgValue()
            case 'sep', 'separator', 'delimiter':
                args.Sep  := NextArgValue()
            case 'save', 'write':
                args.Save := NextArgValue()
            case 'overwrite':
                args.Overwrite := true
            default:
                unknownArgs .= '"' arg '" '                
        }
    }
    
    if unknownArgs
        ParamErr('Unknown parameters ' unknownArgs)
    
    args.Post := LTrim(args.Post, '|')
}


ParsePost(string, repo, sep := '`n') {
    post := ''
    
    loop parse, string, '|' {
        ; List file
        if (SubStr(A_LoopField, 1, 1) = '@') {
            f := SubStr(A_LoopField, 2)
            if FileExist(f) {
                post .= sep . ParseFile(f, repo, sep)
                continue
            }        
        }

        if FileExist(A_LoopField)
            post .= sep . OpenFile(repo, A_LoopField)    
        else
            post .= sep . Convert(A_LoopField, repo)    
    }
    
    return Trim(post, sep)
}

ParseFile(path, repo, sep := '`n') {
    post := ''
    loop read, path
        post .= sep . ParsePost(A_LoopReadLine, repo, sep)
        
    return Trim(post, ' `r`n`t')
}

Output(post, args) {
    saved := SaveRepository(args.Repo)
    if (!post && saved)
        return StdOut('Repository has been saved')
    
    if !args.Save
        return StdOut(post)
        
    if (args.Overwrite && FileExist(args.Save)) {
        try
            FileDelete(args.Save)
        catch
            return FileErr('Unable to overwrite the file', args.Save)
    }
        
    return !SaveFile(post, args.Save)
}