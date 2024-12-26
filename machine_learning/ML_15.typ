#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه پانزدهم
== Unsupervised Learning
#tool.simple_context()[
  از این جلسه تا تعدادی جلسه دیگر، الگوریتم های یادگیری بدون نظارت زیر درس داده خواهند شد:
  #grid(columns: (1fr, 1.5fr))[
    1. Clustering
    3. Association Analysis
  ][
    2. Distribution Estimation
    4. Anomaly Detection (Data Cleaning)
  ]
]

=== Clustering
#tool.question()[
  تعدادی نمونه در دو کلاس به صورت زیر داریم. آن ها را طبقه بندی کنید.
  #tool.custom_figure(
    image("../images/ML/15_01.png", width: 85%),
    caption: [نمونه های مربوط به دو کلاس $C_1$ و $C_2$],
    inset: 1em,
  )
]
#tool.true_answer()[
  با طبقه بند های درخت و شبکه عصبی نیز می توان این سؤال را حل کرد اما برای مسائلی که فضای نمونه پیچیده ای دارند، می توان از رویکرد Ensemble استفاده کرد.
  Ensemble را به دو روش زیر می توان ساخت:
  + Input Space Partitioning:
    در این روش، فضای نمونه را بدون توجه به توزیع داده ها، به چند بخش در محور مختصات تقسیم می کنیم.
    سپس برای هر یک از این بخش ها یک طبقه بند می سازیم.
    بدی این روش در مقایسه با روش Clustering این است که برای ناحیه هایی که خالی هستند نیز باید تصمیم گیری کنیم.
    #tool.custom_figure(
      image("../images/ML/15_02.png", width: 92%),
      caption: "ساخت Ensemble با تکنیک Input Space Partitioning",
      inset: 1em,
    )
  + Clustering (خوشه بندی):
    در این روش، محل تجمع داده ها را تشخیص می دهیم.
    داده هایی که بهم نزدیک اند در یک خوشه دسته بندی می شوند.
    سپس برای هر خوشه یک مدل جدید یاد می گیریم.
    مانند وقتی که از سمت و ارتفاع بالا به یک شهر نگاه می کنیم، محله های مختلف آن را می توانیم ببینیم.
    #tool.custom_figure(
      image("../images/ML/15_03.png", width: 92%),
      caption: "ساخت Ensemble با تکنیک Clustering",
      inset: 1em,
    )
]

#tool.tip()[
  الگوریتم های خوشه بندی و پیدا کردن محل تجمع، معمولاً الگوریتم هایی Semi-automatic (نیمه خودکار) هستند.
  به این معنا که خود ML Engineer باید اطلاعاتی را به الگوریتم بدهد تا الگوریتم محل دقیق خوشه ها را مشخص کند.
]

==== K-Means
#tool.definition()[
  الگوریتم K-Means یک الگوریتم خوشه بندی است و به این شکل اجرا می شود:
  + Random Assignment:
    الگوریتم K-Means، ابتدا مراکز محل های تجمع اولیه را به صورت تصادفی انتخاب می کند.
    سپس هر یک از داده ها به مرکزی که به آن نزدیک تر است، اختصاص داده می شود.

  + اصلاح مراکز خوشه ها:
    در این مرحله، مختصات مراکز خوشه ها اصلاح می شود.
    به این صورت که میانگین هر خوشه فعلی حساب می شود و سپس داده ها در خوشه ای قرار می گیرند که به میانگین آن خوشه نزدیک ترند.

  + تکرار گام ۲ تا رسیدن به همگرایی و یا رسیدن به تعداد Iteration مورد نظر.
]

