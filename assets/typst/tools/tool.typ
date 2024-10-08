#let red_color = rgb(200, 0, 0, 255)
#let orange_color = rgb(220, 100, 0, 255)
#let yellow_color = rgb(120, 120, 0, 255)
#let green_color = rgb(0, 120, 0, 255)
#let blue_color = rgb(0, 100, 200, 255)
#let dark_blue_color = rgb(0, 0, 200, 255)
#let purple_color = rgb(150, 0, 150, 255)
#let gold_color = rgb(255, 215, 0)
#let brown_color = rgb(125, 50, 0)

#let svg(path, rgb: "", width: auto, height: auto) = {
    let original = read(path)
    let colored = original.replace("path", "path fill=\"" + rgb + "\"")

    box(width: width, height: height)[#image.decode(colored)]
}

#let section_template(title: str, content, black_and_white: false, icon_paths: (), icon_color: color, half: false) = {
    block(below: 1em)[
        #block(below: 0.5em , width: 100%)[
            #let icon_list = ()
            #for icon_path in icon_paths {
                icon_list.push(svg(icon_path, rgb: icon_color.to-hex(), width: 0.8em, height: 0.8em))
            }

            #let counter = 0
            #let icon_list_last_index = icon_list.len() - 1
            #grid(
                columns: (auto, 1fr, auto),
                align: center,
                gutter: 0.5em,
                {
                    while counter < icon_list_last_index {
                        box(stroke: icon_color, inset: 0.5em, radius: 0.2em)[
                            #icon_list.at(counter)
                        ]
                        h(0.5em)

                        counter += 1
                    }
                    box(stroke: icon_color, inset: 0.5em, radius: 0.2em)[
                        #icon_list.at(counter)
                    ]
                },
                block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
                    #text(fill: icon_color, baseline: -0.2em)[
                        #title
                    ]
                ],
                {
                    while counter > 0 {
                        box(stroke: icon_color, inset: 0.5em, radius: 0.2em)[
                            #icon_list.at(counter)
                        ]
                        h(0.5em)

                        counter -= 1
                    }
                    box(stroke: icon_color, inset: 0.5em, radius: 0.2em)[
                        #icon_list.at(counter)
                    ]
                },
            )
        ]

        #block(stroke: icon_color, inset: (bottom: 0.75em, rest: 0.5em), radius: 0.2em, width: 100%, below: 1em)[
            #content
        ]
    ]
}

#let double_section(content1, content2) = {
    block(below: 1em)[
        #grid(
            columns: (1fr, 1fr),
            gutter: 1em,
            content1,
            content2
        )
    ]
}

#let tip(content, level: 1, black_and_white: false) = {
    let icon_paths = ()
    while level > 0 {
        icon_paths.push("../../icons/star.svg")
        level -= 1
    }

    section_template(title: "نکته", content, black_and_white: black_and_white, icon_paths: icon_paths, icon_color: orange_color)
}

#let definition(content, black_and_white: false) = {
    section_template(title: "تعریف", content, black_and_white: black_and_white, icon_paths: ("../../icons/file-lines.svg",), icon_color: blue_color)
}

#let question(content, black_and_white: false) = {
    section_template(title: "سؤال", content, black_and_white: black_and_white, icon_paths: ("../../icons/circle-question.svg",), icon_color: brown_color)
}

#let example(content, black_and_white: false) = {
    section_template(title: "مثال", content, black_and_white: black_and_white, icon_paths: ("../../icons/circle-dot.svg",), icon_color: purple_color)
}

#let true_answer(content, black_and_white: false) = {
    section_template(title: "پاسخ درست", content, black_and_white: black_and_white, icon_paths: ("../../icons/circle-check.svg",), icon_color: green_color)
}

#let wrong_answer(content, black_and_white: false) = {
    section_template(title: "پاسخ نادرست", content, black_and_white: black_and_white, icon_paths: ("../../icons/circle-xmark.svg",), icon_color: red_color)
}

