[size=150]Markdown[/size]

[table]
[tr][th] Basic syntax                                           [/th][th]                                 [/th][/tr]
[tr][td] **Bold** __Bold__                              [/td][td] [­b]Bold[­/b]                     [/td][/tr]
[tr][td] *Italic* _Italic_                                  [/td][td] [­i]Italic[­/i]                   [/td][/tr]
[tr][td] ~Strike~ ~~Strike~~                              [/td][td] [­strike]Strike[­/strike]         [/td][/tr]
[tr][td] ***Bold and italic*** ___Bold and italic___ [/td][td] [­b][­i]Bold and italic[­/b][­/i]   [/td][/tr]
[tr][td] `Inline`                                             [/td][td] [­c]Inline[­/c]                   [/td][/tr]
[tr][td] # h1                                                  [/td][td] [­size=200]h1[­/size]             [/td][/tr]
[tr][td] ## h2                                                 [/td][td] [­size=180]h2[­/size]             [/td][/tr]
[tr][td] ### h3                                               [/td][td] [­size=150]h3[­/size]             [/td][/tr]
[tr][td] #### h4                                             [/td][td] [­size=125]h4[­/size]             [/td][/tr]
[/table]

[table]
[tr][th] Links 
(relative links is not supported)                       [/th][th]                             [/th][/tr]
[tr][td] [­Short name](link)                           [/td][td] [­url=link]Short name[­/url]  [/td][/tr]
[tr][td] ![­Image name](link)                          [/td][td] ![­url=link]Image name[­/url] [/td][/tr]
[/table]

[table]
[tr][th] Html tags                                              [/th][th]                                                          [/th][/tr]
[tr][td] <sub>Subscript</sub>                               [/td][td] [­size=85]Subscript[­/size]                                [/td][/tr]
[tr][td] <ins>Underlined</ins>                              [/td][td] [­u]Underlined[­/u]                                        [/td][/tr]
[tr][td] <details><summary>Examples</summary></details> [/td][td] [­spoiler]
[­size=110]Examples[­/size]
[­/spoiler] [/td][/tr]
[tr][td] <details> … </details>                              [/td][td] [­spoiler]
…
[­/spoiler]                         [/td][/tr]
[tr][td] <unknown> … </unknown>                              [/td][td] [­size=110]unknown[­/size]                                 [/td][/tr]
[/table]

[table]
[tr][th] Spoilers and comments                                                  [/th][th]                                                         [/th][/tr]
[tr][td] <!-- spoiler --> Text that should be hidden <!-- /spoiler -->        [/td][td] [­spoiler]
Text that should be hidden
[­/spoiler] [/td][/tr]
[tr][td] <!-- alternate --> Text that mustn't be converted  <!-- /alternate --> [/td][td] Text that mustn't be converted                          [/td][/tr]
[tr][td] <!-- Text that should be removed -->                                  [/td][td]                                                         [/td][/tr]
[tr][td] <details> Text that should be hidden </details>                     [/td][td] [­spoiler]
Text that should be hidden
[­/spoiler] [/td][/tr]
[/table]

[table]
[tr][th] Line breaks                                [/th][th]                                              [/th][/tr]
[tr][td] <br>  </br>  <br/> [/td][td] 

[/td][/tr]
[tr][td] Line with trailing slash\
New line   [/td][td] Line with trailing slash

New line   [/td][/tr]
[tr][td] Line with 2 trailing spaces    
NewLine [/td][td] Line with 2 trailing spaces

NewLine [/td][/tr]
[/table]

[size=150]Blocks[/size]

The blocks below are converted into opening and closing BBcode tags, broken into several lines for readability *(otherwise everything will turn into a horrible mess)*. However, lines, spaces, and tabs between tags do not affect the final result.
To reduce the demonsration, some tags are on the same line as the text.

[table]
[tr][th] Code                                 [/th][th]                                         [/th][/tr]
[tr][td] ```py
print("hello!")
``` [/td][td] [­code]
print("hello!")
[­/code]  [/td][/tr]
[tr][td] ```
MsgBox("hello!")
```  [/td][td] [­code]
MsgBox("hello!")
[­/code] [/td][/tr]
[/table]

