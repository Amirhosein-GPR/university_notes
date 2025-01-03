#let black_and_white = true

#let red_color = rgb(200, 0, 0)
#let orange_color = rgb(220, 100, 0)
#let yellow_color = rgb(120, 120, 0)
#let green_color = rgb(0, 120, 0)
#let blue_color = rgb(0, 100, 200)
#let dark_blue_color = rgb(0, 0, 200)
#let purple_color = rgb(150, 0, 150)
#let gold_color = rgb(255, 215, 0)
#let brown_color = rgb(160, 60, 0)

#let svg(path, rgb: "", width: auto, height: auto) = {
  let original = read(path)
  let colored = original.replace("path", "path fill=\"" + rgb + "\"")

  box(width: width, height: height)[#image.decode(colored)]
}

#let section_template(
  title: str,
  content,
  icon_paths: (),
  icon_color: color,
  pause: bool,
  continuation: bool,
) = {
  let fill_color
  let stroke_color
  if black_and_white {
    stroke_color = black
    fill_color = rgb(0, 0, 0, 0)
    icon_color = black
  } else {
    stroke_color = icon_color
    fill_color = icon_color.lighten(97%)
  }

  block(below: 1em)[
    #block(below: 0.5em, width: 100%)[
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
            box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
              #icon_list.at(counter)
            ]
            h(0.5em)

            counter += 1
          }
          box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
            #icon_list.at(counter)
          ]
        },
        block(stroke: stroke_color, inset: 0.5em, radius: 0.2em, width: 100%, fill: fill_color)[
          #text(fill: icon_color, baseline: -0.2em)[
            #title
          ]
        ],
        {
          while counter > 0 {
            box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
              #icon_list.at(counter)
            ]
            h(0.5em)

            counter -= 1
          }
          box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
            #icon_list.at(counter)
          ]
        },
      )
    ]

    #block(
      stroke: stroke_color,
      inset: (bottom: 0.75em, rest: 0.5em),
      radius: 0.2em,
      width: 100%,
      below: 1em,
      fill: fill_color,
    )[
      #if continuation == true {
        grid(
          columns: 1fr,
          align: center,
          inset: (top: 0.3em),
          place(center, dy: -0.4em)[
            #svg("../../icons/circle-play.svg", rgb: icon_color.to-hex(), width: 1em, height: 1em)
          ],
        )
        block(above: 1em, below: 0.7em)[
          #line(length: 100%, stroke: (paint: icon_color, dash: "densely-dashed"))
        ]
      }

      #content

      #if pause == true {
        block(below: 1em, above: 0.7em)[
          #line(length: 100%, stroke: (paint: icon_color, dash: "densely-dashed"))
        ]
        grid(
          columns: 1fr,
          align: center,
          place(center, dy: -0.6em)[
            #svg("../../icons/circle-pause.svg", rgb: icon_color.to-hex(), width: 1em, height: 1em)
          ],
        )
      }
    ]
  ]
}

#let section_counter(section_type) = {
  let headings_counter = counter("heading")
  let section_counter = counter(section_type)

  section_counter.step()

  context {
    let headings_before_here_count = query(selector(heading.where(level: 1)).before(here())).len()

    if headings_before_here_count > headings_counter.get().first() {
      headings_counter.update(headings_before_here_count)
      counter("tip").update(1)
      counter("definition").update(1)
      counter("question").update(1)
      counter("example").update(1)
      counter("answer").update(1)
      counter("comparison").update(1)
      counter("list").update(1)
      counter("simple_context").update(1)
      counter("exercise").update(1)
      counter("reminder").update(1)
      text(stylistic-set: 1)[#context headings_before_here_count.1]
    } else {
      text(stylistic-set: 1)[#context headings_before_here_count.#context section_counter.get().first()]
    }
  }
}

#let double_section(content1, content2) = {
  block(below: 1em)[
    #grid(
      columns: (1fr, 1fr),
      gutter: 1em,
      content1, content2,
    )
  ]
}

