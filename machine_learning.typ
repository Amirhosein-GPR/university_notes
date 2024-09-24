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
    topic: "جزوه درس یادگیری ماشین",
    authors_name: ("امیرحسین عسگری"),
    professors_name: ("دکتر محرم منصوری زاده"),
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
#outline(title: none, indent: auto)

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

    - آیدی تلگرام: #text(dir: ltr)[\@mansoorm]

    - کانال تلگرام: #text(dir: ltr)[\@mansoorm_courses]
    - ایمیل ها:
        + mansoorm\@basu.ac.ir
        + cse.teacher\@gmail.com

#colbreak()

= جلسه اول

== یادگیری ماشین

#tool.simple_context()[
    یادگیری ماشین زیر شاخه ای از هوش مصنوعی است.
]

#tool.tip()[
    ملاک درست بودن پاسخ، دادن جواب مورد انتظار کاربر است.
]

=== هوش
#tool.definition()[
    هوش: معیار اندازه گیری میزان انطباق پاسخ با انتظار
]

#tool.example()[
    دو عدد ادامه دنباله زیر را مشخص کنید.

    #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, ..., ...]
]

#tool.true_answer()[
    در این مثال، معیار طراح سوال تعداد Ending point های هر عدد می باشد. بنابراین جواب به صورت زیر است:

    #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, #text(fill: blue_color)[۱۲], #text(fill: blue_color)[۱۷]]
]

=== هوش مصنوعی
#tool.definition()[
    هوش مصنوعی: توانمندی کامپیوتر ها (ماشین ها) برای تولید پاسخ های مورد انتظار انسان.
]

#tool.tip()[
    هوش مصنوعی از دید کاربر تعریف می شود.
]

#tool.definition()[
    ماشین (کامپیوتر): به ابزاری که قابل برنامه ریزی است می گوییم.
]

=== رویکرد های هوش مصنوعی
==== مبتنی بر قانون (Rule base approach)
#tool.definition()[
    در این روش مثلا از یک آدم متخصص در حوزه ای سوال می شود که چگونه کارش را انجام می دهد.
    بر این اساس یک سری پارامتر استخراج می کنیم و بر اساس آن ها برنامه ای را می نویسیم.
]

#tool.example()[
    تشخیص انواع چند ضلعی ها #sym.arrow.l این که چند ضلعی مورد نظر مثلث متساوی الساقین است یا مربع است یا پنج ضلعی منتظم است یا ۱۰۰ ضلعی منتظم است یا #sym.dots .
]

#tool.true_answer()[
    روش تشخیص: به کمک اندازه زاویه ها و فاصله نقاط هر چند ضلعی، می توان نوع آن چند ضلعی را فهمید.

    مشکل روش: وقتی تعداد اضلاع و زاویه ها بالا رود، مشکل می شود.
]

==== مبتنی بر یادگیری (Learning based approach)
#tool.definition()[
    در این روش الگوریتمی به کامپیوتر داده می شود تا خودش قاعده و قانون مسأله را به دست آورد.
]

#tool.example()[
    تشخیص هواپیما #sym.arrow.l تعداد زیادی نمونه می آوریم.
]
#tool.true_answer()[
    #tool.custom_figure(
        image("images/ML/01_02.jpg"),
        caption: "نقاط شکل هواپیما را به صورتی که مشخص شده است، شماره گذاری می کنیم."
    )
    کد مرتبط:
    #tool.code_section()[
        ```
        for k = 1 to 16 {
            for j = k + 1 to 16 {
                flag = True
                for image = 1 to 10 {
                    if d_k(image) != d_j(image) {
                        flag = false
                    }
                }
                if flag == true {
                    R = R U <d_k, d_j>
                }
            }
        }               
        ```
    ]
]

#tool.tip()[
    یک مهندس یادگیری ماشین، دو مورد زیر را فراهم می کند:
    + نمونه ها (Examples)
    + الگوی قاعده (Rule template)
]

=== یادگیری (Training)
#tool.definition()[
    یادگیری (Training): فعالیتی که دو ورودی نمونه و الگو و همچنین خروجی قواعد را دارد، گویند.
    
    #tool.custom_figure(
        align(center)[
            #image("images/ML/01_01.png", width: 50%)
        ],
        caption: "گراف مربوط به فعالیت یادگیری",
        inset: 1em
    )
        
]