[table]
[tr][th] Block quotes                                                 [/th][th]                                                              [/th][/tr]
[tr][td] > A quote looks like a block
> of text                   [/td][td] [color=#48a5d7][­quote][/color]
 A quote looks like a block
 of text
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > [­!NOTE]  [­!Tip] [­!warning] [­!cAuTiOn] 
> But this is alert [/td][td] [color=#48a5d7][­quote][/color]
 [­b]NOTE[­/b]  [­b]Tip[­/b] [­b]warning[­/b] [­b]cAuTiOn[­/b]
 But this is alert
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > Quotes can contain
 > > nested quotes
>>without spaces between prefix and word [/td][td] [color=#48a5d7][­quote][/color]
 Quotes can contain
[color=#48a5d7][­quote][/color]
 nested quotes
[color=#48a5d7][­/quote][/color]
without spaces between prefix and word
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > Many
 > > many
 > > > nested
 > quotes [/td][td] [color=#48a5d7][­quote][/color]
 Many
[color=#48a5d7][­quote][/color]
 many
[color=#48a5d7][­quote][/color]
 nested
[color=#48a5d7][­/quote][/color]
 quotes
[color=#48a5d7][­/quote][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > As well as:
> [color=#006868]1. [/color]Ordered lists 
> [color=#006868]1. [/color]item1
> [color=#006868]2. [/color]item2
> <sub>tags</sub>, 
> <!-- comments -->, 
> *basic syntax* 
> and many more… [/td][td] [color=#48a5d7][­quote][/color]
 As well as:
[color=#11975a][­list=1][/color][color=#006868][­*][/color] Ordered lists 
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] item1
[color=#006868][­*][/color] item2
[color=#11975a][­/list][/color][color=#11975a][­/list][/color]
[­size=85]tags[­/size],
[­i]basic syntax[­/i]
and many more…
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > [color=#006868]1.[/color] Lists can have an infinite level of nesting 
>  [color=#006868]1. [/color]item1
>   [color=#006868]2. [/color]item2
>    [color=#006868]3. [/color]item3
> [color=#006868]- [/color]And unordered lists can be nested too!   
>  [color=#006868]- [/color]Item
>   [color=#006868]- [/color]deep item [/td][td] [color=#48a5d7][­quote][/color]
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] Lists can have an infinite level of nesting 
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item1
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item2
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item3
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color]

[color=#11975a][­list][/color]
[color=#006868][­*][/color] And unordered lists can be nested too!
[color=#11975a][­list][/color][color=#006868][­*][/color] Item
[color=#11975a][­list][/color][color=#006868][­*][/color] deep item
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color]

Lists can be mixed
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item1
[color=#11975a][­list][/color][color=#006868][­*][/color] item2
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item3
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > Lists can be mixed 
> [color=#006868]1. [/color]item1
> [color=#006868]- [/color]item2
> [color=#006868]3. [/color]item3
 [/td][td] [color=#48a5d7][­quote][/color]
  Lists can be mixed
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item1
[color=#11975a][­list][/color][color=#006868][­*][/color] item2
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item3
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] > [color=#006868]-[/color] As you might guess,
> [color=#006868]- [/color]all of this applies to:
>  11. lists in quotes.
>  12. lists outside quotes.
>  13. lists with different levels of nesting.
> [color=#006868]- [/color]As well as applied to ordered / unordered lists mixing. [/td][td] [color=#48a5d7][­quote][/color]
[color=#11975a][­list][/color]
[color=#006868][­*][/color] As you might guess,
[color=#006868][­*][/color] all of this applies to:
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] lists in quotes.
[color=#006868][­*][/color] lists outside quotes.
[color=#006868][­*][/color] lists with different levels of nesting.
[color=#11975a][­/list][/color]
[color=#006868][­*][/color] As well as applied to ordered / unordered lists mixing.
[color=#11975a][­/list][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[/table]

[table]
[tr][th] Lists                                                        [/th][th]                                                              [/th][/tr]
[tr][td] [color=#006868]-[/color] The list can start with any number of tabs and spaces
  [color=#006868]- [/color]Each subsequent item in the list must start with the same number of tabs and spaces!
   [color=#006868]- [/color]Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] The list can start with any number of tabs and spaces
[color=#11975a][­list][/color]
[color=#006868][­*][/color] Each subsequent item in the list must start with the same number of tabs and spaces!
[color=#11975a][­list][/color]
[color=#006868][­*][/color] Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces).
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [color=#006868]1.[/color] Lists can have an infinite level of nesting
  [color=#006868]1. [/color]item1
   [color=#006868]2. [/color]item2
    [color=#006868]3. [/color]item3
 [/td][td] [color=#11975a][­list=1][/color]
[color=#006868][­*][/color] Lists can have an infinite level of nesting
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] item1
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] item2
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] item3
[color=#11975a][­/list][/color]
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [b][color=#006868]*[/color][/b] List items can have any prefix
  [b][color=#006868]+[/color][/b] item 
   [b][color=#006868]-[/color][/b] item[/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] List items can have any prefix
[color=#11975a][­list][/color]
[color=#006868][­*][/color] item
[color=#11975a][­list][/color]
[color=#006868][­*][/color] item
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] Lists can be mixed 
[color=#006868]1. [/color]item describes:
 [color=#006868]- [/color]item1
 [color=#006868]- [/color]item2
[color=#006868]2. [/color]This item continues previous list started at 1. [/td][td] [color=#11975a][­list][/color][color=#006868][­*][/color] Lists can be mixed[color=#11975a][­/list][/color]
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item describes:
[color=#11975a][­list][/color]
[color=#006868][­*][/color] item1
[color=#006868][­*][/color] item2
[color=#11975a][­/list][/color]
[color=#006868][­*][/color] This item continues previous list started at 1.
[color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [color=#006868]1.[/color] The lists go on and on. 
[color=#006868]2. [/color]This element is part of the list started in point 1. 
[color=#006868]- [/color]To start a new list at the same nesting level, 
[color=#006868]- [/color]start a list of a different type.
 [color=#006868]- [/color]Or increase the nesting level. [/td][td] [color=#11975a][­list=1][/color]
[color=#006868][­*][/color] The lists go on and on.
[color=#006868][­*][/color] This element is part of the list started in point 1. 
[color=#11975a][­/list][/color][color=#11975a][­list][/color]
[color=#006868][­*][/color] To start a new list at the same nesting level,
[color=#006868][­*][/color] start a list of a different type.
[color=#11975a][­list][/color]
[color=#006868][­*][/color] Or increase the nesting level.
[color=#11975a][­/list][/color][color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] List can capture additional text elements, as well as quotes, spoilers, **all supported syntax**.
[color=#006868]-[/color] Add a tab or space before the item to add it to the list.
 > This quote belongs to the 1st item.
> This quote does not belong to the list. [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] List can capture additional text elements, as well as quotes, spoilers, [­b]all supported syntax[­/b]
[color=#006868][­*][/color] Add a tab or space before the item to add it to the list.
[color=#48a5d7][­quote][/color] This quote belongs to the 1st item [color=#48a5d7][­/quote][/color]
[color=#11975a][­/list][/color]
[color=#48a5d7][­quote][/color] This quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] Quotes and other elements are belongs to previous item regardless of its nesting level.
 [color=#006868]1. [/color]Item1
 [color=#006868]2. [/color]Item2 
 > This quote belongs to item2. 
  [color=#006868]3. [/color]Item3
  > This quote belongs to item3
  [color=#006868]4. [/color]Item4
 [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] Quotes and other elements are belongs to previous item regardless of its nesting level.
[color=#11975a][­/list][/color]
[color=#11975a][­list=1][/color][color=#006868][­*][/color] Item1
[color=#11975a][­list=1][/color][color=#006868][­*][/color] Item2
[color=#48a5d7][­quote][/color] This quote belongs to item2. [color=#48a5d7][­/quote][/color]

[color=#11975a][­list=1][/color][color=#006868][­*][/color] Item3
[color=#48a5d7][­quote][/color] This quote belongs to item3 [color=#48a5d7][­/quote][/color]

[color=#006868][­*][/color] Item4
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] To separate any item / quote / other from the list (or start a new list), 
dont' add space before the item / quote;
[color=#006868]-[/color] or leave one or more blank lines between the item and the list.
> No spaces: this quote does not belong to the list.

> Another line: this quote does not belong to the list. [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;
[color=#006868][­*][/color] or leave one or more blank lines between the item and the list.
[color=#11975a][­/list][/color]
[color=#48a5d7][­quote][/color] No spaces: this quote does not belong to the list. [color=#48a5d7][­/quote][/color]

[color=#48a5d7][­quote][/color] Another line: this quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] Use line break characters\ <br>  </br>  <br/>
> This quote does not belong to the list. [/td][td] [color=#11975a][­list][/color][color=#006868][­*][/color] Use line break characters [color=#11975a][­/list][/color]

[color=#48a5d7][­quote][/color] This quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[/table]

[size=150]GitHub links and references[/size]

You can specify the repository in the converter settings. All issues and commits in short form will be appended into the repository URL.

[table]
[tr][th] Mentions and images 
(relative links is not supported)  [/th][th]                                                              [/th][/tr]
[tr][td] @JoyHak                                                      [/td][td] [­url=https://github.com/JoyHak]@JoyHak[­/url]                 [/td][/tr]
[tr][td] ![­Image name](https://myoctocat.com/assets/images/base-octocat.svg) [/td][td] [­url]https://myoctocat.com/assets/images/base-octocat.svg[­/url] [/td][/tr]
[/table]

[table]
[tr][th] Issues (PRs is not supported) [/th][th]                                                              [/th][/tr]
[tr][td] #64                           [/td][td] [­url=https://github.com/JoyHak/QuickSwitch/issues/64]#64[­/url] [/td][/tr]
[tr][td] GH-64                         [/td][td] [­url=https://github.com/JoyHak/QuickSwitch/issues/64]GH-64[­/url] [/td][/tr]
[tr][td] JoyHak/QuickSwitch#64         [/td][td] [­url=https://github.com/JoyHak/QuickSwitch/issues/64]JoyHak/QuickSwitch#64[­/url] [/td][/tr]
[tr][td] AutoHotkey/AutoHotkeyDocs#744 [/td][td] [­url=https://github.com/AutoHotkey/AutoHotkeyDocs/issues/744]AutoHotkey/AutoHotkeyDocs#744[­/url] [/td][/tr]
[/table]

[table]
[tr][th] Commits                                                      [/th][th]      [/th][/tr]
[tr][td] 896111015666c8fa7a8b390232a52e79356319c4                     [/td][td] [­url=https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4]8961110[­/url]     [/td][/tr]
[tr][td] JoyHak/QuickSwitch@896111015666c8fa7a8b390232a52e79356319c4  [/td][td] [­url=https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4]JoyHak/QuickSwitch@8961110[­/url]     [/td][/tr]
[/table]