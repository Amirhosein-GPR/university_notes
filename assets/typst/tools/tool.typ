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

#let tip(content, level: 1, black_and_white: false) = {
    let star_color = orange_color

    let star_list = ()
    while level > 0 {
        star_list.push([#svg("../../icons/star.svg", rgb: star_color.to-hex(), width: 0.9em)])
        level -= 1
    }

    block(stroke: star_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: star_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: star_color), outset: (left: 0.05em))[
                #star_list.map(star => {
                    [
                        #h(0.05em)
                        #star
                        #h(0.05em)
                    ]
                }).join()
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: star_color)[
                    نکته
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let definition(content, black_and_white: false) = {
    let icon_color = blue_color

    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.15em))[
                #svg("../../icons/file-lines.svg", rgb: icon_color.to-hex(), height: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    تعریف
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let question(content, black_and_white: false) = {
    let icon_color = brown_color
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/circle-question.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    سؤال
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let example(content, black_and_white: false) = {
    let icon_color = purple_color
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/circle-dot.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    مثال
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let true_answer(content, black_and_white: false) = {
    let icon_color = green_color
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/circle-check.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    پاسخ
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let wrong_answer(content, black_and_white: false) = {
    let icon_color = red_color
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/circle-xmark.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    پاسخ
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let comparision(content, black_and_white: false) = {
    let icon_color = rgb(0, 170, 170)
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/code-compare.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    مقایسه
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let list(content, black_and_white: false) = {
    let icon_color = yellow_color
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/list.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    فهرست
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
    ]
}

#let simple_context(content, black_and_white: false) = {
    let icon_color = luma(70)
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/book.svg", rgb: icon_color.to-hex(), width: 0.8em)
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    متن
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
        
        // #text(baseline: -0.2em)[
        //     #content
        // ]
    ]
}

#let exercise(content, black_and_white: false, extra_score: false) = {
    let icon_color = rgb(255, 0, 150)
    block(stroke: icon_color, inset: 0.5em, radius: 0.2em, width: 100%)[
        #box(stroke: icon_color, radius: 0.2em)[
            #box(inset: 0.3em, stroke: (left: icon_color), outset: (left: 0.1em))[
                #svg("../../icons/pen-to-square.svg", rgb: icon_color.to-hex(), width: 0.8em)
                #if extra_score {
                    svg("../../icons/plus.svg", rgb: icon_color.to-hex(), width: 0.8em)
                }
            ]
            #box(inset: 0.3em)[
                #text(baseline: -0.15em, fill: icon_color)[
                    تمرین
                ]
            ]
        ]
        #text(baseline: -0.45em)[
            #content
        ]
        
        // #text(baseline: -0.2em)[
        //     #content
        // ]
    ]
}

#let custom_figure(content, caption: str, refrence: none, inset: 0em) = {
    show par: set block(above: 0em)

    show figure: arg => {
        align(center)[
            #block(stroke: (bottom: black), width: 100%, inset: inset)[
                #arg.body
            ]
            #if caption != none {
                v(0.5em)
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

#let code_section(content) = {
    line(length: 100%)
    block(fill: luma(230), inset: 1em, width: 100%, radius: 0.2em)[
        #text(dir: ltr)[
            #content
        ]
    ]
    line(length: 100%)
}