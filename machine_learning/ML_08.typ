#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه هشتم
== Estimation (تخمین)
#tool.simple_context()[
  سعی می کنیم با نمونه هایی که از جمعیت بر می داریم مقدار میانگین و واریانس جمعیت را حدس بزنیم.
  $
    hat(mu)_1 tilde.equiv mu #h(0.5em) , #h(0.5em) hat(sigma)_1 tilde.equiv sigma #h(2em) mu , sigma arrow "Latent" #h(0.5em) , #h(0.5em) hat(mu)_1 , hat(sigma)_1 arrow "Estimated"
  $

  $hat(mu)_1$ و $hat(sigma)_1$ میانگین و انحراف معیار مربوط به نمونه ها و $mu$ و $sigma$ میانگین و انحراف معیار مربوط به جمعیت (واقعی) هستند.
]

#tool.double_section()[
  #tool.simple_context()[
    از Maximum Likelihood برای Estimation استفاده می کنیم.
  ]
][
  #tool.tip()[
    نمونه یک مجموعه است و یک تک دانه نیست.
  ]
]

#tool.tip()[
  از یک جمعیت می توان به تعداد دلخواه نمونه برداری کرد و برای هر نمونه، $hat(mu)$ و $hat(sigma)$ آن را حساب کرد.
  زمانی نمونه برداری و Estimation خوب است که $hat(mu)$ و $hat(sigma)$ ها به $mu$ و $sigma$ نزدیک شوند.
]

#tool.question()[
  از کجا بفهمیم که $hat(mu)$ و $hat(sigma)$ ها به مقدار $mu$ و $sigma$ نزدیک اند؟
]

#tool.true_answer()[
  درست است که مقدار $mu$ و $sigma$ را نداریم اما Estimated ها ($hat(mu)_i$ و $hat(sigma)_i$ ها) را داریم.
  به این صورت که از $i$ عدد Sample ای که داریم $hat(mu)_i$ و $hat(sigma)_i$ ها را طی فرآیند Estimation به دست می آوریم.
  $
    <S_1, hat(mu)_1, hat(sigma)_1> \ <S_2, hat(mu)_2, hat(sigma)_2> \ <S_3, hat(mu)_3, hat(sigma)_3> \ dots.v \ <S_k, hat(mu)_k, hat(sigma)_k>
  $
  اگر Estimator ها و Sample ها خوب باشند، باید مقادیر $hat(mu)_i$ و $hat(sigma)_i$ ها به یکدیگر نزدیک باشند:
  $
    hat(mu)_1 tilde.equiv hat(mu)_2 tilde.equiv dots tilde.equiv hat(mu)_k #h(1em) , #h(1em) hat(sigma)_1 tilde.equiv hat(sigma)_2 tilde.equiv dots tilde.equiv hat(sigma)_k
  $
  چرا که اگر به یکدیگر نزدیک نباشند یعنی توزیع های مختلفی داریم و نمی دانیم کدام درست است.
]

#tool.tip()[
  برای ارزیابی خوب بودن Estimate، باید Variance مقادیر $hat(mu)_i$ و $hat(sigma)_i$ ها کم باشد. (با واریانس توزیع اشتباه گرفته نشود)
]

=== Estimator
#tool.definition()[
  Estimator: تکنیکی است که جمعیتی را می گیرد و پارامتر های مولد (پارامتر های مدل) آن جمعیت را Estimate (پیش بینی) می کند.
  $ "Estimator"("Population", "Model Parameters") = \ "Estimated Value of Model Paremeters" $
]

#tool.list()[
  برای Estimator ها دو کمیت رو به رو تعریف می شوند:
  ۱) Variance
  #box[۲) Bias]
]

#tool.example()[
  فرض کنید ترازویی داریم که به شکل زیر وزن کالا ها را به اشتباه نشان می دهد:
  #tool.custom_figure(caption: "وزن هایی که یک ترازو به اشتباه نشان می دهد.", kind: table, inset: 1em)[
    #table(
      columns: 2,
      inset: 1em,
      stroke: black,
      align: center,
      "وزن واقعی", "وزن نشان داده شده",
      "1", "3",
      "2", "5",
      "3", "7",
      "4", "9",
    )
  ]
  با نگاه به جدول بالا متوجه می شویم که وزنی که ترازو نشان می دهد، الگوی زیر را دارد:
  $ m arrow 2 m + 1 $

  در این حالت می گویند ترازو Bias (میل) دارد.
]

