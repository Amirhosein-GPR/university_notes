#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه دوم
#tool.double_section()[
  #tool.tip()[
    کار هایی که مهندس یادگیری ماشین به همراه فرد خبره در حوزه مرتبطش انجام می دهند:
    ML engineer + Domain expert:
    #text(dir: ltr)[
      + Data collection
      + Template building
      + Training
    ]
  ]
][
  #tool.tip()[
    در Machine learning نقش اصلی را ML engineer بر عهده دارد.
    در حالی که در Data mining و Deep learning نقش اصلی بر عهده ماشین است.
    #v(4.8em)
  ]
]

#tool.definition()[
  یادگیری ماشین: یعنی به کامپیوتر ها یاد بدهیم تا مسائل را حل کنند.
]

== مسائل پایه ای یادگیری ماشین
=== Supervised learning
==== Classification

#tool.question()[
  Spam detection در ایمیل:
  فرض کنیم می خواهیم ایمیل های اسپم را از غیر اسپم برای فردی یا سازمانی تشخیص دهیم.
]

#tool.true_answer()[
  مراحل انجام این کار به صورت زیر است:
  + کلی ایمیل جمع می کنیم و آن ها را برچسب گذاری می کنیم.
    مثلا به صورت زیر:

    #tool.custom_figure(caption: "برچسب گذاری ایمیل ها", kind: table, inset: 1em)[
      #table(
        columns: 2,
        inset: 1em,
        stroke: black,
        align: center,
        "Message", "Label: Spam",
        "Message 1", "Yes",
        "Message 2", "No",
        "Message 3", "Yes",
        [#sym.dots], [#sym.dots],
        "Message N", "No",
      )
    ]

  + متن را بررسی می کنیم.
    مثلا به صورت زیر:

    #tool.custom_figure(caption: "بررسی لغت های درون ایمیل ها از نظر اسپم بودن یا نبودن", kind: table, inset: 1em)[
      #table(
        columns: 4,
        inset: 1em,
        stroke: black,
        align: center,
        "Word", "F_Yes", "F_No", "Difference",
        "Rich", "56", "73", "56 - 73 = -17 < 0",
        "Click", "123", "15", "108",
        [#sym.dots.v], [#sym.dots.v], [#sym.dots.v], [#sym.dots.v],
      )
    ]

  در جدول بالا، ستون F_Yes به تعداد ایمیل های اسپمی که در متن آن ها کلمه Rich وجود دارد اشاره می کند و ستون F_No، عکس این قضیه می باشد.

  در نهایت تمامی کلمات در قالب جدول بالا بررسی می شوند.
  این عمل را بار اول خودمان انجام می دهیم.

  توجه: اسپم بودن یا نبودن هر ایمیل مورد نظر است و نه هر کلمه هر ایمیل به صورت جداگانه.

  توجه: هر لغتی که در متن یک ایمیل داشته باشیم، همان یک بار برای متنش حساب می شود و نه بیشتر.
  مثلا یک ایمیلی ۱۰۰ عدد کلمه Click دارد.
  در این حالت می گوییم کلمه Click در این ایمیل آمده است و به تعدادش اشاره نمی کنیم.

  اما چرا اینگونه عمل کردیم؟ چون طبیعت، هموار (Smooth) است.

  در ادامه ۱۰۰ کلمه ای (تعداد دلخواه) که بیشترین تفاضل را دارند، انتخاب کرده و برای یک ایمیلی که می خواهیم بررسی اش کنیم، می گوییم اگر درون این ایمیل، مثلاً بیشتر از ۲۰ کلمه مجزا از این ۱۰۰ کلمه وجود داشت، آن ایمیل، یک ایمیل اسپم است.

  پس به صورت خلاصه به شکل زیر عمل می کنیم:
  #text(dir: ltr)[
    + Collect a set of spam and real (not-spam) messages.
    + Count words in the message.
    + Select top #text(stylistic-set: 2)[100] distincitve (Highly frequent in spams) spam words
    // For a new message or stage???
    + For a new message if M contains more than #text(stylistic-set: 2)[20] distincitve words, It is spam.
  ]

  در نهایت برنامه ای به شکل زیر ساخته خواهد شد:

  #tool.custom_figure(
    image("../images/ML/02_01.png"),
    caption: "یک برنامه یادگیری ماشین که یک ورودی و دو خروجی به شکل بالا دارد.",
    inset: 1em,
  )

  به این نوع یادگیری ماشین، Classification می گوییم.
]

