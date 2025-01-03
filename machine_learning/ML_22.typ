#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه بیست و دوم
== طراحی و اجرای آزمایش های یادگیری ماشین
#tool.simple_context()[
  در یادگیری ماشین دو مسئله داریم که باید به آن ها رسیدگی کنیم:
  + عملکرد مدل در دنیای واقعی چقدر خوب است؟
  + تنظیمات مدل (شامل نوع الگوریتم، Hyper Parameter های انتخاب شده و #sym.dots) آیا در بهترین حالت تنظیم شده اند یا خیر.
]

=== بررسی عملکرد الگوریتم های یادگیری ماشین در دنیای واقعی
#tool.definition()[
  این که الگوریتم ما در دنیای واقعی چقدر خوب کار خواهد کرد، به تعداد نمونه های آموزشی مدل، بستگی دارد.
]

=== تنظیم بهینه مدل
#tool.definition()[
  معیار های تصمیم گیری درباره انتخاب مدل و تنظیمات آن:
  + Misclassification Error:
    در Misclassification Error، ماهیت ارور ها از هم تفکیک نمی شوند.
    مثلاً در یک آزمایش پزشکی اگر بیمار را سالم و سالم را بیمار تشخیص دهیم ارور آن ها یکسان است.
  + Risk:
    ریسک، هزینه تصمیم را به ما نشان می دهد.
    مثلاً اگر بیمار به اشتباه سالم تشخیص داده شود و وارد جامعه شود، بقیه را هم آلوده می کند.
    اما اگر فرد سالم به اشتباه بیمار تشخیص داده شود، نهایت یک هفته از کار دست می کشد.
  + Training Time / Space Complexity
  + Testing Time / Space Complexity
  + Interpretability:
    یعنی قابل توصیف و توضیح بودن.
    به عبارت دقیق تر، یعنی فرآیندی که از گرفتن Input تا تولید Output رخ می دهد را بتوان توضیح داد.
  + Easy Programmability
  + Cost-Sensitive Learning:
    فرآیند آموزش، متناسب با هزینه ای باشد که می توانیم پرداخت کنیم.
]

=== Machine Learning Experiments Factors
#tool.definition()[
  در یک آزمایش یا Experiment یادگیری ماشین، فاکتور های زیر وجود دارند:
  + Input
  + Controllable Factors:
    عواملی هستند که می توانیم آن ها را کنترل کنیم.
    مثلاً در فرآیند آموزش از K-Fold استفاده کنیم، Train و Test را به چه شکلی تقسیم کنیم و داده ها را Normalize بکنیم یا نکنیم و #sym.dots.
  + Output
  + Uncontrollable Factors:
    عواملی هستند که خارج از کنترل ما هستند.
    مثلاً وجود Noise یا خرابی در داده ها که کشف شان سخت است.

  #tool.custom_figure(
    image("../images/ML/22_01.png", width: 85%),
    caption: "فاکتور های یک Experiment در یادگیری ماشین",
    inset: 1em,
  )

  Uncontrollable Factors ها باعث ایجاد عدم قطعیت در سیستم می شوند.
  در آزمایش های یادگیری ماشین، ترجیح این است که نتایج تا جای ممکن ناشی از Input و Controllable Factor ها باشند و تا جای ممکن Uncontrollable Factor ها روی سیستم تأثیر نگذارند.
]

=== Strategies of Experimentation
#tool.definition()[
  برای رسیدن به بهترین مقادیر Controllable Factor ها، جستجویی را بر روی آن ها انجام می دهیم.
  این جستجو به ۳ شکل زیر می تواند انجام شود:
  + Best Guess:
    به روشی هوشمندانه، مقادیر مناسب را به صورت هدایت شده پیدا می کنیم.
    مانند انواع الگوریتم های تکاملی.
  + One Factor At a Time:
    در مواردی که می خواهیم مقدار بهینه چندین فاکتور را به دست آوریم، می توانیم ابتدا مقدار بهینه فاکتور اول را به صورت جداگانه جستجو کنیم، سپس مقدار بهینه فاکتور دوم را با توجه به مقدار بهینه فاکتور اول جستجو کنیم.
    سپس مقدار بهینه فاکتور سوم را بر اساس مقدار بهینه فاکتور دوم جستجو کنیم و به همین ترتیب #sym.dots.
  + Factorial Design #box[(Exhaustive Search)]:
    در این روش، تمامی مقادیر ممکنی که فاکتور ها می توانند به خود بگیرند را امتحان می کنیم و واقعاً بهترین مقدار ممکن آن ها را پیدا می کنیم.

    #tool.custom_figure(
      image("../images/ML/22_02.png"),
      caption: "روش های جستجو بهترین مقادیر Controllable Factor ها",
      inset: 1em,
    )
]

