#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه بیستم
== Reinforcement Learning
#tool.reminder()[
  در جلسه قبل یاد گرفتیم که Policy به ما می گوید که در هر State ای چه Action ای انجام دهیم و از روی $Q(s, a)$ می توان Policy را ساخت.
  $
    Q(s, a) = r + gamma sum_(s') p(s' | s, a) V(s')
  $
]
=== Q-Learning
#tool.definition()[
  برای ساخت Q، از الگوریتم های Q-Learning استفاده می شود.
  وقتی محیط را نمی شناسیم، با کاوش در محیط، دید محدودی از محیط را به دست آورده و به کمک آن Q را به دست می آوریم.
]

#tool.example()[
  #tool.custom_figure(
    image("../images/ML/20_01.png", width: 55%),
    caption: "Agent ای درون یک محیط",
    inset: 1em,
  )
  Agent ای به نام A درون یک محیط ناشناخته و در حالت S قرار دارد.
  اعمال ممکن توسط این Agent نیز حرکت در ۴ جهت اصلی است.
  برای آن که Agent، محیط (شامل State ها، ارزش State ها و ارزش Action ها) را بشناسد، به صورت تصادفی اعمالی را انجام می دهد.

  برای مثال عمل حرکت به سمت راست را در حالت S انجام می دهد:
  $
    S, "Right" arrow S' cases("Left", "Right", "Up", "Down")
  $
  Agent با انجام Action بالا به حالت $S'$ رفته و Reward ای را از محیط دریافت می کند.

  با توجه به فرمول $Q(s, a)$ وقتی عملی را در حالت $S$ انجام داده و به حالت $S'$ می رویم، دید بهتری نسبت به حالت قبلی ($S$) پیدا می کنیم:
  $
    Q(s, a) tilde r + gamma limits(max Q )_(a') (s', a')
  $
]

#tool.definition()[
  می توان $Q(s, a)$ را به صورت زیر نیز تعریف کرد:
  $
    Q(s, a) = Q(s, a) + eta [overbrace(r + gamma limits(max Q)_(a')(s', a'), "سود لحظه ای قابل محاسبه") - overbrace(Q(s, a), "ارزش قبلی")]
  $ <equation_20_04>
  اگر حاصل قسمت داخل براکت فرمول بالا مثبت باشد، یعنی سودی که از انجام عمل a به دست می آوریم، از برآورد قبلی مان بهتر است.
  یعنی وضعیت فعلی را می توان بهبود داد.
  اگر صفر باشد، سودی که از عمل a به دست می آوریم فرقی با برآورد قبلی مان ندارد و اگر منفی باشد، بدتر است.
  #tool.custom_figure(
    image("../images/ML/20_03.png"),
    caption: "الگوریتم Q-Learning",
    inset: 1em,
  )
]

#tool.tip()[
  پس به طور خلاصه در Q-Learning وقتی که محیط را نمی شناسیم، از State ای که در آن هستیم یک Action ای را انجام می دهیم.
  بابت آن Action یک Reward ای به دست می آوریم و به State جدیدی وارد می شویم و در نهایت بیشترین ارزش Action ها را به دست می آوریم.
]

=== #text(fill: red_color)[S]#text(fill: orange_color)[A]#text(fill: green_color)[R]#text(fill: blue_color)[S]#text(
  fill: purple_color,
)[A]
#tool.definition()[
  @equation_20_04 را می توان بهتر و واقع گرایانه تر کرد:
  $
    Q(s, a) = Q(s, a) + eta [r + gamma Q(s', a') - Q(s, a)]
  $ <equation_20_05>
  فرمول بالا مربوط به الگوریتم #text(fill: red_color)[S]#text(fill: orange_color)[A]#text(fill: green_color)[R]#text(fill: blue_color)[S]#text(fill: purple_color)[A] است.
  این الگوریتم مخفف عبارت زیر می باشد:
  #align(center)[
    #text(fill: red_color)[S]tate #text(fill: orange_color)[A]ction #text(fill: green_color)[R]eward #text(fill: blue_color)[S]$'$tate #text(fill: purple_color)[A]$'$ction #sym.arrow #text(fill: red_color)[S]#text(fill: orange_color)[A]#text(fill: green_color)[R]#text(fill: blue_color)[S]#text(fill: purple_color)[A]
  ]
  $a'$ برای مثال می تواند از الگوریتم Selection ای به نام greedy-$epsilon$ به دست آید.
  تفاوت @equation_20_05 با @equation_20_04 در این است که به جای ماکزیمم گیری، از یک عملِ نمونه استفاده کردیم.
  #tool.custom_figure(
    image("../images/ML/20_04.png"),
    caption: [الگوریتم #text(fill: red_color)[S]#text(fill: orange_color)[A]#text(fill: green_color)[R]#text(fill: blue_color)[S]#text(fill: purple_color)[A]],
    inset: 1em,
  )
]

