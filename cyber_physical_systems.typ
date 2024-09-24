#import "assets/typst/templates/note.typ": note
#import "assets/typst/tools/tool.typ"

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
    flipped: false,
    first_page_font_size: 10pt,
    font_size: 8pt,
    image_path: "../../images/basu_logo_logosource.ir.svg",
    image_width: 12em,
    topic: "جزوه درس سیستم های سایبر فیزیکی",
    authors_name: ("امیرحسین عسگری"),
    professors_name: ("دکتر حاتم عبدلی"),
    faculty: "مهندسی کامپیوتر",
    date: [
        نیم سال تحصیلی #text(dir: ltr)[۱۴۰۳-۱]
    ],
    version: "v0.1.0",
    phase: none,
    info_color: blue_color,
    no_responsibility: true
)

#tool.title("فهرست مطالب", color: red_color)
// #outline(title: none, indent: auto)

#colbreak()

#tool.title("درباره کلاس", color: blue_color)
- شیوه ارزیابی:
    + تکلیف، تکلیف کامپیوتری و پروژه: ۲۰٪ + ۵٪
    + پرسش و فعالیت کلاسی: ۵٪ + (۵٪ نمره اضافه)
    + سمینار: ۱۵٪ (+ ۱۰٪) #sym.arrow.l هفته آخر کلاس
    + میان ترم: ۲۰٪ #sym.arrow.l ۱۴۰۳/۰۹/۱۲
    + پایان ترم: ۴۰٪
- اطلاع رسانی و تمرین از درس افزار
- بعضی اطلاع رسانی ها از طریق کانال تلگرام: \@cps4031
- ایمیل: abdoli\@basu.ac.ir

#colbreak()

= جلسه اول
== سیستم های سایبر فیزیکی

#tool.simple_context()[
    در سیستم های سایبر فیزیکی، سنسور هایی وجود دارد که اطلاعاتی را از دنیای فیزیکی به سیستم می دهند و سیستم بر اساس برنامه ای که نوشته شده به کمک Actuator ها در دنیای فیزیکی واکنش نشان می دهد.
]


#tool.comparision()[
    تفاوت سیستم های سایبر فیزیکی با کامپیوتر های عادی:
    + سیستم های سایبر فیزیکی به صورت تخصصی مخصوص یک موضوع خاص هستند.
    + ورودی ها و خروجی های این دو سیستم متفاوت از یکدیگر است.
]

#tool.example()[
    سیستم های سایبر فیزیکی:
    - آسانسور
    - خودرو های خودران
]

#tool.simple_context()[
    در سیستم های سایبر فیزیکی موارد شکل زیر را داریم:

]

#tool.custom_figure(
    image("images/CPS/01_01.png"),
    caption: "نمایی از سیستم های سایبر فیزیکی",
    inset: 1em
)


#tool.tip()[
    هر سیستم سایبر فیزیکی الزاماً Real-time نیست و بر عکس.
]

#tool.definition()[
    سیستم های نهفته: سیستم های پردازش اطلاعاتی هستند که در یک محصول بزرگتری نهفته شده و استفاده می شوند.

    دلیل خرید این سیستم ها به خاطر پردازش اطلاعات نیست.
]

#tool.definition()[
    // TODO ??? ???
    پردازش همه جا حاضر (Ubiquitous computing): در این سیستم ها اطلاعات در هر زمان و هر مکانی وجود دارند.
]

#tool.example()[
    حوزه های کاری سیستم های سایبر فیزیکی:
    - خودرو های خودران
    - قطار ها
    - ارتباطات
    - صنعت هوانوردی
    - کاربرد های نظامی
]


#tool.tip()[
    در هر نمونه ای از سیستم های سایبر فیزیکی، مواردی مهم اند و مواردی مهم نیستند.
    به طوری که برای سیستم A ممکن است مواردی مهم باشد که برای سیستم B مهم نباشد و بر عکس.
]

#tool.example()[
    کاربرد های سیستم های سایبر فیزیکی در ارتباط با مشتری:
    - MP3 player
    - DVD player
    - اسباب بازی ها
    - تلویزیون های هوشمند
]


#tool.tip()[
    یکی از تفاوت های سیستم های نهفته با سیستم های سایبر فیزیکی این است که سیستم های نهفته، ارتباط کمتری با دنیای بیرون دارند.
]

#tool.list()[
    اهمیت سیستم های نهفته:
    + بیشتر پردازنده های High-end در سیستم های نهفته استفاده می شوند.
    + تقریبا همه وسایلی که با برق کار می کنند، درونشان سیستم نهفته ای وجود دارد.
    + اهمیت کلیدی در صنایع.
        مانند: صنعت خودران
]

#tool.list()[
    مشخصات سیستم های نهفته:
    + Dependability:
        + Reliability
        + Maintainability
        + Availability
        + Safety
        + Security
    + Energy efficiency
    + Performance
    + Real-time constrations
]


#tool.tip()[
    برای سیستم های بدون درنگ، جواب های درستی که دیر می رسند، غلط اند (اشاره به مورد شماره ۴ که در بالا آمده است).
]

#tool.tip()[
    تفاوت بین Availability و Reliability: #sym.dots
]

#tool.tip()[
    فرق Safety با Security این است که Safety به جنبه ایمن بودن سیستم برای جان آدم ها در ارتباط است و Security با مثلاً حفظ امنیت داده های سیستم در ارتباط است.
]