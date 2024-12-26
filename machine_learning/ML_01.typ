#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه اول
== یادگیری ماشین
#tool.double_section()[
  #tool.simple_context()[
    یادگیری ماشین زیر شاخه ای از هوش مصنوعی است.
  ]
][
  #tool.tip()[
    ملاک درست بودن پاسخ، دادن جواب مورد انتظار کاربر است.
  ]
]

=== هوش
#tool.double_section()[
  #tool.definition()[
    هوش: معیار اندازه گیری میزان انطباق پاسخ با انتظار
    #v(2em)
  ]
][
  #tool.example()[
    دو عدد ادامه دنباله زیر را مشخص کنید.

    #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, ..., ...]
  ]
]

#tool.true_answer()[
  در این مثال، معیار طراح سوال تعداد Ending point های هر عدد می باشد. بنابراین جواب به صورت زیر است:

  #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, #text(fill: blue_color)[۱۲], #text(fill: blue_color)[۱۷]]
]

=== هوش مصنوعی
#tool.definition()[
  هوش مصنوعی: توانمندی کامپیوتر ها (ماشین ها) برای تولید پاسخ های مورد انتظار انسان.
]

#tool.double_section()[
  #tool.tip()[
    هوش مصنوعی از دید کاربر تعریف می شود.
  ]
][
  #tool.definition()[
    ماشین (کامپیوتر): به ابزاری که قابل برنامه ریزی است می گوییم.
  ]
]

=== رویکرد های هوش مصنوعی
==== مبتنی بر قانون (Rule based approach)
#tool.double_section()[
  #tool.definition()[
    در این روش مثلا از یک آدم متخصص در حوزه ای سوال می شود که چگونه کارش را انجام می دهد.
    بر این اساس یک سری پارامتر استخراج می کنیم و بر اساس آن ها برنامه ای را می نویسیم.
  ]
][
  #tool.example()[
    تشخیص انواع چند ضلعی ها #sym.arrow.l این که چند ضلعی مورد نظر مثلث متساوی الساقین است یا مربع است یا پنج ضلعی منتظم است یا ۱۰۰ ضلعی منتظم است یا #sym.dots .
  ]
]

#tool.true_answer()[
  روش تشخیص: به کمک اندازه زاویه ها و فاصله نقاط هر چند ضلعی، می توان نوع آن چند ضلعی را فهمید.

  مشکل روش: وقتی تعداد اضلاع و زاویه ها بالا رود، مشکل می شود.
]

==== مبتنی بر یادگیری (Learning based approach)
#tool.double_section()[
  #tool.definition()[
    در این روش الگوریتمی به کامپیوتر داده می شود تا خودش قاعده و قانون مسأله را به دست آورد.
  ]
][
  #tool.example()[
    تشخیص هواپیما #sym.arrow.l تعداد زیادی نمونه می آوریم.
    #v(1.55em)
  ]
]

#tool.true_answer()[
  #tool.custom_figure(
    image("../images/ML/01_02.jpg", width: 92%),
    caption: "نقاط شکل هواپیما را به صورتی که مشخص شده است، شماره گذاری می کنیم.",
  )
  کد مرتبط:
  #tool.custom_figure(caption: "تشخیص هواپیما", kind: raw, inset: 1em)[
    ```
    R = {}
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
      #image("../images/ML/01_01.png", width: 86%)
    ],
    caption: "گراف مربوط به فعالیت یادگیری",
    inset: 1em,
  )
]
