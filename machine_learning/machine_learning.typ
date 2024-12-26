#import "../assets/typst/templates/note.typ": note
#import "../assets/typst/tools/tool.typ"

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
  black_and_white: false,
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
  version: "v0.20.0",
  progress_string: "20 / 22",
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

#align(center + horizon)[
  #block(
    stroke: (thickness: 0.2em, paint: black, dash: "densely-dashed"),
    inset: (top: 0.5em, rest: 1em),
    radius: 1em,
    clip: true,
  )[
    #image("../assets/images/work_in_progress.png", width: 10em, height: 10em, fit: "contain")
  ]
]
