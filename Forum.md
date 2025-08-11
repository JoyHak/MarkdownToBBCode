When I was writing changelogs for my [url=https://github.com/JoyHak/QuickSwitch]QuickSwitch[/url] project, I needed to convert them from [url=https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax]Markdown[/url] markup language to [url=https://osu.ppy.sh/wiki/en/BBCode]BBcode[/url] markup language for posting on forums. 

That is how this converter was developed. It was successfully tested on the [url=https://github.com/JoyHak/QuickSwitch/releases/tag/1.8]latest complex changelog[/url].

Here's the list of key features:
[list]
[*] Full support for GitHub syntax (basic and advanced).
[*] Recursive syntax conversion (lists containing lists, basic syntax containing basic syntax, etc.).
[*] Support for any type of list (ordered, unordered, with any prefix and nesting level).
[*] Attaching/detaching markdown list items from BBcode lists (ability to add or detach quotes and other items from the converted list).
[*] Support for multi-level quotes with the ability to include lists, mentions, and other syntax.
[*] Support for html tags and spoilers.
[*] Delete comments, mark text that does not need to be converted.
[*] Select a repository for converting Github issues, links, and commits.
[*] Restore text to its pre-conversion state for editing.
[*] Convert, copy, and clear with a single click.
[*] Convert file and save result to the new / existing file.
[*] Command line interface (CLI) for converting different files and combining their contents into a single file.
[/list]

The converter supports basic syntax, complex blocks, and tables. For example, the tables with examples below were converted from the [url=https://github.com/JoyHak/MarkdownToBBCode#markdown]readme file[/url].

[spoiler2=Detailed examples]
[size=150]Markdown[/size]

[table]
[tr][th] Basic syntax                                           [/th][th]                                 [/th][/tr]
[tr][td] [color=#fca336]**[/color]Bold[color=#fca336]**[/color] [color=#fca336]__[/color]Bold[color=#fca336]__[/color]                              [/td][td] [color=#fca336][­b][/color]Bold[color=#fca336][­/b][/color]                     [/td][/tr]
[tr][td] [color=#fca336]*[/color]Italic[color=#fca336]*[/color] [color=#fca336]_[/color]Italic[color=#fca336]_[/color]                                  [/td][td] [color=#fca336][­i][/color]Italic[color=#fca336][­/i][/color]                   [/td][/tr]
[tr][td] [color=#fca336]~[/color]Strike[color=#fca336]~[/color] [color=#fca336]~~[/color]Strike[color=#fca336]~~[/color]                              [/td][td] [color=#fca336][­strike][/color]Strike[color=#fca336][­/strike][/color]         [/td][/tr]
[tr][td] [color=#fca336]***[/color]Bold and italic[color=#fca336]***[/color] [color=#fca336]___[/color]Bold and italic[color=#fca336]___[/color] [/td][td] [color=#fca336][­b][/color][color=#48a5d7][i][/color]Bold and italic[color=#48a5d7][i][/color][color=#fca336][­/b][/color]   [/td][/tr]
[tr][td] [b][color=#fca336]`[/color][/b]Inline[b][color=#fca336]`[/color][/b]                                             [/td][td] [color=#fca336][­c][/color]Inline[color=#fca336][­/c][/color]                   [/td][/tr]
[tr][td] [color=#fca336]#[/color] h1                                                  [/td][td] [color=#fca336][­size=200][/color]h1[color=#fca336][­/size][/color]             [/td][/tr]
[tr][td] [color=#fca336]##[/color] h2                                                 [/td][td] [color=#fca336][­size=180][/color]h2[color=#fca336][­/size][/color]             [/td][/tr]
[tr][td] [color=#fca336]###[/color] h3                                               [/td][td] [color=#fca336][­size=150][/color]h3[color=#fca336][­/size][/color]             [/td][/tr]
[tr][td] [color=#fca336]####[/color] h4                                             [/td][td] [color=#fca336][­size=125][/color]h4[color=#fca336][­/size][/color]             [/td][/tr]
[/table]

[table]
[tr][th] Links                                        [/th][th]                             [/th][/tr]
[tr][td] [­Short name](link)                           [/td][td] [color=#fca336][­url=link][/color]Short name[color=#fca336][­/url][/color]  [/td][/tr]
[tr][td] ![­Image name](link)                          [/td][td] [color=#fca336][­url][/color]link[color=#fca336][­/url][/color] [/td][/tr]
[/table]

[table]
[tr][th] Html tags                                              [/th][th]                                                          [/th][/tr]
[tr][td] [color=#0d529d]<sub>[/color]Subscript[color=#0d529d]</sub>[/color]                               [/td][td] [color=#fca336][­size=85][/color]Subscript[color=#fca336][­/size][/color]                                [/td][/tr]
[tr][td] [color=#0d529d]<ins>[/color]Underlined[color=#0d529d]</ins>[/color]                              [/td][td] [color=#fca336][­u][/color]Underlined[color=#fca336][­/u][/color]                                        [/td][/tr]
[tr][td] [color=#0d529d]<details>[/color] Text that should be hidden [color=#0d529d]</details>[/color]                              [/td][td] [color=#fca336][­spoiler][/color]
Text that should be hidden
[color=#fca336][­/spoiler][/color]                         [/td][/tr]
[tr][td] [color=#0d529d]<details>[/color]
[color=#0d889d]<summary>[/color]Examples[color=#0d889d]</summary>[/color]
Hidden example
[color=#0d529d]</details>[/color] [/td][td] [color=#fca336][­spoiler2=Examples][/color]
Hidden example
[color=#fca336][­/spoiler][/color] [/td][/tr]
[tr][td] [color=#0d529d]<unknown>[/color] Simple text [color=#0d529d]</unknown>[/color]                              [/td][td] [color=#fca336][­size=110][/color]unknown[color=#fca336][­/size][/color]
Simple text                                 [/td][/tr]
[/table]

Tags [c]<details>[/c] on GitHub are similar to spoilers: they turn into collapsed text. The [c]<summary>[/c] tag replaces the spoiler title "details" with the specified title.

Unknown tags are converted to headers. All converted spoilers and unknown tags will have an additional line break for readability.

[table]
[tr][th] Spoilers and comments                                                  [/th][th]                                                         [/th][/tr]
[tr][td] [color=#5e5e5e]<!-- spoiler -->[/color] Text that should be hidden [color=#5e5e5e]<!-- /spoiler -->[/color]        [/td][td] [color=#fca336][­spoiler][/color]
Text that should be hidden
[color=#fca336][­/spoiler][/color] [/td][/tr]
[tr][td] [color=#5e5e5e]<!-- alternate -->[/color] Text that shouldn't be converted  [color=#5e5e5e]<!-- /alternate -->[/color] [/td][td] Text that shouldn't be converted                          [/td][/tr]
[tr][td] [color=#5e5e5e]<!--[color=#5e5e5e] Text that should be removed [color=#5e5e5e]-->[/color]                                  [/td][td]                                                         [/td][/tr]
[/table]

[table]
[tr][th] Line breaks                                [/th][th]                                              [/th][/tr]
[tr][td] [color=#0d529d]<br>  </br>  <br/>[/color] [/td][td] 

[/td][/tr]
[tr][td] Line with trailing slash[color=#0d529d]\[/color]
New line   [/td][td] Line with trailing slash

New line   [/td][/tr]
[tr][td] Line with 2 trailing spaces  
NewLine [/td][td] Line with 2 trailing spaces

NewLine [/td][/tr]
[/table]

Line breaks affect the final appearance of BBcode lists and quotes, but do not affect the appearance of tables: a Markdown table can contain line breaks and they will be captured by the BBcode table. A Markdown list or quote can contain line breaks, but they may not be included in the BBcode list or quote (see detailed examples below).

Spaces between markup and words are optional, as well as spaces inside and outside tags and comments. It means that [color=#fca336]**[/color] Bold   [color=#fca336]**[/color] and [color=#fca336]**[/color]Bold[color=#fca336]**[/color] or [color=#5e5e5e]<!--  alternate    -->[/color] and [color=#5e5e5e]<!--alternate-->[/color] are treated the same.

[size=150]Blocks[/size]

The blocks below are converted into opening and closing BBcode tags, broken into several lines for readability *(otherwise everything will turn into a horrible mess)*. However, lines, spaces, and tabs between tags do not affect the final result.
To reduce the demonsration, some tags are on the same line as the text.

[table]
[tr][th] Code                                 [/th][th]                                         [/th][/tr]
[tr][td] [color=#fca336]```py[/color]
print([color=#5bca53]"hello!"[/color])
[color=#fca336]```[/color] [/td][td] [color=#fca336][­code][/color]
print([color=#5bca53]"hello!"[/color])
[color=#fca336][­/code][/color]  [/td][/tr]
[tr][td] [color=#fca336]```[/color]
MsgBox([color=#5bca53]"hello!"[/color])
[color=#fca336]```[/color]  [/td][td] [color=#fca336][­code][/color]
MsgBox([color=#5bca53]"hello!"[/color])
[color=#fca336][­/code][/color] [/td][/tr]
[/table]

[table]
[tr][th] Block quotes                                                 [/th][th]                                                              [/th][/tr]
[tr][td][color=#48a5d7] > [/color]A quote looks like a block
[color=#48a5d7]> [/color]of text                   [/td][td] [color=#48a5d7][­quote][/color]
 A quote looks like a block
 of text
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color][color=#fca336][­!NOTE]  [­!Tip] [­!warning] [­!cAuTiOn][/color] 
[color=#48a5d7]> [/color]But this is alert [/td][td] [color=#48a5d7][­quote][/color]
 [color=#fca336][­b]NOTE[­/b]  [­b]Tip[­/b] [­b]warning[­/b] [­b]cAuTiOn[­/b][/color]
 But this is alert
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color]Quotes can contain
[color=#48a5d7]> > [/color]nested quotes
[color=#48a5d7]>>[/color]without spaces between prefix and word [/td][td] [color=#48a5d7][­quote][/color]
 Quotes can contain
[color=#48a5d7][­quote][/color]
 nested quotes
[color=#48a5d7][­/quote][/color]
without spaces between prefix and word
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color]Many
[color=#48a5d7] > > [/color]many
[color=#48a5d7] > > > [/color]nested
[color=#48a5d7] > [/color]quotes [/td][td] [color=#48a5d7][­quote][/color]
 Many
[color=#48a5d7][­quote][/color]
 many
[color=#48a5d7][­quote][/color]
 nested
[color=#48a5d7][­/quote][/color]
 quotes
[color=#48a5d7][­/quote][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color]As well as:
[color=#48a5d7]> [/color][color=#006868]1. [/color]Ordered lists 
[color=#48a5d7]> [/color][color=#006868]1. [/color]item1
[color=#48a5d7]> [/color][color=#006868]2. [/color]item2
[color=#48a5d7]> [/color][color=#0d529d]<sub>[/color]tags[color=#0d529d]</sub>[/color], 
[color=#48a5d7]> [/color][color=#5e5e5e]<!--[/color] comments [color=#5e5e5e]-->[/color], 
[color=#48a5d7]> [/color][color=#fca336]*[/color]basic syntax[color=#fca336]*[/color] 
[color=#48a5d7]> [/color]and many more… [/td][td] [color=#48a5d7][­quote][/color]
 As well as:
[color=#11975a][­list=1][/color][color=#006868][­*][/color] Ordered lists 
[color=#11975a][­list=1][/color]
[color=#006868][­*][/color] item1
[color=#006868][­*][/color] item2
[color=#11975a][­/list][/color][color=#11975a][­/list][/color]
[color=#fca336][­size=110][/color]tags[color=#fca336][­/size][/color],
[color=#fca336][­i][/color]basic syntax[color=#fca336][­/i][/color]
and many more…
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color][color=#006868]1.[/color] Lists can have an infinite level of nesting 
[color=#48a5d7]>  [/color][color=#006868]1. [/color]item1
[color=#48a5d7]>   [/color][color=#006868]2. [/color]item2
[color=#48a5d7]>    [/color][color=#006868]3. [/color]item3
[color=#48a5d7]> [/color][color=#006868]- [/color]And unordered lists can be nested too!   
[color=#48a5d7]>  [/color][color=#006868]- [/color]Item
[color=#48a5d7]>   [/color][color=#006868]- [/color]deep item [/td][td] [color=#48a5d7][­quote][/color]
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
[tr][td][color=#48a5d7] > [/color]Lists can be mixed 
[color=#48a5d7]> [/color][color=#006868]1. [/color]item1
[color=#48a5d7]> [/color][color=#006868]- [/color]item2
[color=#48a5d7]> [/color][color=#006868]3. [/color]item3
 [/td][td] [color=#48a5d7][­quote][/color]
  Lists can be mixed
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item1
[color=#11975a][­list][/color][color=#006868][­*][/color] item2
[color=#11975a][­list=1][/color][color=#006868][­*][/color] item3
[color=#11975a][­/list][/color][color=#11975a][­/list][/color][color=#11975a][­/list][/color]
[color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td][color=#48a5d7] > [/color][color=#006868]-[/color] As you might guess,
[color=#48a5d7]> [/color][color=#006868]- [/color]all of this applies to:
[color=#48a5d7]>  [/color]1. lists in quotes.
[color=#48a5d7]>  [/color]2. lists outside quotes.
[color=#48a5d7]>  [/color]3. lists with different levels of nesting.
[color=#48a5d7]> [/color][color=#006868]- [/color]As well as applied to ordered / unordered lists mixing. [/td][td] [color=#48a5d7][­quote][/color]
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
  [color=#006868]- [/color]Each subsequent item in the list should start with the same number of tabs and spaces!
   [color=#006868]- [/color]Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] The list can start with any number of tabs and spaces
[color=#11975a][­list][/color]
[color=#006868][­*][/color] Each subsequent item in the list should start with the same number of tabs and spaces!
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
[tr][td] [color=#006868]-[/color] List can capture additional text elements, as well as quotes, spoilers, [color=#fca336]**[/color]all supported syntax[color=#fca336]**[/color].
[color=#006868]-[/color] Add a tab or space before the item to add it to the list.
[color=#48a5d7] > [/color]This quote belongs to the 1st item.
[color=#48a5d7]> [/color]This quote does not belong to the list. [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] List can capture additional text elements, as well as quotes, spoilers, [color=#fca336][­b][/color]all supported syntax[color=#fca336][­/b][/color]
[color=#006868][­*][/color] Add a tab or space before the item to add it to the list.
[color=#48a5d7][­quote][/color] This quote belongs to the 1st item [color=#48a5d7][­/quote][/color]
[color=#11975a][­/list][/color]
[color=#48a5d7][­quote][/color] This quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] Quotes and other elements are belongs to previous item regardless of its nesting level.
 [color=#006868]1. [/color]Item1
 [color=#006868]2. [/color]Item2 
[color=#48a5d7] > [/color]This quote belongs to item2. 
  [color=#006868]3. [/color]Item3
[color=#48a5d7]  > [/color]This quote belongs to item3
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
[color=#48a5d7]> [/color]No spaces: this quote does not belong to the list.

[color=#48a5d7]> [/color]Another line: this quote does not belong to the list. [/td][td] [color=#11975a][­list][/color]
[color=#006868][­*][/color] To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;
[color=#006868][­*][/color] or leave one or more blank lines between the item and the list.
[color=#11975a][­/list][/color]
[color=#48a5d7][­quote][/color] No spaces: this quote does not belong to the list. [color=#48a5d7][­/quote][/color]

[color=#48a5d7][­quote][/color] Another line: this quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[tr][td] [color=#006868]-[/color] Use line break characters[color=#0d529d]\  <br>  </br>  <br/>[/color]>
[color=#48a5d7]> [/color]This quote does not belong to the list. [/td][td] [color=#11975a][­list][/color][color=#006868][­*][/color] Use line break characters [color=#11975a][­/list][/color]

[color=#48a5d7][­quote][/color] This quote does not belong to the list. [color=#48a5d7][­/quote][/color] [/td][/tr]
[/table]

[size=150]GitHub links and references[/size]

Links and images can be relative to the repository root (it usually starts with [c]/[/c]). You can specify the repository in the converter settings. All relative links will be appended into the repository URL. You can use all relative link operands, such as [c]./[/c] or [c]../[/c]. Relative link text must be on a single line.

The correctness of the converted link is not checked for performance reasons. Make sure that after adding the repository into the relative link, it is correct.

[table]
[tr][th] Mentions and images   [/th][th]                                                              [/th][/tr]
[tr][td] [­Relative readme](./README.md)                           [/td][td] [color=#fca336][­url=https://github.com/JoyHak/QuickSwitch/README.md][/color]Relative readme[color=#fca336][­/url][/color]  [/td][/tr]
[tr][td] [color=#86acf4]![[/color]­Image name[color=#86acf4]]([/color]https://myoctocat.com/assets/images/base-octocat.svg[color=#86acf4])[/color] [/td][td] [color=#fca336][­url][/color]https://myoctocat.com/assets/images/base-octocat.svg[color=#fca336][­/url][/color] [/td][/tr]
[tr][td] [color=#86acf4]@[/color]JoyHak                                                      [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak[color=#fca336]][/color][color=#86acf4]@[/color]JoyHak[color=#fca336][­/url][/color]                 [/td][/tr]
[/table]

All issues and commits in short form will be appended into the repository URL. The converter cannot check whether [color=#86acf4]#[/color][color=#5961e6]64[/color] is a Pull Request (PR), discussion, or issue, so it always assumes that it is an issue.

[table]
[tr][th] Issues (PRs is not supported) [/th][th]                                                              [/th][/tr]
[tr][td] [color=#86acf4]#[/color][color=#5961e6]64[/color]                           [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak/QuickSwitch/issues/64[color=#fca336]][/color][color=#86acf4]#[/color][color=#5961e6]64[/color][color=#fca336][­/url][/color] [/td][/tr]
[tr][td] GH-64                         [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak/QuickSwitch/issues/64[color=#fca336]][/color]GH[color=#86acf4]-[/color][color=#5961e6]64[/color][color=#fca336][­/url][/color] [/td][/tr]
[tr][td] JoyHak[color=#86acf4]/[/color]QuickSwitch#64         [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak/QuickSwitch/issues/64[color=#fca336]][/color]JoyHak/QuickSwitch[color=#86acf4]#[/color][color=#5961e6]64[/color][color=#fca336][­/url][/color] [/td][/tr]
[tr][td] AutoHotkey[color=#86acf4]/[/color]AutoHotkeyDocs#744 [/td][td] [color=#fca336][­url=[/color]https://github.com/AutoHotkey/AutoHotkeyDocs/issues/744[color=#fca336]][/color]AutoHotkey/AutoHotkeyDocs[color=#86acf4]#[/color][color=#5961e6]744[/color][color=#fca336][­/url][/color] [/td][/tr]
[/table]

[table]
[tr][th] Commits                                                      [/th][th]      [/th][/tr]
[tr][td] 896111015666c8fa7a8b390232a52e79356319c4                     [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4[color=#fca336]][/color][color=#5961e6]8961110[/color][color=#fca336][­/url][/color]     [/td][/tr]
[tr][td] JoyHak[color=#86acf4]/[/color]QuickSwitch[color=#86acf4]@[/color]896111015666c8fa7a8b390232a52e79356319c4  [/td][td] [color=#fca336][­url=[/color]https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4[color=#fca336]][/color]JoyHak/QuickSwitch[color=#86acf4]@[/color][color=#5961e6]8961110[/color][color=#fca336][­/url][/color]     [/td][/tr]
[/table]

[/spoiler]

The command line interface allows you to convert files and any text directly from the terminal. The result can be saved to a file or printed to the terminal and passed to any command using the `|` pipe operator.

Usage: [c]md2bb (<file_name> | <text> | @listfile) [<parameters> <switches>][/c]

[spoiler2=Parameters]
[table]
[tr][th] Parameters                   [/th][th]                                                              [/th][/tr]
[tr][td] -save, -write                [/td][td] The name / path of the file where to write the result. The result will be appended at the end of the file if it already exists. [/td][/tr]
[tr][td] -repo, -repository, -domain  [/td][td] Url to the repository for resolving relative links and references. [/td][/tr]
[tr][td] -sep, -separator, -delimiter [/td][td] Separator for text parameters concatenation.                 [/td][/tr]
[/table]
[table]
[tr][th] Switches   [/th][th]                                               [/th][/tr]
[tr][td] -h, -help  [/td][td] Displays help message.                        [/td][/tr]
[tr][td] -overwrite [/td][td] Overwrite the file where to write the result. [/td][/tr]
[/table]

Parameters order doesn't matter:
[code]
    md2bb -save 'forum.md' 'readme.md'
    md2bb 'readme.md' -save 'forum.md'
[/code]
Parameters prefix can be [c]/ - --[/c].
Parameter without prefix will be treated as file name / text / listfile to convert:
[code]
    md2bb 'readme.md' 'add text' '@listfile.md'
    Reads and converts contents of 'readme.md', then converts 'add text', then reads and converts contents of 'listfile.md' line by line.
[/code]
[/spoiler]

CLI md2bb allows you to convert text directly from the terminal, combine converted content into a single file, and convert text, files, and file lists sequentially in a single use. Below are some examples of how to use md2bb.

[spoiler2=CLI examples]
[code]
    md2bb -save 'forum.md' 'readme.md'
    md2bb 'readme.md' -save 'forum.md'
[/code]
Text can be combined:
[code]
    md2bb 'readme.md' 'add text' 'another text' 'license.md' -sep ' '
    md2bb 'sentence' 'will be' 'splitted' -save 'forum.md'
[/code]

The value of [c]-repo[/c] is stored on the disk, so it can be passed once. After that its value will be used for each [c]md2bb[/c] usage:
[code]
    md2bb -repo 'https://github.com/JoyHak/MarkdownToBBCode' -> 'Repository has been saved'
    md2bb 'issue #1' -> issue [url=https://github.com/JoyHak/MarkdownToBBCode/issues/1]#1[/url]
[/code]

Parameters prefix can be [c]/ - --[/c].
Parameter without prefix will be treated as file name / text / listfile to convert:

[code]
    md2bb 'readme.md' 'add text' '@listfile.md'
    Reads and converts contents of 'readme.md', then converts 'add text', then reads and converts contents of 'listfile.md' line by line.
[/code]
[c]@listfile[/c] can be [c]@filename.ext[/c] or [c]@path[/c] and it can contain anything. It will be readed and each line will be converted as the text. If line contains file name / path, it's contents will be converted (if it exists).  Also it can be used to convert individual lines, combine them into one text and separate using symbol passed via [c]-sep[/c] .

You can pass the [c]|[/c] symbol as a text to force the separation of parts of the text from each other:
[code]
    md2bb 'readme.md|@listfile.md'
    Reads and converts 'readme.md' file, then reads and converts 'listfile.md' line by line.
    
    md2bb 'sentence|will be|splitted'
    Convert 'sentence' 'will be' 'splitted' separately.
[/code]
Pass [c]-sep[/c] symbol to concatenate different parts:
[code]
    md2bb 'sentence|will be|splitted'     -sep '_' -> 'sentence_will be_splitted'
    md2bb 'sentence' 'will be' 'splitted' -sep '_' -> 'sentence_will be_splitted'

    md2bb 'readme.md' 'add text' -sep '_' -save 'forum.md'
    Concatenates converted contents of 'readme.md' with 'add text' using '_' symbol and appends it to the 'forum.md'.
[/code]
You can pass multi-line text and [c]-sep[/c] value:
[code]
    md2bb ' > Multi-line            ->  [quote]Multi-line
    > text'                             text[/quote]
    
    md2bb '*New*' '*line*' -sep '   ->  [i]New[/i]
    +'                                  [i]+line[/i]
[/code]
You can also pass any line break tags to get several lines of the text:
[/code]
    md2bb '_New_<br>_line_'         ->  [i]New[/i]
                                        [i]line[/i]
   
    md2bb 'New<br/>line' -sep '+'   ->  [i]New[/i]
                                        [i]line[/i]
    Ignores '-sep' because text is treated as single part.
[/code]
The [c]-save[/c]  parameter appends the converted text at the end of existing file, removing all leading and trailing spaces, tabs, and blank lines. This allows you to create complex conversion chains:
[code]
md2bb 'readme.md' 'add text' '@listfile.md' 'add another text' '@lines.md' -save 'forum.md'
[/code]
If you want to recreate the file, use [c]-overwrite[/c] switch:
[code]
md2bb 'readme.md' -save 'readme.md'
Appends converted contents of 'readme.md' at the end of this file.
md2bb 'readme.md' -save 'readme.md' -overwrite
Deletes 'readme.md' and appends converted content to the new 'readme.md'
[/code]
To convert individual elements to different files, use separate commands:
[code]
md2bb 'readme.md' 'add text' -save 'forum.md'
md2bb 'license.md' 'add copyright' -save 'lic.md'
[/code]
[/spoiler]