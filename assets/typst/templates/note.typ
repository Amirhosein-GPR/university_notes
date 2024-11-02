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
  should_fill: true,
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
    red_color = rgb(0, 0, 0, 255)
    orange_color = rgb(0, 0, 0, 255)
    yellow_color = rgb(0, 0, 0, 255)
    green_color = rgb(0, 0, 0, 255)
    blue_color = rgb(0, 0, 0, 255)
    dark_blue_color = rgb(0, 0, 0, 255)
    purple_color = rgb(0, 0, 0, 255)
  }

  set page(
    header: context {
      set text(fill: black)
      if counter(page).get().first() > 1 {
        block()[
          #grid(
            columns: (1fr, 1fr, 1fr),
            row-gutter: 0.5em,
            align(right + horizon)[
              #topic
            ],
            align(center + horizon)[
              #let previous_heading = query(
                selector(heading.where(level: 2)).before(here()),
              )

              #if previous_heading.len() > 0 {
                previous_heading.last().body
              }
            ],
            align(left + horizon)[
              #image(image_path, height: 2em)
            ],

            line(length: 300%),
          )
        ]
      }
    },
    numbering: (..nums) => (
      context {
        if counter(page).get().first() > 1 {
          text(stylistic-set: 1)[
            #nums.pos().at(0)
          ]
        }
      }
    ),
    paper: paper,
    flipped: flipped,
    margin: (x: 1cm, y: 2cm),
  )

  set heading(numbering: (..nums) => {
    nums
      .pos()
      .map(num => {
          box[#num]
        })
      .rev()
      .join(".")
  })
  show heading: arg => {
    set par(justify: false)
    arg
  }
  show heading.where(level: 1): arg => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)

    let fill_color
    if should_fill {
      fill_color = red_color
    } else {
      fill_color = rgb(0, 0, 0, 0)
    }

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: red_color, thickness: 0.15em))[
              #text(stylistic-set: 1, dir: ltr, fill: red_color)[
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
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: red_color, thickness: 0.15em))[
              #text(fill: red_color)[
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
    let fill_color
    if should_fill {
      fill_color = blue_color
    } else {
      fill_color = rgb(0, 0, 0, 0)
    }

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: blue_color, thickness: 0.15em))[
              #text(stylistic-set: 1, fill: blue_color)[
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
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: blue_color, thickness: 0.15em))[
              #text(fill: blue_color)[
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
    let fill_color
    if should_fill {
      fill_color = green_color
    } else {
      fill_color = rgb(0, 0, 0, 0)
    }

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: green_color, thickness: 0.15em))[
              #text(stylistic-set: 1, fill: green_color)[
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
            block(inset: 1em, radius: 0.2em, width: 100%, stroke: (paint: green_color, thickness: 0.15em))[
              #text(fill: green_color)[
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
    let fill_color
    if should_fill {
      fill_color = purple_color
    } else {
      fill_color = rgb(0, 0, 0, 0)
    }

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(inset: 0.9em, radius: 0.2em, width: 100%, stroke: (paint: purple_color, thickness: 0.15em))[
              #text(stylistic-set: 1, fill: purple_color, size: 0.9em)[
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
            block(inset: 0.9em, radius: 0.2em, width: 100%, stroke: (paint: purple_color, thickness: 0.15em))[
              #text(fill: purple_color, size: 0.9em)[
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
    let fill_color
    if should_fill {
      fill_color = orange_color
    } else {
      fill_color = rgb(0, 0, 0, 0)
    }

    block(above: 0.8em)[
      #grid(
        columns: (16%, 82%),
        gutter: 2%,
        align(center)[
          #if black_and_white {
            block(inset: 0.8em, radius: 0.2em, width: 100%, stroke: (paint: orange_color, thickness: 0.15em))[
              #text(stylistic-set: 1, fill: orange_color, size: 0.8em)[
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
            block(inset: 0.8em, radius: 0.2em, width: 100%, stroke: (paint: orange_color, thickness: 0.15em))[
              #text(fill: orange_color, size: 0.8em)[
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
    it.body
    h(1em)
    box(width: 1fr)[#repeat([.])]
    h(1em)
    box()[#it.page]
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

  show ref: arg => {
    text(stylistic-set: 1, fill: blue_color)[#arg]
  }

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

      #v(4em)

      #if authors_name != none {
        block(width: 80%)[
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

      #align(bottom)[

        #set text(dir: ltr, weight: "bold", stylistic-set: 1, number-width: "tabular")

        #block(below: 0em, width: 80%, fill: black.lighten(97%), inset: 10%, radius: 0.5em, stroke: black.lighten(87%))[
          پیشرفت کلاس

          #v(5em)

          #let progress = eval(progress_string)
          #block(width: 100%, height: 0.5em, fill: blue_color, stroke: (thickness: 0.1em))[
            #align(left)[
              #block(fill: red_color, width: progress * 100%, height: 0.5em)
            ]
          ]

          #place(dx: 0% - 0.2%, dy: -1em)[
            #block(height: 1.5em, width: 0.2em, fill: black)
          ]

          #place(dx: 25% - 0.2%, dy: -1em)[
            #block(height: 1.5em, width: 0.2em, fill: black)
          ]

          #place(dx: 50% - 0.2%, dy: -1em)[
            #block(height: 1.5em, width: 0.2em, fill: black)
          ]

          #place(dx: 75% - 0.2%, dy: -1em)[
            #block(height: 1.5em, width: 0.2em, fill: black)
          ]

          #place(dx: 100% - 0.2%, dy: -1em)[
            #block(height: 1.5em, width: 0.2em, fill: black)
          ]

          #place(dx: progress * 100% - 1.1%, dy: -0.75em)[
            #circle(fill: red_color, width: 1em, stroke: (thickness: 0.1em))

            #place(dx: -1.35em, dy: -2.8em)[
              #progress_string
            ]

            #place(dx: -0.4em, dy: 0.8em)[
              #int(progress * 100)%
            ]
          ]

          #place(dy: -5em)[
            #block(width: 100%)[
              #text(size: 1.5em)[
                #place(dx: -1.7%)[
                  #emoji.face.peek
                ]
                #place(dx: 25% - 1.7%)[
                  #emoji.face.think
                ]
                #place(dx: 50% - 1.7%)[
                  #emoji.face.smile.slight
                ]
                #place(dx: 75% - 1.7%)[
                  #emoji.face.tear.withheld
                ]
                #place(dx: 100% - 1.7%)[
                  #emoji.face.party
                ]
              ]
            ]
          ]

          #place(dy: 2.5em)[
            #block(width: 100%)[
              #place(dx: -1.6%)[
                0%
              ]
              #place(dx: 25% - 2%)[
                25%
              ]
              #place(dx: 50% - 2%)[
                50%
              ]
              #place(dx: 75% - 2%)[
                75%
              ]
              #place(dx: 100% - 2%)[
                100%
              ]
            ]
          ]

          #v(3em)
        ]
        // Typst Version: #sys.version
      ]
    ]
  ]

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

  columns(2)[
    #doc
  ]
}