#tool.example()[
  مثالی در حوزه Classification به صورت زیر آمده است:
  ساخت یک برنامه یادگیری ماشین که Chest X-Ray را به عنوان ورودی بگیرد و بگوید ریه فرد، چقدر درگیر است.
  خروجی برنامه نیز یکی از موارد زیر است:
  #text(dir: ltr)[
    + None
    + Low
    + Mild
    + High
    + Severe
  ]
]

==== Regression
#tool.question()[
  پیش بینی کردن قیمت خانه
]

#tool.true_answer()[
  - گام اول: فرض کنیم قیمت خانه ها به شکل زیر است:

  #tool.custom_figure(caption: "قیمت خانه ها بر اساس مساحت آن ها", kind: table, inset: 1em)[
    #table(
      columns: 2,
      inset: 1em,
      stroke: black,
      align: center,
      "Area", "Price",
      [50 $m^2$], [100],
      [75 $m^2$], [105],
      [75 $m^2$], [150],
      [100 $m^2$], [220],
      [120 $m^2$], [240],
    )
  ]

  برای آن که درک بهتری از جدول بالا داشته باشیم به شکل زیر توجه کنید:

  #tool.custom_figure(
    image("../images/ML/02_02.png", width: 85%),
    caption: "تلاش می کنیم معادله ای که تا جای ممکن تمامی نقاط نمودار را پوشش می دهد، پیدا کنیم.",
    inset: 1em,
  )

  بر اساس اصل پیوسته بودن طبیعت مشاهده می کنیم که نقاط شکل بالا گویی حول محور آبی حرکت می کنند.

  - گام دوم:

  معادله خط مربوط به خط آبی رنگ را پیدا می کنیم.
  مثلا:

  $ "Price = 2" "Area" + epsilon $

  به این گونه مسائل که به دنبال یافتن معادله ای همچون

  $ y = f(x) $

  برای حل شان می گردیم؛ مسائل Regression می گویند.
]

#tool.list()[
  مسائل پایه ای یادگیری ماشین:
  #text(dir: ltr)[
    + Supervised learning
      + Classification
      + Regression
    + Unsupervised learning
      + Association learning
      + Clustering
      + Distribution learning (Density estimation)
    + Reinforcement learning
      + Reward / Punishment
  ]
]

=== Unsupervised learning
==== Association learning

#tool.question()[
  فروشنده یک مغازه می خواهد به مشتری ای که مثلاً ۴ کالا خریده است، کالای پنجمی را پیشنهاد داده و آن را بفروشد.
  چگونه به او پیشنهاد بدهد؟
]

#tool.true_answer()[
  + داده های گذشته رو بررسی می کنیم.
    مثلا:
    #tool.custom_figure(caption: "کالا های خریده شده توسط مشتری ها", kind: table, inset: 1em)[
      #table(
        columns: 2,
        inset: 1em,
        stroke: black,
        align: center,
        "مشتری ۱", "پنیر - [شیر] - [نان]",
        "مشتری ۲", "<رب> - تخم مرغ - <نان>",
        "مشتری ۳", "[شیر] - رب> - [<نان>]>",
        [#sym.dots.v], [#sym.dots.v],
        "مشتری N", [#sym.dots],
      )
    ]

  + کالا های با بیشترین تکرار را پیدا می کنیم.
    مثلا:

    $ F_1 = "رب - شیر - نان" $

  + کد الگوریتم را به صورت زیر می نویسیم (برای آموزش یا همان Training)):
    #tool.custom_figure(caption: "آموزش مدل برای یافتن کالا های با بیشترین تکرار", kind: raw, inset: 1em)[
      ```
      F_1 = {} F_2 = {}

      for each x in F_1 {
          for each y in F_1 {
              if <x, y> is frequent {
                  F_2 = F_2 U {<x, y>}
              }
          }
      }
      ```
    ]

  + در آخر برنامه پیشنهاد کالا را با استفاده از داده هایی که در مرحله قبل به دست آوردیم به صورت زیر می نویسیم و اجرا می کنیم:
    #tool.custom_figure(caption: "برنامه پیشنهاد کالا که از مدل آموزش داده شده، استفاده می کند.", kind: raw, inset: 1em)[
      ```
      for each customer c {
          for each pair <x, y> in F_2 {
              if c buys x {
                  recommend y
              }
          }
      }
      ```
    ]

  این مسأله نوعی مسأله در حوزه Association learning می باشد.
]

