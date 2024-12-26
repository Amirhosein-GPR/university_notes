#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه ششم
== Probabilistic Classifiers
#tool.tip()[
  در این طبقه بند ها ما اطلاعی نداریم که نمونه به کدام کلاس تعلق دارد اما سعی می کنیم بر اساس شواهدی آن را به کلاسی تخصیص دهیم.
]

#tool.double_section()[
  #tool.question()[
    اگر یک تاس ساده را بیاندازیم، احتمال آن که عدد ۳ بیاید چقدر است؟
  ]
][
  #tool.true_answer()[
    #v(0.9em)
    #align(center)[
      $display(1 / 6)$
    ]
    #v(0.57em)
  ]
]

#tool.double_section()[
  #tool.question()[
    اگر یک تاس ساده را بیاندازیم و بدانیم که عددی فرد آمده است، احتمال آن که مقدار آن ۳ باشد چقدر است؟
  ]
][
  #tool.true_answer()[
    #v(1.73em)
    #align(center)[
      $display(1 / 3)$
    ]
    #v(1.35em)
  ]
]

#tool.double_section()[
  #tool.tip()[
    در مواقعی دانسته هایی داریم که ما را در رسیدن به احتمال مورد نظر کمک می کنند و آن را کمتر یا بیشتر می کنند.
  ]
][
  #tool.definition()[
    Evidence (مشاهده): چیزی است که ذهنیت ما را به یک سمت می برد.
    #v(1.6em)
  ]
]

#tool.double_section()[
  #tool.question()[
    فردی وارد کلاس می شود.
    احتمال آن که اهل فرانسه باشد و احتمال آن که اهل ایران باشد چقدر است؟
    #v(3.2em)
  ]
][
  #tool.true_answer()[
    احتمال زیاد ایرانی است چرا که ذهن ما به سمت حقیقتی Bias شده و آن این است که احتمال دیدن شخصی فرانسوی در این جا خیلی خیلی کمتر از احتمال دیدن شخصی ایرانی است.
  ]
]

#tool.tip()[
  بعضی اوقات بدون این که درباره Class یک نمونه اطلاعاتی داشته باشیم، ذهن ما سراغ دانش خاصی می رود.
]

=== Prior, Posterio and Marginal Probability
#tool.definition()[
  Prior Probability (احتمال پیشین): به اینکه بدون این که درباره موضوع مورد نظر Evidence خاصی داشته باشیم، ذهن ما به دلیل خاصی به یک جهت خاصی گرایش پیدا کرده است.

  به عبارتی دیگر احتمال Prior به احتمالی می گویند که بدون داشتن اطلاعاتی راجع به پیش آمد بیان می شود.
]

#tool.double_section()[
  #tool.definition()[
    Posterio Probability (احتمال پسین): احتمالی است که با داشتن اطلاعاتی راجع به پیش آمد بیان می شود.
    #v(3.2em)
  ]
][
  #tool.definition()[
    Marginal Probability (احتمال حاشیه ای): احتمال حاشیه ای به احتمال مشاهده یک مقدار خاص از یک متغیر، ادغام شده روی تمام مقادیر ممکن سایر متغیرها اشاره دارد.
  ]
]

#tool.double_section()[
  #tool.tip()[
    از Evidence به Probability می رسیم.
    #v(1.6em)
  ]
][
  #tool.example()[
    اگر بدانیم که بعد از انداختن تاس عددی که آمده فرد است، احتمال آمدن عدد ۳ بیشتر می شود.
  ]
]

#tool.definition()[
  در بسیاری از موارد
  $p(x)$
  را داریم که احتمال رخ دادن متغیر $x$ می باشد.
  برای نمونه در مثال تاس بدون داشتن دانش قبلی به صورت زیر است:
  $ p(1) = 1 / 6 = p(2) = dots = p(6) $

  اما مواردی وجود دارند که اطلاع قبلی ای در مورد موضوع مورد نظر داریم.
  این موارد به صورت احتمال شرطی بیان می شوند.
  این گونه احتمالات شبیه زیر بیان می شوند:
  $ "Likelihood" arrow p("evidence" | "class") $
  مانند زیر که $x$ را به یک کلاس مشروط کردیم:
  #text(size: 1em)[
    $ p(underbrace(x, "مشاهده") | x in underbrace({1, 3, 5}, "گروه یا کلاس")) = 1 / 3 $
  ]
]

#tool.tip()[
  Likelihood معمولا با یک Probability Density Function یا همان PDF بیان می شود.
  #h(10.5em) $p(x | c): "pdf"$
]

