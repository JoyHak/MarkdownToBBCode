;@Ahk2Exe-SetDescription https://github.com/JoyHak/MarkdownToBBCode
;@Ahk2Exe-SetProductName MarkdownToBBCode
;@Ahk2Exe-SetMainIcon Lib\Icon.ico
;@Ahk2Exe-SetCopyright Rafaello
;@Ahk2Exe-SetCompanyName ToYu studio
;@Ahk2Exe-SetLegalTrademarks GPL-3.0 license

#Requires AutoHotKey v2.0.19
#Include %A_LineFile%\..\output.ahk
KeyHistory(0)
Listlines(false)

SetKeyDelay(-1, -1)
SetWinDelay(-1)
SetWorkingDir(A_ScriptDir)
try TraySetIcon('Lib\Icon.ico')
lastRepo := IniRead('Config.ini', 'General', 'LastRepository', 'https://github.com/JoyHak/QuickSwitch')


Convert(post, repo) {
    post  := Trim(post, ' `r`n`t')
    if !post
        return ''

    SplitPath repo,,,,, &domain

    ; Replace unicode line breaks
	post := RegExReplace(post, '`a)\R', '`n')
    post := ParseUrls(post, repo)

    ; Hide individual blocks from the text and process them separately
    blocks := MarkdownBlocks()
    blocks.Add(&post, 'alternate',  'sx)<!-- \s* alternate \s* -->(.+)<!-- \s* /alternate \s* -->',         '{1}')
    blocks.Add(&post, 'code',       's)[ \t]*``````.*?\s(.+?)\s[ \t]*``````',                               '[code]{1}`n[/code]')
    blocks.Add(&post, 'image',      'sx) ! \[.*?\]  \( [ \t]* (.+?) [ \t]* \)',                             '[url]{1}[/url]')
    blocks.Add(&post, 'link',       'sx) \[  ( [^\[\]]{2,}? )  \]  \( [ \t]* (.+?) [ \t]* \)',              '[url={2}]{1}[/url]')
    blocks.Add(&post, 'pathIssue',  'x) (\S+ [\w\d]\/\S+ [\w\d]) \# (\d+)',                                 '[url=' domain '/{1}/issues/{2}]{1}#{2}[/url]')
    blocks.Add(&post, 'GHissue',    'x) [ \t] \b GH- (\d+)',                                                '[url=' repo '/issues/{1}]GH-{1}[/url]')
    blocks.Add(&post, 'issue',      'x) (?<!^|\#) \# (\d+)',                                                '[url=' repo '/issues/{1}]#{1}[/url]')
    blocks.Add(&post, 'pathCommit', 'x) (\S+ [\w\d] (\/ \S+ [\w\d])?) @ ( ([a-f0-9]{7}) [a-f0-9]{33} ) \b', '[url=' domain '/{1}/commit/{3}]{1}@{4}[/url]')
    blocks.Add(&post, 'mention',    'x)            @ (\S+  [\w\d])',                                        '[url=' domain '/{1}]@{1}[/url]')
    blocks.Add(&post, 'commit',     '(([a-f0-9]{7})[a-f0-9]{33})\b',                                        '[url=' repo '/commit/{1}]{2}[/url]')
    
    post := ParseTables(post)
    ; Replace markdown line breaks
    post := RegExReplace(post, '<\/?br[ \t]*\/?>', '`n')
	post := RegExReplace(post, 'm)(\\| {2})$', '`n')
    
    ; Parse each block
    post := ParseHtml(post)
    post := ParseLists(post)
    post := ParseQuotes(post)
    post := ParseMarkdown(post)

    blocks.RestoreAll(&post)
    return Trim(post, '`r`n `t')
}

ParseHtml(block) {
    ; Tags and line breaks
    static htmlTags := [
        ['(?<!\\)<sub>',                    '[size=85]'],
		['(?<!\\)</sub>',                   '[/size]'],
		['(?<!\\)<ins>',                    '[u]'],
		['(?<!\\)</ins>',                   '[/u]'],
        ['(?<!\\)<details>\s*<summary>(.+)</summary>',  '[spoiler2=$1]`n'],
		['(?<!\\)\s*<details>\s*',          '`n[spoiler]`n'],
		['(?<!\\)\s*<\/details>\s*',        '`n[/spoiler]`n'],
        ['(?<!\\)<\/\w+>',                  ''],
        ['(?<!\\)<(\w+)>',                  '[size=110]$1[/size]'],
		['\s*<!--\s*spoiler\s*-->\s*',      '`n[spoiler]`n'],
		['\s*<!--\s*/spoiler\s*-->\s*',     '`n[/spoiler]`n'],
		['s)<!--(.+)-->',                   '']
    ]

    for tag in htmlTags
		block := RegexReplace(block, tag[1], tag[2])

    return block
}