#let tip(content, level: 1, pause: false, continuation: false, enable_counter: false) = {
  let title = "نکته"

  if enable_counter {
    title += " " + section_counter("tip")
  }

  let icon_paths = ()
  while level > 0 {
    icon_paths.push("../../icons/star.svg")
    level -= 1
  }

  section_template(
    title: title,
    content,
    icon_paths: icon_paths,
    icon_color: orange_color,
    pause: pause,
    continuation: continuation,
  )
}

#let definition(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "تعریف"

  if enable_counter {
    title += " " + section_counter("definition")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/file-lines.svg",),
    icon_color: blue_color,
    pause: pause,
    continuation: continuation,
  )
}

#let question(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "سؤال"

  if enable_counter {
    title += " " + section_counter("question")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/circle-question.svg",),
    icon_color: red_color,
    pause: pause,
    continuation: continuation,
  )
}

#let example(
  content,
  pause: false,
  continuation: false,
  enable_counter: false,
  double_section: false,
) = {
  let title = "مثال"

  if enable_counter {
    title += " " + section_counter("example")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/circle-dot.svg",),
    icon_color: purple_color,
    pause: pause,
    continuation: continuation,
  )
}

#let true_answer(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "پاسخ"

  if enable_counter {
    title += " " + section_counter("answer")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/circle-check.svg",),
    icon_color: green_color,
    pause: pause,
    continuation: continuation,
  )
}

#let wrong_answer(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "پاسخ"

  if enable_counter {
    title += " " + section_counter("answer")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/circle-xmark.svg",),
    icon_color: brown_color,
    pause: pause,
    continuation: continuation,
  )
}

#let comparision(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "مقایسه"

  if enable_counter {
    title += " " + section_counter("comparision")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/code-compare.svg",),
    icon_color: rgb(0, 170, 170),
    pause: pause,
    continuation: continuation,
  )
}

#let list(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "فهرست"

  if enable_counter {
    title += " " + section_counter("list")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/list.svg",),
    icon_color: yellow_color,
    pause: pause,
    continuation: continuation,
  )
}

#let simple_context(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "متن"

  if enable_counter {
    title += " " + section_counter("simple_context")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/book.svg",),
    icon_color: luma(70),
    pause: pause,
    continuation: continuation,
  )
}

#let exercise(
  content,
  extra_score: false,
  pause: false,
  continuation: false,
  enable_counter: false,
) = {
  let title = "تمرین"

  if enable_counter {
    title += " " + section_counter("exercise")
  }

  let icon_paths
  if extra_score {
    icon_paths = ("../../icons/pen-to-square.svg", "../../icons/plus.svg")
  } else {
    icon_paths = ("../../icons/pen-to-square.svg",)
  }
  section_template(
    title: title,
    content,
    icon_paths: icon_paths,
    icon_color: rgb(255, 0, 150),
    pause: pause,
    continuation: continuation,
  )
}

#let reminder(content, pause: false, continuation: false, enable_counter: false) = {
  let title = "یادآوری"

  if enable_counter {
    title += " " + section_counter("reminder")
  }

  section_template(
    title: title,
    content,
    icon_paths: ("../../icons/arrows-rotate.svg",),
    icon_color: rgb(0, 180, 100),
    pause: pause,
    continuation: continuation,
  )
}

