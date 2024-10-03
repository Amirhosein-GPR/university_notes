#import "assets/typst/templates/note.typ": note
#import "assets/typst/tools/tool.typ"

#let red_color = rgb(200, 0, 0, 255)
#let orange_color = rgb(220, 100, 0, 255)
#let yellow_color = rgb(130, 130, 0, 255)
#let green_color = rgb(0, 120, 0, 255)
#let blue_color = rgb(0, 100, 200, 255)
#let dark_blue_color = rgb(0, 0, 200, 255)
#let purple_color = rgb(150, 0, 150, 255)
#let gold_color = rgb(255, 215, 0)
#let brown_color = rgb(125, 50, 0)

#let dir = rtl

#show: doc => note(
    doc,
    paper: "a4",
    black_and_white: false,
    flipped: false,
    first_page_font_size: 10pt,
    font_size: 8pt,
    image_path: "../../images/basu_logo_logosource.ir.svg",
    image_width: 12em,
    topic: "جزوه درس یادگیری ماشین",
    authors_name: ("امیرحسین عسگری"),
    professors_name: ("دکتر محرم منصوری زاده"),
    faculty: "مهندسی کامپیوتر",
    date: [
        نیم سال تحصیلی #text(dir: ltr)[۱۴۰۳-۱]
    ],
    version: "v0.3.0",
    phase: none,
    info_color: blue_color,
    no_responsibility: true
)

#tool.title("فهرست مطالب", color: red_color)
#outline(title: none, indent: auto)

#colbreak()

#tool.title("درباره کلاس", color: blue_color)
- قواعد و مقررات:
    + حضور در کلاس اجباری است.
    + انجام تمرین ها و پروژه ها در زمان مشخص شده.
    + باید برایشان گزارش نوشته شود.
    + کزارش شامل موارد زیر است:
        + تعریف مسأله
        + پیاده سازی
        + اجرای نمونه
    + میان ترم و پایان ترم کتبی خواهیم داشت.

- راه های ارتباطی:

    - آیدی تلگرام: #text(dir: ltr)[mansoorm\@]

    - کانال تلگرام: #text(dir: ltr)[mansoorm\_courses\@]
    - ایمیل ها:
        + mansoorm\@basu.ac.ir
        + cse.teacher\@gmail.com

#colbreak()

= جلسه اول

== یادگیری ماشین

#tool.simple_context()[
    یادگیری ماشین زیر شاخه ای از هوش مصنوعی است.
]

#tool.tip()[
    ملاک درست بودن پاسخ، دادن جواب مورد انتظار کاربر است.
]

=== هوش
#tool.definition()[
    هوش: معیار اندازه گیری میزان انطباق پاسخ با انتظار
]

#tool.example()[
    دو عدد ادامه دنباله زیر را مشخص کنید.

    #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, ..., ...]
]

#tool.true_answer()[
    در این مثال، معیار طراح سوال تعداد Ending point های هر عدد می باشد. بنابراین جواب به صورت زیر است:

    #text(dir: ltr)[۱, ۲, ۵, ۷, ۱۰, #text(fill: blue_color)[۱۲], #text(fill: blue_color)[۱۷]]
]

=== هوش مصنوعی
#tool.definition()[
    هوش مصنوعی: توانمندی کامپیوتر ها (ماشین ها) برای تولید پاسخ های مورد انتظار انسان.
]

#tool.tip()[
    هوش مصنوعی از دید کاربر تعریف می شود.
]

#tool.definition()[
    ماشین (کامپیوتر): به ابزاری که قابل برنامه ریزی است می گوییم.
]

=== رویکرد های هوش مصنوعی
==== مبتنی بر قانون (Rule based approach)
#tool.definition()[
    در این روش مثلا از یک آدم متخصص در حوزه ای سوال می شود که چگونه کارش را انجام می دهد.
    بر این اساس یک سری پارامتر استخراج می کنیم و بر اساس آن ها برنامه ای را می نویسیم.
]

#tool.example()[
    تشخیص انواع چند ضلعی ها #sym.arrow.l این که چند ضلعی مورد نظر مثلث متساوی الساقین است یا مربع است یا پنج ضلعی منتظم است یا ۱۰۰ ضلعی منتظم است یا #sym.dots .
]

#tool.true_answer()[
    روش تشخیص: به کمک اندازه زاویه ها و فاصله نقاط هر چند ضلعی، می توان نوع آن چند ضلعی را فهمید.

    مشکل روش: وقتی تعداد اضلاع و زاویه ها بالا رود، مشکل می شود.
]

