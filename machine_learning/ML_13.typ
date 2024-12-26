#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه سیزدهم
== شبکه های عصبی در یادگیری ماشین
=== بخش های تشکیل دهنده یک شبکه عصبی
#tool.reminder()[
  شبکه های عصبی مصنوعی برگرفته از ساختار سلول های عصبی مغز انسان هستند.
  #tool.custom_figure(
    image("../images/ML/13_01.png"),
    caption: "سمت چپ نورون های مغز و سمت راست برداشت ما از آن ها را نشان می دهد.",
    inset: 1em,
  )
]

#tool.double_section()[
  #tool.tip()[
    در شبکه های عصبی، از الگوریتم و داده های آموزشی خاصی استفاده می شود تا وزن ها یاد گرفته شوند.
    قسمت $Sigma$ و Activation Function توسط ML Engineer تعیین می شود.
  ]
][
  #tool.tip()[
    در شبکه های عصبی، تابع فعال سازی یک عدد اسکالر را به عنوان ورودی می گیرد و یک عدد اسکالر را به عنوان خروجی می دهد.
    #v(1.6em)
  ]
]

#tool.tip()[
  مغز از ساختار پیچیده ای تشکیل شده است.
  اما برای شبکه های عصبی در یادگیری ماشین، مدل ساده تری که ساختاری لایه ای دارد، می سازیم:
  #tool.custom_figure(
    image("../images/ML/13_02.png", width: 79%),
    caption: "شبکه عصبی طبیعی (چپ) و شبکه عصبی مصنوعی (راست).",
    inset: 1em,
  )
]

#tool.definition()[
  Net Input: ورودی خالص یک نورون را Net Input می گویند.
  $
    v = sum_(i=0)^n w_i x_i
  $
]

#tool.list()[
  انواع Activation Function ها:
  + Step Function / Hard Limit: تابع فعال سازی آن به صورت زیر است:
    $
      f(x) = cases(
        1 #h(2em) x >= 0,
        0 #h(2em) x < 0
      )
    $
    #tool.custom_figure(
      image("../images/ML/13_12.png"),
      caption: [Step Function],
      inset: 1em,
    )

  + Logistic Regression / Sigmoid: تابع فعال سازی آن به صورت زیر است:
    $
      f(x) = 1 / (1 + e^(-x))
    $ <equation_13_03>
    #tool.custom_figure(
      image("../images/ML/10_04.png"),
      caption: [تابع Logistic Regression که در @image_10_04 آورده شده بود.],
      inset: 1em,
    )

  + Linear Function: تابع فعال سازی آن به صورت زیر است:
    $
      f(x) = a x + b
    $

  + Identity Fucntion: تابع فعال سازی آن به صورت زیر است:
    $
      f(x) = x
    $

  + Tangent Hyperbolic: تابع فعال سازی آن به صورت زیر است:
    $
      f(x) = (e^x - e^(-x)) / (e^x + e^(-x))
    $
]

=== Basic Architectures
==== Perceptron
#tool.definition()[
  شبکه ای عصبی است که از دو لایه، شامل یک لایه ورودی و یک لایه خروجی تشکیل شده است.
  #tool.custom_figure(
    image("../images/ML/13_03.png"),
    caption: "شبکه عصبی Perceptron از یک لایه ورودی و یک لایه خروجی تشکیل شده است. Constant موجود در شکل، همان Bias شبکه است.",
    inset: 1em,
  )
]

==== Logistic Regression
#tool.definition()[
  #tool.custom_figure(
    image("../images/ML/13_04.png", width: 55%),
    caption: "شبکه عصبی Logistic Regression",
    inset: 1em,
  )
]

#tool.tip()[
  دقت شود که شبکه Logistic Regression با Perceptron تفاوت دارد.
  چرا که تابع شبکه Logistic Regression بر خلاف تابع شبکه Perceptron، مشتق پذیر است.
]

==== Extreme Learning Machines (ELM)
#tool.definition()[
  شبکه ای عصبی است که از سه لایه، شامل یک لایه ورودی، یک لایه میانی یا مخفی و یک لایه خروجی تشکیل شده است.
  #tool.custom_figure(
    image("../images/ML/13_05.png", width: 79%),
    caption: "شبکه عصبی Extreme Learning Machines",
    inset: 1em,
  )
  در این شبکه دو مجموعه وزن $w$ و $beta$ داریم که باید مشخص شوند.
  یادگیری $beta$ ها آسان است چرا که خروجی نورونی که به آن متصل می شوند را داریم.
  از طرفی چون خروجی نورون های لایه مخفی را نداریم، نمی توانیم وزن $w$ ها را با فرآیند یادگیری به دست آوریم.
  اما خوشبختانه در این شبکه وزن $w$ ها به صورت تصادفی تعیین می شوند و نیازی به یادگیری آن ها نیست.
]