#tool.example()[
  می خواهیم داده های زیر را به وسیله الگوریتم K-Means خوشه بندی کنیم:
  $
    A = {-1, 0, 0, 1, 2, 7, 5, 8, 9, 5, 6}
  $
  این الگوریتم دو ورودی می گیرد:
  داده ها و اطلاعات کمکی (تعداد خوشه ها).
  ML Engineer حدس می زند که این داده ها مربوط به ۲ خوشه هستند و تعداد خوشه ها را به الگوریتم می دهد.
  یکی از راه های حدس زدن تعداد خوشه ها، رسم داده ها بر روی نمودار است.
  #tool.custom_figure(
    image("../images/ML/15_04.png"),
    caption: "با توجه به نمودار داده ها می توان دریافت که داده ها در نزدیکی ۰ و ۶ تجمع پیدا کرده اند.",
    inset: 1em,
  )
  در این مثال فرض کنید شانسی، بدترین انتخاب ممکن انجام می شود.
  $
    \
    a_1 &= 8 &&arrow {-1, 0, 0, 1, 2, 5, 5, 6, 7, 8} &&arrow "Mean" = 33 / 10 &&= 3.3
    \
    a_2 &= 9 &&arrow {9} &&arrow "Mean" = 9 / 1 &&= 9
    \ #place(dx: 27.1em, line(length: 100%, stroke: (dash: "densely-dashed"))) \
    a_1 &= 3.3 &&arrow {-1, 0, 0, 1, 2, 5, 5, 6} &&arrow "Mean" = 18 / 8 &&= 2.25
    \
    a_2 &= 9 &&arrow {7, 8, 9} &&arrow "Mean" = 24 / 3 &&= 8
    \ #place(dx: 27.1em, line(length: 100%, stroke: (dash: "densely-dashed"))) \
    a_1 &= 2.25 &&arrow {-1, 0, 0, 1, 2, 5, 5} &&arrow "Mean" = 12 / 7 &&tilde.eq 1.7
    \
    a_2 &= 8 &&arrow {6, 7, 8, 9} &&arrow "Mean" = 30 / 4 &&= 7.5
    \ #place(dx: 27.1em, line(length: 100%, stroke: (dash: "densely-dashed"))) \
    a_1 &= 1.7 &&arrow #text(dir: ltr, fill: red_color)[{-1, 0, 0, 1, 2}] &&arrow "Mean" = 2 / 5 &&= #text(dir: ltr, fill: red_color)[0.4]
    \
    a_2 &= 7.5 &&arrow #text(dir: ltr, fill: blue_color)[{5, 5, 6, 7, 8, 9}] &&arrow "Mean" = 40 / 6 &&tilde.eq #text(dir: ltr, fill: blue_color)[6.6]
    \ #place(dx: 27.1em, line(length: 100%, stroke: (dash: "densely-dashed"))) \
    a_1 &= 0.4 &&arrow #text(dir: ltr, fill: red_color)[{-1, 0, 0, 1, 2}] &&arrow "Mean" = 2 / 5 &&= #text(dir: ltr, fill: red_color)[0.4]
    \
    a_2 &= 6.6 &&arrow #text(dir: ltr, fill: blue_color)[{5, 5, 6, 7, 8, 9}] &&arrow "Mean" = 40 / 6 &&tilde.eq #text(dir: ltr, fill: blue_color)[6.6]
  $
  با توجه به این که دو بخش آخر معادله های بالا یکسان اند (به لحاظ دسته بندی داده ها و یا میانگین آن ها)، پس الگوریتم به همگرایی رسیده است و داده ها را در ۲ خوشه تقسیم بندی کرده است.
]

#tool.tip()[
  K-Means الگوریتمی Iterative و Non-deterministic است.
]

=== Distribution Estimation
#tool.definition()[
  Distribution Estimation برای تخمین توزیع داده ها استفاده می شود.
  به این صورت که فرض می کنیم تک تک داده هایی که داریم هر یک می توانند مرکز یک توزیع نرمال باشند.
  نحوه عملکرد Distribution Estimation به این صورت است که به تعداد داده ها توزیع نرمال با مرکزیت هر یک از آن ها می سازیم و در نهایت این توزیع ها را با یک دیگر جمع می کنیم و توزیع نهایی را به دست می آوریم.
]