ParseMarkdown(block) {
    ; Simple markdown to BBcode syntax
	static replacements := [
        ; BBcode
		['\*\*(.+?)\*\*',               '[b]$1[/b]'],
		['__(.+?)__',                   '[b]$1[/b]'],
		['``(.+?)``',                   '[c]$1[/c]'],
		['~+(.+?)~+',                   '[strike]$1[/strike]'],
		['m)(?<![\[\\])\_(.+?)\_',      '[i]$1[/i]'],
		['m)(?<![\[*\\])\*(.+?)\*',     '[i]$1[/i]'],
		['m)^\s*####\s*(.+)',           '[size=125]$1[/size]'],
		['m)^\s*###\s*(.+)',            '[size=150]$1[/size]'],
		['m)^\s*##\s*(.+)',             '[size=180]$1[/size]'],
		['m)^\s*#\s*(.+)',              '[size=200]$1[/size]'],

		; Characters
		['&#9888;',                     ' :!: '],
        ['&sup1;',                      Chr(0xB9)],
		['&sup2;',                      Chr(0xB2)],
		['&sup3;',                      Chr(0xB3)]
	]

    for code in replacements
		block := RegExReplace(block, code[1], code[2])

    return block
}

ParseUrls(block, repository) {
    context := unset
    static isUrl := '(?:http[s]?:\/\/.)(?:www\.)?[-a-zA-Z0-9@%._\+~#=]{2,256}\.[a-z]{2,6}\b(?:[-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)'
    static urls  := 'sx) \[  [^\[\]]{2,}?  \]  \( [ \t]* (.+?) [ \t]* \)'

    ; Convert each relative url to absolute
    for url, ctx in RegExMatchAll(&block, urls) {
		context := ctx

        if (url[1] ~= isUrl)
            ctx.Replacement := url[0]
        else
            ctx.Replacement := StrReplace(url[0], url[1], repository '/' url[1])
    }

    if IsSet(context)
        block := context.Haystack

    return block
}

ParseTables(block) {
    context  := unset
    static tables := 'x) ^ \| (.*?) \|? \r?\n \| \s* [:-]+ .+ ((?: \r? \n (?=\|) .+ )+)'

    for table, ctx in RegExMatchAll(&block, tables) {
        context := ctx
        
		header := '[tr][th]' table[1] '[/th][/tr]'
		header := StrReplace(header, '|', '[/th][th]')   ; Columns delimiters 
                                                                                           
        rows   := Trim(table[2], ' `t`r`n')   
        MsgBox rows
        rows   := RegExReplace(rows, 'm)^\|(.*?)\|?$', '[tr][td]$1[/td][/tr]') 
        MsgBox rows
        rows   := StrReplace(rows,   '|', '[/td][td]')   ; Columns delimiters
        
        ctx.Replacement := '[table]`n' header '`n' rows '`n[/table]'
	}

    if IsSet(context)
        block := context.Haystack

    return block
}

ParseLists(block) {
	context  := unset
	static lists := 'mx`n) ( ^ [ \t]* ([-+*] | \d \.) [ \t]+ .+  (?: \R [ \t]+ .+)* \R?  )+'

    ; Enclose each list with [list]...[/list]
    for list, ctx in RegExMatchAll(&block, lists) {
		ctx.Replacement := ''
		context   := ctx
        maxLevel  := -1
        openLists := 0
        isPrevOrdered := false

        ; Get all items and their indentation level
        loop parse, list[0], '`n', '`r' {
            if A_LoopField ~= '^\s*(>|$)' {
                ; Quote or empty line
                ctx.Replacement .= A_LoopField '`n'
                continue
            }

            ; 1 tab will be 8 spaces, so tabs and spaces will be treated as different levels of indentation.
            line     := StrReplace(A_LoopField, '`t', '        ')
            item     := LTrim(line)                  ; Prefix + item
            minLevel := StrLen(line) - StrLen(item)  ; Indentation level
            isCurOrdered := (item ~= '^\d+')         ; Starts with digit?

            ; Enclose sub-list depending on item indentaion
            if (minLevel > maxLevel) {
                ; Open new list
                ctx.Replacement .= '[list' (isCurOrdered ? '=1' : '') ']`n'
                maxLevel := minLevel
                openLists++
            } else if (minLevel < maxLevel) {
                ; Close previous list
                ctx.Replacement .= '[/list]`n'
                maxLevel := minLevel
                openLists--
            } else if (isCurOrdered != isPrevOrdered) {
                ; Close previous list and start s new one
                ctx.Replacement .= '[/list]`n[list' (isCurOrdered ? '=1' : '') ']`n'
            }
            isPrevOrdered := isCurOrdered

            ; Replace item prefix with [*]
            ctx.Replacement .= RegExReplace(item, '^([-+*]|\d+\.)', '[*]') . '`n'
        }

        ; Close all opened lists
        ctx.Replacement := Trim(ctx.Replacement, ' `r`n')
        loop openLists
            ctx.Replacement .= '`n[/list]`n'
	}

    if IsSet(context)
        block := context.Haystack

    return block
}

