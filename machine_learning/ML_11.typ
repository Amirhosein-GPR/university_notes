#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه یازدهم
== ساده یا پیچیده؟ مسأله این است! #emoji.face.think
#tool.tip()[
  گاهی نیاز است که برای حل بهینه مسأله، مدل خود را کمی پیچیده تر کنیم.
  مانند تصویر زیر:
  #tool.custom_figure(
    image("../images/ML/11_01.png", width: 58.5%),
    caption: "حل بهینه این مسأله کلاس بندی، نیازمند معادله ای درجه دو است.",
    inset: 1em,
  )
  اما گاهی اوقات افزایش پیچیدگی نتیجه عکس می دهد:
  #tool.custom_figure(
    image("../images/ML/11_02.png", width: 58.5%),
    caption: [در این جا مرز بندی دقیق باعث می شود تا نمونه تست به اشتباه در کلاس $C_2$ طبقه بندی شود. در حالی که اگر از مدل ساده تر خط استفاده می کردیم، با وجود خطاهای احتمالی، نمونه ما درست طبقه بندی می شد.],
    inset: 1em,
  )
]

#tool.question()[
  با توجه به بخش قبل، از کجا بفهمیم چه مدلی را باید انتخاب کنیم؟
]

#tool.true_answer()[
  + روش اول:
    قاعده ساده ای وجود دارد که بر اساس آن از ساده ترین مدل شروع می کنیم به امتحان کردن مدل.
    پیچیدگی مدل را تا زمانی افزایش می دهیم که به میزان خطای قابل قبول مد نظرمان برسیم.
  + روش دوم:
    از تکنیک Regularization استفاده می کنیم.
]

== Regularization
#tool.example()[
  مجموعه داده هایی با ویژگی ها و برچسب زیر داریم:
  $
    "Features": <x_0, x_1, x_2, dots, x_n> , "Label": y
  $
  این داده ها را می توان با مدل های مختلفی تحلیل کرد.

  معادله مدل خطی:
  $
    hat(y)^(<k>) = h(arrow(x)^(<k>)) = sum_(j=0)^n w_j x_j^(<k>)
  $
  معادله مدل غیر خطی:
  $
    hat(y) = h_2(arrow(x)) = sum_(j=0)^n w_j x_j + sum_(j=0)^n u_j x_j^2
  $
  برای مثال اگر داده ما ۳ ویژگی داشته باشد، معادله بالا به صورت زیر در می آید:
  $
    hat(y) = h_2(x) = w_0 x_0 + w_1 x_1 + w_2 x_2 + u_0 x_0^2 + u_1 x_1^2 + u_2 x_2^2
  $
  $
    E = underbrace(1 / (2 N) sum_(k=1)^N (y^(<k>) - hat(y)^(<k>))^2, display(E_1)) + underbrace(lambda sum_(j=0)^n u_j^2, display(E_2)) #h(1em) , #h(1em) lambda >= 100
    \
    (partial E) / (partial w) = (partial E_1) / (partial w) + (partial E_2) / (partial u)
  $
  در بالا، $lambda$ توسط ML Engineer تعیین می شود.
]

#tool.definition()[
  Regularization (تنظیم):
  به تنطیم کردن تأثیر جملات تابع خطای مدل که در اغلب مدل های یادگیری کاربرد دارد، Regularization می گوییم که ضریبی به نام $lambda$ دارد.
  $lambda$ عدد بزرگی است.
  مثلاً: $lambda >= 100$ به این معنا است که جمله با ضریب $lambda$، ۱۰۰ برابر تأثیر بیشتری در تابع خطا دارد نسبت به جمله ای که این ضریب را ندارد.
]

#tool.tip()[
  هر جایی که Gradient Descent وجود داشته باشد می توان از Regularization استفاده کرد.
]

== Hyper Parameters
#tool.list()[
  Hyper Parameter های زیر برای Train کردن، توسط ML Engineer تعیین می شوند:
  + Max-iteration
  + Learning Rate ($eta, alpha$)
  + Regularization Coefficient ($lambda_i$)
]