#tool.example()[
  Distribution Estimation در حل مسائلی که با K-Means حل می شوند، با دادن بینش به ما کمک می کند.
  برای حل مثال قبل به این روش، فرض می کنیم که داده ها از توزیع نرمالی به دست آمده اند.
  ابتدا تابع توزیع تک تک داده ها را به شکل زیر بر روی نمودار رسم می کنیم که میانگین هر یک از آن ها برابر با مقدار آن داده است ($-1, 0, dots, 9$).
  در ادامه نمودار جدیدی که حاصل جمع نمودار تک تک توابع است می کشیم.
  به این صورت که قسمت هایی که بر روی یک دیگر افتاده اند، با هم جمع می شوند:
  #tool.custom_figure(
    image("../images/ML/15_05.jpg"),
    caption: "نمودار های توزیع داده ها و نمودار حاصل جمع آن ها",
    inset: 1em,
  )
  با نگاه به نمودار حاصل جمع، ML Engineer متوجه می شود که دو قله بزرگ، یکی در نقطه ۰ و دیگری در نقطه ۵، در آن وجود دارد.
  با توجه به این موضوع، بهتر است مرکز اولیه خوشه ها در این نقاط باشند.

  به این ترتیب الگوریتم K-Means به صورت زیر شروع می شود:
  $
    a_1 &= 0 &&arrow #text(dir: ltr, fill: red_color)[{-1, 0, 0, 1, 2}] &&arrow "Mean" = 2 / 5 &&tilde.eq #text(dir: ltr, fill: red_color)[0.4]
    \
    a_2 &= 5 &&arrow #text(dir: ltr, fill: blue_color)[{5, 5, 6, 7, 8, 9}] &&arrow "Mean" = 40 / 6 &&tilde.eq #text(dir: ltr, fill: blue_color)[6.6]
  $
  و چون از مثال قبل می دانیم خوشه های بالا جواب نهایی هستند، Iteration دوم که از آن متوجه همگرایی می شویم، دیگر در این مثال آورده نشده است.

  در این روش تنها با ۲ بار تکرار به جواب نهایی رسیدیم.
]

#tool.tip()[
  الگوریتم K-Means به انتخاب مراکز اولیه حساس است.
]

#tool.tip()[
  در الگوریتم K-Means، داده ها همیشه این گونه نیستند که با یک بینش بتوان مقدار مناسب برای مراکز اولیه آن ها را حدس زد.
  در این حالت، برای مثال اگر قرار است دو مرکز را انتخاب کنیم، عدد اول را به صورت تصادفی انتخاب می کنیم.
  سپس برای انتخاب عدد دوم، دورترین عدد نسبت به آن را انتخاب می کنیم.
  این کار باعث می شود که الگوریتم سریع تر به همگرایی برسد.
]

#tool.example()[
  داده هایی به شکل زیر داریم و می خواهیم آن ها را دسته بندی کنیم:
  #tool.custom_figure(
    image("../images/ML/15_06.png", width: 80%),
    caption: "داده هایی متعلق به ۳ کلاس مختلف",
    inset: 1em,
  )
  با مشاهده نمودار بالا به این نتیجه می رسیم که داده ها در ۳ گروه قرار گرفته اند.
  بنابراین ۳ مرکز را انتخاب می کنیم.
  سپس به کمک الگوریتم تقسیم بر اساس عمود منصف، صفحه را به ۳ خوشه، افراز می کنیم.
  هر نمونه متعلق به خوشه ای خواهد بود که به آن نزدیک تر است.
  فرض کنید ۳ مرکزی که انتخاب می کنیم، مراکز بدی هستند:
  #tool.custom_figure(
    image("../images/ML/15_07.png", width: 80%),
    caption: "Iteration اول K-Means",
    inset: 1em,
  )
  در ادامه باید مراکز خوشه ها را با توجه به اعضای شان، به دست آوریم.
  یعنی نقطه مرکزی بین نمونه های هر خوشه را حساب کنیم.
  سپس دوباره به کمک الگوریتم تقسیم بر اساس عمود منصف، صفحه را به ۳ بخش تقسیم می کنیم و داده ها را در خوشه های جدید دسته بندی می کنیم:
  #tool.custom_figure(
    image("../images/ML/15_08.png", width: 80%),
    caption: "Iteration دوم K-Means",
    inset: 1em,
  )
]

