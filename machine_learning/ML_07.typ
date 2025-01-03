#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه هفتم
#tool.reminder()[
  در جلسه قبل یاد گرفتیم که احتمال این که $x$ عضو کدام کلاس باشد به صورت زیر تعیین می شود:
  $ x in C_(i^*) , i^* = "argmax"_i p(C_i) p(x | C_i) $
  یعنی احتمال $P(C_i | x)$ را به ازای تمامی $i$ کلاسی که داریم حساب می کنیم.
  $x$ عضو کلاسی است که بیشترین مقدار را در این احتمال دارد.
  خود $P(C | x)$ نیز به صورت زیر محاسبه می شود:
  $
    underbrace(p(
      C | x
    ), "Posterior") = (overbrace(p(C), "Prior") overbrace(p(x | C), "Likelihood")) / underbrace(p(underbrace(x, "Evidence")), "Marginal probability of evidence")
  $
  لازم به ذکر است که اگر بخواهیم $P(C | x)$ را برای $C$ های مختلف با یکدیگر مقایسه کنیم، نیازی به دانستن $p(x)$ نیست.
  چرا که مقدار آن بین همه $P(C | x)$ ها مشترک است.
]

== حل احتمال شرطی با PDF
#tool.simple_context()[
  در این جلسه به نمونه ای از حل یک سؤال با استفاده از PDF می پردازیم.
]

#tool.question()[
  دو گروه آدم های سیگاری و غیر سیگاری داریم که هر یک از افراد این دو گروه بعد از مدتی پیاده روی خسته می شوند.
  فردی بعد از ۱۹ دقیقه خسته می شود.
  این فرد سیگاری است یا غیر سیگاری؟
]

#tool.true_answer(pause: true)[
  تعدادی نمونه به صورت جدول زیر تهیه می کنیم:
  #tool.custom_figure(
    caption: "نمونه هایی از میزان خسته شدن بعد از N دقیقه پیاده روی در افراد سیگاری و غیر سیگاری.",
    kind: table,
    inset: 1em,
  )[
    #table(
      columns: 4,
      inset: 1em,
      stroke: black,
      align: center,
      fill: (x, y) => if calc.even(x) {
        luma(230)
      },
      "Smokers", "Non-smokers", "Smokers", "Non-smokers",
      "10", "30", "10", "30",
      "5", "45", "11", "35",
      "12", "25", "9", "25",
      "13", "20", "5", "18",
      "15", "5", "7", "38",
    )
  ]

  گروه های مختلف داده ها توزیع های مرتبط با خودشان را دارند.
  \ \
]

#tool.list()[
  تعدادی از توزیع های پیوسته مربوط به Feature ها عبارتند از:
  + Uniform:
    در این توزیع، مقدار $p(x)$ به ازای تمامی $x$ ها یکسان است.
  #grid(columns: 3, gutter: 1em)[
    2. Gaussian
  ][
    3. Rayleigh
  ][
    4. Cauchy
  ]

  توزیعی به نام Poisson نیز وجود دارد که جزو توزیع های پر کاربرد گسسته است.
  توزیع Normal که نوع خاصی از توزیع Gaussian می باشد توزیعی ساده و محبوب است.
  در بحث های Epidemic ها توزیع Rayleigh بهتر از توزیع Normal عمل می کند.
]

#tool.true_answer(pause: true, continuation: true)[
  پس ما در اغلب اوقات فرض می کنیم که نمونه های ما از توزیع های مشخصی می آیند.
]

#tool.double_section()[
  #tool.example()[
    برای استفاده از یک توزیع، مثلاً توزیع نرمال، به صورت زیر عمل می کنیم:
    $ P(x | C_1) tilde N(mu_1, sigma_1) $
  ]
][
  #tool.tip()[
    هر کلاس می تواند توزیع مخصوص خود را داشته باشد.
    #v(2.2em)
  ]
]


#tool.simple_context()[
  در آمار بحثی به نام Stochastic Processes وجود دارد که یکی از محصولات آن Maximum Likelihood Estimation (MLE) می باشد.
  MLE یک نظریه است و در این درس ما از نتایج آن استفاده می کنیم.
]

