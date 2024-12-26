#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه سوم
== مسائل پایه ای یادگیری ماشین (ادامه)
=== Unsupervised learning
==== Distribution learning (Density estimation)
#tool.question()[
  یک فرد سیگاری داریم. این فرد چند سال دارد؟
]

#tool.true_answer()[
  داده ها را جمع آوری کرده و معمولاً به صورت فراوانی نسبی نشان شان می دهیم.

  از تعداد جمعیت ۱۰۰ نفر، سن شان پرسیده می شود و به جدول زیر می رسیم.

  #tool.custom_figure(caption: "فراوانی سیگاری بودن افراد در سنین مختلف", kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center,
      "سن\n(Age)", "فراوانی\n(Frequency)", "فراوانی نسبی\n(Relative frequency)",
      "1", "0", "0",
      "5", "0", "0",
      "10", "5", "0.05",
      "15", "15", "0.15",
      "20", "16", "0.16",
      "25", "16", "0.16",
      "30", "16", "0.16",
      "50", "15", "0.15",
      "60", "10", "0.10",
      "80", "5", "0.05",
      "90", "2", "0.02",
      "100", "0", "0",
      "---", "مجموع", "---",
      "---", "100", "---",
    )
  ]

  حالا می خواهیم به این برسیم که مثلاً احتمال اینکه یک آدم ۴۰ ساله سیگاری باشد چقدر است.
  یعنی:
  $ P("Smoking" | "Age" = 40) = space ? $

  راه حل این است که می آییم می بینیم که ۳۰ ساله ها احتمال ۰/۱۶ و ۵۰ ساله ها احتمال ۰/۱۵ را دارند.
  از آن جایی که سن ۴۰ سال بین این دو احتمال است، میانگین شان را برای آن در نظر می گیریم.
  یعنی:
  $ P("Smoking" | "Age" = 40) = 0.155 $

  پس اگر Data ما به صورت زیر باشد:
  $ X = {x_1, x_2, dots, x_n} $

  آنگاه به
  $ P(x in X) $
  می گویند Distribution و به پیدا کردنش می گویند Distribution learning.
  به عبارت دیگر Distribution learning یعنی اینکه توزیع داده ها را به دست آوریم.
  $ P(x in X): "Distribution learning" $

  اما گاهی مقادیری که یک متغیر می تواند اختیار کند، خیلی زیاد است یا بی نهایت است.
  در اینگونه موارد، معمولاً در آمار به جای کاری که کردیم، برای Distribution از Probability density function استفاده می کنیم که به صورت خلاصه به آن PDF می گویند:

  $
    \
    P( "Smoking" | x ) = cases(0 &"if" space.quad x < 10 &|space space| space.quad x > 90, 0.01 x &"if" space.quad x >= 10 &amp amp space.quad x < 20, 0.16 &"if" space.quad x >= 20 &amp amp space.quad x < 50, 0.16 - 0.01 x space.quad &"if" space.quad x >= 50 space.quad &amp amp space.quad x < 90)
  $

  به این ترتیب هدف ما در Distribution learning، پیدا کردن یک تابع توزیع است.
]

#tool.question()[
  همان سؤال قبلی با فرض این که داده ها توزیع نرمال داشته باشند.
  یعنی سن افراد سیگاری به صورت نرمال توزیع شده باشد.
]

#tool.true_answer()[
  در اصل ML engineer از سوادش به این موضوع پی می برد که داده ها نرمال هستند.
  مثلاً مشاهده می کند که ۵ فرد سیگاری ۱۰ ساله داریم و بعدش ۱۵ فرد سیگاری ۱۵ ساله داریم و به همین ترتیب متوجه می شود که داده ها شکلی نرمال دارند.

  با ضرب نظیر به نظیر هر عضو ستون سن در ستون فراوانی، و سپس تقسیم کردن حاصل آن بر تعداد جمعیت که ۱۰۰ می باشد به میانگین زیر می رسیم:
  $ mu = "Average" = 34 $
  و احتمالاً دارای انحراف معیار زیر می باشد:
  $ "Standard deviation" = 5 $

  و بر این اساس به نمودار زیر می رسیم:
  #tool.custom_figure(
    image("../images/ML/03_01.png", width: 90%),
    caption: "با توجه به میانگین و انحراف معیار جمعیت، به نمودار بالا می رسیم.",
    inset: 1em,
  )
]

#tool.tip()[
  تفاوت روش Regression با Distribution learning: در Regression لزوماً متغیر خروجی مان یک متغیر احتمالاتی نیست.
  این دو روش از هم خیلی دور نیستند ولی به هر صورت تفاوت دارند.
]

== Classification
#tool.question()[
  می خواهیم یک ماشین مناسب خانواده بخریم (Family car detection).
  چه ماشینی مناسب خانواده است؟
]