=== ایراد K-Means
#tool.tip()[
  K-Means همیشه برای خوشه بندی مناسب نیست.
]

#tool.example()[
  K-Means در مواردی مانند حالت زیر به مشکل می خورد. چرا که مرز بین خوشه ها را تنها با رسم عمود منصف فاصله مرکز خوشه ها، محاسبه می کند:
  #tool.custom_figure(
    image("../images/ML/15_09.png", width: 45%),
    caption: "خوشه بندی اشتباه توسط الگوریتم K-Means",
    inset: 1em,
  )

  و یا در حالتی که دو خوشه به شکل زیر داریم:
  #tool.custom_figure(
    image("../images/ML/15_10.png", width: 55%),
    caption: "خوشه بندی اشتباه توسط الگوریتم K-Means",
    inset: 1em,
  )
]

==== Silhouette and Clustering Score
#tool.definition()[
  فرض کنید ۳ خوشه به شکل زیر داریم.
  نمونه ای به نام $x_i$ را درون یکی از خوشه ها در نظر می گیریم.
  اگر به میانگین فاصله این نمونه با نمونه های هم خوشه اش، $a$ و به میانگین فاصله این نمونه با نمونه های نزدیک ترین خوشه دیگر، $b$ بگوییم:
  #tool.custom_figure(
    image("../images/ML/15_11.png", width: 95%),
    caption: [نمونه $x_i$ به همراه میانگین فاصله های $a$ و $b$],
    inset: 1em,
  )
  آن گاه کیفیت خوشه بندی تک نمونه $x_i$، که به آن Silhouette Score مربوط به $x_i$ می گوییم، به صورت زیر تعریف می شود:
  $
    "Silhouette Score for" x_i arrow s_i = (b - a) / max(a, b)
  $
  که در آن دوست داریم $b$ بزرگ تر و $a$ کوچک تر باشد.

  برای ارزیابی خوشه بندی، معیار Clustering Score به صورت زیر تعریف می شود:
  $
    "Clustering Score" = (sum_i s_i) / N
  $
]

#tool.double_section()[
  #tool.tip()[
    Silhouette Score نمونه هایی که خوب خوشه بندی شده اند بزرگ، و نمونه هایی که پرت اند، کوچک است.
  ]
][
  #tool.tip()[
    الگوریتم K-Means به Noise حساس است.
    #v(1.6em)
  ]
]

==== تشخیص Noise در K-Means
#tool.definition()[
  یکی از روش های تشخیص Noise در الگوریتم K-Means، این است که Range یا محدوده ای از Silhouette Score را به عنوان محدوده Valid و محدوده مکمل آن را به عنوان محدوده Invalid در نظر می گیریم.

  کد این الگوریتم تشخیص Noise، به صورت زیر است:
  #tool.custom_figure(caption: "کد یک الگوریتم تشخیص Noise", kind: raw, inset: 1em)[
    ```
    // <<<Part 1>>>
    // First Sort all 's_i' in a decreasing order. That is:
    // s_1 >= s_2 >= s_3 >= ... >= s_n
    sort s_1, s_2, ..., s_N
    // Calculate the sum of all 's_i' and assign it to 's'.
    s = sum_of(s_i)
    // Calculate each 's_i' share. Consequently the sum of
    // this set is equal to 1.
    s_1 = (s_1 / s) , s_2 = (s_2 / s), ..., s_N = (s_N / s)

    // <<<Part 2>>>
    t = 0, i = 0
    // Increase 'i' until we reach to the 95% of scores
    while (t < 0.95) {
      i = i + 1
      t = t + s_i
    }
    // Now 'i' refers to the index of the first sample
    // which it's score is in the 5% of the lowest scores.
    // Now we can say that each sample 'x'
    // from index 'i' to 'N', is a NOISE!!!
    noises = x_(i+1), x_(i+2), ..., x_N
    ```
  ]
]

#tool.tip()[
  دقت شود که در الگوریتم تشخیص Noise بالا، نمونه هایی که Score شان جزو ۵٪ کمترین Score ها بود را پیدا و به عنوان Noise تعیین کردیم و نه ۵٪ از نمونه هایی که داریم.
]