#let special(content, pause: false, continuation: false, enable_counter: false) = {
  let fill_color
  let stroke_color
  let icon_color
  let icon_paths = ("../../icons/receipt.svg",)
  let text_color
  let title = [#emoji.face.relief نصیحت های استاد#emoji.face.relief]
  if black_and_white {
    stroke_color = black
    fill_color = rgb(0, 0, 0, 0)
    icon_color = black
    text_color = black
  } else {
    stroke_color = gradient.linear(..color.map.rainbow.map(a => a.lighten(0%)), angle: 0deg)
    fill_color = gradient.linear(..color.map.rainbow.map(a => a.lighten(97%)), angle: 0deg)

    // icon_color = gradient.linear(..color.map.turbo)
    icon_color = rgb(0, 150, 150)
    text_color = gradient.linear(..color.map.rainbow.map(a => a.darken(50%)))
  }

  set text(fill: text_color, weight: "bold")

  block(below: 1em)[
    #block(below: 0.5em, width: 100%)[
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
            box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
              #icon_list.at(counter)
            ]
            h(0.5em)

            counter += 1
          }
          box(stroke: stroke_color, inset: 0.56em, radius: 0.2em, fill: fill_color)[
            #icon_list.at(counter)
          ]
        },
        block(stroke: stroke_color, inset: 0.5em, radius: 0.2em, width: 100%, fill: fill_color)[
          #text(fill: icon_color, baseline: -0.2em)[
            #title
          ]
        ],
        {
          while counter > 0 {
            box(stroke: stroke_color, inset: 0.5em, radius: 0.2em, fill: fill_color)[
              #icon_list.at(counter)
            ]
            h(0.5em)

            counter -= 1
          }
          box(stroke: stroke_color, inset: 0.56em, radius: 0.2em, fill: fill_color)[
            #icon_list.at(counter)
          ]
        },
      )
    ]

    #block(
      stroke: stroke_color,
      inset: (bottom: 0.75em, rest: 0.5em),
      radius: 0.2em,
      width: 100%,
      below: 1em,
      fill: fill_color,
    )[
      #if continuation == true {
        grid(
          columns: 1fr,
          align: center,
          inset: (top: 0.3em),
          place(center, dy: -0.4em)[
            #svg("../../icons/circle-play.svg", rgb: icon_color.to-hex(), width: 1em, height: 1em)
          ],
        )
        block(above: 1em, below: 0.7em)[
          #line(length: 100%, stroke: (paint: icon_color, dash: "densely-dashed"))
        ]
      }

      // #set text(fill: white)

      #content

      #if pause == true {
        block(below: 1em, above: 0.7em)[
          #line(length: 100%, stroke: (paint: icon_color, dash: "densely-dashed"))
        ]
        grid(
          columns: 1fr,
          align: center,
          place(center, dy: -0.6em)[
            #svg("../../icons/circle-pause.svg", rgb: icon_color.to-hex(), width: 1em, height: 1em)
          ],
        )
      }
    ]
  ]
}

#let custom_figure(content, caption: str, refrence: none, inset: 0em, kind: image) = {
  let supplement
  if kind == image {
    supplement = "شکل"
  } else if kind == table {
    supplement = "جدول"
  }
  if kind == raw {
    supplement = "کد"

    set raw(lang: "js")

    show figure: arg => {
      set block(below: 0em, breakable: true)
      block(
        stroke: black,
        width: 100%,
        inset: inset,
        radius: (top-left: 0.2em, top-right: 0.2em),
        clip: true,
        fill: luma(240),
      )[
        #align(left)[
          #text(dir: ltr)[
            #arg.body
          ]
        ]
      ]
      align(center)[
        #box(stroke: black, inset: 1em, width: 100%, radius: (bottom-left: 0.2em, bottom-right: 0.2em))[
          #text(baseline: 0em, stylistic-set: 1)[
            #arg.caption
          ]
        ]

      ]
    }

    [
      #figure(content, caption: caption, supplement: supplement) #refrence
    ]
  } else {
    show figure: arg => {
      set block(below: 0em, breakable: true)
      align(center)[
        #block(stroke: black, width: 100%, inset: inset, radius: (top-left: 0.2em, top-right: 0.2em), clip: true)[
          #text(dir: ltr)[
            #arg.body
          ]
        ]
        #box(stroke: black, inset: 1em, width: 100%, radius: (bottom-left: 0.2em, bottom-right: 0.2em))[
          #text(baseline: 0em, stylistic-set: 1)[
            #arg.caption
          ]
        ]
      ]
    }

    [
      #figure(content, caption: caption, supplement: supplement) #refrence
    ]
  }
}