#tool.example(pause: true)[
  در یک آزمایش پزشکی، تعداد گلبول های سفید در واحد خون تعدادی آدم شمرده می شود.
  اگر بدن درگیر مهاجمی شده باشد، تعداد گلبول های سفید افزایش می یابد.

  #tool.custom_figure(
    image("../images/ML/06_01.png"),
    caption: "تعداد گلبول های سفید در واحد خون و فراوانی افراد مرتبط با این تعداد گلبول سفید",
    inset: 1em,
  )

  #tool.custom_figure(
    image("../images/ML/06_02.png"),
    caption: "تعداد گلبول های سفید در واحد خون و احتمال داشتن این تعداد از گلبول های سفید برای یک فرد با توجه به اینکه مریض است یا سالم است.",
    inset: 1em,
  )

  از آن جایی که این پدیده، پدیده ای پیوسته و طبیعی است، می توان آن را با یک توزیع نرمال مدل کرد.
  جمعیت بالا را خودمان نمونه گیری کردیم.

  پزشک با داشتن تعداد گلبول های سفید، می خواهد بداند احتمال بیمار بودن فرد چقدر است؟ یعنی مثلا:
  $ p("disease" | x = 15) $
]

=== Chain Rule of Probability
#tool.definition()[
  قاعده زنجیره احتمالات توأمان (Chain rule of probability):
  $ p(A, B) = p(A) times p(B | A) = p(B) times p(A | B) = p(B, A) $
  $ P(A, B, C) = p(A) times p(B | A) times p(C | A, B) $
  $
    \
    P(A, B, C, D) = p(A) times p(B | A) times p(C | A, B) times p(D | A, B, C)
  $
]

#tool.example(continuation: true)[
  #text(fill: red_color)[$C_1$] نمایانگر بیمار بودن و #text(fill: green_color)[$C_2$] نمایانگر سالم بودن است.

  $ p(x_1, C_1) = p(x) times p(C_1 | x) = p(C_1) times p(x | C_1) $

  همانطور که گفتیم پزشک می خواهد احتمال بیمار بودن فرد را بداند:
  $
    overbrace(p(C_1 | x), "Posterio") = (overbrace(p(C_1), "Prior") times overbrace(p(x | C_1), "Likelihood")) / (p( x ) = underbrace(p(x | C_1) + p(x | C_2), "Marginal probability of x"))
  $
  $p(C_1)$ یعنی احتمال بیمار بودن یک آدم در یک جمعیت، بدون اینکه Evidence ای داشته باشیم.

  $p(x)$ یعنی احتمال اینکه تعداد گلبول های سفید در یک جمعیت، مقدار $x$ باشد، بدون اینکه Evidence ای داشته باشیم.

  همچنین چون فقط $C_1$ و $C_2$ هستند که فضا را افراز می کنند، $p(x)$ را در مخرج معادله بالا برابر با مقدار زیر قرار دادیم:
  $ p(x) = p(x | C_1) + p(x | C_2) $
  که به آن Marginal probability مربوط به $x$ می گویند.
]

#tool.question()[
  شخصی با WBC = 14 به پزشک مراجعه کرده است.
  آیا بیمار است؟
]

#tool.true_answer()[
  برای این که پزشک بیمار بودن فرد را تشخیص دهد، مقدار دو احتمال زیر را حساب کرده و مقدار هر کدام که بیشتر بود یعنی فرد در آن وضعیت (سالم یا بیمار) قرار دارد.
  $ p("بیمار" | "wbc" = 14) space.quad , space.quad p("سالم" | "wbc" = 14) $

  بنابراین فرد در صورت زیر بیمار است:
  $
    \
    "Type of a preson" == "بیمار" "iff" p("بیمار" | "wbc" = 14) > p("سالم" | "wbc" = 14)
  $
]

=== Bayesian Learning
#tool.definition()[
  Bayesian Learning:
  $
    x in C_1 "iff" p(C_1 | x) > p(C_2 | x) \
    = (p(C_1) times p(x | C_1)) / cancel(p(x)) > (p(C_2) times p(x | C_2)) / cancel(p(x)) \
    = p(C_1) times p(x | C_1) > p(C_2) times p(x | C_2)
  $
]

#tool.question()[
  مقدار $p(C_1)$ را از کجا می آوریم و چقدر است؟
]

#tool.true_answer()[
  از Domain Knowledge می آوریم.

  در مسائل Machine Learning همان اول روی Train Data معادله زیر را اعمال کرده و با این معادله مقدار $p(C_1)$ را حساب می کنیم:
  $ p(C_1) = n(C_1) / (n(C_1) + n(C_2) = N) $
]

=== به دست آوردن $p(x | C_1)$ و $p(x | C_2)$
#tool.question()[
  مقدار $p(x | C_1)$ و $p(x | C_2)$ را چگونه به دست آوریم؟
]

