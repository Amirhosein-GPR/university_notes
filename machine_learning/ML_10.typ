#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه دهم
== روش تحلیلی حل معادلات رگرسیون خطی
<section_10_01>
#tool.reminder()[
  روشی تحلیلی برای حل معادلات رگرسیون خطی:
  $
    overbrace(Y, "True Labels") = overbrace(W, "Parameters") underbrace(X, "Features Values")
    \
    W = Y underbrace(X^T (X X^T)^(-1), "شبه معکوس X")
  $
]

== روشی دیگر برای حل معادلات رگرسیون خطی
#tool.definition()[
  فرض کنید معادله ای به شکل زیر داریم:
  $
    y^(<k>) = w_0 x_0^(<k>) + w_1 x_1^(<k>) + dots + w_n x_n^(<k>) = sum_(j=0)^n w_n x_n^(<k>)
  $
  آن گاه می توان تابع خطا را به شکل زیر تعریف کرد:
  $
    E_arrow(w) = sum_(k=1)^N (y^(<k>) - hat(y)^(<k>))^2 , arrow(w) = [w_0, w_1, dots, w_n]
  $
  $
    E = sum_(k=1)^N (y^(<k>) - sum_(j=0)^n w_j x_j^(<k>))^2
  $
  همانطور که مشاهده می شود، تابع بالا یک تابع درجه دو است که به این معناست که همواره $E >= 0$.
  حالت ایده آل این است که مینیمم این تابع را پیدا کنیم.
  مینیمم تابع هم با مشتق گرفتن از آن و برابر قرار دادنش با مقدار ۰ به دست می آید.
  در ادامه مشتق این تابع نسبت به $w_0$ را می گیریم:
  $
    (partial E) / (partial w_0) = sum_(k=1)^N 2 (y^(<k>) - sum_(j=0)^n w_j x_j^(<k>)) (-x_0^(<k>))
  $
  و آن را برابر با ۰ قرار می دهیم:
  $
    -2 sum_(k=1)^N (y^(<k>) - sum_(j=0)^n w_j x_j^(<k>)) x_0^(<k>) = 0
  $
  با ساده سازی معادله بالا، در نهایت تعدادی معادله برای $w_0$ تا $w_n$ به دست می آید.
]
=== خطای جمعی مجموعه ای از پارامتر های $w$
#tool.definition()[
  این خطا مستقل از تعداد نمونه ها است و رسیدن به مینیمم این خطا، به جای مشتق گرفتن و برابر ۰ قرار دادن، با روشی Iterative انجام می شود:
  $
    E_arrow(w) = 1 / (2 N) sum_(k=1)^N (y^(<k>) - sum_(j=0)^n w_j x_j^(<k>))^2
  $
]

#tool.tip()[
  حرکت در جهت مشتق یا حرکت در جهت گرادیان تابع، مقدار آن را بهبود می بخشد.
]

#tool.example()[
  در تصویر زیر، اگر از نقطه $x^(<4>)$ به سمت نقطه $x^(<4>) + epsilon f^' (x^(<4>)) $ حرکت کنیم:
  $
    x^(<4>) arrow x^(<4>) + epsilon f^' (x^(<4>)) arrow.curve.b
    \
    f(x^(<4>)) <= f(x^(<4>) + epsilon underbrace(f^' (x^(<4>)), > 0))
  $
  و برای نقطه $x^(<2>)$ نیز:
  $
    x^(<2>) + epsilon underbrace(f^' (x^(<2>)), < 0) < x^(<2>)
  $
  #tool.custom_figure(
    image("../images/ML/10_01.jpg"),
    caption: [اگر به مقدار کمی $x^(<4>)$ را با مشتق آن جمع کنیم، حاصل جمع، بزرگتر از مقدار $x^(<4>)$ خواهد بود و اگر به مقدار کمی $x^(<2>)$ را با مشتق آن جمع کنیم، حاصل جمع، کوچک تر از مقدار $x^(<2>)$ خواهد بود.],
    inset: 1em,
  )
]

#tool.tip()[
  با توجه به مثال قبل، اگر مشتق مقداری مثبت باشد:

  اگر در جهت آن حرکت کنیم، به سمت ماکزیمم تابع و اگر در خلاف جهت آن حرکت کنیم، به سمت مینیمم تابع خواهیم رفت.
]

