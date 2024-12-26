#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه هفدهم
== Association Analysis
#tool.definition()[
  در تحلیل شرکت پذیری می خواهیم بدانیم که کدام رخداد ها با هم پیش می آیند.
]
=== الگوریتم Apriori
#tool.example(pause: true)[
  در یک فروشگاه، مشتریان خرید های زیر را انجام داده اند:
  #tool.custom_figure(caption: "خرید های مشتریان یک فروشگاه", kind: table, inset: 1em)[
    #table(
      columns: 2,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      "Number", "Transaction",
      "1", "Milk, Bread, Butter",
      "2", "Bread, Butter",
      "3", "Milk, Bread",
      "4", "Milk, Butter",
      "5", "Bread, Butter, Eggs",
    )
  ]
  می خواهیم برنامه یا الگوریتمی بنویسیم که از جدول بالا مثلاً به این قاعده برسد که اگر کسی نان خرید، کره هم می خرد:
  #align(center)[
    Bread #sym.arrow Butter
  ]
  به عبارتی در Association Analysis الگوریتمی می نویسیم که Input و Output آن در این مثال، به صورت زیر است:

  #align(center)[
    Input: Transactions Data #h(1em) Output: Bread #sym.arrow Butter
  ]

  پس در Association Analysis به دنبال یافتن تعدادی قاعده یا Rule هستیم.
  قاعده هایی برای ما مهم اند که سودمند باشند.
  سودمندی قاعده بر اساس میزان تکرار آن قاعده در داده های ورودی، مشخص می شود.
  هر چه بیشتر تکرار شود، میزان سودمندی آن افزایش پیدا می کند.
  از جایی که جهان ما جهانی Smooth است، احتمال این که قاعده های سودمند دوباره بخواهند تکرار شوند، بالا خواهد بود.

  Apriori الگوریتمی معروف برای داده کاوی است.
  در این مثال طبق این الگوریتم، دو Item نان و کره در صورتی پشتوانه بالایی دارد که تعداد زیادی از افراد، آن ها را با یکدیگر خریده باشند و همچنین این دو Item رابطه ای Causal (عِلّی) باید با یکدیگر داشته باشند.

  عملکرد این الگوریتم به این صورت است که ابتدا فراوانی یک تایی های داده های ورودی را حساب می کنیم.
  سپس میزان Support یک تایی ها را حساب می کنیم.
  یک تایی هایی که مقدار Support شان از مقدار Minimum Support بیشتر باشد، به عنوان یک تایی های پر تکرار انتخاب می شوند.
  سپس از روی یک تایی های پر تکرار، دوتایی های ممکن را می سازیم.
  در ادامه فراوانی و Support شان را حساب کرده و به همین ترتیب تا آخرین چند تایی های ممکن را ساخته و نمونه های پر تکرار را آن ها را نیز بر می گزینیم.
  Minimum Support، پارامتری است که توسط ML Engineer تعیین می شود. در این مثال، $"Minimum Support" = 0.25$ است.
  #tool.custom_figure(caption: "محاسبه Frequency و Support چند تایی ها", kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      "Item", "Frequency", [Support #v(0em) $(display("Frequency" / N))$],
      "Milk", "3", "0.6",
      "Bread", "4", "0.8",
      "Butter", "4", "0.8",
      "Eggs", "1", "0.2",
      "Milk, Bread", "2", "0.4",
      "Milk, Butter", "2", "0.4",
      "Bread, Butter", "3", "0.6",
      "Milk, Bread, Butter", "1", "0.2",
    )
  ]
  نکته مهمی که در اینجا وجود دارد این است که برای هر چند تایی، مقدار Support تک تکِ عضو هایش باید بزرگتر از مقدار Minimum Support باشد.
  به همین دلیل است که دو تایی و سه تایی هایی که از Eggs تشکیل شده اند، دیگر در جدول بالا آورده نشده اند.

  این الگوریتم از روی یک تایی ها، دو تایی ها را می سازد و از روی دو تایی ها، سه تایی ها را می سازد و به همین ترتیب تا بزرگترین چند تایی ممکن را می سازد.
]

==== Rule Induction
#tool.example(continuation: true)[
  در ادامه مثال قبل، می دانیم Bread, Milk یک دو تایی پر تکرار است.
  از این دو تایی می توان دو قانون زیر را به دست آورد:
  $
    "Bread, Milk" arrow cases("Bread" arrow "Milk", "Milk" arrow "Bread")
  $
  سؤال: کدام یک از این قانون ها را باید انتخاب کنیم؟ همه، یکی یا هیچ کدام؟

  پاسخ: با محاسبه Confidence های دو قانون بالا، میزان عِلّی بودن شان را محاسبه کرده و در ادامه قوانینی را انتخاب می کنیم که مقدار Confidence شان بیشتر از Minimum Confidence باشد:
  $
    p("Milk" | "Bread") = (\#("Bread", "Milk")) / (\#"Bread") = 2 / 4 = 0.5 \
    p("Bread" | "Milk") = (\#("Bread", "Milk")) / (\#"Milk") = 2 / 3 = 0.67
  $

  در این جا، اگر $"Minimum Confidence" = 0.6$ در نظر گرفته شود، تنها قانون زیر انتخاب می شود:
  $
    "Bread" arrow "Milk"
  $

]

#tool.tip()[
  برای استخراج قانون در مواردی که چند تایی پر تکراری با بیش از دو عضو داریم، مانند زیر که ۴ تایی پر تکرار داریم، این گونه عمل می کنیم:

  ابتدا آن را به صورت ۳ به ۱ می شکنیم:
  $
    A, B, C, D arrow.double cases(
    A\, B\, C arrow D,
    A\, C\, D arrow B,
    C\, D\, B arrow A,
    A\, B\, D arrow C
  )
  $
  سپس به صورت ۲ به ۲:
  $
    A, B, C, D arrow.double cases(
    A\, B arrow C\, D,
    A\, C arrow D\, B,
    #h(2.6em) dots.v
  )
  $
  و به همین ترتیب به صورت ۱ به ۳ #sym.dots.

  در انتها مقدار Confidence هر کدام از قانون ها را حساب کرده و آن هایی که Confidence شان بیشتر از Minimum Confidence است را بر می گزینیم.
]

=== Language Model
#tool.definition()[
  برنامه ای کامپیوتری است که با توجه به توالی کلمه های ورودی، توالی کلمه های خروجی مرتبط را حدس می زند و به عنوان پاسخ بر می گرداند.
  این مدل ها با دیدن متن های زیاد، توالی کلمه ها را یاد گرفته و آموزش می بینند.
]