#tool.true_answer()[
  این موارد نیز از روی Train Data، حساب می شوند.

  فرض کنید Train Data ای به شکل زیر داریم:
  #tool.custom_figure(
    caption: [Train Data ما دارای تعدادی m ویژگی و دو کلاس $C_1$ و $C_2$ است.],
    kind: table,
    inset: 1em,
  )[
    $#stack(
            v(2.5em),
            $"Number of rows" arrow.l N lr(\{, size: #21em)$,
        )
        #table(
            columns: 2,
            inset: 1em,
            stroke: black,
            align: center,
            $x_1 x_2 dots x_m$,
            $y$,
            line(),
            $C_1$,
            line(),
            $C_1$,
            $dots.v$,
            $dots.v$,
            line(),
            $C_1$,
            line(),
            $C_2$,
            line(),
            $C_2$,
            line(),
            $C_2$,
            line(),
            $C_2$
        )
        #stack(
            v(2.75em),
            $lr(}, size: #10em) C_1$,
            v(2em),
            $lr(}, size: #10em) C_2$,
        )$
  ]

  با استفاده از یک جدول احتمالاتی ساده $p(C_1)$ و $p(C_2)$ که در پاسخ سؤال قبلی فرمول آن آورده شد، به دست می آیند.

  $p(x | C_1)$ و $p(x | C_2)$ نیز به صورت یک Probability Distribution نوشته می شوند که معمولاً دو حالت دارد زیر را دارد:
  + Tabular: یعنی به صورت جدولی نوشته می شود.
    مانند جدول زیر:
    #tool.custom_figure(caption: "نمونه ای از نوشته شدن یک توزیع احتمالاتی به شکل جدول.", kind: table, inset: 1em)[
      #table(
        columns: 2,
        inset: 1em,
        stroke: black,
        align: center,
        $x$, $p(x)$,
        $1$, $0.1$,
        $2$, $0.002$,
        $dots.v$, $dots.v$,
        $100$, $0.0003$,
      )
    ]
  + PDF: یک تابع ریاضی می نویسیم که $x$ را به احتمالش نگاشت می کند.
    مثلاً برای خیلی از پدیده هایی که با آن ها سر و کار داریم، یک تابع توزیع احتمال نرمال می نویسیم.
    فرمول تابع توزیع نرمال برای $C_1$ به صورت زیر است:
    $ p(x | C_1): "Normal"(underbrace(mu_1, "Mean"), underbrace(sigma_1, "Standard deviation")) arrow.curve.b $
    $ p(x | C_1) = 1 / (sqrt(2 pi sigma_1^2)) e^display((-(x - mu_1)^2) / (2 sigma_1^2)) $
    $ mu_1 = (sum_display(x in C_1)x) / (n(C_1)) $
    $ sigma_1 = sqrt((sum_display(x in C_1)(x - mu_1)^2) / (N - 1)) $
]

#tool.tip()[
  برای توزیع های کوچک Tabular و برای توزیع های بزرگ PDF خوب است.
]

=== احتمال شرطی دو متغیره

#tool.question()[
  ۶ نمونه که هر یک، دو Feature دارند و در کل به دو کلاس تقسیم بندی می شوند، به شکل زیر داریم:
  #tool.custom_figure(
    image("../images/ML/06_03.png", width: 77%),
    caption: "۶ نمونه داریم که به شکل بالا توزیع شده اند.",
    inset: 1em,
    refrence: <image_06_03>,
  )

  نمونه ای داریم که ویژگی های آن به صورت $x_1 = -1$ و $x_2 = 0$ است.
  این نمونه متعلق به کلاس $C_1$ است یا $C_2$؟
]