=== الگوریتم Gradient Descent
#tool.definition()[
  الگوریتم گرادیان کاهشی (Gradient Descent): الگوریتمی است Iterative که بر اساس مشتق تابع خطا کار می کند و مسیر حرکت به سمت نقطه مینیمم را تعیین می کند.
  اگر پارامتر تابع خطا، $w$ باشد، می توانیم از یک $w_0$ ای به صورت تصادفی شروع به حرکت کنیم.
  $
    E #h(0.5em) alpha #h(0.5em) w
  $
  قاعده به روز رسانی این الگوریتم به صورت زیر می باشد:
  $
    w^(<t+1>) = w^(<t>) - eta (partial E) / (partial w)
  $

  که در بالا $eta$ (اتا) همان سرعت یا نرخ یادگیری (Learning Rate) می باشد.

  #tool.custom_figure(
    image("../images/ML/10_02.png", width: 70%),
    caption: [ابتدا $w$ ای را به صورت تصادفی انتخاب کرده، سپس مشتق آن را حساب می کنیم و بر اساس مثبت یا منفی بودن آن حرکت می کنیم.],
    inset: 1em,
  )

  $
    (partial E) / (partial w_j) = - 1 / N sum_(k=1)^N x_j^(<k>) ( y^(<k>) - overbrace(sum_(j=0)^N w_j x_j^(<k>), display(hat(y)^(<k>))) )
  $
  $
    (partial E) / (partial w_j) = - 1 / N sum_(k=1)^N x_j^(<k>) (y^(<k>) - hat(y)^(<k>))
  $
  $y^(<k>)$ مقدار واقعی مربوط به یک نمونه و $hat(y)^(<k>)$ مقداری است که برای آن حساب کردیم.
]

==== پیاده سازی الگوریتم Gradient Descent
#tool.definition()[
  پیاده سازی این الگوریتم به صورت زیر است:
  #tool.custom_figure(
    caption: "پیاده سازی الگوریتم Gradient Descent",
    kind: raw,
    inset: 1em,
  )[
    ```
    // Gradient Descent Algorithm
    function GD(Input: X, Y; Output: W) {
      m, n = size(X) // X_(m x n)
      iteration = 0, max_iteration = 1000
      [w_0, w_1, w_2, ..., w_n] = small random values

      Repeat {
        dw = [0, 0, ..., 0]_(1 x n), eta = 0.0001
        for k = 1 to m {
          // Calcualting x and w vectors' dot products
          // yhat is a scalar
          yhat = x^(<k>) . w
          dw = dw + x^(<k>) . (y^(<k>) - yhat)
        }
        dw = dw / m
        w = w + eta * dw
        iteration = iteration + 1
        // tau is the threshold
        // ||dw|| is the norm of dw
      } Until E(w) <= tau || iteration >= max_teration || ||dw|| >= epsilon
      return w
    }
    ```
  ]

  #tool.custom_figure(
    caption: [ابعاد ماتریس ورودی $X$ که با $m$ و $n$ نشان داده می شوند.],
    kind: table,
    inset: 1em,
  )[
    \
    #place(dx: 12.85em, dy: -1.7em, $n$)
    #v(0.5em)
    #place(dx: 12.7em, dy: -4.25em, $#rotate(90deg, $lr(\{, size: #9em)$)$)
    #table(
      columns: 4,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      $x_0$, $x_1$, $x_2$, $y$,
      "", "", "", "",
      "", "", "", "",
      "", "", "", "",
    )
    #place(dx: 6.5em, dy: -7.5em, $m lr(\{, size: #8em)$)
  ]
]

==== خوبی ها و بدی های Gradient Descent
#tool.tip()[
  الگوریتم Gradient Descent برای رگرسیون خطی، بهترین نقطه ممکن را پیدا می کند.
]