=== Guidelines for ML Experiments
#tool.list()[
  + Aim of the Study
  + Selection of the Response Variable
  + Choice of Factors and Levels
  + Choice of Experimental Design
  + Performing the Experiment
  + Statistical Analysis of the Data
  + Conclusions and Recommendations
]
=== Resampling
==== K-Fold Cross-Validation
#tool.definition()[
  در این روش، داده ها به $K$ بخش مستقل تقسیم می شوند.
  هر بخش که با $X$ نشان می دهیم شامل تعدادی Feature و Label است.
  در نهایت به شکل زیر تمامی Fold ها را برای Validation انتخاب خواهیم کرد.
  $
    V_1 = X_1 #h(1em) T_1 = X_2 union X_3 union dots union X_K
    \
    V_2 = X_2 #h(1em) T_2 = X_1 union X_3 union dots union X_K
    \
    dots.v
    \
    V_K = X_K #h(1em) T_K = X_1 union X_2 union dots union X_(K - 1)
  $
  در این روش، بخش هایی که در هر مرحله برای Validation انتخاب می شوند، با یکدیگر اشتراکی ندارند.
  اما بخش های Train مراحل، اشتراک زیادی با یکدیگر دارند که برابر با مقدار زیر است:
  $
    T_i = K - 2
  $
]

==== #text(dir: ltr)[5 $times$ 2 Cross-Validation]
#tool.definition()[
  در این روش، ۵ بار تکنیک #text(dir: ltr)[2-Fold Cross-Validation] را استفاده می کنیم.
  به این صورت که ۵ بار، داده ها را به ۲ قسمت مساوی تقسیم می کنیم.
  البته قبل از انجام تقسیم برای مرحله بعدی باید داده ها را Shuffle کنیم.
  در هر مرحله که تقسیم ها را انجام می دهیم،
  نصفه اول داده ها را برای Train و نصفه دوم آن ها را برای Validation استفاده می کنیم و در ادامه نصفه دوم آن ها را برای Train و نصفه اول آن ها را برای Validation استفاده می کنیم.
  $
    T_1 = X_1^[1] #h(1em) V_1 = X_1^[2]
    \
    T_2 = X_1^[2] #h(1em) V_2 = X_1^[1]
    \
    T_3 = X_2^[1] #h(1em) V_3 = X_2^[2]
    \
    T_4 = X_2^[2] #h(1em) V_4 = X_2^[1]
    \
    dots.v
    \
    T_9 = X_5^[1] #h(1em) V_9 = X_5^[2]
    \
    T_10 = X_5^[2] #h(1em) V_10 = X_5^[1]
  $
  خوبی این روش نسبت به روش قبل این است که داده ها هم در Validation و هم در Test کاملاً از یکدیگر مستقل هستند.
]

==== Bootstrapping
#tool.definition()[
  در این روش، نمونه ها را با جایگذاری از Dataset انتخاب می کنیم.
  احتمال این که بعد از $N$ بار نمونه برداری، یک نمونه را بر نداریم برابر مقدار زیر است:
  $
    (1 - 1 / N)^N approx e^(-1) = 0.368
  $
  که یعنی در هر آزمایش ۳۶/۸٪ از نمونه ها جدید خواهند بود.
]

