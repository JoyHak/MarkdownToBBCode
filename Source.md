$\small{\textsf{\color{Purple}[/b]\color{white}data\color{Purple}[/b]}}$ 

Spaces are optional.

## Markdown

| Basic syntax                                           |                                 |
| :----------------------------------------------------- | :------------------------------ |
| \*\*Bold\*\* \_\_Bold\_\_                              | [b]Bold[/b]                     |
| \*Italic\* \_Italic\_                                  | [i]Italic[/i]                   |
| \~Strike\~ \~\~Strike\~\~                              | [strike]Strike[/strike]         |
| \*\*\*Bold and italic\*\*\* \_\__Bold and italic\_\_\_ | \[b][i]Bold and italic\[/b][/i] |
| \`Inline\`                                             | [c]Inline[/c]                   |
| \# h1                                                  | [size=220]h1[/size]             |
| \## h2                                                 | [size=200]h2[/size]             |
| \#\## h3                                               | [size=150]h3[/size]             |
| \#\#\## h4                                             | [size=125]h4[/size]             |

| Links <br />(relative links is not supported) |                             |
| :-------------------------------------------- | :-------------------------- |
| [Short name]\(link)                           | [url=link]Short name[/url]  |
| ![Image name]\(link)                          | ![url=link]Image name[/url] |

| Html tags                                              |                                                          |
| :----------------------------------------------------- | :------------------------------------------------------- |
| \<sub\>Subscript\</sub\>                               | [size=85]Subscript[/size]                                |
| \<ins\>Underlined\</ins\>                              | [u]Underlined[/u]                                        |
| \<details\>\<summary\>Examples\</summary\>\</details\> | [spoiler]<br />[size=110]Examples[/size]<br />[/spoiler] |
| \<details\> … </details\>                              | [spoiler]<br />…<br />[/spoiler]                         |
| \<unknown\> … </unknown\>                              | [size=110]unknown[/size]                                 |

| Spoilers and comments                                        |                                                         |
| :----------------------------------------------------------- | :------------------------------------------------------ |
| \<!-- spoiler --> Text that should be hidden \<!-- /spoiler --> | [spoiler]<br/>Text that should be hidden<br/>[/spoiler] |
| \<!-- alternate --> Text that mustn't be converted  \<!-- /alternate --> | Text that mustn't be converted                          |
| \<!-- Text that should be removed -->                        |                                                         |
| \<details\> Text that should be hidden </details\>           | [spoiler]<br/>Text that should be hidden<br/>[/spoiler] |

| Line breaks                                |                                              |
| :----------------------------------------- | :------------------------------------------- |
| \<br\>  </br\>  <br/\>                     | <br />                                       |
| Line with trailing slash\ <br />New line   | Line with trailing slash<br/><br/>New line   |
| Line with 2 trailing spaces  <br />NewLine | Line with 2 trailing spaces<br/><br/>NewLine |

## Blocks

The blocks below are converted into opening and closing BBcode tags, broken into several lines for readability *(otherwise everything will turn into a horrible mess)*. However, lines, spaces, and tabs between tags do not affect the final result.

To reduce the demonsration, some tags are on the same line as the text.

| Code                                 |                                         |
| :----------------------------------- | :-------------------------------------- |
| \```py<br />print("hello!")<br />``` | [code]<br/>print("hello!")<br/>[/code]  |
| \```<br />MsgBox("hello!")<br />```  | [code]<br/>MsgBox("hello!")<br/>[/code] |

| Block quotes                                                 |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| > A quote looks like a block<br/>> of text                   | [quote]<br/> A quote looks like a block<br/> of text<br/>[/quote] |
| > [!NOTE]  [!Tip] [!warning] [!cAuTiOn] <br />> But this is alert | [quote]<br/> [b]NOTE[/b]  [b]Tip[/b] [b]warning[/b] [b]cAuTiOn[/b]<br/> But this is alert<br/>[/quote] |
| > Quotes can contain<br/> > > nested quotes<br />>>without spaces between prefix and word | [quote]<br/> Quotes can contain<br/>[quote]<br/> nested quotes<br/>[/quote]<br/>without spaces between prefix and word<br/>[/quote] |
| > Many<br /> > > many<br /> > > > nested<br/> > quotes       | [quote]<br/> Many<br/>[quote]<br/> many<br/>[quote]<br/> nested<br/>[/quote]<br/> quotes<br/>[/quote]<br/>[/quote] |
| > As well as:<br />>  1. Ordered lists <br/>>     1. item1<br />>     2. item2<br />> \<sub>tags\</sub>, <br />> \<!-- comments -->, <br />> \*basic syntax\* <br />> and many more… | [quote]<br/> As well as:<br/>\[list=1][\*] Ordered lists <br/>[list=1]<br/>[\*] item1<br/>[\*] item2<br/>\[/list]\[/list]<br/>[size=85]tags[/size],<br/>[i]basic syntax[/i]<br/>and many more…<br/>[/quote] |
| >  1. Lists can have an infinite level of nesting <br/>>     1. item1<br />>          2. item2<br />>               3. item3<br />>  - And unordered lists can be nested too!   <br />>       - Item<br /> >               - deep item | \[quote]<br/>\[list=1]<br/>[*] Lists can have an infinite level of nesting <br/>\[list=1][\*] item1<br/>\[list=1][\*] item2<br/>\[list=1][\*] item3<br/>\[/list]\[/list]\[/list]\[/list]<br/><br/>[list]<br/>[\*] And unordered lists can be nested too!<br/>\[list][\*] Item<br/>\[list][\*] deep item<br/>\[/list]\[/list]\[/list]<br/><br/>Lists can be mixed<br/>\[list=1][\*] item1<br/>\[list][\*] item2<br/>\[list=1][\*] item3<br/>\[/list]\[/list]\[/list]<br/>\[/quote] |
| >  Lists can be mixed <br />>  1. item1<br />>     - item2<br />>          3. item3<br /> | [quote]<br/>  Lists can be mixed<br/>\[list=1][\*] item1<br/>\[list][\*] item2<br/>\[list=1][\*] item3<br/>\[/list]\[/list]\[/list]<br/>[/quote] |
| > - As you might guess,<br/>> - all of this applies to:<br/>>     1. lists in quotes.<br/>>     2. lists outside quotes.<br/>>     3. lists with different levels of nesting.<br/>> - As well as applied to ordered/unordered lists transitions. | [quote]<br/>[list]<br/>[\*] As you might guess,<br/>[\*] all of this applies to:<br/>[list=1]<br/>[\*] lists in quotes.<br/>[\*] lists outside quotes.<br/>[\*] lists with different levels of nesting.<br/>[/list]<br/>[\*] As well as applied to ordered/unordered lists transitions.<br/>[/list]<br/>[/quote] |