#tool.list()[
  ایراد های الگوریتم Gradient Descent:
  + اندازه گام های آن متناسب با مشتق تعیین می شود.
  + الگوریتمی حریصانه است و لزوماً Global Minimum را پیدا نمی کند.
  + تابع خطای مدل که الگوریتم بر روی این تابع اجرا می شود، باید پیوسته و مشتق پذیر باشد.
]

#tool.example()[
  الگوریتم Gradient Descent را بر روی تابع خطایی به دو حالت شکل زیر می توان اعمال کرد:
  #tool.custom_figure(
    image("../images/ML/10_03.png", width: 70%),
    caption: "الگوریتم Gradient Descent لزوماً Global Minimum را پیدا نمی کند چرا که وابسته به مکانی است که حرکت از آن شروع می شود.",
    inset: 1em,
  )
]

#tool.tip()[
  مشکل Local Minimum الگوریتم Gradient Descent را می توان با شروع دوباره آن، تا حدی حل کرد.
  چرا که هر بار از نقطه ای تصادفی شروع به حرکت می کند و در نهایت به بهترین Minimum ای که با N بار اجرای الگوریتم می توان به آن رسید، می رسد که در مواردی *ممکن است* همان Global Minimum باشد.
]

#tool.list()[
  روش های کم اثر کردن مسأله Local Minimum:
  + تست چندین نقطه شروع و انتخاب بهترین جواب Minimum بین آن ها.
  + الگوریتم مورد نظر را به رگرسیون خطی تبدیل کرده و Global Minimum را پیدا می کنیم.
]

#tool.comparision()[
  در مقایسه الگوریتم Gradient Descent و روشی که در @section_10_01[بخش] یادآوری شد، روش @section_10_01[بخش] روشی Deterministic است.
  چرا که زمان ضرب و جمع های این الگوریتم توسط CPU را تحت شرایطی می توان حساب کرد.
  اما روش Gradient Descent روشی Stochastic و Iterative می باشد و همگرایی آن وابسته به انتخاب پارامتر ها و مقدار تصادفی اولیه است.
  بنابراین الگوریتم Gradient Descent، زمان بر تر و پر هزینه تر از الگوریتم @section_10_01[بخش] است.
]

#tool.tip()[
  با وجود زمان بر تر و پر هزینه تر بودن الگوریتم Gradient Descent، به دلیل این که برای همه مدل ها و تابع خطاهایی که پیوسته و مشتق پذیر اند، قابل استفاده است، از آن استفاده می کنیم.
  البته حتی در صورتی که از تابع خطا به صورت مستقیم نتوان مشتق گرفت، مشتق عددی آن را حساب می کنیم.
  اما الگوریتم @section_10_01[بخش] برای رگرسیون خطی استفاده می شود.
]

#tool.tip()[
  به طور خلاصه الگوریتم Gradient Descent، الگوریتمی عمومی تر و قابل تعمیم تر است و برای هر نوع مدلی قابل استفاده است.
]

== Logistic Regression Model
#tool.reminder()[
  Linear Regression به صورت زیر تعریف می شد:
  $
    y^(<k>) = sum_(j=0)^n w_j x_j^(<k>)
  $
]