#tool.definition()[
  بر اساس MLE اگر فرض کنیم Population یا Sample مان از یک توزیع نرمال آمده است، اگر Sample Size مان به صورت زیر باشد:

  $ |"Sample"| >= 33 $
  می توان گفت که:
  $
    mu &tilde.equiv hat(mu) = (sum_display(x in "Sample") x) / (|"Sample"|) \ sigma &tilde.equiv hat(sigma) = sqrt((sum_display(x in "Sample") (
      x - hat(mu)
    )^2) / (|"Sample"| - 1))
  $
  بر این اساس می توانیم در یک مسأله ای که دو کلاس داریم، میانگین و انحراف معیار هر یک از کلاس ها را حساب کرده و سپس بر اساس این میانگین و انحراف معیار بگوییم که هر نمونه ای به چه کلاسی تعلق دارد.
]

#tool.true_answer(continuation: true)[
  برای راحتی کار در این پاسخ تعداد نمونه ما کمتر از ۳۳ شد و گرنه طبق قاعده ای که توضیح داده شد باید حداقل ۳۳ نمونه تهیه می کردیم.

  در ادامه میانگین و انحراف معیار دو کلاس Smoker و Non-smoker را حساب می کنیم که مقدار آن ها در جدول زیر آمده است:
  #tool.custom_figure(caption: "میانگین و انحراف معیار مربوط به دو کلاس Smoker و Non-smoker", kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center,
      "Class", $mu$, $sigma$,
      $C_1: "Smoker"$, "9.7", "3.13",
      $C_2: "Non-smoker"$, "27.1", "10.72",
    )
  ]

  در این سؤال فرض کردیم که توزیع داده های هر دو کلاس توزیع Gaussian است و بر همین اساس با استفاده از فرمول توزیع Gaussian می توانیم احتمال مربوط به $x$ را به صورت زیر حساب کنیم:
  $
    p("Smoker" | x = 19) &= (p("Smoker") times p(x = 19 | "Smoker")) / p(x) \
    p("Non-smoker" | x = 19) &= (p("Non-smoker") times p(x = 19 | "Non-smoker")) / p(x)
  $

  از آن جایی که از هر کلاس ۱۰ نمونه داریم پس احتمال پیشین آن ها یکسان است:
  $ p("Smoker") = p("Non-smoker") = 0.5 $

  از طرفی $p(x)$ نیز بین هر دو کلاس مشترک است و به این ترتیب فقط نیاز است که $p(x = 19 | "Smoker")$ و $p(x = 19 | "Non-smoker")$ را حساب کنیم.

  برای مثال $x$ در صورتی عضو کلاس Smoker است که رابطه زیر برقرار باشد:

  $ x in "Smoker" "iff" p("Smoker" | x) > p("Non-smoker" | x) $

  که با توجه به توضیحاتی که داده شد در نهایت به شکل زیر در می آید:
  $ p(x | "Smoker") > p(x | "Non-smoker") $

  فرمول تابع توزیع Gaussian به صورت زیر است:
  $
    p(x ; mu , sigma) = 1 / (sqrt(2 pi sigma^2)) e^display((-(x - mu)^2) / (2 sigma^2))
  $

  با استفاده از فرمول بالا مقدار دو احتمال زیر به دست می آید و از این دو احتمال نتیجه می گیریم که احتمال غیر سیگاری بودن فردی که پس از ۱۹ دقیقه خسته شود بیشتر از احتمال سیگاری بودنش است.

  $
    \
    p(x | "Non-smoker") = 0.028 > p(x | "Smoker") = 0.001 arrow x in "Non-smoker"
  $

]

== Approach, Model and Method
#tool.double_section()[
  #tool.definition()[
    Model: تابعی ریاضی است که تعدادی پارامتر دارد و توزیع داده یا مرز را معرفی می کند.

    Approach: رویکرد کلی یا روش کلی است.
  ]
][
  #tool.simple_context()[
    برای به دست آوردن خروجی یک مدل باید ابتدا مقدار پارامتر های آن را حساب کرد.
    این کار را با روش Maximum Likelihood Estimation انجام می دهیم.
    #v(0.4em)
  ]
]