==== مبتنی بر یادگیری (Learning based approach)
#tool.definition()[
    در این روش الگوریتمی به کامپیوتر داده می شود تا خودش قاعده و قانون مسأله را به دست آورد.
]

#tool.example()[
    تشخیص هواپیما #sym.arrow.l تعداد زیادی نمونه می آوریم.
]
#tool.true_answer()[
    #tool.custom_figure(
        image("images/ML/01_02.jpg"),
        caption: "نقاط شکل هواپیما را به صورتی که مشخص شده است، شماره گذاری می کنیم."
    )
    کد مرتبط:
    #tool.code_section()[
        ```
        R = {}
        for k = 1 to 16 {
            for j = k + 1 to 16 {
                flag = True
                for image = 1 to 10 {
                    if d_k(image) != d_j(image) {
                        flag = false
                    }
                }
                if flag == true {
                    R = R U <d_k, d_j>
                }
            }
        }               
        ```
    ]
]

#tool.tip()[
    یک مهندس یادگیری ماشین، دو مورد زیر را فراهم می کند:
    + نمونه ها (Examples)
    + الگوی قاعده (Rule template)
]

=== یادگیری (Training)
#tool.definition()[
    یادگیری (Training): فعالیتی که دو ورودی نمونه و الگو و همچنین خروجی قواعد را دارد، گویند.
    
    #tool.custom_figure(
        align(center)[
            #image("images/ML/01_01.png", width: 50%)
        ],
        caption: "گراف مربوط به فعالیت یادگیری",
        inset: 1em
    )
]

= جلسه دوم

#tool.tip()[
    کار هایی که مهندس یادگیری ماشین به همراه فرد خبره در حوزه مرتبطش انجام می دهند:
    ML engineer + Domain expert:
    #text(dir: ltr)[
        + Data collection
        + Template building
        + Training
    ]
]

#tool.tip()[
    در Machine learning نقش اصلی را ML engineer بر عهده دارد.
    در حالی که در Data mining و Deep learning نقش اصلی بر عهده ماشین است.
]

#tool.definition()[
    یادگیری ماشین: یعنی به کامپیوتر ها یاد بدهیم تا مسائل را حل کنند.
]

== مسائل پایه ای یادگیری ماشین

=== Supervised learning
==== Classification

#tool.question()[
    Spam detection در ایمیل:
    فرض کنیم می خواهیم ایمیل های اسپم را از غیر اسپم برای فردی یا سازمانی تشخیص دهیم.
]

#tool.true_answer()[
    مراحل انجام این کار به صورت زیر است:
    + کلی ایمیل جمع می کنیم و آن ها را برچسب گذاری می کنیم.
        مثلا به صورت زیر:

    #align(center)[
        #text(dir: ltr)[
            #table(
                columns: 2,
                inset: 1em,
                stroke: black,
                align: center,
                "Message",
                "Label: Spam",
                "Message 1",
                "Yes",
                "Message 2",
                "No",
                "Message 3",
                "Yes",
                [#sym.dots],
                [#sym.dots],
                "Message N",
                "No"
            )
        ]
    ]

    2. متن رو بررسی می کنیم.
        مثلا به صورت زیر:

    #align(center)[
        #text(dir: ltr, number-width: "proportional")[
            #table(
                columns: 4,
                inset: 1em,
                stroke: black,
                align: center,
                "Word",
                "F_Yes",
                "F_No",
                "Difference",
                "Rich",
                "56",
                "73",
                "56 - 73 = -17 < 0",
                "Click",
                "123",
                "15",
                "108",
                [#sym.dots.v],
                [#sym.dots.v],
                [#sym.dots.v],
                [#sym.dots.v]
            )
        ]
    ]

    در جدول بالا، ستون F_Yes به تعداد ایمیل های اسپمی که در متن آن ها کلمه Rich وجود دارد اشاره می کند و ستون F_No، عکس این قضیه می باشد.

    در نهایت تمامی کلمات در قالب جدول بالا بررسی می شوند.
    این عمل را بار اول خودمان انجام می دهیم.

    توجه: اسپم بودن یا نبودن هر ایمیل مورد نظر است و نه هر کلمه هر ایمیل به صورت جداگانه.

    توجه: هر لغتی که در متن یک ایمیل داشته باشیم، همان یک بار برای متنش حساب می شود و نه بیشتر.
    مثلا یک ایمیلی ۱۰۰ عدد کلمه Click دارد.
    در این حالت می گوییم کلمه Click در این ایمیل آمده است و به تعدادش اشاره نمی کنیم.

    اما چرا اینگونه عمل کردیم؟ چون طبیعت، هموار (Smooth) است.

    در ادامه ۱۰۰ کلمه ای (تعداد دلخواه) که بیشترین تفاضل را دارند، انتخاب کرده و برای یک ایمیلی که می خواهیم بررسی اش کنیم، می گوییم اگر درون این ایمیل، مثلاً بیشتر از ۲۰ کلمه مجزا از این ۱۰۰ کلمه وجود داشت، آن ایمیل، یک ایمیل اسپم است.

    پس به صورت خلاصه به شکل زیر عمل می کنیم:
    #text(dir: ltr)[
        + Collect a set of spam and real (not-spam) messages.
        + Count words in the message.
        + Select top #text(stylistic-set: 2)[100] distincitve (Highly frequent in spams) spam words
        // For a new message or stage???
        + For a new message if M contains more than #text(stylistic-set: 2)[20] distincitve words, It is spam.
    ]

    در نهایت برنامه ای به شکل زیر ساخته خواهد شد:

    #tool.custom_figure(
        image("images/ML/02_01.png"),
        caption: "یک برنامه یادگیری ماشین که یک ورودی و دو خروجی به شکل بالا دارد.",
        inset: 1em
    )

    به این نوع یادگیری ماشین، Classification می گوییم.
]

