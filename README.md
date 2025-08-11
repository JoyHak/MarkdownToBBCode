When I was writing changelogs for my [QuickSwitch](https://github.com/JoyHak/QuickSwitch) project, I needed to convert them from [Markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) markup language to [BBcode](https://osu.ppy.sh/wiki/en/BBCode) markup language for posting on forums. 

That is how this converter was developed. It was successfully tested on the [latest complex changelog](https://github.com/JoyHak/QuickSwitch/releases/tag/1.8).

Here's the list of key features:
- Full support for GitHub markdown syntax ([basic](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) and [advanced](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/organizing-information-with-collapsed-sections)).
- Support for [html tags](#html-tags) and [spoilers](#spoilers-comments).
- Delete [comments](#spoilers-comments), mark text that does not need to be converted.
- Recursive [block elements](https://github.com/JoyHak/MarkdownToBBCode#blocks) conversion (lists containing lists, basic syntax containing basic syntax, etc).
- Support for any type of [list](#lists) (ordered, unordered, with any prefix and nesting level).
- Attaching / detaching markdown list items from BBcode lists (ability to add or detach quotes and other items from the converted list).
- Support for multi-level [quotes](#quotes) with the ability to include lists, mentions, and other syntax.
- Support for [Github issues](#github-links), commits and relative to the selected repository root links.
- Restore text to its pre-conversion state for editing.
- Convert, copy, and clear with a single click.
- Convert file and save result to the new / existing file.
- [Command line interface](https://github.com/JoyHak/MarkdownToBBCode#сommand-line) (CLI) for converting different files and combining their contents into a single file.

It uses the [Maple Mono](https://github.com/subframe7536/maple-font) font for GUI elements.

## Markdown

The converter supports basic syntax, complex blocks, and tables. For example, the tables with examples below can also be converted to BBcode tables (without alignment).

| Basic syntax                                                 |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#fb7237}\*\*\color{White}Bold\color{#fb7237}**\hspace{3mm}\\_\\\_\color{White}Bold\color{#fb7237}\\\_\\\_}$ | $\texttt{\color{#fb7237}[b]\color{White}Bold\color{#fb7237}[/b]}$ |
| $\texttt{\color{#fb7237}\*\color{White}Italic\color{#fb7237}\*\hspace{3mm}\\_\color{White}Italic\color{#fb7237}\\\_}$ | $\texttt{\color{#fb7237}[i]\color{White}Italic\color{#fb7237}[/i]}$ |
| $\color{#fb7237}\sim\texttt{\color{White}Strike}\color{#fb7237}\sim\hspace{3mm}\sim\sim\texttt{\color{White}Strike}\color{#fb7237 }\color{#fb7237}\sim\sim$ | $\texttt{\color{#fb7237}[strike]\color{White}Strike\color{#fb7237}[/strike]}$ |
| $\texttt{\color{#fb7237}\*\*\*\color{White}Bold and italic\color{#fb7237}\*\*\*\hspace{3mm}\\_\\\_\\\_\color{White}Bold and italic\color{#fb7237}\\\_\\\_\\\_}$ | $\texttt{\color{#fb7237}\[b]\color{#48a5d7}[i]\color{White}Bold and italic\color{#48a5d7}\[/i]\color{#fb7237}[/b]}$ |
| $\large\color{#fb7237}\textasciiacute$ $\texttt{\color{White}Inline}\color{#fb7237}$ $\large\color{#fb7237}\textasciiacute$ | $\texttt{\color{#fb7237}[c]\color{White}Inline\color{#fb7237}[/c]}$ |
| $\large\texttt{\color{#fb7237}\\#}$ h1                               | $\texttt{\color{#fb7237}[size=200]\color{White}h1\color{#fb7237}[/size]}$ |
| $\large\texttt{\color{#fb7237}\\#\\#}$ h2                              | $\texttt{\color{#fb7237}[size=180]\color{White}h2\color{#fb7237}[/size]}$ |
| $\texttt{\color{#fb7237}\\#\\#\\#}$ h3                             | $\texttt{\color{#fb7237}[size=150]\color{White}h3\color{#fb7237}[/size]}$ |
| $\tiny\texttt{\color{#fb7237}\\#\\#\\#\\#}$ h4                            | $\texttt{\color{#fb7237}[size=125]\color{White}h4\color{#fb7237}[/size]}$ |

| Links                                       |                                                              |
| :------------------------------------------ | :----------------------------------------------------------- |
| [Short name]\(link)                         | $\texttt{\color{#fb7237}[url=link]\color{White}Short name\color{#fb7237}[/url]}$ |
| ![Image name]\(link)                        | $\texttt{\color{#fb7237}[url]\color{White}link\color{#fb7237}[/url]}$ |

<a name="html-tags"></a>

| Html tags                                                    |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#0d529d}\<sub>\color{White}Subscript\color{#0d529d}\</sub>}$ | $\texttt{\color{#fb7237}[size=85]\color{White}Subscript\color{#fb7237}[/size]}$ |
| $\texttt{\color{#0d529d}\<ins>\color{White}Underlined\color{#0d529d}\</ins>}$ | $\texttt{\color{#fb7237}[u]\color{White}Underlined\color{#fb7237}[/u]}$ |
| $\texttt{\color{#0d529d}\<details>\color{White} Text that should be hidden \color{#0d529d}\</details>}$ | $\texttt{\color{#0d529d}[spoiler]}$<br>$\texttt{\color{White}Text that should be hidden}$<br>$\texttt{\color{#0d529d}[/spoiler]}$ |
| $\texttt{\color{#0d529d}\<details>\color{#108c9a}}$<br>$\texttt{\color{#108c9a}\<summary>\color{White}Examples\color{#108c9a}\</summary>}$<br>$\texttt{\color{White}Hidden example}$<br>$\texttt{\color{#0d529d}\</details>}$ | $\texttt{\color{#0d529d}[spoiler2=Examples]}$<br>$\texttt{\color{White}Hidden example}$<br>$\texttt{\color{#0d529d}[/spoiler]}$ |
| $\texttt{\color{#0d529d}\<unknown>\color{White}Simple text\color{#0d529d}\</unknown>}$ | $\texttt{\color{#fb7237}[size=110]\color{White}unknown\color{#fb7237}[/size]}$<br>Simple text |

Tags `<details>` on GitHub are similar to spoilers: they turn into collapsed text. The `<summary>` tag replaces the spoiler title "details" with the specified title.

Unknown tags are converted to headers. All converted spoilers and unknown tags will have an additional line break for readability.
<a name="spoilers-comments"></a>

| Spoilers and comments                                        |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#5e5e5e}\<!-- spoiler -->\color{White} Text that should be hidden \color{#5e5e5e}\<!-- /spoiler -->}$ | $\texttt{\color{#fb7237}[spoiler]}$<br>$\texttt{\color{White}Text that should be hidden}$<br>$\texttt{\color{#fb7237}[/spoiler]}$ |
| $\texttt{\color{#5e5e5e}\<!-- alternate -->\color{White} Text that shouldn't be converted  \color{#5e5e5e}\<!-- /alternate -->}$ | Text that shouldn't be converted                               |
| $\texttt{\color{#5e5e5e}\<!--\color{White} Text that should be removed \color{#5e5e5e}\-->}$ |                                                              |

<a name="line-breaks"></a>

| Line breaks                                    |                                            |
| :--------------------------------------------- | :----------------------------------------- |
| $\texttt{\color{#0d529d}\<br>  \</br>  \<br/>  }$ | <br>                                       |
| Line with trailing slash\ <br>New line         | Line with trailing slash<br><br>New line   |
| Line with 2 trailing spaces  <br>NewLine       | Line with 2 trailing spaces<br><br>NewLine |

Line breaks affect the final appearance of BBcode lists and quotes, but do not affect the appearance of tables: a Markdown table can contain line breaks and they will be captured by the BBcode table. A Markdown list or quote can contain line breaks, but they may not be included in the BBcode list or quote (see detailed examples below).

Spaces between markup and words are optional, as well as spaces inside and outside tags and comments. It means that `** Bold   **`  and `**Bold**` or `<!-- alternate     -->` and `<!--alternate-->` are treated the same.

## Blocks

The blocks below are converted into opening and closing BBcode tags, split into several lines for readability *(otherwise everything will turn into a horrible mess)*. Empty lines, spaces, and tabs between tags do not affect the rendered BBcode.

To reduce the demonsration, some tags are on the single line.

| Code                             |                                                              |
| :------------------------------- | :----------------------------------------------------------- |
| $\color{#fb7237}\textasciiacute\textasciiacute\textasciiacute\color{#fa4738}py$<br>$\texttt{print(\color{#48ee44}"hello!"}$)<br>$\color{#fb7237}\textasciiacute\textasciiacute\textasciiacute$ | $\texttt{\color{#fb7237}[code]}$<br>$\texttt{\color{White}print(\color{#48ee44}"hello!"}$)<br>$\texttt{\color{#fb7237}[/code]}$ |
| $\color{#fb7237}\textasciiacute\textasciiacute\textasciiacute$<br>$\texttt{MsgBox(\color{#48ee44}"hello!"}$)<br>$\color{#fb7237}\textasciiacute\textasciiacute\textasciiacute$ | $\texttt{\color{#fb7237}[code]}$<br>$\texttt{\color{White}MsgBox(\color{#48ee44}"hello!"}$)<br>$\texttt{\color{#fb7237}[/code]}$ |

<a name="quotes"></a>

| Block quotes                                                 |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#48a5d7}>}$ A quote looks like a block<br> $\texttt{\color{#48a5d7}>}$ of text | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White}A quote looks like a block}$<br>$\texttt{\color{White}of text}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}> \color{#fb7237}[!NOTE]  [!Tip] [!warning] [!cAuTiOn]}$ <br> $\texttt{\color{#48a5d7}>}$ But this is alert | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{#fb7237}[b]NOTE[/b]  [b]Tip[/b] [b]warning[/b] [b]cAuTiOn[/b]}$<br>$\texttt{\color{White} But this is alert}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}>}$ Quotes can contain<br> $\texttt{\color{#48a5d7}> >}$ nested quotes<br> $\texttt{\color{#48a5d7}>}$ without spaces between prefix and word | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} Quotes can contain}$<br>$\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} nested quotes}$<br>$\texttt{\color{#48a5d7}[/quote]}$<br>$\texttt{\color{White}without spaces between prefix and word}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}>}$ Many<br> $\texttt{\color{#48a5d7}> >}$ many<br> $\texttt{\color{#48a5d7}> > >}$ nested<br> $\texttt{\color{#48a5d7}>}$ quotes | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White}Many}$<br>$\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White}many}$<br>$\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White}nested}$<br>$\texttt{\color{#48a5d7}[/quote]}$<br>$\texttt{\color{White}quotes}$<br>$\texttt{\color{#48a5d7}[/quote]}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}>}$ As well as:<br> $\texttt{\color{#48a5d7}> \color{#006868} 1.}$ Ordered lists <br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}1.}$ item1<br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}2.}$ item2<br> $\texttt{\color{#48a5d7}> \color{#0d529d}\<sub>\color{White}tags\color{#0d529d}\</sub>,}$ <br> $\texttt{\color{#48a5d7}>}$ $\texttt{\color{#717171}\<!-- \color{White}comments \color{#5e5e5e}-->,}$ <br> $\texttt{\color{#48a5d7}> \color{#fb7237}\*\color{White}basic syntax\color{#fb7237}\*}$ <br> $\texttt{\color{#48a5d7}>}$ and many more… | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} As well as:}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ Ordered lists  $\texttt{}$<br>$\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item1 $\texttt{}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item2 $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]}$<br>$\texttt{\color{#fb7237}[size=85]\color{White}tags\color{#fb7237}[/size],}$<br>$\texttt{\color{#fb7237}[i]\color{White}basic syntax\color{#fb7237}[/i]}$<br>$\texttt{\color{White}and many more…}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}> \color{#006868} 1.}$ Lists can have an infinite level of nesting <br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}1.}$ item1<br> $\texttt{\color{#48a5d7}>\hspace{2cm}\color{#006868}2.}$ item2<br> $\texttt{\color{#48a5d7}>\hspace{3cm}\color{#006868}3.}$ item3<br> $\texttt{\color{#48a5d7}> \color{#006868} -}$ And unordered lists can be nested too!<br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}-}$ Item<br> $\texttt{\color{#48a5d7}>\hspace{2cm}\color{#006868}-}$ deep item | $\texttt{\color{#48a5d7}\[quote]}$<br>$\texttt{\color{#11975a}\[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[*] }$ Lists can have an infinite level of nesting  $\texttt{}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item1 $\texttt{}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item2 $\texttt{}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item3 $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\[/list]\[/list]}$<br>$\texttt{}$<br>$\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ And unordered lists can be nested too! $\texttt{}$<br>$\texttt{\color{#11975a}\[list]\color{#006868}[\*] }$ Item $\texttt{}$<br>$\texttt{\color{#11975a}\[list]\color{#006868}[\*] }$ deep item $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\[/list]}$<br>$\texttt{}$<br>$\texttt{\color{White}Lists can be mixed}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item1 $\texttt{}$<br>$\texttt{\color{#11975a}\[list]\color{#006868}[\*] }$ item2 $\texttt{}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item3 $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\[/list]}$<br>$\texttt{\color{#fb7237}\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}>}$ Lists can be mixed <br> $\texttt{\color{#48a5d7}> \color{#006868} 1.}$ item1<br> $\texttt{\color{#48a5d7}> \color{#006868} -}$ item2<br> $\texttt{\color{#48a5d7}> \color{#006868} 3.}$ item3<br> | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} Lists can be mixed}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item1 $\texttt{}$<br>$\texttt{\color{#11975a}\[list]\color{#006868}[\*] }$ item2 $\texttt{}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item3 $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\[/list]}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#48a5d7}>}$ $\texttt{\color{#006868} -}$ As you might guess,<br> $\texttt{\color{#48a5d7}>}$ $\texttt{\color{#006868} -}$ all of this applies to:<br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}1.}$ lists in quotes.<br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}2.}$ lists outside quotes.<br> $\texttt{\color{#48a5d7}>\hspace{1cm}\color{#006868}3.}$ lists with different levels of nesting.<br> $\texttt{\color{#48a5d7}> \color{#006868} -}$ As well as applied to ordered / unordered lists mixing. | $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ As you might guess, $\texttt{}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ all of this applies to: $\texttt{}$<br>$\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ lists in quotes. $\texttt{}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ lists outside quotes. $\texttt{}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ lists with different levels of nesting. $\texttt{}$<br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ As well as applied to ordered / unordered lists mixing. $\texttt{}$<br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |

<a name="lists"></a>

| Lists                                                        |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#006868} -}$ The list can start with any number of tabs and spaces<br> $\texttt{\hspace{1cm}\color{#006868} -}$ Each subsequent item in the list should start with the same number of tabs and spaces!<br> $\texttt{\hspace{2cm}\color{#006868} -}$ Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). | $\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#006868}[\*] }$ The list can start with any number of tabs and spaces<br>$\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#006868}[\*] }$ Each subsequent item in the list should start with the same number of tabs and spaces! $\texttt{}$<br>$\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ Nesting levels are taken into account in both spaces and tabs (converted to 8 spaces). $\texttt{}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\color{#11975a}[/list]}$ |
| $\texttt{\color{#006868} 1.}$ Lists can have an infinite level of nesting<br> $\texttt{\hspace{1cm}\color{#006868}1.}$ item1<br> $\texttt{\hspace{2cm}\color{#006868}2.}$ item2<br> $\texttt{\hspace{3cm}\color{#006868}3.}$ item3<br> | $\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ Lists can have an infinite level of nesting <br>$\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item1 <br>$\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item2 <br>$\texttt{\color{#11975a}[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item3 <br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#11975a}\[/list]\[/list]\color{#11975a}[/list]}$ |
| $\huge{\textsf{\color{#006868} *}}$ List items can have any prefix<br/> $\textsf{\hspace{1cm}\color{#006868}+}$ item <br/> $\huge{\textsf{\hspace{2cm}\color{#006868}-}}$ item | $\texttt{\color{#11975a}[list]}$<br/>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ List items can have any prefix <br/>$\texttt{\color{#11975a}[list]}$<br/> $\texttt{\color{#006868}[\*] }$ item  <br/> $\texttt{\color{#11975a}[list]}$<br/> $\texttt{\color{#006868}[\*] }$ item <br/>$\texttt{\color{#11975a}\[/list]\[/list]\[/list]}$ |
| $\texttt{\color{#006868} -}$ Lists can be mixed <br> $\texttt{\color{#006868}1.}$ item describes:<br> $\texttt{\hspace{1cm}\color{#006868}-}$ item1<br> $\texttt{\hspace{1cm}\color{#006868}-}$ item2<br> $\texttt{\color{#006868}2.}$ This item continues previous list started at 1. | $\texttt{\color{#11975a}\[list]\color{White}\color{#006868}[\*] }$ Lists can be mixed[/list] <br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ item describes: <br>$\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item1 <br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ item2 <br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ This item continues previous list started at 1. <br>$\texttt{\color{#11975a}[/list]}$ |
| $\texttt{\color{#006868} 1.}$ The lists go on and on.<br>$\texttt{\color{#006868}2.}$ This element is part of the list started in point 1. <br> $\texttt{\color{#006868}-}$ To start a new list at the same nesting level, <br> $\texttt{\color{#006868}-}$ start a list of a different type.<br> $\texttt{\hspace{1cm}\color{#006868}-}$ Or increase the nesting level. | $\texttt{\color{#11975a}\[list=1]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ The lists go on and on. <br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ This element is part of the list started in point 1.  <br>$\texttt{\color{#11975a}\[/list]\[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ To start a new list at the same nesting level, <br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ start a list of a different type. <br>$\texttt{\color{#11975a}\[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ Or increase the nesting level. <br>$\texttt{\color{#11975a}\[/list]\color{#11975a}[/list]}$ |
| $\texttt{\color{#006868} -}$ List can capture additional text elements, as well as quotes, spoilers, $\texttt{\color{#fb7237}\*\*\color{White}all supported syntax\color{#fb7237}\*\*}$ .<br> $\texttt{\color{#006868}-}$ Add a tab or space before the item to add it to the list.<br> $\texttt{\hspace{3mm}\color{#48a5d7}>}$ This quote belongs to the 1st item.<br> $\texttt{\color{#48a5d7}>}$ This quote does not belong to the list. | $\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ List can capture additional text elements, as well as quotes, spoilers,  $\texttt{\color{#fb7237}\[b]\color{White}all supported syntax\color{#fb7237}\[/b]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ Add a tab or space before the item to add it to the list. <br> $\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} This quote belongs to the 1st item}$<br>$\texttt{\color{#48a5d7}[/quote]}$<br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#48a5d7}[quote]}$<br>$\texttt{\color{White} This quote does not belong to the list.}$<br>$\texttt{\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#006868} -}$ Quotes and other elements are belongs to previous item regardless of its nesting level.<br> $\texttt{\color{#006868} 1.}$ Item1 <br>	$\texttt{\hspace{1cm}\color{#006868} 2.}$ Item2 <br> $\texttt{\hspace{1cm}\color{#48a5d7}>}$ This quote belongs to item2. <br> $\texttt{\hspace{2cm}\color{#006868} 3.}$ Item3<br> $\texttt{\hspace{2cm}\color{#48a5d7}>}$ This quote belongs to item3.<br> $\texttt{\hspace{2cm}\color{#006868}4.}$ Item4 | $\texttt{\color{#11975a}\[list]}$<br>$\texttt{\color{#006868}[\*] }$ Quotes and other elements are belongs to previous item regardless of its nesting level. <br>$\texttt{\color{#11975a}\[/list]}$<br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ Item1 <br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ Item2 <br>$\texttt{\color{#48a5d7}[quote]\color{White}This quote belongs to item2.\color{#48a5d7}[/quote]}$<br><br>$\texttt{\color{#11975a}\[list=1]\color{#006868}[\*] }$ Item3 <br>$\texttt{\color{#48a5d7}[quote]\color{White}This quote belongs to item3.\color{#48a5d7}[/quote]}$<br><br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ Item4 <br>$\texttt{\color{#11975a}\[/list]\[/list]\color{#11975a}[/list]}$ |
| $\texttt{\color{#006868} -}$ To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote;<br> $\texttt{\color{#006868}-}$ or leave one or more blank lines between the item and the list.<br> $\texttt{\color{#48a5d7}>}$ No spaces: this quote does not belong to the list.<br><br> $\texttt{\color{#48a5d7}>}$ Another line: this quote does not belong to the list. | $\texttt{\color{#11975a}[list]}$<br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ To separate any item / quote / other from the list (or start a new list), dont' add space before the item / quote; <br>$\texttt{\color{#fb7237}\color{#006868}[\*] }$ or leave one or more blank lines between the item and the list. <br>$\texttt{\color{#11975a}[/list]}$<br>$\texttt{\color{#48a5d7}[quote]\color{White}No spaces: this quote does not belong to the list.\color{#48a5d7}[/quote]}$<br><br>$\texttt{\color{#48a5d7}[quote]\color{White}Another line: this quote does not belong to the list.\color{#48a5d7}[/quote]}$ |
| $\texttt{\color{#006868} -}$ Use line break characters $\texttt{\color{#0d529d}\\\\  \<\/br>   \<br\>}$ <br> $\texttt{\color{#48a5d7}>}$ This quote does not belong to the list. | $\texttt{\color{#11975a}\[list]\color{White}\color{#006868}[\*]\color{White} Use line break characters\color{#11975a}[/list]}$ <br><br>$\texttt{\color{#48a5d7}[quote]\color{White}This quote does not belong to the list.\color{#48a5d7}[/quote]}$ |

## GitHub links and references

<a name="github-links"></a>
Links and images can be relative to the repository root (it usually starts with `/`). You can specify the repository in the converter settings. All relative links will be appended into the repository URL. You can use all relative link operands, such as `./` or `../`. Relative link text should be on a single line.

The correctness of the converted link is not checked for performance reasons. Make sure that after adding the repository into the relative link, it is correct.

| Relative links                                    |                                                              |
| :------------------------------------------       | :----------------------------------------------------------- |
| [Relative readme]\(./README.md)                   | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/README.md $\texttt{\color{#fb7237}]\color{White}Relative readme\color{#fb7237}[/url]}$ |
| $\texttt{\color{#7ab3dc}![\color{White}Image name\color{#7ab3dc}]\(}$ https://myoctocat.com/assets/images/base-octocat.svg $\texttt{\color{#7ab3dc}\)}$ | $\texttt{\color{#fb7237}[url]}$ https://myoctocat.com/assets/images/base-octocat.svg $\texttt{\color{#fb7237}[/url]}$ |
| $\texttt{\color{#7ab3dc}@\color{White}JoyHak}$    | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak $\texttt{\color{#fb7237}]\color{#7ab3dc}@\color{White}JoyHak\color{#fb7237}[/url]}$ |

All issues and commits in short form will be appended into the repository URL. The converter cannot check whether `#64` is a Pull Request (PR), discussion, or issue, so it always assumes that it is an issue.

| Issues (PRs is not supported)                                |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| $\texttt{\color{#7ab3dc}\\#\color{#7a80dc}64}$               | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/issues/64 $\texttt{\color{#fb7237}]\color{#7ab3dc}\\#\color{#7a80dc}64\color{#fb7237}[/url]}$ |
| $\texttt{\color{White}GH-\color{#7a80dc}64}$                 | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/issues/64 $\texttt{\color{#fb7237}]\color{White}GH-\color{#7a80dc}64\color{#fb7237}[/url]}$ |
| $\texttt{\color{White}JoyHak\color{#7ab3dc}/\color{White}QuickSwitch\color{#7ab3dc}\\#\color{#7a80dc}64}$ | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/issues/64 $\texttt{\color{#fb7237}]\color{White}JoyHak\color{#7ab3dc}/\color{White}QuickSwitch\color{#7ab3dc}\\#\color{#7a80dc}64\color{#fb7237}[/url]}$ |
| $\texttt{\color{White}AutoHotkey\color{#7ab3dc}/\color{White}AutoHotkeyDocs\color{#7ab3dc}\\#\color{#7a80dc}744}$ | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/AutoHotkey/AutoHotkeyDocs/issues/744 $\texttt{\color{#fb7237}]\color{White}AutoHotkey\color{#7ab3dc}/\color{White}AutoHotkeyDocs\color{#7ab3dc}\\#\color{#7a80dc}744\color{#fb7237}[/url]}$ |

| Commits                                                      |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| 896111015666c8fa7a8b390232a52e79356319c4                     | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4 $\texttt{\color{#fb7237}]\color{#7a80dc}8961110\color{#fb7237}[/url]}$ |
| $\texttt{\color{White}JoyHak\color{#7ab3dc}/\color{White}QuickSwitch\color{#7ab3dc}@}$ 896111015666c8fa7a8b390232a52e79356319c4 | $\texttt{\color{#fb7237}[url=}$ https://redirect.github.com/JoyHak/QuickSwitch/commit/896111015666c8fa7a8b390232a52e79356319c4 $\texttt{\color{#fb7237}]\color{White}JoyHak\color{#7ab3dc}/\color{White}QuickSwitch\color{#7ab3dc}@\color{#7a80dc}8961110\color{#fb7237}[/url]}$ |

## Command line

The command interface allows you to convert files and any text directly from the terminal. The result can be saved to a file or printed to the terminal and passed to any command using the `|` pipe operator.

You can use auto-completion for CLI directly in [Powershell 5.1](https://github.com/PowerShell/powershell/releases) and above. This requires an auto-completion module, such as [PSReadLine](https://learn.microsoft.com/en-us/powershell/module/psreadline/about/about_psreadline?view=powershell-7.5) and [Register-AutocompleteCommand](https://github.com/marcio1002/AutocompleteCommand).

<details><summary>Auto-completion setup</summary>

Add the path to the directory containing `md2bb.exe` to the path environment variable:
```shell
setx PATH "$env:path;\the\directory\to\add" -m
```
Then open the profile:
```shell
notepad $PROFILE
```
If you're using [Cmder](https://github.com/cmderdev/cmder) or [Conemu](https://github.com/ConEmu/ConEmu), open `%CMDER_ROOT%\config\user_profile.ps1`. 
Add the following command:
```shell
Register-AutocompleteCommand -Commands 'md2bb'

# Set auto-complete list view
$options = @{
    PredictionSource    = 'HistoryAndPlugin'
    PredictionViewStyle = 'ListView'
}
Set-PSReadLineOption @options

# Assign an auto-complete key, such as `Tab`
Set-PSReadLineKeyHandler -Chord 'Tab' -Function 'MenuComplete'
```
Restart your PC.  Now, after entering md2bb and pressing `Tab`, you will see a list of available parameters and their descriptions. When entering arguments, such as `-repo`, you can press `Tab` again to read its description. Press `Tab` again to have autocomplete type the parameter for you.

</details>

Usage: `md2bb (<file_name> | <text> | @listfile) [<parameters> <switches>]`
| Parameters                   |                                                              |
| :--------------------------- | :----------------------------------------------------------- |
| -save, -write                | The name / path of the file where to write the result. The result will be appended at the end of the file if it already exists. |
| -repo, -repository, -domain  | Url to the repository for resolving relative links and references. |
| -sep, -separator, -delimiter | Separator for text parameters concatenation.                 |

| Switches   |                                               |
| :--------- | :-------------------------------------------- |
| -h, -help  | Displays help message.                        |
| -overwrite | Overwrite the file where to write the result. |

Parameters order doesn't matter:
```shell
    md2bb -save 'forum.md' 'readme.md'
    md2bb 'readme.md' -save 'forum.md'
```
Text can be combined:
```shell
    md2bb 'readme.md' 'add text' 'another text' 'license.md' -sep ' '
    md2bb 'sentence' 'will be' 'splitted' -save 'forum.md'
```
The value of `-repo` is stored on the disk, so it can be passed once. After that [its value will be used](#github-links) for each `md2bb` usage:
```shell
    md2bb -repo 'https://github.com/JoyHak/MarkdownToBBCode' -> 'Repository has been saved'
    md2bb 'issue #1' -> issue [url=https://github.com/JoyHak/MarkdownToBBCode/issues/1]#1[/url]
```
Parameters prefix can be `/ - --`.
Parameter without prefix will be treated as file name / text / listfile to convert:

```shell
    md2bb 'readme.md' 'add text' '@listfile.md'
    Reads and converts contents of 'readme.md', then converts 'add text', then reads and converts contents of 'listfile.md' line by line.
```
`@listfile` can be `@filename.ext` or `@path` and it can contain anything. It will be readed and each line will be converted as the text. If line contains file name / path, it's contents will be converted (if it exists). Also it can be used to convert individual lines, combine them into one text and separate using symbol passed via `-sep` .

You can pass the `|` symbol as a text to force the separation of parts of the text from each other:
```shell
    md2bb 'readme.md|@listfile.md'
    Reads and converts 'readme.md' file, then reads and converts 'listfile.md' line by line.
    
    md2bb 'sentence|will be|splitted'
    Convert 'sentence' 'will be' 'splitted' separately.
```
Pass `-sep` symbol to concatenate different parts:
```shell
    md2bb 'sentence|will be|splitted'     -sep '_' -> 'sentence_will be_splitted'
    md2bb 'sentence' 'will be' 'splitted' -sep '_' -> 'sentence_will be_splitted'

    md2bb 'readme.md' 'add text' -sep '_' -save 'forum.md'
    Concatenates converted contents of 'readme.md' with 'add text' using '_' symbol and appends it to the 'forum.md'.
```
You can pass multi-line text and `-sep` value:
```shell
    md2bb ' > Multi-line            ->  [quote]Multi-line
    > text'                             text[/quote]
    
    md2bb '*New*' '*line*' -sep '   ->  [i]New[/i]
    +'                                  [i]+line[/i]
```
You can also pass any [line break tags](#line-breaks) to get several lines of the text:
```shell
    md2bb '_New_<br>_line_'         ->  [i]New[/i]
                                        [i]line[/i]
   
    md2bb 'New<br/>line' -sep '+'   ->  [i]New[/i]
                                        [i]line[/i]
    Ignores '-sep' because text is treated as single part.
```
The `-save`  parameter appends the converted text at the end of existing file, removing all leading and trailing spaces, tabs, and blank lines. This allows you to create complex conversion chains:

```shell
md2bb 'readme.md' 'add text' '@listfile.md' 'add another text' '@lines.md' -save 'forum.md'
```
If you want to recreate the file, use `-overwrite` switch:
```shell
md2bb 'readme.md' -save 'readme.md'
Appends converted contents of 'readme.md' at the end of this file.
md2bb 'readme.md' -save 'readme.md' -overwrite
Deletes 'readme.md' and appends converted content to the new 'readme.md'
```
To convert individual elements to different files, use separate commands:
```shell
md2bb 'readme.md' 'add text' -save 'forum.md'
md2bb 'license.md' 'add copyright' -save 'lic.md'

```





