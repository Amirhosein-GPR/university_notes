#let note(
  doc,
  paper: str,
  flipped: bool,
  first_page_font_size: relative,
  font_size: relative,
  image_path: str,
  image_width: relative,
  topic: str,
  problem_topic: str,
  black_and_white: bool,
  version: str,
  progress_string: str,
  authors_name: (),
  professors_name: (),
  date: str,
  faculty: str,
  info_color: luma(50),
  no_responsibility: false,
  font_attribution: false,
) = {
  let red_color = rgb(200, 0, 0)
  let orange_color = rgb(220, 100, 0)
  let yellow_color = rgb(130, 130, 0)
  let green_color = rgb(0, 120, 0)
  let blue_color = rgb(0, 100, 200)
  let dark_blue_color = rgb(0, 0, 200)
  let purple_color = rgb(150, 0, 150)
  let gold_color = rgb(255, 215, 0)
  let brown_color = rgb(125, 50, 0)

  if black_and_white {
    red_color = rgb(0, 0, 0)
    orange_color = rgb(0, 0, 0)
    yellow_color = rgb(0, 0, 0)
    green_color = rgb(0, 0, 0)
    blue_color = rgb(0, 0, 0)
    dark_blue_color = rgb(0, 0, 0)
    purple_color = rgb(0, 0, 0)
    gold_color = rgb(0, 0, 0)
    brown_color = rgb(0, 0, 0)
  }

  set page(
    header: context {
      set text(fill: black)
      if counter(page).get().first() > 1 {
        block()[
          #grid(
            columns: (1fr, 1fr, 1fr),
            row-gutter: 0.5em,
            align: horizon,
            align(right)[
              #topic
            ],
            align(center)[
              #let next_heading
              #let previous_heading = query(selector(heading.where(level: 2)).before(here()))

              #if previous_heading.len() > 0 {
                previous_heading.last().body
              } else {
                next_heading = query(selector(heading.where(level: 2)).after(here()))
                if (
                  next_heading.len() > 0
                    and counter(page).get().first() == next_heading.first().location().position().page
                ) {
                  next_heading.first().body
                }
              }
            ],
            align(left)[
              #image(image_path, height: 2em)
            ],
          )

          #set block(above: 1em)
          #line(length: 100%, stroke: (dash: "densely-dash-dotted"))
        ]
      }
    },
    footer: context {
      set text(fill: black)

      let current_page = counter(page).get().first()
      let h1 = query(selector(heading.where(level: 1)).before(here()))

      if current_page > 1 {
        set block(below: 1em)
        set text(stylistic-set: 1, number-width: "tabular")

        let first_lesson_page = query(heading.where(level: 1)).first().location().position().page - 1
        let lesson_page = current_page - first_lesson_page
        let total_page_number = counter(page).final().first() - first_lesson_page

        line(length: 100%, stroke: (dash: "densely-dash-dotted"))
        grid(
          columns: (1fr, 1fr, 1fr),
          row-gutter: 0.5em,
          align: horizon,
          {
            if lesson_page > 0 {
              align(right)[
                #total_page_number / #lesson_page
              ]
              // CONSTANT UPDATE IF NECESSARY (if statements):
            } else if lesson_page == -4 {
              [ث / آ]
            } else if lesson_page == -3 {
              [ث / ب]
            } else if lesson_page == -2 {
              [ث / پ]
            } else if lesson_page == -1 {
              [ث / ت]
            } else if lesson_page == 0 {
              [ث / ث]
            }
          },
          align(center)[
            #if h1.len() > 0 {
              h1.last().body
            } else {
              [پیش گفتار]
            }
          ],
          align(left)[
            #if h1.len() > 0 {
              // CONSTANT UPDATE IF NECESSARY (current_page - CONSTANT):
              [#int((current_page - 6) / (total_page_number) * 100)%]
            } else {
              [
                #{
                  int(((current_page - 1) / (first_lesson_page - 1)) * 100)
                }%
              ]
            }
          ],
        )
      }
    },
    paper: paper,
    flipped: flipped,
    margin: (x: 0.75cm, top: 1.65cm, bottom: 1.25cm),
  )

  set heading(
    numbering: (..nums) => {
      nums
        .pos()
        .map(num => {
          box[#num]
        })
        .rev()
        .join(".")
    },
  )
  show heading: arg => {
    set par(justify: false)
    arg
  }
  show heading.where(level: 1): arg => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(math.equation).update(0)

    let fill_color = red_color

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(stylistic-set: 1, dir: ltr)[
                #counter(heading).display()
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: red_color),
              fill: fill_color.lighten(97%),
            )[
              #text(stylistic-set: 1, dir: ltr)[
                #counter(heading).display()
              ]
            ]
          }
        ],
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text()[
                #arg.body
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: red_color),
              fill: fill_color.lighten(97%),
            )[
              #text()[
                #arg.body
              ]
            ]
          }
        ],
      )
    ]
  }
  show heading.where(level: 2): arg => {
    let fill_color = blue_color

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(stylistic-set: 1)[
                #counter(heading).display()
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: blue_color),
              fill: fill_color.lighten(97%),
            )[
              #text(stylistic-set: 1)[
                #counter(heading).display()
              ]
            ]
          }
        ],
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text()[
                #arg.body
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: blue_color),
              fill: fill_color.lighten(97%),
            )[
              #text()[
                #arg.body
              ]
            ]
          }
        ],
      )
    ]
  }
  show heading.where(level: 3): arg => {
    let fill_color = green_color

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(stylistic-set: 1)[
                #counter(heading).display()
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: green_color),
              fill: fill_color.lighten(97%),
            )[
              #text(stylistic-set: 1)[
                #counter(heading).display()
              ]
            ]
          }
        ],
        align(center)[
          #if black_and_white {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text()[
                #arg.body
              ]
            ]
          } else {
            block(
              inset: 1em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: green_color),
              fill: fill_color.lighten(97%),
            )[
              #text()[
                #arg.body
              ]
            ]
          }
        ],
      )
    ]
  }
  show heading.where(level: 4): arg => {
    let fill_color = purple_color

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(
              inset: 0.9em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(stylistic-set: 1, size: 0.9em)[
                #counter(heading).display()
              ]
            ]
          } else {
            block(
              inset: 0.9em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: purple_color),
              fill: fill_color.lighten(97%),
            )[
              #text(stylistic-set: 1, size: 0.9em)[
                #counter(heading).display()
              ]
            ]
          }
        ],
        align(center)[
          #if black_and_white {
            block(
              inset: 0.9em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text()[
                #arg.body
              ]
            ]
          } else {
            block(
              inset: 0.9em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: purple_color),
              fill: fill_color.lighten(97%),
            )[
              #text()[
                #arg.body
              ]
            ]
          }
        ],
      )
    ]
  }
  show heading.where(level: 5): arg => {
    let fill_color = orange_color

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(
              inset: 0.8em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(stylistic-set: 1, size: 0.8em)[
                #counter(heading).display()
              ]
            ]
          } else {
            block(
              inset: 0.8em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: orange_color),
              fill: fill_color.lighten(97%),
            )[
              #text(stylistic-set: 1, size: 0.8em)[
                #counter(heading).display()
              ]
            ]
          }
        ],
        align(center)[
          #if black_and_white {
            block(
              inset: 0.8em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: black),
            )[
              #text(size: 0.8em)[
                #arg.body
              ]
            ]
          } else {
            block(
              inset: 0.8em,
              radius: 0.2em,
              width: 100%,
              stroke: (thickness: 0.15em, paint: orange_color),
              fill: fill_color.lighten(97%),
            )[
              #text(size: 0.8em)[
                #arg.body
              ]
            ]
          }
        ],
      )
    ]
  }

  set text(
    font: "Vazirmatn",
    dir: rtl,
    lang: "fa",
  )

  set par(
    justify: true,
    leading: 0.8em,
  )

  set enum(
    full: true,
    numbering: "1.1)",
  )
  show enum: arg => {
    text(stylistic-set: 1, number-width: "tabular")[
      #arg
    ]
  }

  show outline.entry: it => {
    set text(stylistic-set: 1, number-width: "tabular", dir: rtl)
    if it.level == 1 {
      v(1em)
      link(
        it.element.location(),
        box()[
          #text(weight: "bold")[
            #it.body
          ]
        ],
      )
    } else {
      link(
        it.element.location(),
        box()[
          #it.body
        ],
      )
    }
    h(0.3em)
    box(width: 1fr)[#repeat([.])]
    h(0.3em)
    link(
      it.element.location(),
      box()[#{
          int(it.page.text) - query(heading.where(level: 1)).first().location().position().page + 1
        }],
    )
  }

  set text(size: font_size)

  set figure(
    supplement: "شکل",
    numbering: arg => box()[
      #text(dir: ltr)[
        #counter(heading.where(level: 1)).display().#arg
      ]
    ],
  )
  show figure: arg => {
    show par: set block(above: 0em)
    set text(stylistic-set: 1)
    align(center)[
      #block(stroke: black, width: 100%, inset: 1em, radius: (top-left: 0.2em, top-right: 0.2em), clip: true)[
        #arg.body
      ]
      #box(stroke: black, inset: 1em, width: 100%, radius: (bottom-left: 0.2em, bottom-right: 0.2em))[
        #text(baseline: 0em)[
          #arg.caption
        ]
      ]
    ]
  }

  show ref: it => {
    box[
      #text(stylistic-set: 1, fill: blue_color)[#it]
    ]
  }

  // show ref: it => {
  //   let el = it.element
  //   if el != none and el.func() == math.equation {
  //     it.element.supplement
  //    }
  // }

  show raw.where(block: true): code => {
    grid(
      columns: 2,
      align: left + top,
      column-gutter: 1em,
      stroke: (x, y) => if x == 0 {
        (right: (paint: luma(150), dash: "densely-dashed"))
      },
      inset: (right: 1em, top: 0.4em, bottom: 0.4em),
      ..code.lines.map(line => (text(fill: luma(150))[#line.number], line.body)).flatten()
    )
  }

  set math.vec(delim: "[")
  set math.mat(delim: "[")

  set math.equation(
    numbering: n => box()[
      #set text(font: "Vazirmatn", stylistic-set: 1)
      (#n.#counter(heading.where(level: 1)).display())
    ],
    supplement: "فرمول",
    number-align: top + left,
  )

  block(width: 100%, height: 100%)[
    #set text(size: first_page_font_size)
    #align(center + horizon)[
      #image(image_path, width: image_width)

      #text(size: 1.2em)[
        دانشکده #faculty
      ]

      #v(2em)

      #text(size: 1.6em)[
        *#topic*
      ]

      #v(2em)

      #text(size: 1.2em)[
        استاد درس: #professors_name
      ]

      #text(size: 1.2em)[
        نویسنده: #authors_name
      ]

      #v(5em)

      #if authors_name != none {
        block(width: 60%)[
          #set block(below: 0pt)
          #grid(
            columns: (1fr, 1fr),
            align(right)[
              #date
            ],
            align(left)[
              #version
            ],
          )
          #v(1em)
          #line(length: 100%)
        ]
      }
    ]
  ]

  set page(margin: (inside: 1.5cm))

  if font_attribution {
    align(center + horizon)[
      #text(weight: "bold", size: first_page_font_size)[
        به یاد بزرگ مردی که بی هیچ چشم داشتی

        دنیای فونت فارسی را متحول کرد.

        روحش شاد.

        #image("../../images/saber-rastikerdar-poster.jpg", width: 35%)


        #text(fill: blue_color, size: 0.85em, weight: "bold")[#link(
            "https://www.hamed-bd.com/saber-rastikerdar",
            "(عکس از وبسایت شخصی حامد بیدی)",
          )]

        #v(2em)

        #text(size: 1em)[
          در تهیه این جزوه از فونت *وزیر متن*، طراحی شده

          توسط #text(fill: blue_color)[#link("https://fa.wikipedia.org/wiki/%D8%B5%D8%A7%D8%A8%D8%B1_%D8%B1%D8%A7%D8%B3%D8%AA%DB%8C%E2%80%8C%DA%A9%D8%B1%D8%AF%D8%A7%D8%B1", [*صابر راستی کردار*])]، طراح فونت های

          متن باز فارسی، استفاده شده است.

        ]
      ]


    ]
    pagebreak()
  }

  if no_responsibility {
    align(center + horizon)[
      #text(weight: "bold", size: first_page_font_size)[
        #text(fill: blue_color)[
          درود بر تو دوست عزیزی که میخوای از این جزوه استفاده کنی #emoji.face.smile
        ]

        #text(fill: green_color)[
          این جزوه، جزوه شخصیم هست و طبیعیه \ که احتمال داره مشکلاتی داشته باشه.
        ]

        #text(fill: brown_color)[
          بنابراین اگه میخوای ازش استفاده \ کنی، با کمال احترام بدون که #emoji.finger.b
        ]

        #v(2em)

        #block(stroke: (paint: red_color, thickness: 0.2em), inset: 1em, radius: 0.2em)[
          #text(fill: red_color)[
            هیچ مسئولیتی بابت این جزوه بر عهده \ من نخواهد بود.
            از جمله موارد زیر:
          ]

          #block()[
            #align(right)[
              #text(fill: red_color, weight: "bold")[
                + ناقص بودن جزوه به هر شکلی
                + وجود هر گونه و هر تعداد اشتباه نگارشی یا علمی
              ]
            ]
          ]

        ]

        #v(2em)

        #text(fill: purple_color)[
          بنابراین اگه خواستی از این جزوه استفاده کنی، بهتره \ فقط به این منبع اکتفا نکنی و از کتاب یا جزوه های \ دیگه ای که وجود دارن، استفاده کنی. \ \ \
        ]
        موفق باشی #emoji.face.cool
      ]
    ]
  }

  pagebreak()

  columns(3, gutter: 1em)[
    #doc
  ]
}