#tool.example()[
  شبکه عصبی ای به شکل زیر داریم.
  مسأله ای که این شبکه حل می کند، مسأله XOR است.
  همچنین تابع فعال سازی آن، تابع Sigmoid است.
  می خواهیم ببینیم اگر به صورت تصادفی وزن هایش را تعیین کنیم چه اتفاقی می افتد.
  #tool.custom_figure(
    image("../images/ML/13_13.png", width: 95%),
    caption: "نمونه ای از یک شبکه عصبی برای حل مسأله XOR که وزن های آن به صورت تصادفی انتخاب شده اند.",
    inset: 1em,
  )
  دو بار وزن های این شبکه را به صورت تصادفی انتخاب کرده و سپس با توجه به @equation_13_03 که همان فرمول تابع فعال سازی این مسأله است، مقادیر $z_1$ و $z_2$ را در هر بار، حساب می کنیم:

  جدول زیر مقادیر $z_1$ و $z_2$ را برای وزن های زیر نشان می دهد:

  $
    w_1 = 0.5, w_2 = 0.1, w_3 = -1, w_4 = 0.2
  $
  #tool.custom_figure(
    caption: [مقدار $z_1$ و $z_2$ برای داده ها و وزن های مرتبط],
    kind: table,
    inset: 1em,
    refrence: <table_13_01>,
  )[
    #table(
      columns: 5,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      $x_1$, $x_2$, $y$, $z_1$, $z_2$,
      "0", "0", "0", "0.5", "0.5",
      "0", "1", "1", "0.25", "0.94",
      "1", "0", "1", "0.63", "0.52",
      "1", "1", "0", "0.38", "0.57",
    )
  ]

  #tool.custom_figure(
    image("../images/ML/13_14.png", width: 39%),
    caption: [نمودار مرتبط با @table_13_01. به کمک وزن های تصادفی، فضای نقاط مربوط به کلاس های مختلف به گونه ای تغییر می کند که می توان آن ها را با یک خط مستقیم از هم جدا کرد.],
    inset: 1em,
  )

  جدول زیر نیز مقادیر $z_1$ و $z_2$ را برای وزن های زیر نشان می دهد:
  $
    w_1 = 1, w_2 = -1, w_3 = 0.4, w_4 = -0.8
  $
  #tool.custom_figure(
    caption: [مقدار $z_1$ و $z_2$ برای داده ها و وزن های مرتبط],
    kind: table,
    inset: 1em,
    refrence: <table_13_02>,
  )[
    #table(
      columns: 5,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      $x_1$, $x_2$, $y$, $z_1$, $z_2$,
      "0", "0", "0", "0.5", "0.5",
      "0", "1", "1", "0.59", "0.69",
      "1", "0", "1", "0.73", "0.4",
      "1", "1", "0", "0.8", "0.14",
    )
  ]

  #tool.custom_figure(
    image("../images/ML/13_15.png", width: 39%),
    caption: [نمودار مرتبط با @table_13_02. به کمک وزن های تصادفی، فضای نقاط مربوط به کلاس های مختلف به گونه ای تغییر می کند که می توان آن ها را با یک خط مستقیم از هم جدا کرد.],
    inset: 1em,
  )
]

#tool.double_section()[
  #tool.question()[
    وظیفه لایه دوم شبکه ELM چیست؟
    #v(1.6em)
  ]
][
  #tool.true_answer()[
    این لایه وظیفه پیدا کردن خط جدا کننده کلاس ها را دارد.
  ]
]

#tool.double_section()[
  #tool.tip()[
    معماری های شبکه عصبی زیادی آمدند و رفتند.
    چرا که در مقایسه با ساختار های ساده تر شبکه عصبی، مزیت خاصی از نظر عملکرد، نداشتند.
  ]
][
  #tool.tip()[
    در شبکه ELM نورون های هر لایه، به همه نورون های لایه بعدی و قبلی، وصل می شود.
    #v(1.6em)
  ]
]

#tool.tip()[
  در شبکه ELM، تابع نورون های لایه سوم، Linear است.
  چرا که قرار است خطی که کلاس ها را از هم جدا می کند، بسازد.
  تابع فعال سازی لایه میانی، Sigmoid است.
]