#tool.double_section()[
  #tool.tip()[
    Approach یک فرآیند بالاسری است که در آن کار های مختلفی را انجام می دهیم.
    داخل هر تکه کار ممکن است از تعدادی Model و برای محاسبه پارامتر های Model از Method های خاصی استفاده کنیم.
    #v(1.2em)
  ]
][
  #tool.example()[
    Model #sym.arrow.l تابع توزیع Gaussian

    Method #sym.arrow.l روش محاسبه یا همان فرمول $mu$ و $sigma$

    Variable or Feature #sym.arrow.l $x$

    Approach #sym.arrow.curve.l #box[Bayesian Learning Approach]
  ]
]


=== Parametric and Non-parametric Models
#tool.definition()[
  Model ها دو نوع اند:
  + Parameteric Models: مدل هایی که تعداد پارامتر هایشان از قبل مشخص و ثابت است و ربطی به تعداد Train Data ندارند.
  + Non-parameteric Models: مدل هایی که تعداد پارامتر هایشان از قبل مشخص نیست و وابسته به Train Data است.
    مانند وقتی که مدل یا توزیع احتمال مان را به صورت جدولی نشان می دهیم.
]

#tool.double_section()[
  #tool.tip()[
    مدل های Non-parameteric نیز پارامتر دارند و اتفاقاً پارامتر های زیادی نسبت به مدل های Parameteric دارند اما چون تعداد پارامتر هایشان مشخص و ثابت نیست به آن ها Non-parametric می گویند.
  ]
][
  #tool.definition()[
    Latent: موضوعی که واقعا در پس یک پدیده رخ می دهد.

    Model: برداشت و تصویری که ما از روی Latent می سازیم و به کمک آن، Latent را شرح می دهیم.

    #v(1.2em)
  ]
]

#tool.double_section()[
  #tool.tip()[
    مدلی خوب است که بر اساس آن بتوانیم پیش بینی دقیق تری از Latent داشته باشیم.
    #v(4.8em)
  ]
][
  #tool.example()[
    بالا رفتن دلار دلایل مختلفی می تواند داشته باشد:
    + نزدیک شدن به کریسمس
    + Black Friday
    + تقدیم بودجه کشور و احتمال کسری بودجه
  ]
]


== Model Paramters Variance
#tool.example()[
  فرض کنید در سؤال پیاده روی به جای برداشتن ۱۰ نمونه برای کلاس Smokers، تنها ۳ نمونه بر می داریم. یعنی:
  $ "Sample Size" = 3 $
  این کار را چند سری انجام می دهیم.
  به این صورت که ابتدا ۳ نمونه اول (نمونه اول تا سوم)، سپس ۳ نمونه بعدی (نمونه دوم تا چهارم) و به همین ترتیب تا آخر نمونه گیری ۳ تایی را انجام می دهیم و برای هر دسته از این نمونه ها، میانگین شان را به دست می آوریم.
  این کار را برای حالت ۵ نمونه ای و ۷ نمونه ای نیز انجام می دهیم و در نهایت به اعداد زیر می رسیم. (فکر کنم عدد آخر در جدول که مقدارش ۷ هست رو برای حالت ۵ نمونه ای و ۷ نمونه ای حساب نمی کنیم):
  //TODO
  $
    3 "Instances" &arrow 9, 10, 13, 13, 12, 9, 8, 7 \
    5 "Instances" &arrow 11, 11, 12, 10, 8 \
    7 "Instances" &arrow 11, 10, 10
  $

  با نگاه به اعداد بالا متوجه می شویم که هرچه اندازه نمونه ها بیشتر شود، داده ها به یکدیگر نزدیک تر می شوند. یعنی تنوع آن ها کمتر می شود. تنوع نیز با واریانس نشان داده می شود.
]

#tool.tip()[
  ML Engineer مدل را می سازد و مشتری از آن استفاده می کند.
  مدل هایی خوب هستند که واریانس پایینی دارند چرا که باعث می شود که نتایجی که ML Engineer گرفته است را مشتری نیز بگیرد.
  واریانس نیز زمانی کمتر می شود که تعداد نمونه هایی که می گیریم بیشتر شوند.

  مثلاً برای توزیع نرمال به همین دلیل بود که گفتیم حداقل ۳۳ نمونه گیری باید انجام شود.
]

