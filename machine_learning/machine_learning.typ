#import "../assets/typst/templates/note.typ": note
#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": black_and_white

#let red_color = rgb(200, 0, 0, 255)
#let orange_color = rgb(220, 100, 0, 255)
#let yellow_color = rgb(130, 130, 0, 255)
#let green_color = rgb(0, 120, 0, 255)
#let blue_color = rgb(0, 100, 200, 255)
#let dark_blue_color = rgb(0, 0, 200, 255)
#let purple_color = rgb(150, 0, 150, 255)
#let gold_color = rgb(255, 215, 0)
#let brown_color = rgb(125, 50, 0)

#let dir = rtl

#show: doc => note(
  doc,
  paper: "a4",
  black_and_white: black_and_white,
  flipped: true,
  first_page_font_size: 9pt,
  font_size: 8pt,
  image_path: "../../images/basu_logo_logosource.ir.svg",
  image_width: 12em,
  topic: "جزوه درس یادگیری ماشین",
  authors_name: "امیرحسین عسگری",
  professors_name: "دکتر محرم منصوری زاده",
  faculty: "مهندسی کامپیوتر",
  date: [
    نیم سال تحصیلی #text(dir: ltr)[۱۴۰۳-۱]
  ],
  version: "v1.0.0",
  progress_string: "22 / 22",
  info_color: blue_color,
  no_responsibility: true,
  font_attribution: true,
)

#tool.introduce_sections()

#colbreak()

#tool.title("درباره کلاس", color: blue_color)
- قواعد و مقررات:
  + حضور در کلاس اجباری است.
  + انجام تمرین ها و پروژه ها در زمان مشخص شده.
  + باید برایشان گزارش نوشته شود.
  + کزارش شامل موارد زیر است:
    + تعریف مسأله
    + پیاده سازی
    + اجرای نمونه
  + میان ترم و پایان ترم کتبی خواهیم داشت.

- راه های ارتباطی:

  - آیدی تلگرام: #text(dir: ltr)[mansoorm\@]

  - کانال تلگرام: #text(dir: ltr)[mansoorm\_courses\@]
  - ایمیل ها:
    + mansoorm\@basu.ac.ir
    + cse.teacher\@gmail.com

#colbreak()

#tool.title("فهرست مطالب", color: red_color)
#outline(title: none, indent: auto)

#colbreak()

#include "ML_01.typ"
#include "ML_02.typ"
#include "ML_03.typ"
#include "ML_04.typ"
#include "ML_05.typ"
#include "ML_06.typ"
#include "ML_07.typ"
#include "ML_08.typ"
#include "ML_09.typ"
#include "ML_10.typ"
#include "ML_11.typ"
#include "ML_12.typ"
#include "ML_13.typ"
#include "ML_14.typ"
#include "ML_15.typ"
#include "ML_16.typ"
#include "ML_17.typ"
#include "ML_18.typ"
#include "ML_19.typ"
#include "ML_20.typ"
#include "ML_21.typ"
#include "ML_22.typ"

#colbreak()
#colbreak()
#colbreak()

#let ref_color

#if black_and_white {
  ref_color = black
} else {
  ref_color = blue_color
}

#place(dx: 115%, dy: 0%)[
  #block(width: 125%)[
    #tool.title("منابع")
    #set text(dir: ltr, size: 1.25em)
    #block(fill: ref_color.lighten(97%), stroke: (paint: blue_color, dash: "solid"), inset: 1em, width: 100%)[
      - Machine Learning Lecture
      - Introduction To Machine Learning Slides - Ethem Alpaydin (ethem.alpaydin\@gmail.com)
      - FontAwesome
      - Xournal++ (For Some Shapes and Charts)
      - Libreoffice Draw (For Some Shapes)
      - Libreoffice Calc (For Some Tables)
      - #sym.dots
    ]
  ]
]

#place(dx: 115%, dy: 59%)[
  #block(width: 125%)[
    #align(center)[
      #if black_and_white [
        #text(weight: "extrabold", size: 1.75em)[
          به پایان آمد این دفتر، حکایت همچنان باقی است#sym.dots
        ]

        #line(length: 100%, stroke: (dash: "solid", thickness: 0.25em))

        #text(weight: "extrabold", size: 1.75em)[
          تقدیم به قهرمانان راه آزادی

          #emoji.heart#emoji.heart.white#emoji.heart.green
        ]
      ] else [
        #text(fill: gradient.linear(..color.map.turbo.map(a => a.darken(50%))), weight: "extrabold", size: 1.75em)[
          به پایان آمد این دفتر، حکایت همچنان باقی است#sym.dots
        ]

        #line(
          length: 100%,
          stroke: (paint: gradient.linear(..color.map.turbo.map(a => a.darken(50%))), dash: "solid", thickness: 0.25em),
        )

        #text(fill: gradient.linear(..color.map.turbo.map(a => a.darken(50%))), weight: "extrabold", size: 1.75em)[
          تقدیم به قهرمانان راه آزادی

          #emoji.heart#emoji.heart.white#emoji.heart.green
        ]

      ]
      #v(12em)
      #text()[
        *This Document Was Written With #text(fill: ref_color)[Typst]*
      ]
    ]
  ]

]