== Initial Momentum
#tool.reminder()[
  تابع به روز رسانی ای که در جلسه قبل تعریف کردیم، به شکل زیر بود:
  $
    w = w + overbrace(alpha (1 / N) sum_(k=1)^N (y^(<k>) - hat(y)^(<k>)) x^(<k>), display(Delta w))
    \
    w = w + Delta w
  $
]

#tool.definition()[
  فرض کنید مدلی به صورت زیر داریم:
  $
    y = w x
  $
  مقدار اولیه $w$ به صورت تصادفی تعیین می شود.
  فرض کنید مقدار اولیه آن ۰ باشد:
  $
    w = 0
  $
  در مرحله های بعدی با توجه به $Delta w$ ای که خواهیم داشت، $w$ جدید را تعیین می کنیم:
  $
    Delta w = 1 arrow w^("New") = 1
    \
    Delta w = 2 arrow w^("New") = 3
    \
    Delta w = 5 arrow w^("New") = 8
    \
    Delta w = -1 arrow w^("New") = 7
  $
  همان طور که در بالا مشاهده می شود، روند کلی $Delta w$ صعودی است.
  در گام آخر، شاید Data ما دچار Noise شده باشد یا Selection خوبی نداشته ایم که باعث شده $Delta w$ مقداری منفی و کاهشی به ما بدهد که باعث بر هم زدن روند کلی می شود.

  راه حل این است که از روش Initial Momentum استفاده کنیم که در آن $Delta w$ به صورت زیر محاسبه می شود:
  $
    Delta w_"Average"^(<t>) = (Delta w_"Average"^(<t - 1>) + Delta w^(<t>)) / 2
  $
]

#tool.example()[
  جدول زیر را در نظر بگیرید:
  #tool.custom_figure(
    caption: [همان گونه که مشاهده می شود، $w$ ای که با $Delta w_"Average"$ به دست می آید، تأثیر کمتری از تغییرات شدید می گیرد و پایدار تر است],
    kind: table,
    inset: 1em,
  )[
    #table(
      columns: 5,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      table.cell(fill: luma(230), $t$), table.cell(fill: luma(230), $Delta w$), table.cell(
        fill: luma(230),
        $Delta w_"Average"$,
      ), table.cell(fill: luma(230), $w$), table.cell(fill: luma(230), $w_"Old(بدون استفاده از میانگین گیری)"$),
      $0$, $0$, $0$, $0$, $0$,
      $1$, $1$, $display(1 / 2)$, $display(1 / 2)$, $1$,
      $2$, $2$, $1.25$, $1.75$, $3$,
      $3$, $5$, $3.12$, $4.9$, $8$,
      $4$, $-1$, $1.06$, $5.96$, $7$,
      table.cell(fill: luma(230), $t$), table.cell(fill: luma(230), $Delta w$), table.cell(
        fill: luma(230),
        $Delta w_"Average"$,
      ), table.cell(fill: luma(230), $w$), table.cell(fill: luma(230), $w_"Old(بدون استفاده از میانگین گیری)"$),
      $0$, $0$, $0$, $0$, $0$,
      $1$, $1$, $display(1 / 2)$, $display(1 / 2)$, $1$,
      $2$, $-1$, $display((-1) / 4)$, $display(1 / 4)$, $0$,
      $3$, $1$, $display(3 / 8)$, $display(5 / 8)$, $1$,
      $4$, $-1$, $display((-5) / 16)$, $display(5 / 16)$, $0$,
    )
  ]
  با توجه به جدول بالا، در می یابیم که زمانی که از $Delta w_"Average"$ استفاده می کنیم، نمودار هموار تر (Smooth تر) می شود.
  #tool.custom_figure(
    image("../images/ML/11_03.png", width: 53%),
    caption: [استفاده از $Delta w_"Average"$، حساسیت به تغییرات شدید را کمتر و نمودار را هموار تر می کند.],
    inset: 1em,
  )
]