#tool.true_answer()[
  دو نقش برای حل این مسأله داریم:
  + ML engineer: برنامه ای می سازد که بتواند ماشین مناسب برای خانواده را با توجه به قدرت موتور و قیمت آن، تشخیص دهد.
  + Domain expert: می گوید چه ماشینی مناسب خانواده است.
    با گفتن قدرت موتور و قیمت ماشین به او، به ما جواب خواهد داد.

  ML engineer داده های قدرت و قیمت ماشین ها را به Domain expert می دهد و از او سؤال می کند آیا با توجه به مقدار آن ها، ماشین مربوطه مناسب است یا خیر؟
  در جدول زیر اطلاعات ماشین ها و پاسخ او آمده است:
  #tool.custom_figure(
    caption: "مناسب بودن یا نبودن ماشین برای خانواده با توجه به قدرت موتور و قیمت ماشین",
    kind: table,
    inset: 1em,
  )[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center,
      [Engine power ($X_1$)], [Price ($X_2$)], [Family car ($Y$)],
      "10", "1k", "No",
      "20", "1.2k", "No",
      "45", "5k", "Yes",
      "60", "10k", "Yes",
      "120", "15k", "Yes",
      "140", "30k", "No",
      "30", "100k", "No",
      "20", "200k", "No",
    )
  ]

  در ادامه مراحل زیر را انجام می دهیم:
  + Plot data:
    از آن جایی که انسان با دیدن نمودار داده ها درک بهتری از آن ها پیدا می کند، تا دیدن جدول، نمودار جدول بالا را رسم می کنیم.
    #tool.custom_figure(
      image("../images/ML/03_02.png"),
      caption: "نمودار جدول بالا. دایره های منفی بیانگر ماشین های نامناسب و دایره های مثبت بیانگر ماشین های مناسب خانواده می باشند.",
      inset: 1em,
    )

  + Get an insight:
    #tool.custom_figure(
      image("../images/ML/03_03.png"),
      caption: "با کمی نگاه به نموداری که رسم کردیم، به این دیدگاه می رسیم که ماشین های مناسب خانواده درون محدوده قرمز رنگ قرار می گیرند. گویی که توسط یک مستطیل (که با طول و عرض و مختصات نقطه پایین سمت چپش مشخص می شود) احاطه شده اند.",
      inset: 1em,
    )
    ما به عنوان ML engineer تصمیم می گیریم که محدوده ماشین های مناسب خانواده در نمودار بالا را به کمک شکلی نمایش دهیم.
    برای مثال به کمک یک مستطیل موازی محور های مختصات این محدوده را مشخص می کنیم.
    یکی از دلایل انتخاب مستطیل به جای مثلاً بیضی، ساده بودن رسم و تعریف آن است.

  + Make hypothesis and select a model:
    مهم ترین گام ما این گام است که در آن باید یک فرضیه خوب بسازیم.

    برای این مسأله فرضیه ما این است: ماشین های مناسب خانواده درون یک مستطیل موازی محور های مختصات هستند.
    در این جا مستطیلی که تعریف کردیم، همان Model برنامه ما می باشد که دارای ۴ پارامتر است و به صورت زیر تعریف می شود:

    #align(center)[
      #text(dir: ltr)[
        Model\<Left, Bottom, Width, Height\>
      ]
    ]

  + Train the model:
    یعنی یافتن بهترین مقادیر برای پارامتر های مدل.

    در این مرحله باید مدل خود را آموزش دهیم.
    از آنجایی که مدل پیشنهادی ما یک مستطیل است، برای آن که برنامه ما بتواند مشخصات این مستطیل را یاد بگیرد الگوریتم زیر را می نویسیم (الگوریتم Training):
    #tool.custom_figure(caption: "الگوریتم Training مدل.", kind: raw, inset: 1em)[
      ```
      // X is the data items consisting from only the first 2 columns of the former table (An N x 2 matrix)
      // Y is the data items consisting from only the last column of the former table (An N x 1 matrix)
      // N is the number of table rows (Here N = 8)

      Input: X, Y, N
      left = Infinity, bottom = Infinity
      width = -Infinity, height = -Infinity

      for k = 1 to N {
          // Poisitive example
          if Y[k] = True {
              if X[k, 1] < left {
                  left = X[k, 1]
              }
              if X[k, 2] < bottom {
                  bottom = X[k, 2]
              }
              if X[k, 1] - left > width {
                  width = X[k, 1] - left
              }
              if X[k, 2] - bottom > height {
                  height = X[k, 2] - bottom
              }
          }
      }
      ```
    ]

    پس از اجرای الگوریتم و آموزش دادن برنامه، باید برنامه را تست کنیم.
    برای مثال اگر ماشینی با مشخصات زیر به برنامه بدهیم:

    #align(center)[
      #text(stylistic-set: 2)[Engine power: 50, Price: 12k]
    ]

    برنامه به ما جواب
    Yes
    می دهد چون داخل مستطیل می افتد.
    فرآیندی که توضیح دادیم فرآیند Prediction می باشد.

    الگوریتم Prediction برای این مسأله به صورت زیر می باشد (Class label prediction):
    #tool.custom_figure(caption: "الگوریتم Prediction بر اساس مدل آموزش داده شده.", kind: raw, inset: 1em)[
      ```
      // e ---> Engine power
      // p ---> Price
      // M ---> Model
      // M[1] ---> Left,  M[2] ---> Bottom
      // M[3] ---> Width, M[4] ---> Height
      function Prediction(e, p, M) {
          if e >= M[1] and
          e <= M[1] + M[3] and
          p >= M[2] and
          p <= M[2] + M[4] {
              return "Yes"
          } else {
              return "No"
          }
      }
      ```
    ]

  #tool.list()[
    عبارت های مهم در این درس:
    - Classification
    - Plot: رسم کردن
    - Insight: بینش
    - Hypothesis: فرضیه
    - Model
    - Parameter
    - Train
    - Algorithm
    - Feature: در این جا همان ستون های مربوط به X می باشد.
    - Training set: در این جا همان مجموعه داده های X و Y می باشد.
    - Prediction (Recognition)
    - Inductive bias: هر دانسته ای غیر از اطلاعاتی که صورت مسأله داده و آن را به مسأله اضافه می کنیم، می گویند.
      مثلاً اینکه مدل مان مستطیل باشد یا بیضی، یک Inductive bias است.
  ]
]