| Lists                                                        |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| - The list can start with any number of tabs and spaces<br/>     - Each subsequent item in the list must start with the same number of tabs and spaces!<br />			- Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). | [list]<br/>[\*] The list can start with any number of tabs and spaces<br/>[list]<br/>[\*] Each subsequent item in the list must start with the same number of tabs and spaces!<br/>[list]<br/>[\*] Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces).<br/>\[/list]\[/list]\[/list] |
| 1. Lists can have an infinite level of nesting<br/>      1. item1<br />        2. item2<br />           3. item3<br /> | [list=1]<br/>[\*] Lists can have an infinite level of nesting<br/>[list=1]<br/>[\*] item1<br/>[list=1]<br/>[\*] item2<br/>[list=1]<br/>[\*] item3<br/>[/list]<br/>\[/list]\[/list]\[/list] |
| - And unordered lists can be nested too!<br/>        - deep item | [list]<br/>[\*] And unordered lists can be nested too!<br/>[list]<br/>[\*] deep item<br/>\[/list]\[/list] |
| - Lists can be mixed <br />1. item describes:<br />     1. item2<br />     2. item3<br />2. This item continues previous list started at 1. | \[list][\*] Lists can be mixed[/list]<br/>\[list=1][\*] item describes:<br/>[list=1]<br/>[\*] item2<br/>[\*] item3<br/>[/list]<br/>[\*] This item continues previous list started at 1.<br/>[/list] |
| 1. The lists go on and on. <br />2. This element is part of the list started in point 1. <br/>- To start a new list at the same nesting level, <br />- start a list of a different type.<br/>      - Or increase the nesting level. | \[list=1]<br/>[\*] The lists go on and on.<br/>[\*] This element is part of the list started in point 1. <br/>\[/list]\[list]<br/>[\*] To start a new list at the same nesting level,<br/>[\*] start a list of a different type.<br/>\[list]<br/>[\*] Or increase the nesting level.<br/>\[/list]\[/list] |
| - List can capture additional text elements, as well as quotes, spoilers, \*\*all supported syntax\*\*.<br />- Add a tab or space before the item to add it to the list.<br /> \<details><br/>    *This spoiler belongs to the 1st item.*<br/>     > This quote belongs to the 1st item.<br/> \</details><br />> This quote does not belong to the list. | [list]<br/>[\*] List can capture additional text elements, as well as quotes, spoilers, \[b]all supported syntax\[/b]<br/>[\*] Add a tab or space before the item to add it to the list.<br/>[\*]This spoiler belongs to the 1st item.*<br/>[quote]<br/> This quote belongs to the 1st item<br/>[/quote]<br/>[/list]<br/>[quote]<br/> This quote does not belong to the list.<br/>[/quote] |
| - Quotes and other elements are belongs to previous item regardless of its nesting level.<br/> 1. Item1<br />	2. Item2 <br />        > This quote belongs to item2. <br />	        3. Item3<br />                > This quote belongs to item3<br />                4. Item4<br /> | \[list]<br/>[\*] Quotes and other elements are belongs to previous item regardless of its nesting level.<br/>\[/list]<br/>\[list=1][\*] Item1<br/>\[list=1][\*] Item2<br/>[quote] This quote belongs to item2. [/quote]<br/><br/>\[list=1][\*] Item3<br/>[quote] This quote belongs to item3 [/quote]<br/><br/>[\*] Item4<br/>\[/list]\[/list]\[/list] |
| - To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;<br/>- or leave one or more blank lines between the item and the list.<br/>> No spaces: this quote does not belong to the list.<br/><br/>> Another line: this quote does not belong to the list. | [list]<br/>[\*] To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;<br/>[\*] or leave one or more blank lines between the item and the list.<br/>[/list]<br/>[quote] No spaces: this quote does not belong to the list. [/quote]<br/><br/>[quote] Another line: this quote does not belong to the list. [/quote] |
| - Use line break characters\\     \</br>  \<br/><br />> This quote does not belong to the list. | \[list][\*] Use line break characters [/list]<br/><br/>[quote] This quote does not belong to the list. [/quote] |

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

| Commits                                                      |      |
| :----------------------------------------------------------- | :--- |
| https://github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4 |      |
| 896111015666c8fa7a8b390232a52e79356319c4                     |      |
| JoyHak@896111015666c8fa7a8b390232a52e79356319c4              |      |
| JoyHak/QuickSwitch@896111015666c8fa7a8b390232a52e79356319c4  |      |