==== Clustering
#tool.question()[
  در ادامه مسأله قبلی، حالا می خواهیم بدانیم که چگونه مشتری هایی داریم؟ (Grouping customers)
]

#tool.true_answer()[
  بر اساس سبد خرید مشتری ها، آن ها را دسته بندی می کنیم.

  + به صورت زیر سبد ها را دو به دو مقایسه کرده و دسته بندی می کنیم.

    داریم:
    $ B_1 , B_2 $

    به کمک فرمول زیر، شباهت بین دو سبد $B_1$ و $B_2$ را به دست می آوریم (علامت قدر مطلق به اندازه مجموعه ها اشاره می کند):
    $ S = abs(B_1 sect B_2) / abs(B_1 union B_2) $

    برای نمونه بین مشتری ۱ و مشتری ۲ داریم:
    $ S = abs("نان") / abs("رب - تخم مرغ - پنیر - شیر - نان") = ۱ / ۵ $

    #text(number-width: "proportional")[یعنی سبد خرید مشتری ۱ و مشتری ۲ به میزان ۲۰٪ به یکدیگر شباهت دارند.]

  + به تعداد دلخواه مثلاً ۵ عدد گروه در نظر می گیریم و به صورت زیر عمل می کنیم:

    + #text(number-width: "proportional")[فرض کنید ۱۰۰ تا مشتری داریم.
        این مشتری ها را به شکل تصادفی در ۵ گروه ۲۰ تایی تقسیم بندی می کنیم.]

    + سپس یکی از مشتری ها را از یک گروهی انتخاب کرده و با همه گروه ها مقایسه می کنیم.
      در نهایت مشتری به گروهی که بیشترین شباهت را با آن دارد، منتقل می شود.

    + #text(
        number-width: "proportional",
      )[اگر این کار را بر روی مشتری ها ادامه دهیم بعد از مدتی به همگرایی خواهیم رسید و ۵ گروه ۲۰ تایی خواهیم داشت که اعضای درون هر گروه به یکدیگر شباهت دارند.]

    اما این دسته بندی چه فایده ای دارد؟

    یک نمونه مثال از فایده آن این است که مشتری هایی که در گروه مشترک هستند را بررسی می کنیم چه کالا هایی را خریدند تا آن کالا ها را در یک راهرو کنار هم قرار دهیم.

    این مسئله نمونه ای از مسائل Clustering می باشد.
]

=== Reinforcement learning
==== Reward / Punishment
#tool.question()[
  می خواهیم نحوه بازی کردن شطرنج را آموزش دهیم.
]

#tool.true_answer()[
  فرض کنیم دو بازیکن به نام های بازیکن ۱ و ۲ داریم.
  بازیکن ۲ می خواهد شطرنج را به بازیکن ۱ یاد بدهد.

  + #text(number-width: "proportional")[ابتدا حرکاتی که هر مهره می تواند انجام دهد به بازیکن ۱ گفته می شود.]
  + بازیکن ها شروع به بازی کردن می کنند.
  + #text(number-width: "proportional")[به صورت زیر هر دو بازیکن حرکاتی را انجام می دهند و در نهایت بازیکن ۲ می برد.]
    #tool.custom_figure(caption: "حرکت های بازیکن های ۱ و ۲", kind: table, inset: 1em)[
      #table(
        columns: 2,
        inset: 1em,
        stroke: black,
        align: center,
        "بازیکن ۱", "بازیکن ۲",
        [$W_1$], [$B_1$],
        [$W_2$], [$B_2$],
        [#sym.dots.v], [#sym.dots.v],
        [$W_7$], [$B_7$],
      )
    ]
  + #text(
      number-width: "proportional",
    )[وقتی که بازیکن ۱ می بازد، می فهمد مجموعه حرکاتی که انجام داده، بد بوده است و بابت باخت مجازات می شود.]
  + #text(
      number-width: "proportional",
    )[بازیکن ۱ اینقدر حرکات شانسی مختلف را امتحان می کند تا می برد و بابت برد امتیاز می گیرد.]

  به این صورت بازیکن ۱ بازی شطرنج را یاد می گیرد.

  به این روش که ماشین می تواند از شکست ها (جریمه ها) و برد ها (جایزه ها) یاد بگیرد روش Reward / Punishment می گویند که زیر مجموعه ای از Reinforcement learning می باشد.
]