#tool.double_section()[
  #tool.tip()[
    Maximum Likelihood برای بسیاری از Estimation ها Unbiased است.
    به این صورت که سعی می کند هر پارامتر $hat(theta)$ ای را از روی جمعیت دست آورد به گونه ای که:
    $ hat(theta) tilde.equiv theta $
    #v(1.6em)
  ]
][
  #tool.tip()[
    اگر انحراف معیار را با فرمولی که توضیح داده شده حساب کنیم و از جمعیت تعداد زیادی نمونه برداریم، انحراف معیار نمونه به صورت زیر خواهد بود:
    $ hat(sigma) tilde.equiv N / (N - 1) sigma $
    #v(0.5em)
  ]
]

#tool.double_section()[
  #tool.tip()[
    Estimator هایی خوب اند که Unbiased باشند.
    #v(1.6em)
  ]
][
  #tool.tip()[
    بر روی MLE می توان متدی را تعریف کرد که Biased باشد یا Unbiased باشد.
  ]
]

#tool.simple_context()[
  در نمودار توزیع نرمال می توان از احتمال به مقدار عددی متناظر آن رسید.

  #tool.custom_figure(
    image("../images/ML/08_01.png", width: 60%),
    caption: "از احتمال ۰/۰۷ به عدد متناظر آن می رسیم.",
    inset: 1em,
  )
]

//TODO: MAYBE SHOULD BE MOVED -> 31:53
#tool.tip()[
  Maximum Likelihood Estimation به ما می گوید که اگر میانگین جمعیت را برداریم به میانگین توزیع نزدیک خواهد بود.
]

#tool.example(pause: true)[
  فرض کنیم دو جعبه داریم که یکی مربوط به Smoker ها و دیگری مربوط به Non-smoker ها است.
  همچنین هر یک از آن ها توزیع نرمال مربوط به خود را دارند که با دیگری متفاوت است.
  اگر این توزیع نرمال ها را بر روی محور رسم کنیم، به شکل زیر می رسیم:

  #tool.custom_figure(
    image("../images/ML/08_02.png", width: 81%),
    caption: "توزیع های دو کلاس Smoker و Non-smoker. محور x بیانگر تعداد دقیقه های پیاده روی است.",
    inset: 1em,
    refrence: <image_08_02>,
  )

  احتمال این که $x$ عضو کلاس $C_1$ باشد به صورت زیر است:
  $
    x in C_1 "iff" p(C_1 | x) > p(C_2 | x) arrow.curve.b \ (p(C_1) times p(x | C_1)) / p(x) > (p(C_2) times p( x | C_2 )) / p(x)
  $
  همچنین از مثال پیاده روی داشتیم که:
  $ p(C_1) tilde.equiv p(C_2) $
  بنابراین:
  $
    p(x | C_1) > p(x | C_2)
  $
  بر اساس فرضی که داشتیم، اگر به تعداد کافی نمونه برداری کنیم می توان فرض کرد که توزیع نمونه ها نیز نرمال است و از PDF توزیع نرمال استفاده کرد:
  $
    1 / (sqrt(2 pi) sigma_1) e^display((-(x - mu_1)^2) / (2 sigma_1^2)) > 1 / (sqrt(2 pi) sigma_2) e^display((-(
      x - mu_2
    )^2) / (2 sigma_2^2))
  $

  در فرمول بالا تنها $x$ است که مجهول است و $sigma$ و $mu$ ها را با استفاده از تکنیک های Estimation، می توان از روی داده ها به دست آورد.

  // فرض کنیم در مثال پیاده روی جلسه قبل توزیع کلاس Smoker از یک توزیع نرمال و کلاس Non-smoker از یک توزیع نرمال دیگر می آید.
]

#tool.tip()[
  Estimation به درد این می خورد که پارامتر های مورد نیاز را از روی داده ها به دست آورد.
]

#tool.example(continuation: true)[
  فرض کنید از خوش شانسی، انحراف معیار ها مثل هم است:
  $ sigma_1 tilde.equiv sigma_2 $
  آن گاه با لگاریتم گیری (بر مبنای $e$) از نامعادله ای که پیش تر آمد، به نامعادله زیر می رسیم:
  $ -(x - mu_1)^2 > -(x - mu_2)^2 arrow (x - mu_1)^2 < (x - mu_2)^2 arrow.curve.b \ |x - mu_1| < |x - mu_2| $

  بنابراین:
  $ x in C_1 "iff" |x - mu_1| < |x - mu_2| $

  در نامعادله بالا، $|x - mu_1|$ یعنی فاصله $x$ از $mu_1$.
  نکته جالب این است که بر اساس نامعادله بالا، دیگر کاری با توزیع ها نداریم و کافی است میانگین ها را به دست آوریم.

  مرز بین دو کلاس با توجه به این فرض که $x$ کوچک تر از $mu_2$ است (@image_08_02)، به صورت زیر تعیین می شود:
  $
    |x - mu_1| = |x - mu_2| arrow x - mu_1 = mu_2 - x arrow x = (mu_1 + mu_2) / 2
  $

  به این ترتیب بر اساس فرض هایمان به طبقه بند ساده ای که تنها بر اساس فاصله کار می کند می رسیم.
]

