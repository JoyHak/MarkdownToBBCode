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
> of text                   [/td][td] [­quote]
 A quote looks like a block
 of text
[­/quote] [/td][/tr]
[tr][td] > [­!NOTE]  [­!Tip] [­!warning] [­!cAuTiOn] 
> But this is alert [/td][td] [­quote]
 [­b]NOTE[­/b]  [­b]Tip[­/b] [­b]warning[­/b] [­b]cAuTiOn[­/b]
 But this is alert
[­/quote] [/td][/tr]
[tr][td] > Quotes can contain
 > > nested quotes
>>without spaces between prefix and word [/td][td] [­quote]
 Quotes can contain
[­quote]
 nested quotes
[­/quote]
without spaces between prefix and word
[­/quote] [/td][/tr]
[tr][td] > Many
 > > many
 > > > nested
 > quotes [/td][td] [­quote]
 Many
[­quote]
 many
[­quote]
 nested
[­/quote]
 quotes
[­/quote]
[­/quote] [/td][/tr]
[tr][td] > As well as:
> 1. Ordered lists 
> 1. item1
> 2. item2
> <sub>tags</sub>, 
> <!-- comments -->, 
> *basic syntax* 
> and many more… [/td][td] [­quote]
 As well as:
[­list=1][­*] Ordered lists 
[­list=1]
[­*] item1
[­*] item2
[­/list][­/list]
[­size=85]tags[­/size],
[­i]basic syntax[­/i]
and many more…
[­/quote] [/td][/tr]
[tr][td] > 1. Lists can have an infinite level of nesting 
>  1. item1
>   2. item2
>    3. item3
> - And unordered lists can be nested too!   
>  - Item
>   - deep item [/td][td] [­quote]
[­list=1]
[­*] Lists can have an infinite level of nesting 
[­list=1][­*] item1
[­list=1][­*] item2
[­list=1][­*] item3
[­/list][­/list][­/list][­/list]

[­list]
[­*] And unordered lists can be nested too!
[­list][­*] Item
[­list][­*] deep item
[­/list][­/list][­/list]

Lists can be mixed
[­list=1][­*] item1
[­list][­*] item2
[­list=1][­*] item3
[­/list][­/list][­/list]
[­/quote] [/td][/tr]
[tr][td] > Lists can be mixed 
> 1. item1
> - item2
> 3. item3
 [/td][td] [­quote]
  Lists can be mixed
[­list=1][­*] item1
[­list][­*] item2
[­list=1][­*] item3
[­/list][­/list][­/list]
[­/quote] [/td][/tr]
[tr][td] > - As you might guess,
> - all of this applies to:
>  11. lists in quotes.
>  12. lists outside quotes.
>  13. lists with different levels of nesting.
> - As well as applied to ordered / unordered lists mixing. [/td][td] [­quote]
[­list]
[­*] As you might guess,
[­*] all of this applies to:
[­list=1]
[­*] lists in quotes.
[­*] lists outside quotes.
[­*] lists with different levels of nesting.
[­/list]
[­*] As well as applied to ordered / unordered lists mixing.
[­/list]
[­/quote] [/td][/tr]
[/table]

[table]
[tr][th] Lists                                                        [/th][th]                                                              [/th][/tr]
[tr][td] - The list can start with any number of tabs and spaces
  - Each subsequent item in the list must start with the same number of tabs and spaces!
   - Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). [/td][td] [­list]
[­*] The list can start with any number of tabs and spaces
[­list]
[­*] Each subsequent item in the list must start with the same number of tabs and spaces!
[­list]
[­*] Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces).
[­/list][­/list][­/list] [/td][/tr]
[tr][td] 1. Lists can have an infinite level of nesting
  1. item1
   2. item2
    3. item3
 [/td][td] [­list=1]
[­*] Lists can have an infinite level of nesting
[­list=1]
[­*] item1
[­list=1]
[­*] item2
[­list=1]
[­*] item3
[­/list]
[­/list][­/list][­/list] [/td][/tr]
[tr][td] * List items can have any prefix
  + item 
   - item [/td][td] [­list]
[­*] List items can have any prefix
[­list]
[­*] item
[­list]
[­*] item
[­/list][­/list][­/list] [/td][/tr]
[tr][td] - Lists can be mixed 
1. item describes:
 - item1
 - item2
2. This item continues previous list started at 1. [/td][td] [­list][­*] Lists can be mixed[­/list]
[­list=1][­*] item describes:
[­list]
[­*] item1
[­*] item2
[­/list]
[­*] This item continues previous list started at 1.
[­/list] [/td][/tr]
[tr][td] 1. The lists go on and on. 
2. This element is part of the list started in point 1. 
- To start a new list at the same nesting level, 
- start a list of a different type.
 - Or increase the nesting level. [/td][td] [­list=1]
[­*] The lists go on and on.
[­*] This element is part of the list started in point 1. 
[­/list][­list]
[­*] To start a new list at the same nesting level,
[­*] start a list of a different type.
[­list]
[­*] Or increase the nesting level.
[­/list][­/list] [/td][/tr]
[tr][td] - List can capture additional text elements, as well as quotes, spoilers, **all supported syntax**.
- Add a tab or space before the item to add it to the list.
 > This quote belongs to the 1st item.
> This quote does not belong to the list. [/td][td] [­list]
[­*] List can capture additional text elements, as well as quotes, spoilers, [­b]all supported syntax[­/b]
[­*] Add a tab or space before the item to add it to the list.
[­quote] This quote belongs to the 1st item [­/quote]
[­/list]
[­quote] This quote does not belong to the list. [­/quote] [/td][/tr]
[tr][td] - Quotes and other elements are belongs to previous item regardless of its nesting level.
 1. Item1
 2. Item2 
 > This quote belongs to item2. 
  3. Item3
  > This quote belongs to item3
  4. Item4
 [/td][td] [­list]
[­*] Quotes and other elements are belongs to previous item regardless of its nesting level.
[­/list]
[­list=1][­*] Item1
[­list=1][­*] Item2
[­quote] This quote belongs to item2. [­/quote]

[­list=1][­*] Item3
[­quote] This quote belongs to item3 [­/quote]

[­*] Item4
[­/list][­/list][­/list] [/td][/tr]
[tr][td] - To separate any item / quote / other from the list (or start a new list), 
dont' add space before the item / quote;
- or leave one or more blank lines between the item and the list.
> No spaces: this quote does not belong to the list.

> Another line: this quote does not belong to the list. [/td][td] [­list]
[­*] To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;
[­*] or leave one or more blank lines between the item and the list.
[­/list]
[­quote] No spaces: this quote does not belong to the list. [­/quote]

[­quote] Another line: this quote does not belong to the list. [­/quote] [/td][/tr]
[tr][td] - Use line break characters\ <br>  </br>  <br/>
> This quote does not belong to the list. [/td][td] [­list][­*] Use line break characters [­/list]

[­quote] This quote does not belong to the list. [­/quote] [/td][/tr]
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