#tool.example()[
    مثالی در حوزه Classification به صورت زیر آمده است:
    ساخت یک برنامه یادگیری ماشین که Chest X-Ray را به عنوان ورودی بگیرد و بگوید ریه فرد، چقدر درگیر است.
    خروجی برنامه نیز یکی از موارد زیر است:
    #text(dir: ltr)[
        + None
        + Low
        + Mild
        + High
        + Severe
    ]
]

==== Regression
#tool.question()[
    پیش بینی کردن قیمت خانه
]

#tool.true_answer()[
    - گام اول: فرض کنیم قیمت خانه ها به شکل زیر است:

    #align(center)[
        #text(dir: ltr)[
            #table(
                columns: 2,
                inset: 1em,
                stroke: black,
                align: center,
                "Area",
                "Price",
                [50 $m^2$],
                [100],
                [75 $m^2$],
                [105],
                [75 $m^2$],
                [150],
                [100 $m^2$],
                [220],
                [120 $m^2$],
                [240]
            )
        ]
    ]

    برای آن که درک بهتری از جدول بالا داشته باشیم به شکل زیر توجه کنید:

    #tool.custom_figure(
        image("images/ML/02_02.png"),
        caption: "تلاش می کنیم معادله ای که تا جای ممکن تمامی نقاط نمودار را پوشش می دهد، پیدا کنیم.",
        inset: 1em
    )

    بر اساس اصل پیوسته بودن طبیعت مشاهده می کنیم که نقاط شکل بالا گویی حول محور آبی حرکت می کنند.

    - گام دوم:

    معادله خط مربوط به خط آبی رنگ را پیدا می کنیم.
    مثلا:
    
    $ "Price = 2" "Area" + epsilon $

    به این گونه مسائل که به دنبال یافتن معادله ای همچون
    
    $ y = f(x) $
    
    برای حل شان می گردیم؛ مسائل Regression می گویند.
]

#tool.list()[
    مسائل پایه ای یادگیری ماشین:
    #text(dir: ltr)[
        + Supervised learning
            + Classification
            + Regression
        + Unsupervised learning
            + Association learning
            + Clustering
            + Distribution learning (Density estimation)
        + Reinforcement learning
            + Reward / Punishment
    ]
]

=== Unsupervised learning
==== Association learning

#tool.question()[
    فروشنده یک مغازه می خواهد به مشتری ای که مثلاً ۴ کالا خریده است، کالای پنجمی را پیشنهاد داده و آن را بفروشد.
    چگونه به او پیشنهاد بدهد؟
]