#let comparision(content, black_and_white: false) = {
    section_template(title: "مقایسه", content, black_and_white: black_and_white, icon_paths: ("../../icons/code-compare.svg",), icon_color: rgb(0, 170, 170))
}

#let list(content, black_and_white: false) = {
    section_template(title: "فهرست", content, black_and_white: black_and_white, icon_paths: ("../../icons/list.svg",), icon_color: yellow_color)
}

#let simple_context(content, black_and_white: false) = {
    section_template(title: "متن", content, black_and_white: black_and_white, icon_paths: ("../../icons/book.svg",), icon_color: luma(70))
}

#let exercise(content, black_and_white: false, extra_score: false) = {
    let icon_paths
    if extra_score {
        icon_paths = ("../../icons/pen-to-square.svg", "../../icons/plus.svg")
    } else {
        icon_paths = ("../../icons/pen-to-square.svg",)
    }
    section_template(title: "تمرین", content, black_and_white: black_and_white, icon_paths: icon_paths, icon_color: rgb(255, 0, 150))
}

#let custom_figure(content, caption: str, refrence: none, inset: 0em) = {
    show par: set block(above: 0em)

    show figure: arg => {
        align(center)[
            #block(stroke: (bottom: black), width: 100%, inset: inset)[
                #arg.body
            ]
            #if caption != none {
                box(inset: 1em, width: 100%)[
                    #text(baseline: 0em)[
                        #arg.caption
                    ]
                ]
            }
        ]
    }
    
    set text(stylistic-set: 1)

    block(stroke: black, radius: 0.2em)[
        #figure(content, caption: caption, supplement: "شکل") #refrence
    ]
}

#let title(content, color: blue_color, size: 1.4em) = {
  block(stroke: (thickness: 0.2em, paint: color), width: 100%, inset: 1.4em, radius: 0.2em)[
    #align(center)[
      #text(size: size)[
        *#content*
      ]
    ]
  ]
}

#let sources(content) = {
    // pagebreak()
    show block: set block(above: 0em)

    block(width: 100%, stroke: black)[
        #block(width: 100%, inset: 1em)[
            #align(center)[
                منابع
            ]
        ]
        #block(width: 100%, stroke: black, inset: 1em)[
            #text(dir: ltr)[
                #content
            ]
        ]
    ]
}

#let code_section(content, lang: "js") = {
    line(length: 100%)
    set raw(lang: lang)
    block(fill: luma(230), inset: 1em, width: 100%, radius: 0.2em)[
        #text(dir: ltr)[
            #content
        ]
    ]
    line(length: 100%)
}

#let introduce_sections() = {
    title("توضیح بخش های مختلف جزوه", color: green_color)

    double_section()[
        #tip()[
            نکاتی که به نظر قابل توجه می آیند در این بخش قرار می گیرند.
        ]

        #question()[
            سؤال ها در این بخش قرار می گیرند.
        ]

        #true_answer()[
            پاسخ های درست در این بخش قرار می گیرند.
        ]

        #comparision()[
            مقایسه ها در این بخش قرار می گیرند.
        ]

        #simple_context()[
            متن های عادی در این بخش قرار می گیرند.
        ]
        
        #exercise(extra_score: true)[
            تمرین های نمره مثبت در این بخش قرار می گیرند.
        ]
    ][
        #definition()[
            تعریف ها در این بخش قرار می گیرند.
            #v(1.6em)
        ]

        #example()[
            مثال ها در این بخش قرار می گیرند.
        ]

        #wrong_answer()[
            پاسخ های نادرست در این بخش قرار می گیرند.
        ]

        #list()[
            فهرست ها در این بخش قرار می گیرند.
        ]

        #exercise()[
            تمرین ها در این بخش قرار می گیرند.
            #v(1.6em)
        ]
    ]










    
}