==== Multilayer Perceptrons (MLP)
#tool.definition()[
  شبکه ای است که از سه لایه، شامل یک لایه ورودی، چندین لایه مخفی و یک لایه خروجی تشکیل شده است.
  در این شبکه، پردازش داده ها به صورت لایه ای است.
  به این صورت که داده ها به ترتیب از سمت چپ وارد شده، سپس خروجی آن حساب می شود، سپس لایه بعدی و لایه بعدی و ... تا لایه خروجی.
  #tool.custom_figure(
    image("../images/ML/13_06.png", width: 57%),
    caption: "Multilayer Perceptron",
    inset: 1em,
  )
]

#tool.double_section()[
  #tool.tip()[
    تجربه نشان داده است که وجود بیش از یک لایه پنهان در شبکه MLP، زیاد به درد بخور نیست.
  ]
][
  #tool.tip()[
    شبکه MLP، هر چقدر لایه میانی بیشتری داشته باشد، مسائل پیچیده تری را می تواند یاد بگیرد.
  ]
]

#tool.tip()[
  در شبکه MLP، تابع لایه ورودی، تابع همانی،
  تابع لایه میانی، تابع Sigmoid یا تابع Tangent Hyperbolic و تابع لایه خروجی معمولاً تابع Linear است.
]

#tool.definition()[
  Error Propagation: در شبکه MLP ورودی و نتیجه محاسبه آن از لایه ورودی تا لایه خروجی انتشار می یابد.
  همچنین به کمک مشتق زنجیره ای، خطا از لایه خروجی به سمت لایه ورودی انتشار می یابد و محاسبه می شود و به کمک آن، وزن ها اصلاح می شوند.
  این اصلاح به کمک الگوریتم Error Propagation انجام می شود.
  #tool.custom_figure(
    image("../images/ML/13_07.png"),
    caption: "Error Propagation",
    inset: 1em,
  )
]

==== Autoencoder Networks (AEN)
#tool.definition()[
  این شبکه در ساده ترین حالت از سه لایه تشکیل می شود.
  لایه ورودی، لایه میانی و لایه خروجی.
  از روی داده های ورودی، وزن ها حساب می شوند و با کمک وزن ها، خروجی لایه میانی را به همان داده های اولیه ورودی تبدیل می کند.
  به عبارتی این شبکه، داده ها را Encode می کند و برای مثال در فشرده کردن داده ها کاربرد دارد.
  #tool.custom_figure(
    image("../images/ML/13_08.png", width: 61%),
    caption: "Autoencoder Networks",
    inset: 1em,
  )
]

#tool.tip()[
  این شبکه مانند شبکه MLP است.
  تنها تفاوت آن ها این است که در AEN، ورودی با خروجی یکسان است.
]

==== Deep Multilayer Perceptrons (DMLP)
#tool.definition()[
  به شبکه MLP ای که بیش از یک لایه میانی داشته باشد، شبکه DMLP می گویند.
  #tool.custom_figure(
    image("../images/ML/13_09.png"),
    caption: "Deep Multilayer Perceptrons",
    inset: 1em,
  )
]

#tool.tip()[
  در عمل، به شبکه های عصبی ای که چند صد لایه میانی دارند، شبکه های عصبی عمیق می گویند.
]

==== Convolutional Neural Network (CNN)
#tool.definition()[
  شبکه عصبی ای است که چندین لایه میانی دارد و هر کدام از آن ها وظایف خاصی را انجام می دهند و Activation Function های آن ها با یکدیگر فرق می کند.
  #tool.custom_figure(
    image("../images/ML/13_10.png", width: 80%),
    caption: "Convolutional Neural Network",
    inset: 1em,
  )
]

==== Recurrent Neural Network (RNN)
#tool.definition()[
  شبکه های عصبی بازگشتی، شبکه هایی وابسته به زمان هستند و در آن ها خروجی یک نورون می تواند به عنوان ورودی خود آن نورون و یا ورودی نورون های قبلی اش، تعیین شود.
  #tool.custom_figure(
    image("../images/ML/13_11.png", width: 91%),
    caption: "Recurrent Neural Network",
    inset: 1em,
  )
]

#tool.tip()[
  RNN ها در مدل سازی دنباله ها مانند گفتار و سری های زمانی استفاده می شوند.
]

==== Pretrained Neural Networks (PNN)
#tool.definition()[
  در این شبکه ها یک لایه دلخواه ML Engineer به شبکه اضافه و آموزش داده می شود و بقیه لایه ها ثابت هستند.
]
