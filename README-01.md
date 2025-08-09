$\small{\textsf{\color{Purple}[/b]\color{white}data\color{Purple}[/b]}}$ 

Spaces are optional.

## Markdown

| Basic syntax                                           |                                 |
| :----------------------------------------------------- | :------------------------------ |
| \*\*Bold\*\* \_\_Bold\_\_                              | $\textsf{\color{#fb7237}[b]\color{White}Bold\color{#fb7237}[/b]}$ |
| \*Italic\* \_Italic\_                                  | $\textsf{\color{#fb7237}[i]\color{White}Italic\color{#fb7237}[/i]}$ |
| \~Strike\~ \~\~Strike\~\~                              | $\textsf{\color{#fb7237}[strike]\color{White}Strike\color{#fb7237}[/strike]}$ |
| \*\*\*Bold and italic\*\*\* \_\__Bold and italic\_\_\_ | $\textsf{\color{#fb7237}\[b]\color{White}[i]Bold and italic\[/b]\color{#fb7237}[/i]}$ |
| \`Inline\`                                             | $\textsf{\color{#fb7237}[c]\color{White}Inline\color{#fb7237}[/c]}$ |
| \# h1                                                  | $\textsf{\color{#fb7237}[size=220]\color{White}h1\color{#fb7237}[/size]}$ |
| \## h2                                                 | $\textsf{\color{#fb7237}[size=200]\color{White}h2\color{#fb7237}[/size]}$ |
| \#\## h3                                               | $\textsf{\color{#fb7237}[size=150]\color{White}h3\color{#fb7237}[/size]}$ |
| \#\#\## h4                                             | $\textsf{\color{#fb7237}[size=125]\color{White}h4\color{#fb7237}[/size]}$ |

| Links <br>(relative links is not supported) |                             |
| :-------------------------------------------- | :-------------------------- |
| [Short name]\(link)                           | $\textsf{\color{#fb7237}[url=link]\color{White}Short name\color{#fb7237}[/url]}$ |
| ![Image name]\(link)                          | $\textsf{\color{#fb7237}[url=link]\color{White}Image name\color{#fb7237}[/url]}$ |

| Html tags                                              |                                                          |
| :----------------------------------------------------- | :------------------------------------------------------- |
| \<sub\>Subscript\</sub\>                               | $\textsf{\color{#fb7237}[size=85]\color{White}Subscript\color{#fb7237}[/size]}$ |
| \<ins\>Underlined\</ins\>                              | $\textsf{\color{#fb7237}[u]\color{White}Underlined\color{#fb7237}[/u]}$ |
| \<details\>\<summary\>Examples\</summary\>\</details\> | $\textsf{\color{#fb7237}[spoiler]}$<br>$\textsf{\color{#fb7237}[size=110]Examples[/size]}$<br>$\textsf{\color{White}[/spoiler]}$ |
| \<details\> … </details\>                              | $\textsf{\color{#fb7237}[spoiler]}$<br>$\textsf{\color{White}…}$<br>$\textsf{\color{#fb7237}[/spoiler]}$ |
| \<unknown\> … </unknown\>                              | $\textsf{\color{#fb7237}[size=110]\color{White}unknown\color{#fb7237}[/size]}$ |

| Spoilers and comments                                        |                                                         |
| :----------------------------------------------------------- | :------------------------------------------------------ |
| \<!-- spoiler --> Text that should be hidden \<!-- /spoiler --> | $\textsf{\color{#fb7237}[spoiler]}$<br>$\textsf{\color{White}Text that should be hidden}$<br>$\textsf{\color{#fb7237}[/spoiler]}$ |
| \<!-- alternate --> Text that mustn't be converted  \<!-- /alternate --> | Text that mustn't be converted                          |
| \<!-- Text that should be removed -->                        |                                                         |
| \<details\> Text that should be hidden </details\>           | $\textsf{\color{#fb7237}[spoiler]}$<br>$\textsf{\color{White}Text that should be hidden}$<br>$\textsf{\color{#fb7237}[/spoiler]}$ |

| Line breaks                                |                                              |
| :----------------------------------------- | :------------------------------------------- |
| \<br\>  </br\>  <br/\>                     | <br>                                       |
| Line with trailing slash\ <br>New line   | Line with trailing slash<br><br>New line   |
| Line with 2 trailing spaces  <br>NewLine | Line with 2 trailing spaces<br><br>NewLine |

## Blocks

The blocks below are converted into opening and closing BBcode tags, broken into several lines for readability *(otherwise everything will turn into a horrible mess)*. However, lines, spaces, and tabs between tags do not affect the final result.

To reduce the demonsration, some tags are on the same line as the text.

| Code                                 |                                         |
| :----------------------------------- | :-------------------------------------- |
| \```py<br>print("hello!")<br>``` | $\textsf{\color{#fb7237}[code]}$<br>$\textsf{\color{White}print("hello!")}$<br>$\textsf{\color{#fb7237}[/code]}$ |
| \```<br>MsgBox("hello!")<br>```  | $\textsf{\color{#fb7237}[code]}$<br>$\textsf{\color{White}MsgBox("hello!")}$<br>$\textsf{\color{#fb7237}[/code]}$ |

| Block quotes                                                 |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| > A quote looks like a block<br>> of text                   | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White}A quote looks like a block}$<br>$\textsf{\color{White}of text}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| > [!NOTE]  [!Tip] [!warning] [!cAuTiOn] <br>> But this is alert | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{#fb7237}[b]NOTE[/b]  [b]Tip[/b] [b]warning[/b] [b]cAuTiOn[/b]}$<br>$\textsf{\color{White} But this is alert}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| > Quotes can contain<br> > > nested quotes<br>>>without spaces between prefix and word | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White} Quotes can contain}$<br>$\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White} nested quotes}$<br>$\textsf{\color{#fb7237}[/quote]}$<br>$\textsf{\color{White}without spaces between prefix and word}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| > Many<br> > > many<br> > > > nested<br> > quotes       | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White}Many}$<br>$\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White}many}$<br>$\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White}nested}$<br>$\textsf{\color{#fb7237}[/quote]}$<br>$\textsf{\color{White}quotes}$<br>$\textsf{\color{#fb7237}[/quote]}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| > As well as:<br>>  1. Ordered lists <br>>     1. item1<br>>     2. item2<br>> \<sub>tags\</sub>, <br>> \<!-- comments -->, <br>> \*basic syntax\* <br>> and many more… | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White} As well as:}$<br>$\textsf{\color{#fb7237}\[list=1][\*] Ordered lists }$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] item1}$<br>$\textsf{\color{#fb7237}[\*] item2}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]}$<br>$\textsf{\color{#fb7237}[size=85]tags[/size],}$<br>$\textsf{\color{#fb7237}[i]basic syntax[/i]}$<br>$\textsf{\color{White}and many more…}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| >  1. Lists can have an infinite level of nesting <br>>     1. item1<br>>          2. item2<br>>               3. item3<br>>  - And unordered lists can be nested too!   <br>>       - Item<br> >               - deep item | $\textsf{\color{#fb7237}\[quote]}$<br>$\textsf{\color{#fb7237}\[list=1]}$<br>$\textsf{\color{#fb7237}[*] Lists can have an infinite level of nesting }$<br>$\textsf{\color{#fb7237}\[list=1][\*] item1}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item2}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item3}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\[/list]\[/list]}$<br>$\textsf{}$<br>$\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] And unordered lists can be nested too!}$<br>$\textsf{\color{#fb7237}\[list][\*] Item}$<br>$\textsf{\color{#fb7237}\[list][\*] deep item}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\[/list]}$<br>$\textsf{}$<br>$\textsf{\color{White}Lists can be mixed}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item1}$<br>$\textsf{\color{#fb7237}\[list][\*] item2}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item3}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\[/list]}$<br>$\textsf{\color{#fb7237}\color{#fb7237}[/quote]}$ |
| >  Lists can be mixed <br>>  1. item1<br>>     - item2<br>>          3. item3<br> | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White}  Lists can be mixed}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item1}$<br>$\textsf{\color{#fb7237}\[list][\*] item2}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item3}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\[/list]}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| > - As you might guess,<br>> - all of this applies to:<br>>     1. lists in quotes.<br>>     2. lists outside quotes.<br>>     3. lists with different levels of nesting.<br>> - As well as applied to ordered/unordered lists transitions. | $\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] As you might guess,}$<br>$\textsf{\color{#fb7237}[\*] all of this applies to:}$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] lists in quotes.}$<br>$\textsf{\color{#fb7237}[\*] lists outside quotes.}$<br>$\textsf{\color{#fb7237}[\*] lists with different levels of nesting.}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}[\*] As well as applied to ordered/unordered lists transitions.}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}[/quote]}$ |

| Lists                                                        |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| - The list can start with any number of tabs and spaces<br>     - Each subsequent item in the list must start with the same number of tabs and spaces!<br>			- Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). | $\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] The list can start with any number of tabs and spaces}$<br>$\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] Each subsequent item in the list must start with the same number of tabs and spaces!}$<br>$\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces).}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\color{#fb7237}[/list]}$ |
| 1. Lists can have an infinite level of nesting<br>      1. item1<br>        2. item2<br>           3. item3<br> | $\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] Lists can have an infinite level of nesting}$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] item1}$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] item2}$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] item3}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\color{#fb7237}[/list]}$ |
| - And unordered lists can be nested too!<br/>        - deep item |  $\textsf{\color{#fb7237}[list]}$<br/>$\textsf{\color{#fb7237}[\*] And unordered lists can be nested too!}$<br/>$\textsf{\color{#fb7237}[list]}$<br/> $\textsf{\color{#fb7237}[\*] deep item}$<br/>$\textsf{\color{#fb7237}\[/list]\[/list]}$ |
| - Lists can be mixed <br>1. item describes:<br>     1. item2<br>     2. item3<br>2. This item continues previous list started at 1. | $\textsf{\color{#fb7237}\[list]\color{White}[\*] Lists can be mixed[/list]}$<br>$\textsf{\color{#fb7237}\[list=1][\*] item describes:}$<br>$\textsf{\color{#fb7237}[list=1]}$<br>$\textsf{\color{#fb7237}[\*] item2}$<br>$\textsf{\color{#fb7237}[\*] item3}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}[\*] This item continues previous list started at 1.}$<br>$\textsf{\color{#fb7237}[/list]}$ |
| 1. The lists go on and on. <br>2. This element is part of the list started in point 1. <br>- To start a new list at the same nesting level, <br>- start a list of a different type.<br>      - Or increase the nesting level. | $\textsf{\color{#fb7237}\[list=1]}$<br>$\textsf{\color{#fb7237}[\*] The lists go on and on.}$<br>$\textsf{\color{#fb7237}[\*] This element is part of the list started in point 1. }$<br>$\textsf{\color{#fb7237}\[/list]\[list]}$<br>$\textsf{\color{#fb7237}[\*] To start a new list at the same nesting level,}$<br>$\textsf{\color{#fb7237}[\*] start a list of a different type.}$<br>$\textsf{\color{#fb7237}\[list]}$<br>$\textsf{\color{#fb7237}[\*] Or increase the nesting level.}$<br>$\textsf{\color{#fb7237}\[/list]\color{#fb7237}[/list]}$ |
| - List can capture additional text elements, as well as quotes, spoilers, \*\*all supported syntax\*\*.<br>- Add a tab or space before the item to add it to the list.<br> \<details><br>    *This spoiler belongs to the 1st item.*<br>     > This quote belongs to the 1st item.<br> \</details><br>> This quote does not belong to the list. | $\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] List can capture additional text elements, as well as quotes, spoilers, \[b]all supported syntax\[/b]}$<br>$\textsf{\color{#fb7237}[\*] Add a tab or space before the item to add it to the list.}$<br>$\textsf{\color{#fb7237}[\*]This spoiler belongs to the 1st item.*}$<br>$\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White} This quote belongs to the 1st item}$<br>$\textsf{\color{#fb7237}[/quote]}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}[quote]}$<br>$\textsf{\color{White} This quote does not belong to the list.}$<br>$\textsf{\color{#fb7237}[/quote]}$ |
| - Quotes and other elements are belongs to previous item regardless of its nesting level.<br> 1. Item1<br>	2. Item2 <br>        > This quote belongs to item2. <br>	        3. Item3<br>                > This quote belongs to item3<br>                4. Item4 | $\textsf{\color{#fb7237}\[list]}$<br>$\textsf{\color{#fb7237}[\*] Quotes and other elements are belongs to previous item regardless of its nesting level.}$<br>$\textsf{\color{#fb7237}\[/list]}$<br>$\textsf{\color{#fb7237}\[list=1][\*] Item1}$<br>$\textsf{\color{#fb7237}\[list=1][\*] Item2}$<br>$\textsf{\color{#fb7237}[quote] This quote belongs to item2. [/quote]}$<br>$\textsf{}$<br>$\textsf{\color{#fb7237}\[list=1][\*] Item3}$<br>$\textsf{\color{#fb7237}[quote] This quote belongs to item3 [/quote]}$<br>$\textsf{}$<br>$\textsf{\color{#fb7237}[\*] Item4}$<br>$\textsf{\color{#fb7237}\[/list]\[/list]\color{#fb7237}[/list]}$ |
| - To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;<br>- or leave one or more blank lines between the item and the list.<br>> No spaces: this quote does not belong to the list.<br><br>> Another line: this quote does not belong to the list. | $\textsf{\color{#fb7237}[list]}$<br>$\textsf{\color{#fb7237}[\*] To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;}$<br>$\textsf{\color{#fb7237}[\*] or leave one or more blank lines between the item and the list.}$<br>$\textsf{\color{#fb7237}[/list]}$<br>$\textsf{\color{#fb7237}[quote] No spaces: this quote does not belong to the list. [/quote]}$<br>$\textsf{}$<br>$\textsf{\color{#fb7237}[quote] Another line: this quote does not belong to the list. \color{#fb7237}[/quote]}$ |
| - Use line break characters\\     \</br>  \<br><br>> This quote does not belong to the list. | $\textsf{\color{#fb7237}\[list]\color{White}[\*] Use line break characters [/list]}$<br>$\textsf{}$<br>$\textsf{\color{#fb7237}[quote] This quote does not belong to the list. \color{#fb7237}[/quote]}$ |

## GitHub links and references

You can specify the repository in the converter settings. All issues and commits in short form will be appended into the repository URL.

| Mentions and images <br />(relative links is not supported)  |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| @JoyHak                                                      | [url=https://github.com/JoyHak]@JoyHak[/url]                 |
| ![Image name]\(https://myoctocat.com/assets/images/base-octocat.svg) | [url]https://myoctocat.com/assets/images/base-octocat.svg[/url] |

| Issues (PRs is not supported) |                                                              |
| :---------------------------- | :----------------------------------------------------------- |
| #64                           | [url=https://github.com/JoyHak/QuickSwitch/issues/64]#64[/url] |
| GH-64                         | [url=https://github.com/JoyHak/QuickSwitch/issues/64]GH-64[/url] |
| JoyHak/QuickSwitch#64         | [url=https://github.com/JoyHak/QuickSwitch/issues/64]JoyHak/QuickSwitch#64[/url] |
| AutoHotkey/AutoHotkeyDocs#744 | [url=https://github.com/AutoHotkey/AutoHotkeyDocs/issues/744]AutoHotkey/AutoHotkeyDocs#744[/url] |

| Commits                                                     |                                                              |
| :---------------------------------------------------------- | :----------------------------------------------------------- |
| 896111015666c8fa7a8b390232a52e79356319c4                    | [url=https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4]8961110[/url] |
| JoyHak/QuickSwitch@896111015666c8fa7a8b390232a52e79356319c4 | [url=https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4]JoyHak/QuickSwitch@8961110[/url] |