#tool.definition()[
  نوعی Variance برای تغییرات پارامتر های مدلی که می سازیم، وجود دارد.
  #tool.custom_figure(
    image("../images/ML/07_01.png"),
    caption: [نمونه برداری هایی که از دامنه انجام می دهیم و در ادامه از آن ها برای Estimate کردن پارامتر های مدل استفاده می کنیم. $theta_1$ تا $theta_k$ پارامتر های مدل هستند.],
    inset: 1em,
  )
  اگر واریانس پارامتر های بالا بزرگ باشد نتیجه ای که ML Engineer و مشتری خواهند دید، متفاوت از یکدیگر خواهد بود.
]

#tool.tip()[
  Model Parameters Variance به دو مورد زیر ربط دارد:
  + Model
  + Sample Size
]

#tool.double_section()[
  #tool.tip()[
    با کمی سهل انگاری بزرگی مدل را معادل با تعداد پارامتر های آن در نظر می گیریم.
    مثلاً مدلی که ۵ پارامتر دارد بزرگ تر از مدلی است که ۳ پارامتر دارد یا شبکه عصبی ای که یک لایه دارد، کوچک تر از شبکه عصبی ای است که ۲۰ لایه دارد.
  ]
][
  #tool.tip()[
    وقتی مدل ما کوچک تر باشد نیاز به Sample Size کمتری خواهد بود تا به Variance مطلوب برسیم.
    مثلاً مدل Poisson نسبت به مدل Normal پارامتر کمتری دارد و کوچک تر است.
    #v(3.2em)
  ]
]

#tool.tip()[
  پیچیدگی مدل باید در حدی باشد که خطای آن قابل تحمل باشد.
  #tool.custom_figure(
    image("../images/ML/07_02.png", width: 70%),
    caption: "مرز دو کلاس بالا به وسیله یک معادله درجه دو به خوبی مشخص می شود. اما اگر مدل ساده ای مثل یک خط استفاده کنیم، خطای مدل زیاد می شود.",
    inset: 1em,
  )
]

== Sample Size
#tool.tip()[
  برای کنترل واریانس پارامتر های مدل، ساده ترین مدلی که بتواند مسأله را به خوبی حل کند انتخاب کرده و سپس متناسب با آن مدل Sample Size درست را انتخاب می کنیم.
]

#tool.definition()[
  Sample Size مناسب برای Parameteric Model ها و Non-parameteric Model ها
  به صورت زیر است:
  + Parameteric Models:
    آماری ها جدول هایی تهیه کرده اند که در آن ها Sample Size مناسب برای هر توزیع، مشخص شده است.
  + Non-parameteric Models:
    قاعده ای سر انگشتی به صورت زیر تعریف شده است:
  $ 3 times "max"("parameters#", "features#") <= "Sample Size" \ <= 10 times "max"("parameters#", "features#") $
]

#tool.example()[
  مدل پارامتری ساده ای به صورت زیر داریم:
  $ theta_0 + theta_1 x_1 + theta_2 x_2 = 0 $
  تعداد Parameter و Feature های این مدل به صورت زیر است:
  $ "Parameters" = 3 space.quarter space.quarter space.quarter , space.quarter "Features" = 2 $
  ماکزیمم دو مقدار بالا عدد ۳ می باشد.
  بنابراین از هر کلاس باید حداقل ۹ نمونه داشته باشیم.
  یعنی برای یک مسأله دو کلاسه اگر بخواهیم یک خط را یاد بگیریم، برای آن که مطمئن شویم که خطی که ما پیدا می کنیم مشابه خطی است که دوست مان پیدا می کند، از هر کلاس باید حداقل ۹ نمونه داشته باشیم که یعنی مجموعاً ۱۸ نمونه باید داشته باشیم.
  #tool.custom_figure(
    image("../images/ML/07_03.png", width: 50%),
    caption: "مدل خطی این مثال که در آن باید برای هر کلاسی حداقل ۹ نمونه وجود داشته باشد.",
    inset: 1em,
  )
]