== Non-parameteric Models
#tool.definition()[
  در این مدل ها، برای مدل سازی $hat(y)$ از یک مدل دارای پارامتر های مشخص (مانند: Bayesian، خط، Logistic Regression و مواردی همچون این ها)، استفاده *نمی شود*.
]
=== k-Nearest Neighbour (k-NN)
#tool.definition()[
  وقتی می خواهیم یک نمونه را کلاس بندی کنیم و نمی دانیم که به کدام کلاس تعلق دارد.
  می توانیم تعداد فردی از نزدیک ترین نمونه ها به آن را انتخاب کرده و آن را در کلاسی که اکثریت شان در آن قرار دارند، قرار دهیم.
  این روش، k-NN نام دارد.
  #tool.custom_figure(
    image("../images/ML/11_04.png", width: 60%),
    caption: "نمونه در کلاس مثبت طبقه بندی می شود. چرا که در نزدیکی آن ۳ نمونه با کلاس مثبت، در مقایسه با ۲ نمونه با کلاس منفی، وجود دارد.",
    inset: 1em,
  )
]

#tool.double_section()[
  #tool.tip()[
    خوبی روش k-NN آن است که ساده است و نتیجه خوبی می دهد.
    بدی روش k-NN سنگین بودن آن است.
    چرا که برای طبقه بندی نمونه تست، باید تمامی نمونه های آموزشی را در حافظه داشته باشیم.
    بر خلاف روش های پارامتری که بعد از آموزش، تنها پارامتر های آن ها را نگه می داشتیم.
  ]
][
  #tool.example()[
    برای مدل های زیر، نیاز به نگهداری موارد زیر است:
    #set text(dir: ltr)
    #set math.equation(numbering: none)
    + Bayes Gaussian:
      $ | mu_1, mu_2, sigma_1, sigma_2 | = 4 $
    + k-NN:
      $ &| x^(<1>), x^(<2>), x^(<3>), dots, x^(<N>) | \ &= "Sample Size" $
    #v(0.2em)
  ]
]

#tool.tip()[
  به روش k-NN، روش Lazy Learning نیز می گویند.
  چرا که در این روش، گام Training وجود ندارد و تمامی کار هایش را زمانی که نمونه تست را باید بررسی کند، انجام می دهد.
]

=== r-NN
#tool.definition()[
  روشی شبیه به k-NN به نام r-NN وجود دارد که در آن دایره ای به شعاع r رسم می شود و هر آن چه درون این دایره بیافتد، برای کلاس بندی بررسی می شود.
]

#tool.tip()[
  مشکلی که در روش r-NN وجود دارد این است که تعداد نمونه هایی که درون دایره می افتند دیگر دست ما نیست و ممکن است تعداد آن ها زوج شود و اگر مثلاً دو کلاس داشته باشیم که نصف نمونه های آموزشی درون دایره به یک کلاس و نصف دیگر به کلاس دیگر تعلق داشته باشد، نمی توانیم تشخیص دهیم که نمونه تست به کدام کلاس تعلق دارد.
]

=== Case-Based Reasoning (1NN)
#tool.definition()[
  الگوریتمی منشعب از k-NN است که معادل 1NN می باشد.
  به این معنا که نزدیک ترین همسایه خود را پیدا کرده و Label آن را به عنوان پاسخ بر می گرداند.
]