#tool.example()[
  مثال @equation_20_04:
  فردی می خواهد درباره تحصیل در رشته کامپیوتر تحقیق کند.
  برای این کار از تمامی افراد ممکن در این حوزه حقوقشان را می پرسد و ماکزیمم حقوقی را که به عنوان پاسخ دریافت می کند، برای پیش بینی آینده اش، ملاک می گیرد.

  مثال @equation_20_05:
  فردی می خواهد درباره تحصیل در رشته کامپیوتر تحقیق کند.
  از یک فردی که رشته کامپیوتر خوانده حقوقش را می پرسد و پاسخ "ماهانه ۱۶ میلیون تومان" را دریافت می کند.
  در اینجا فردی که دارد تحقیق می کند و بر اساس آن می خواهد آینده خود را پیش بینی کند همان $S$ است و فردی که حقوق خود را گفته همان $S'$ است.
  از طرفی ممکن است اگر همین سؤال را از فرد دیگری در این رشته بپرسد با پاسخ "ماهانه ۸۰ میلیون تومان" مواجه شود.
  به این ترتیب پیش بینی آن بر اساس نمونه حقوقی که دیده است، تغییر می کند.
]

#tool.tip()[
  شانس انتخاب بهترین عمل در الگوریتم greedy-$epsilon$ برابر زیر است:
  $
    epsilon + (1 - epsilon) times (1 / {a_1, a_2, dots, a_m})
  $
  در فرمول بالا به احتمال $epsilon$ بهترین عمل و به احتمال $1-epsilon$ به صورت شانسی یکی از عمل ها انتخاب می شود.
]

=== Eligibility Traces
#tool.question()[
  الگوریتم greedy-$epsilon$ مشکلی دارد.
  شکل زیر را در نظر بگیرید.
  فرض کنید در هر دو State، الگوریتم Selection ما greedy-$epsilon$ است.

  #tool.custom_figure(
    image("../images/ML/20_02.png", width: 50%),
    caption: [دو حالت $S$ و $S'$ که با عمل های $a$ و $a'$ بین آن ها در حرکتیم.],
    inset: 1em,
  )

  فرض کنید از حالت $S$ شروع به حرکت می کنیم.
  طبق @equation_20_05 و الگوریتم greedy-$epsilon$ ،عمل $a$ با پاداش ۱۰۰ انجام می شود و ما را به حالت $S'$ می برد.
  در حالت $S'$ نیز عمل $a'$ با پاداش ۰ انجام می شود و ما را به حالت $S$ بر می گرداند.
  به این ترتیب ارزش های زیر برای انجام دو عمل $a$ و $a'$ به دست می آیند (فرض کنید $eta, gamma = 1$):
  $
    \
    Q(s, a) = Q(s, a) + eta [underbrace(r, "پاداش عمل") + gamma underbrace(Q(s', a'), "پاداش عمل" tilde "ارزش حالت") - Q(s, a)]
    \
    Q(s, a) = underbrace(100, a "پاداش عمل") + underbrace(0, s' "ارزش حالت") = 100
    \
    Q(s', a') = underbrace(0, a' "پاداش عمل") + underbrace(100, s "ارزش حالت") = 100
  $
  به این ترتیب، هر دو عمل به صورت بی نهایت تکرار می شوند، گویی که در یک حلقه گیر افتادیم.
  راه حل این مشکل چیست؟
]

#tool.true_answer()[
  رکوردی از State هایی (Action هایی) که قبلاً ملاقات کردیم را در قالب جدولی به نام جدول Eligibility (به اختصار $e$) نگه می داریم.
  جدول $e$ مانند جدول $Q$ متشکل از $(s, a)$ است.
]

#tool.definition()[
  Eligibility Trace:
  در State فعلی، مقدار s و a را برابر با ۱ قرار بده.
  در غیر این صورت، جدول جدید e را از روی جدول e لحظه قبل بساز:
  $
    e_t (s, a) = cases(1 &"if" s = s_t "and" a = a_t, gamma lambda e_(t-1)(s, a) &"Otherwise")
  $
  $lambda$، ضریب Eligibility است که عددی بین ۰ و ۱ است.
  $gamma$ هم همان $gamma$ ای است که داشتیم.

  فرض کنیم $gamma = lambda = 0.9$.
  به این ترتیب هر بار مقدار e خانه هایی که در آن ها نیستیم در ۰/۸۱ ضرب می شود.
  یعنی رفته رفته کوچک تر می شوند.

  جمله به روز رسانی به صورت زیر است که مشابه بخشی از @equation_20_05 است:
  $
    delta_t = r_(t+1) + gamma Q(s_(t+1), a_(t+1)) - Q(s_t, a_t)
  $
  در نهایت برای به روز رسانی $Q(s_t, a_t)$ به صورت زیر عمل می کنیم:
  $
    Q(s_t, a_t) = Q(s_t, a_t) + eta delta_t e_t (s, a), forall s, a
  $
]

=== Deep Reinforcement Learning
#tool.definition()[
  از نظر ساختمان داده، جنس Q و E ماتریس و جنس $lambda$ اسکالر است.
  مهم ترین مشکل ما اندازه Q است.
  در مسائلی مانند شطرنج، اندازه Q خیلی بزرگ است.

  به همین دلیل باید برای مثال تابع یا شبکه ای بنویسیم که s و a را به عنوان ورودی بگیرد و $Q(s, a)$ را به عنوان خروجی به ما برگرداند.
  پس ماشینی به شکل زیر می سازیم:
  $
    s, a arrow #rect(width: 2em, height: 2em) arrow Q(s, a)
  $
  این ماشین هر Regressor ای می تواند باشد.
  مثلاً یک خط رگرسیون یا یک درخت رگرسیونی یا یک شبکه عصبی باشد.
  اگر شبکه عصبی، یک شبکه عصبی عمیق باشد، به آن Deep Reinforcement Learning می گوییم.
]