#tool.true_answer()[
    + داده های گذشته رو بررسی می کنیم.
        مثلا:

        #align(center)[
            #text(dir: ltr)[
                #table(
                    columns: 2,
                    inset: 1em,
                    stroke: black,
                    align: center,
                    "مشتری ۱",
                    "پنیر - [شیر] - [نان]",
                    "مشتری ۲",
                    "<رب> - تخم مرغ - <نان>",
                    "مشتری ۳",
                    "[شیر] - رب> - [<نان>]>",
                    [#sym.dots.v],
                    [#sym.dots.v],
                    "مشتری N",
                    [#sym.dots]
                )
            ]
        ]

    + کالا های با بیشترین تکرار را پیدا می کنیم.
        مثلا:
    
        $ F_1 = "رب - شیر - نان" $

    + کد الگوریتم را به صورت زیر می نویسیم (برای آموزش یا همان Training)):
        //TODO: for each y in F_1 or F_2???
        #tool.code_section()[
            ```
            F_1 = {} F_2 = {}

            for each x in F_1 {
                for each y in F_1 {
                    if <x, y> is frequent {
                        F_2 = F_2 U {<x, y>}
                    }
                }
            }
            ```
        ]

    + در آخر برنامه پیشنهاد کالا را با استفاده از داده هایی که در مرحله قبل به دست آوردیم به صورت زیر می نویسیم و اجرا می کنیم:
        #tool.code_section()[
            ```
            for each customer c {
                for each pair <x, y> in F_2 {
                    if c buys x {
                        recommend y
                    }
                }
            }
            ```
        ]

    این مسأله نوعی مسأله در حوزه Association learning می باشد.
]

==== Clustering
#tool.question()[
    در ادامه مسأله قبلی، حالا می خواهیم بدانیم که چگونه مشتری هایی داریم؟ (Grouping customers)
]

#tool.true_answer()[
    بر اساس سبد خرید مشتری ها، آن ها را دسته بندی می کنیم.

    + به صورت زیر سبد ها را دو به دو مقایسه کرده و دسته بندی می کنیم.
        
        داریم:
        $ B_1 , B_2 $

        به کمک فرمول زیر، شباهت بین دو سبد $B_1$ و $B_2$ را به دست می آوریم (علامت قدر مطلق به اندازه مجموعه ها اشاره می کند):
        $ S = abs(B_1 sect B_2) / abs(B_1 union B_2) $
        
        برای نمونه بین مشتری ۱ و مشتری ۲ داریم:
        $ S = abs("نان") / abs("رب - تخم مرغ - پنیر - شیر - نان") = ۱ / ۵ $

        #text(number-width: "proportional")[یعنی سبد خرید مشتری ۱ و مشتری ۲ به میزان ۲۰٪ به یکدیگر شباهت دارند.]

    + به تعداد دلخواه مثلاً ۵ عدد گروه در نظر می گیریم و به صورت زیر عمل می کنیم:
    
        + #text(number-width: "proportional")[فرض کنید ۱۰۰ تا مشتری داریم.
            این مشتری ها را به شکل تصادفی در ۵ گروه ۲۰ تایی تقسیم بندی می کنیم.]
        
        + سپس یکی از مشتری ها را از یک گروهی انتخاب کرده و با همه گروه ها مقایسه می کنیم.
            در نهایت مشتری به گروهی که بیشترین شباهت را با آن دارد، منتقل می شود.
        
        + #text(number-width: "proportional")[اگر این کار را بر روی مشتری ها ادامه دهیم بعد از مدتی به همگرایی خواهیم رسید و ۵ گروه ۲۰ تایی خواهیم داشت که اعضای درون هر گروه به یکدیگر شباهت دارند.]

        اما این دسته بندی چه فایده ای دارد؟
        
        یک نمونه مثال از فایده آن این است که مشتری هایی که در گروه مشترک هستند را بررسی می کنیم چه کالا هایی را خریدند تا آن کالا ها را در یک راهرو کنار هم قرار دهیم.

        این مسئله نمونه ای از مسائل Clustering می باشد.
]

=== Reinforcement learning
==== Reward / Punishment
#tool.question()[
    می خواهیم نحوه بازی کردن شطرنج را آموزش دهیم.
]