#tool.true_answer()[
  برای حل این مسأله هر دو احتمال زیر را حساب می کنیم:
  $
    \
    p(C_1 | < x_1 = -1, x_2 = 0 >) = space ? space.quarter , space.quarter p(C_2 | < x_1 = -1, x_2 = 0 >) = space ?
  $
  این مسأله را به کمک جدول حل می کنیم.
  ابتدا نمودار را به صورت جدول زیر در می آوریم:
  #tool.custom_figure(caption: [جدول مربوط به نمودار @image_06_03], kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center,
      $x_1$, $x_2$, $y$,
      $-1$, $0$, $C_1$,
      $-1$, $-1$, $C_1$,
      $0$, $-1$, $C_1$,
      $1$, $0$, $C_2$,
      $1$, $1$, $C_2$,
      $0$, $1$, $C_2$,
    )
  ]

  سپس احتمالات شرطی (Posterio های) مربوط به $x_1$ را به صورت جدول زیر می نویسیم:
  #tool.custom_figure(caption: [احتمالات شرطی (Posterio های) مربوط به $x_1$], kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      $x_1$, $p(x_1 | C_1)$, $p(x_1 | C_2)$,
      $-1$, $display(2 / 3)$, $0$,
      $0$, $display(1 / 3)$, $display(1 / 3)$,
      $1$, $0$, $display(2 / 3)$,
    )
  ]

  برای $x_2$ نیز به همین صورت عمل می کنیم:
  #tool.custom_figure(caption: [احتمالات شرطی (Posterio های) مربوط به $x_2$], kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      $x_2$, $p(x_2 | C_1)$, $p(x_2 | C_2)$,
      $-1$, $display(2 / 3)$, $0$,
      $0$, $display(1 / 3)$, $display(1 / 3)$,
      $1$, $0$, $display(2 / 3)$,
    )
  ]

  همچنین خود Prior ها را نیز می نویسیم:
  $ p(C_1) = p(C_2) = 0.5 $

  فرض کنید برای تست از همان داده های Training استفاده می کنیم (در اینجا برای سادگی این کار را می کنیم و گرنه کار خوبی نیست).
  در ادامه جواب دو احتمال شرطی ای که در ابتدا آورده شدند را محاسبه می کنیم:
  $
    \
    p(C_1 | < x_1 = -1, x_2 = 0 >) = space ? space.quarter , space.quarter p(C_2 | < x_1 = -1, x_2 = 0 >) = space ?
  $

  به کمک قاعده بیز ساده (Naive Bayes Assumption) می توان احتمال های بالا را حساب کرد.
  این قاعده می گوید که فرض کنیم $x_1$ و $x_2$ از هم مستقل هستند.
  این قاعده برای احتمال های بالا به صورت زیر نوشته می شود:
  $ p(C_1 | < x_1 = -1, x_2 = 0 >) = \ p(C_1 | x_1 = -1) times p(C_1 | x_2 = 0) $

  از آن جایی که $p(x)$ مساوی است، به آن نیازی نداریم و مخرج کسر را حساب نمی کنیم.
  در ادامه به صورت زیر معادله بالا را حل می کنیم:
  $
    p(C_1 | < x_1 = -1, x_2 = 0 >) = \ p(C_1 | x_1 = -1) times p(C_1 | x_2 = 0) = \
    cancel(p(C_1)) times p(x_1 = -1 | C_1) times cancel(p(C_1)) times p(x_2 = 0 | C_1) = \ 2 / 3 times 1 / 3 = 2 / 9 arrow star star #text(dir: ltr)[Wins] star star
  $
  $
    p(C_2 | < x_1 = -1, x_2 = 0 >) = \ p(C_2 | x_1 = -1) times p(C_2 | x_2 = 0) = \
    cancel(p(C_2)) times p(x_1 = -1 | C_2) times cancel(p(C_2)) times p(x_2 = 0 | C_2) = \ 0 times 1 / 3 = 0
  $
]

=== ترتیب استفاده از Classifier ها
#tool.tip()[
  Naive Bayes طبقه بند خیلی ساده ای است.
  به همین دلیل به عنوان Baseline یا مبنای پایه برای محاسبات استفاده می شود.
  اگر Naive Bayes در حد ۶۰٪ یا ۷۰٪ خوب جواب داد، آن گاه سراغ روش های دیگر برای بهتر کردن مدل می رویم.

  باید بقیه روش هایی که بعد از Naive Bayes استفاده می کنیم از آن بهتر باشند به جز Random Assignment.
  یعنی عملکرد روش های مختلف و ترتیب به کار گیری آن ها (از چپ به راست) به شکل زیر است:
  #align(center)[
    Random Assignment < Naive Bayes < Other Methods
  ]

  روش Random Assignment به این صورت کار می کند که به صورت تصادفی به نمونه ها Label می زنیم.
  مثلاُ این روش در یک مسأله دو کلاسه دارای دقت ۵۰٪ است.
]

#tool.example()[
  مسأله ای درباره طبقه بندی زعفران داریم.
  زعفران ها در ۵ کلاس طبقه بندی می شوند:
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    align: center,
    [1. عالی], [2. بسیار خوب], [3. خوب], [4. متوسط], [5. بد],
  )
  روش Random Assignment برای این مسأله دارای دقت ۲۰٪ است.
  یعنی احتمال این که کلاس نمونه ای درست تشخیص داده شود، ۲۰٪ است.
  در ادامه طبقه بند Naive Bayes می سازیم.
  اگر دقت Naive Bayes بالای ۲۰٪ شد، به سراغ حل مسأله با روش های یادگیری ماشین می رویم.
  چرا که تجربه نشان می دهد اگر Naive Bayes خیلی بهتر از Random Assignment کار نکرد، اول به Dataset مسأله مان باید شک کنیم و به این گمان بیافتیم که در یک جای مسأله اشتباهی کرده ایم.
]