ParseQuotes(block) {
    context  := unset
    static quotes := 'xm) ^ [ \t]* > .* (?: \r? \n (?= [ \t]* > ) .* )*'

    ; Enclose each blockquote with [quote]...[/quote]
    for quote, ctx in RegExMatchAll(&block, quotes) {
		ctx.Replacement := ''
		context    := ctx
        maxLevel   := -1
        openQuotes := 0

        ; Get all items prefixed by >
        loop parse, quote[0], '`n', '`r' {
            ; 1 tab will be 8 spaces, so tabs and spaces will be treated as different levels of indentation.
            line     := StrReplace(A_LoopField, '`t', '        ')
            item     := RegExReplace(line, '^( *>)+')
            minLevel := StrLen(line) - StrLen(item)

            ; Enclose sub-quote depending on item indentaion
            if (minLevel > maxLevel) {
                ; Open new quote
                ctx.Replacement .= '[quote]`n'
                maxLevel := minLevel
                openQuotes++
            } else if (minLevel < maxLevel) {
                ; Close previous quote
                ctx.Replacement .= '[/quote]`n'
                maxLevel := minLevel
                openQuotes--
            }
            ctx.Replacement .= item '`n'
        }

        ; Close all opened quotes
        ctx.Replacement := Trim(ctx.Replacement, ' `r`n')
        loop openQuotes
            ctx.Replacement .= '`n[/quote]`n'

        ctx.Replacement := ParseLists(ctx.Replacement)
	}

    if IsSet(context) {
        ; Replace quote blocks like [!NOTE] or [!WARNING] with bold text
        block := RegexReplace(context.Haystack, '\[!(\w+)\]', '[b]$1[/b]')
    }

    return block
}


class RegExMatchAll {
	__New(&haystack, needle) {
		this.Haystack := haystack
		this.Needle   := needle
	}

	__Enum(n) {
		this.Pos := 0
        return Next

        Next(&match, &context) {
            if this.HasProp('Replacement') {
                this.Haystack := SubStr(this.Haystack, 1, this.Pos - 1)
                               . this.Replacement
                               . SubStr(this.Haystack, this.Pos + this.match.Len)

                this.DeleteProp('Replacement')
            }

            context    := this
            this.Pos   := RegExmatch(this.Haystack, this.Needle, &match, this.Pos + 1)
            this.match := match

            return this.Pos != 0
        }
	}
}

class MarkdownBlocks {
    Blocks := []

    Add(&haystack, blockName, needleRegex, restoreFormat) {
        context := unset
        for match, ctx in RegExMatchAll(&haystack, needleRegex) {
            ; Save block that was found by needleRegex
            this.Blocks.Push(Array(
                ctx.Replacement := '&&' . blockName . A_Index . '&&',
                restoreFormat,
                match*
            ))

            context := ctx
        }

        ; At least one block was found, replace whole block with special mark
        if IsSet(context)
            haystack := context.Haystack
    }

    RestoreAll(&haystack) {
        for block in this.Blocks {
            block.removeAt(3)  ; Remove overall match

            haystack := StrReplace(
                haystack,
                block.removeAt(1),
                Format(block.removeAt(1), block*)
            )
        }
    }
}


OpenFile(repo, path?) {
    try {
        f := path ?? FileSelect(1 + 2, 'README.md')
        return Convert(FileRead(f), repo)
    } catch {
        FileErr('Unable to open the file', f)
    }
}

SaveFile(post, path?) {
    try {
        f := path ?? FileSelect('S16', 'Forum.md')
        FileAppend(post, f)
        return true
    } catch {
        FileErr('Unable to save converted text', f)
        return false
    }
}

SaveRepository(repo) {
    try {
        if !(repo := Trim(repo, ' `t\/'))
            return false

        IniWrite(repo, 'Config.ini', 'General', 'LastRepository')
        return true
    } catch {
        FileErr('Unable to save repository url', 'Config.ini')
        return false
    }
}