#tool.definition()[
  Logistic Regression به صورت زیر تعریف می شود:
  $
    y^(<k>) = 1 / (1 + e^display(-sum_(j=0)^n w_j x_j^(<k>)))
  $ <equation_10_14>
  در این مدل:
  $
    y^(<k>) in (0, 1)
  $
  یعنی $y^(<k>)$ هیچ گاه خود ۱ یا خود ۰ نمی شود.

  اگر:
  $
    sum_(j=0)^n w_j x_j^(<k>)
  $
  را معادل $v$ در نظر بگیریم، به معادله و نمودار زیر می رسیم:
  $
    y^(<k>) = 1 / (1 + e^(-v))
  $
  #tool.custom_figure(
    image("../images/ML/10_04.png"),
    caption: [اگر $v$ به بی نهایت میل کند، $y$ به یک میل می کند؛ و اگر $v$ به منفی بی نهایت میل کند، $y$ به صفر میل می کند.],
    inset: 1em,
    refrence: <image_10_04>,
  )
  //TODO:
  با مشتق گرفتن از @equation_10_14، به معادله زیر می رسیم:
  $
    \
    (partial y) / (partial w_j) &= (0 times dots - 1 times (x_j^(<k>) e^display(-sum_(j=0)^n w_j x_j^(<k>)))) / (
      1 + e^display(-sum_(j=0)^n w_j x_j^(<k>))
    )^2
    \
    &= -x_j^(<k>) #h(1em) times #h(1em) 1 / (1 + e^display(-sum_(j=0)^n w_j x_j^(<k>))) #h(1em) times #h(1em) (e^display(-sum_(j=0)^n w_j x_j^(<k>))) / (1 + e^display(-sum_(j=0)^n w_j x_j^(<k>)))
  $
  #place(dx: -12em, dy: -5.75em, rect(width: 9em, height: 5em, stroke: (dash: "densely-dash-dotted"), radius: 0.5em))
  #place(dx: -0.9em, dy: -7.8em, rect(width: 9em, height: 7em, stroke: (dash: "densely-dash-dotted"), radius: 0.5em))
  #v(2em)
  #place(dx: -15em, dy: -2em, $y^(<k>)$)
  #place(dx: -3em, dy: -2em, $1 - y^(<k>)$)
  $
    (partial y) / (partial w_j) = -x_j y (1- y)
  $
  با نگاه به فرمول بالا می توان فهمید که مشتق تابع $y$، با خود تابع $y$ بیان می شود.
]

#tool.definition()[
  تابع خطای Logistic Regression به صورت زیر تعریف می شود (RMS Error for Logistic Regression):
  $
    E = 1 / (2 N) sum_(k=1)^N (y^(<k>) - hat(y)^(<k>))^2
  $
  $
    w arrow.l w - eta (partial E) / (partial w)
  $
  <equation_10_22>
  $
    (partial E) / (partial w) &= 1 / N sum_(k=1)^N (y^(<k>) - hat(y)^(<k>)) (partial ( y^(<k>) - hat(y)^(<k>) )) / (partial w)
    \
    &= -1 / N sum_(k=1)^N (y^(<k>) - hat(y)^(<k>)) (partial hat(y)^(<k>)) / (partial w)
    \
    &= -1 / N sum_(k=1)^N (y^(<k>) - hat(y)^(<k>)) x_j hat(y)^(<k>)(1 - hat(y)^(<k>))
  $
  <equation_10_23>
  $
    0 < hat(y)^(<k>)(1 - hat(y)^(<k>)) < 0.25
  $
  با توجه به @equation_10_23، @equation_10_22 به شکل زیر در می آید:
  $
    w arrow.l w + eta / N sum_(k=1)^N (y^(<k>) - hat(y)^(<k>)) x_j^(<k>) (hat(y)^(<k>))(1 - hat(y)^(<k>))
  $
  از آن جایی که $(hat(y)^(<k>))(1 - hat(y)^(<k>))> 0$ است، می توان آن را به عنوان یک ضریب مثبت در نظر گرفت.
  اگر این ضریب را برداریم گویی که $eta$ را بزرگ تر کرده ایم.
  به همین دلیل می توان $w$ ای به نام $"Polished" w$ به شکل زیر تعریف کرد:
  $
    "Polished" w: w arrow.l w + eta 1 / N sum_(k=1)^N x_j^(<k>) (y^(<k>) - hat(y)^(<k>))
  $
  با نگاه به فرمول بالا می توان فهمید که این فرمول، همان قاعده به روز رسانی $w$ در رگرسیون خطی می باشد.
  تنها فرق آن این است که $hat(y)$ در رگرسیون خطی، از تابع خطی به دست می آید اما در رگرسیون لاجستیک از تابع لاجستیک به دست می آید.
]