==== ارزیابی Estimator
#tool.double_section()[
  #tool.question()[
    آیا Classifier مان خوب است یا بد؟
  ]
][
  #tool.true_answer()[
    برای ارزیابی آن باید معیار تعریف کنیم.
  ]
]

#tool.definition()[
  Accuracy: معیاری برای ارزیابی مدل است که به صورت زیر تعریف می شود:
  $ "Accuracy" = (n_(1,1) + n_(2,2)) / (n_(1,1) + n_(1,2) + n_(2,1) + n_(2,2)) $
]

#tool.example()[
  فرض کنید داده های مثال پیاده روی را داریم و پس از آموزش مدل، می خواهیم آن را تست کنیم.
  پس از تست مدل، جدول زیر به دست می آید:

  #tool.custom_figure(
    caption: [۷ مورد برای کلاس $C_1$ و ۶ مورد برای کلاس $C_2$ درست تشخیص داده شده است. $n_(2,1)$ یعنی داده در اصل متعلق به کلاس ۲ بوده اما به اشتباه در کلاس ۱ طبقه بندی شده است. به این جدول، Confusion Matrix می گویند.],
    kind: table,
    inset: 1em,
  )[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center,
      "", $C_1$, $C_2$,
      $C_1: 10$, $n_(1,1): 7$, $n_(1,2): 3$,
      $C_2: 10$, $n_(2,1): 4$, $n_(2,2): 6$,
    )
  ]
]

#tool.question()[
  فرض کنید توزیع داده ها نرمال است.
  اگر نمونه کوچک باشد و با آن پارامتر های مدل را بسازیم، به چه نتیجه ای می رسیم؟
]

#tool.true_answer()[
  وقتی اندازه نمونه به اندازه کافی بزرگ نباشد، پارامتر های مدل زیاد و متنوع می شوند (Variance آن ها زیاد می شود) و به شکل زیر می رسیم:
  #tool.custom_figure(
    image("../images/ML/08_03.jpg"),
    caption: "توزیع های واقعی در پایین و توزیع هایی که از روی نمونه ها می سازیم، در بالای محور x رسم شده اند.",
  )
]

#tool.tip()[
  برای یک مسأله، مدل های مختلف پارامتر های مختلفی دارند و به این ترتیب Accuracy شان نیز با یکدیگر متفاوت است.
]

===== Variance of Accuracy (واریانس عملکردی)
#tool.definition()[
  Variance of Accuracy (واریانس عملکردی): وقتی تعداد زیادی مدل داریم که با Dataset های کوچک آموزش یافته اند، یعنی تعداد زیادی مدل با پارامتر های مختلف داریم که هر یک دقت مربوط به خودشان را دارند.
  به تنوعی که در این دقت ها وجود دارد، واریانس عملکردی می گویند.
]

#tool.example()[
  می خواهیم دو کلاس زیر را از یکدیگر جدا کنیم:
  #tool.custom_figure(
    image("../images/ML/08_04.png", width: 60%),
    caption: "هیچ تک خطی پیدا نمی شود که این دو کلاس را از یکدیگر جدا کند و مسأله به مدلی پیچیده تر از یک خط (به یک سهمی) نیاز دارد.",
    inset: 1em,
  )
  مدل های تصویر بالا ($d_1$ تا $d_3$) در ارور $E_0$ مشترک اند که به آن Bias مدل می گویند:
  $
    \
    "Error"(d_1) , "Error"(d_2) , "Error"(d_3) = underbrace(E_0, "Bias") + "Minimum Achievable Error"
  $
  در این مثال، Bias محصول خط بودن مدل ها است.

]

#tool.definition()[
  Error به صورت رو به رو تعریف می شود:
  #h(2.7em)
  $"Error" = 1 - "Accuracy"$
]

#tool.definition()[
  Minimum Achievable Error: کمترین خطای ممکن برای هر مدل.
  مثلاً در مثال بالا، سهمی دارای Minimum Achievable Error صفر است.
]

#tool.tip()[
  مدل هایی خوب اند که Low Bias و Low Variance هستند.
  چرا که اگر پیچیدگی مدل را افزایش دهیم Bias آن کم می شود و تا یک جایی Variance اش متعادل می ماند اما از یک جایی به بعد، Bias کم و Variance زیاد می شود.
  مدل هایی خوب اند که Bias و Variance شان متعادل باشند.
]

#tool.tip()[
  Bias بالا و Variance بالا، دقت را تخریب می کنند و با یکدیگر Tradeoff دارند.
]