#let title(content, color: blue_color, size: 1.4em) = {
  let stroke_color
  let fill_color
  if black_and_white {
    stroke_color = black
    fill_color = rgb(0, 0, 0, 0)
  } else {
    stroke_color = color
    fill_color = color.lighten(97%)
  }
  block(
    stroke: (thickness: 0.2em, paint: stroke_color),
    width: 100%,
    inset: 1.4em,
    radius: 0.2em,
    fill: fill_color,
  )[
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
  title("راهنمای جزوه", color: green_color)

  align(center)[
    #block(fill: black.lighten(97%), inset: 1em, radius: 0.2em, width: 100%, stroke: black.lighten(87%))[
      *نحوه خواندن جزوه*
    ]
    #align(right)[
      جزوه از دو نوع ستون تشکیل شده است:
      + #text(fill: red_color)[ستون اصلی]:
        ابتدا ستون اصلی راست هر صفحه را #text(fill: rgb(0, 100, 0))[به طور کامل] خوانده و سپس ستون اصلی چپ آن را #text(fill: rgb(0, 100, 0))[به طور کامل] بخوانید.
      + #text(fill: blue_color)[ستون فرعی]:
        درون هر ستون اصلی نیز در مواقعی ممکن است دو ستون فرعی ایجاد شود.
        ستون های فرعی اما بر خلاف ستون های اصلی، از #text(fill: rgb(0, 100, 0))[راست به چپ] خوانده می شوند.
        شکل زیر گویای همه چیز است:
    ]
    #block(stroke: (paint: black, dash: "densely-dash-dotted"), radius: 0.2em, inset: 0.5em, breakable: false)[
      #image("../../../images/ML/00.png")
    ]
  ]

  align(center)[
    #block(fill: black.lighten(97%), inset: 1em, radius: 0.2em, width: 100%, stroke: black.lighten(87%))[
      *بخش های مختلف جزوه*
    ]
  ]

  double_section()[
    #tip(enable_counter: false)[
      نکاتی که به نظر قابل توجه می آیند در این بخش قرار می گیرند.
    ]

    #question(enable_counter: false)[
      سؤال ها در این بخش قرار می گیرند.
    ]

    #true_answer(enable_counter: false)[
      پاسخ های درست در این بخش قرار می گیرند.
    ]

    #comparision(enable_counter: false)[
      مقایسه ها در این بخش قرار می گیرند.
    ]

    #simple_context(enable_counter: false)[
      متن های عادی در این بخش قرار می گیرند.
    ]

    #exercise(enable_counter: false, extra_score: true)[
      تمرین های نمره مثبت در این بخش قرار می گیرند.
    ]
  ][
    #definition(enable_counter: false)[
      تعریف ها در این بخش قرار می گیرند.
      #v(1.6em)
    ]

    #example(enable_counter: false)[
      مثال ها در این بخش قرار می گیرند.
    ]

    #wrong_answer(enable_counter: false)[
      پاسخ های نادرست در این بخش قرار می گیرند.
    ]

    #list(enable_counter: false)[
      فهرست ها در این بخش قرار می گیرند.
    ]

    #exercise(enable_counter: false)[
      تمرین ها در این بخش قرار می گیرند.
      #v(1.6em)
    ]

    #reminder(enable_counter: false)[
      يادآوری ها در این بخش قرار می گیرند.
      #v(1.6em)
    ]
  ]

  special()[
    #align(center)[
      بشنو زِ استاد نصیحتی چند!#emoji.face.beam
    ]
  ]

  align(center)[
    #block(fill: black.lighten(97%), inset: 1em, radius: 0.2em, width: 100%, stroke: black.lighten(87%))[
      *قطع شدن بخش ها*
    ]
  ]

  block()[
    فرض کنید دو بخش به نام های بخش ۱ و بخش ۲ داریم:

    هنگامی که بخش ۱ توسط بخش ۲ قطع می شود، در انتهای بخش ۱، علامت
    #text(baseline: 0.2em)[
      #svg("../../icons/circle-pause.svg", rgb: "rgb(0, 0, 0)", width: 1em, height: 1em)
    ]
    آورده می شود و پس از آنکه بخش ۲ (و شاید تعدادی بخش دیگر) به پایان رسید، ادامه بخش ۱ که با علامت
    #text(baseline: 0.2em)[
      #svg("../../icons/circle-play.svg", rgb: "rgb(0, 0, 0)", width: 1em, height: 1em)
    ]
    شروع می شود، می آید.
    به طور مثال:
    #double_section()[
      #definition(pause: true)[
        #sym.dots
      ]
    ][
      #question()[
        #sym.dots
        #v(1.7em)
      ]
    ]
    #double_section()[
      #true_answer()[
        #sym.dots
        #v(2em)

      ]
    ][
      #definition(continuation: true)[
        #sym.dots
      ]
    ]
  ]
}