#tool.true_answer()[
    فرض کنیم دو بازیکن به نام های بازیکن ۱ و ۲ داریم.
    بازیکن ۲ می خواهد شطرنج را به بازیکن ۱ یاد بدهد.

    + #text(number-width: "proportional")[ابتدا حرکاتی که هر مهره می تواند انجام دهد به بازیکن ۱ گفته می شود.]
    + بازیکن ها شروع به بازی کردن می کنند.
    + #text(number-width: "proportional")[به صورت زیر هر دو بازیکن حرکاتی را انجام می دهند و در نهایت بازیکن ۲ می برد.]
        #align(center)[
            #text(dir: ltr)[
                #table(
                    columns: 2,
                    inset: 1em,
                    stroke: black,
                    align: center,
                    "بازیکن ۱",
                    "بازیکن ۲",
                    [$W_1$],
                    [$B_1$],
                    [$W_2$],
                    [$B_2$],
                    [#sym.dots.v],
                    [#sym.dots.v],
                    [$W_7$],
                    [$B_7$]
                )
            ]
        ]
    + #text(number-width: "proportional")[وقتی که بازیکن ۱ می بازد، می فهمد مجموعه حرکاتی که انجام داده، بد بوده است و بابت باخت مجازات می شود.]
    + #text(number-width: "proportional")[بازیکن ۱ اینقدر حرکات شانسی مختلف را امتحان می کند تا می برد و بابت برد امتیاز می گیرد.]

    به این صورت بازیکن ۱ بازی شطرنج را یاد می گیرد.

    به این روش که ماشین می تواند از شکست ها (جریمه ها) و برد ها (جایزه ها) یاد بگیرد روش Reward / Punishment می گویند که زیر مجموعه ای از Reinforcement learning می باشد.
]

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
    
    #align(center)[
        #text(dir: ltr)[
            #table(
                columns: 3,
                inset: 1em,
                stroke: black,
                align: center,
                "سن\n(Age)",
                "فراوانی\n(Frequency)",
                "فراوانی نسبی\n(Relative frequency)",
                "1",
                "0",
                "0",
                "5",
                "0",
                "0",
                "10",
                "5",
                "0.05",
                "15",
                "15",
                "0.15",
                "20",
                "16",
                "0.16",
                "25",
                "16",
                "0.16",
                "30",
                "16",
                "0.16",
                "50",
                "15",
                "0.15",
                "60",
                "10",
                "0.10",
                "80",
                "5",
                "0.05",
                "90",
                "2",
                "0.02",
                "100",
                "0",
                "0",
                "---",
                "مجموع",
                "---",
                "---",
                "100",
                "---",
            )
        ]
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

    $ P("Smoking" | x) = cases(0 &"if" space.quad x < 10 &|space space| space.quad x > 90, 0.01 x &"if" space.quad x >= 10 &amp amp space.quad x < 20, 0.16 &"if" space.quad x >= 20 &amp amp space.quad x < 50, 0.16 - 0.01 x space.quad &"if" space.quad x >= 50 space.quad &amp amp space.quad x < 90) $

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
        image("images/ML/03_01.png"),
        caption: "با توجه به میانگین و انحراف معیار جمعیت، به نمودار بالا می رسیم.",
        inset: 1em
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
    #align(center)[
        #text(dir: ltr)[
            #table(
                columns: 3,
                inset: 1em,
                stroke: black,
                align: center,
                [Engine power ($X_1$)],
                [Price ($X_2$)],
                [Family car ($Y$)],
                "10",
                "1k",
                "No",
                "20",
                "1.2k",
                "No",
                "45",
                "5k",
                "Yes",
                "60",
                "10k",
                "Yes",
                "120",
                "15k",
                "Yes",
                "140",
                "30k",
                "No",
                "30",
                "100k",
                "No",
                "20",
                "200k",
                "No"
            )
        ]
    ]

    در ادامه مراحل زیر را انجام می دهیم:
    + Plot data:
        از آن جایی که انسان با دیدن نمودار داده ها درک بهتری از آن ها پیدا می کند، تا دیدن جدول، نمودار جدول بالا را رسم می کنیم.
        #tool.custom_figure(
            image("images/ML/03_02.png"),
            caption: "نمودار جدول بالا. دایره های منفی بیانگر ماشین های نامناسب و دایره های مثبت بیانگر ماشین های مناسب خانواده می باشند.",
            inset: 1em
        )

    + Get an insight:
        #tool.custom_figure(
            image("images/ML/03_03.png"),
            caption: "با کمی نگاه به نموداری که رسم کردیم، به این دیدگاه می رسیم که ماشین های مناسب خانواده درون محدوده قرمز رنگ قرار می گیرند. گویی که توسط یک مستطیل (که با طول و عرض و مختصات نقطه پایین سمت چپش مشخص می شود) احاطه شده اند.",
            inset: 1em
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
        #tool.code_section()[
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
        #tool.code_section()[
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