=== Performance Measures
#tool.definition()[
  تعدادی از معیار های اندازه گیری عملکرد سیستم عبارتند از:
  + Confusion Matrix:
    #tool.custom_figure(caption: "نمونه ای از یک Confusion Matrix", kind: table, inset: 1em)[
      #table(
        columns: 4,
        inset: 1em,
        stroke: black,
        align: center + horizon,
        table.cell(stroke: none)[], table.cell(stroke: none)[], table.cell(colspan: 2)[Predicted Class],
        table.cell(stroke: none)[], table.cell(stroke: none)[], "Yes", "No",
        table.cell(rowspan: 2)[#rotate(-90deg, block(width: 1.5em)[True Class])],
        "Yes", "TP: True Positive", "FN: False Negative",
        "No", "FP: False Positive", "TN: True Negative"
      )
    ]
  + Error rate:
    $
      "Number of Errors" / "Number of Instances" = ("FN" + "FP") / N
    $
  + Accuracy:
    $
      1 - "Error Rate"
    $
  + Recall:
    $
      \
      "Number of Found Positives" / "Number of Positives" = "TP" / ("TP" + "FN") = "Sensivity" = "Hit Rate"
    $
  + Precision:
    $
      "Number of Found Positives" / "Number of Found" = "TP" / ("TP" + "FP")
    $
  + Specificity:
    $
      "TN" / ("TN" + "FP")
    $
  + False Alarm Rate:
    $
      "FP" / ("FP" + "TN") = 1 - "Specificity"
    $
]

=== Plotting Over Differrent Decision Thresholds
#tool.definition()[
  در مواقعی که خروجی مدل ما در یک بازه عددی است مثل مدل های رگرسیون؛ می توانیم با تنظیم یک Threshold که آن را با $tau$ نمایش می دهیم مشخص کنیم که که اگر مقدار خروجی مثلاً کمتر از ۰/۵ بود، نمونه مورد نظر در کلاس ۱ و در غیر این صورت در کلاس ۲ قرار دارد.
  $
    x arrow #rect(width: 2em, height: 2em) arrow y in (0, 1)
    \
    T in [0, 1]
  $
  سپس بر اساس مقدار Threshold معیار های مورد نظر مان را حساب می کنیم.
  مثلاً Threshold را برابر با ۰/۱ در نظر گرفته و بر اساس این مقدار False Alarm Rate و Hit Rate را محاسبه می کنیم.
  با تغییر مقدار Threshold، مقدار محاسبه شده آن ها نیز تغییر کرده و با رسم نمودار مقادیر حساب شده مختلف آن ها به نمودار های زیر می رسیم:
  #tool.custom_figure(
    image("../images/ML/22_03.png"),
    caption: "نمودار Hit Rate - False Alarm Rate در سمت چپ و نمودار Sensivity - Specificity در سمت راست",
    inset: 1em,
  )
  هر اندازه که Threshold باعث جدا سازی بهتر داده ها از یکدیگر شود، منحی های رسم شده زودتر به نقاط اکسترمم می رسند.
  برای مثال در نمودار بالا در سمت چپ، زودتر به Maximum و در سمت راست، زودتر به Minimum می رسیم.

  همچنین سطح زیرین منحنی نمودار سمت چپ را معمولاً به عنوان معیار عملکرد در نظر می گیرند و طبیعتا هر چه مقدار آن بیشتر باشد، عملکرد بهتر است.
]

=== ROC Curve
#tool.definition()[
  برای مقایسه عملکرد الگوریتم های مختلف در Threshold های مختلف می تواند استفاده شود.
  هرچه مساحت ناحیه زیر این نمودار بیشتر باشد، آن الگوریتم بهتر است.
  #tool.custom_figure(
    image("../images/ML/22_04.png"),
    caption: "نمودار ROC Curve",
    inset: 1em,
  )
  این نمودار برای Dataset هایی با اندازه کم و محدود مناسب است.
]

=== Precision and Recall
#tool.definition()[
  در زیر، نمایشی از دو معیار Precision و Recall آورده شده است:
  #tool.custom_figure(
    image("../images/ML/22_05.png", width: 90%),
    caption: "نمایشی از Precision و Recall",
    inset: 1em,
  )
]

=== Interval Estimation
#tool.definition(pause: true)[
  فرض کنید که $x^t$ از یک توزیع نرمال با میانگین $mu$ و واریانس $sigma^2$ به دست آمده است:
  $
    X = {x^t}_t "where" x^t tilde N(mu, sigma^2)
  $
  در این صورت، توزیع میانگین (که این میانگین، همان $m$ است) این جمعیت به صورت زیر خواهد بود:
  $
    m tilde N (mu, sigma^2 \/ N)
  $
]