== کم کردن هزینه k-NN
=== الگوریتم Quad Tree Decomposition
#tool.definition()[
  برای کم کردن هزینه روش k-NN (در حالت دو بعدی)، کل داده های آموزشی را به شکل یک ماتریس در می آوریم (@image_11_02).
  سپس این ماتریس را به دو بخش افقی تقسیم می کنیم. بخش پایین کاملاً مثبت است و تنها به کلاس مثبت تعلق دارد.
  به همین دلیل به جای آن که کل بخش پایین نگه داشته شود، کافی است این نکته که هر آن چه که در نیمه پایینی ماتریس است، مثبت می باشد، را ذخیره کنیم.
  به همین ترتیب نیمه بالایی ماتریس را نیز به دو بخش چپ و راست تقسیم کرده و این تقسیم های عمودی و افقی را در هر بخش آن قدر ادامه می دهیم تا ماتریس به بخش هایی تقسیم شود که تمامی نمونه های درون آن بخش ها متعلق به یک کلاس باشد.
  به هر یک از این بخش ها، Hyper Cube می گویند:
  $
    "Hyper Cubes" = {R_1, R_2, R_3, R_4, R_5, R_6}
  $
  در نهایت کافی است که تنها مختصات این ۶ ناحیه و این که هر یک به چه کلاسی تعلق دارند را در حافظه نگه داریم.
  #tool.custom_figure(
    caption: "ماتریس داده های آموزشی که با روش QTD به ۶ ناحیه تقسیم شده اند. در نهایت تنها اطلاعات مربوط به این ۶ ناحیه نگه داشته می شوند.",
    inset: 1em,
    refrence: <image_11_02>,
  )[
    #set circle(radius: 0.95em)
    #place(
      dx: 8em,
      dy: 0.5em,
      [
        #place(dy: -0.5em, $R_1$)
        #rotate(90deg, $lr(\{, size: #3.5em)$)
      ],
    )
    #place(
      dx: 11.95em,
      dy: 0.5em,
      [
        #place(dy: -0.5em, $R_2$)
        #rotate(90deg, $lr(\{, size: #3.5em)$)
      ],
    )
    #place(
      dx: 15.9em,
      dy: 0.5em,
      [
        #place(dy: -0.5em, $R_3$)
        #rotate(90deg, $lr(\{, size: #3.5em)$)
      ],
    )
    #place(
      dx: 19.8em,
      dy: 0.5em,
      [
        #place(dy: -0.5em, $R_4$)
        #rotate(90deg, $lr(\{, size: #3.5em)$)
      ],
    )
    #v(2.5em)
    #place(
      dx: 5.25em,
      dy: 4.7em,
      [
        #place(dx: -1.5em, dy: 0.75em, $R_5$)
        $lr(\{, size: #3.5em)$
      ],
    )
    #table(
      columns: 4,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      table.cell(fill: red_color.lighten(60%), circle($-$)), table.cell(
        fill: green_color.lighten(60%),
        circle($+$),
      ), table.cell(fill: blue_color.lighten(60%), circle($+$)), table.cell(
        fill: orange_color.lighten(60%),
        circle($-$),
      ),
      table.cell(fill: brown_color.lighten(60%), circle($-$)), table.cell(
        fill: brown_color.lighten(60%),
        circle($-$),
      ), table.cell(fill: blue_color.lighten(60%), circle($+$)), table.cell(
        fill: orange_color.lighten(60%),
        circle($-$),
      ),
      table.cell(fill: purple_color.lighten(60%), circle($+$)), table.cell(
        fill: purple_color.lighten(60%),
        circle($+$),
      ), table.cell(fill: purple_color.lighten(60%), circle($+$)), table.cell(
        fill: purple_color.lighten(60%),
        circle($+$),
      ),
      table.cell(fill: purple_color.lighten(60%), circle($+$)), table.cell(
        fill: purple_color.lighten(60%),
        circle($+$),
      ), table.cell(fill: purple_color.lighten(60%), circle($+$)), table.cell(
        fill: purple_color.lighten(60%),
        circle($+$),
      ),
    )
    #v(2.5em)
    #place(
      dx: 13.9em,
      dy: -8.5em,
      [
        #place(dy: 7.9em, $R_6$)
        #rotate(-90deg, $lr(\{, size: #15em)$)
      ],
    )
  ]
]

#tool.tip()[
  از الگوریتم k-NN می توان برای بررسی این که آیا مسأله مورد نظر ما به جواب می رسد یا خیر، استفاده کرد.
  به این صورت که ابتدا آن را اجرا می کنیم.
  اگر جواب خوبی داد، یعنی با مدل های پارامتری نیز ممکن است به این حد از دقت برسیم.
]

#tool.tip()[
  Hyper Parameter الگوریتم k-NN، همان k و Hyper Parameter الگوریتم r-NN، همان r است.
]