#tool.example()[
  فرض کنید که می دانیم توزیع میانگین قد پسران جوان ۲۰ ساله همدانی به صورت زیر است:
  $
    N(170, 16)
  $
  ٪۹۵ این افراد، قدی در بازه زیر دارند:
  $
    170 plus.minus 2 times sqrt(16) = 170 plus.minus 8
  $
  در ادامه، یک بار ۱۰۰ جوان همدانی را انتخاب می کنیم.
  بار دوم مجدداً ۱۰۰ جوان دیگر انتخاب می کنیم.
  بار سوم هم همین کار را تکرار می کنیم و میانگین های هر دفعه را حساب کرده و به مقادیر زیر می رسیم:
  $
    100 arrow m = 171
    \
    100 arrow m = 170
    \
    100 arrow m = 169
  $
  خود این میانگین ها جمعیتی را تشکیل می دهند که توزیع نرمالی به صورت زیر دارد:
  $
    m tilde N (mu, sigma^2 \/ N)
  $
  $N$ در مخرج فرمول بالا بیانگر تعداد آزمایش هایی است که انجام دادیم.
  مثلاً اگر ۴ آزمایش انجام دادیم و در هر آزمایش ۳ بار نمونه گیری کردیم و میانگین آن ها را به دست آوردیم، توزیع این میانگین ها، توزیع نرمالی به صورت زیر خواهد بود:
  $
    N(170, 16 / 4)
  $
]

#tool.definition(continuation: true)[
  طبیعتاً انحراف معیار توزیع میانگین ها به صورت زیر است:
  $
    sqrt(sigma^2 / N) = sigma / sqrt(N)
  $
  به همین دلیل می توان گفت که $m$، از توزیع $Z$ نیز سرچشمه می گیرد:
  $
    sqrt(N) ((m - mu)) / sigma tilde Z
  $
  $Z$ همان توزیع نرمال استاندارد است که میانگینش ۰ و واریانسش ۱ است:
  $
    Z(0, 1)
  $
]

=== Hypothesis Testing
#tool.definition()[
  در Hypothesis Testing می خواهیم بدانیم که آیا تفاوت در نتیجه دو آزمایشی که انجام دادیم، ظاهری است یا واقعی؟

  اگر ده ها آزمایش را انجام دهیم و با استفاده از قضیه حد مرکزی میانگین های این آزمایش ها را حساب کنیم، خود مجموعه ی این میانگین ها توزیع نرمالی خواهد داشت.
  حال اگر آن دو آزمایش خاصی که می خواهیم میانگین شان را در نظر بگیریم، اگر هر دوی شان در بازه اطمینان ۹۵٪ باشند، تفاوت آن ها ظاهری و در غیر این صورت، مثلاً اگر قسمتی از بازه شان بیرون باشد، ماهیتاً متفاوت اند.

  این کار به این صورت انجام می گیرد که یک Significance Level ای را انتخاب می کنیم.
  معمولاً مقدار آن ۰/۰۱ یا ۰/۰۵ است.
  با استفاده از ابزار های آماری، احتمال شانسی بودن تفاوتی که بین نتیجه دو آزمایش می بینیم را حساب می کنیم.
  وقتی داشته باشیم:
  $
    "Significance Level" = 0.01
  $
  یعنی احتمال شانسی بودن تفاوت دو آزمایش، کمتر از ۰/۰۱ است.
  همچنین وقتی:
  $
    "Significance Level" = 0.05
  $
  یعنی اگر تفاوت نتیجه دو آزمایش کمتر از ۰/۰۵ باشد، آن تفاوت ماهیتی است و آن را ناشی از مداخله یک عامل خارجی می بینیم.
  اگر بالای ۰/۰۵ باشد یعنی چیزی ظاهری است و در نتیجه مثلاً نمونه برداری بوده است.

  ابزار هایی که در این زمینه استفاده می شوند، عبارت اند از:
  + t Test
  + #text(stylistic-set: 2)[Anova 1]
  + $"Chi"^2$
  + و #sym.dots
]
