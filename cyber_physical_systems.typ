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
    topic: "جزوه درس سیستم های سایبر فیزیکی",
    authors_name: ("امیرحسین عسگری"),
    professors_name: ("دکتر حاتم عبدلی"),
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
- شیوه ارزیابی:
    + تکلیف، تکلیف کامپیوتری و پروژه: ۲۰٪ + ۵٪
    + پرسش و فعالیت کلاسی: ۵٪ + (۵٪ نمره اضافه)
    + سمینار: ۱۵٪ (+ ۱۰٪) #sym.arrow.l هفته آخر کلاس
    + میان ترم: ۲۰٪ #sym.arrow.l ۱۴۰۳/۰۹/۱۲
    + پایان ترم: ۴۰٪
- اطلاع رسانی و تمرین از درس افزار
- بعضی اطلاع رسانی ها از طریق کانال تلگرام: cps4031\@
- ایمیل: abdoli\@basu.ac.ir

#colbreak()

= جلسه اول
== سیستم های سایبر فیزیکی

#tool.simple_context()[
    در سیستم های سایبر فیزیکی، سنسور هایی وجود دارد که اطلاعاتی را از دنیای فیزیکی به سیستم می دهند و سیستم بر اساس برنامه ای که نوشته شده به کمک Actuator ها در دنیای فیزیکی واکنش نشان می دهد.
]


#tool.comparision()[
    تفاوت سیستم های سایبر فیزیکی با کامپیوتر های عادی:
    + سیستم های سایبر فیزیکی به صورت تخصصی مخصوص یک موضوع خاص هستند.
    + ورودی ها و خروجی های این دو سیستم متفاوت از یکدیگر است.
]

#tool.example()[
    سیستم های سایبر فیزیکی:
    - آسانسور
    - خودرو های خودران
]

#tool.simple_context()[
    در سیستم های سایبر فیزیکی موارد شکل زیر را داریم:

]

#tool.custom_figure(
    image("images/CPS/01_01.png"),
    caption: "نمایی از سیستم های سایبر فیزیکی",
    inset: 1em
)


#tool.tip()[
    هر سیستم سایبر فیزیکی الزاماً Real-time نیست و بر عکس.
]

#tool.definition()[
    سیستم های نهفته: سیستم های پردازش اطلاعاتی هستند که در یک محصول بزرگتری نهفته شده و استفاده می شوند.

    دلیل خرید این سیستم ها به خاطر پردازش اطلاعات نیست.
]

#tool.definition()[
    // TODO ??? ???
    پردازش همه جا حاضر (Ubiquitous computing): در این سیستم ها اطلاعات در هر زمان و هر مکانی وجود دارند.
]

#tool.example()[
    حوزه های کاری سیستم های سایبر فیزیکی:
    - خودرو های خودران
    - قطار ها
    - ارتباطات
    - صنعت هوانوردی
    - کاربرد های نظامی
]


#tool.tip()[
    در هر نمونه ای از سیستم های سایبر فیزیکی، مواردی مهم اند و مواردی مهم نیستند.
    به طوری که برای سیستم A ممکن است مواردی مهم باشد که برای سیستم B مهم نباشد و بر عکس.
]

#tool.example()[
    کاربرد های سیستم های سایبر فیزیکی در ارتباط با مشتری:
    - MP3 player
    - DVD player
    - اسباب بازی ها
    - تلویزیون های هوشمند
]


#tool.tip()[
    یکی از تفاوت های سیستم های نهفته با سیستم های سایبر فیزیکی این است که سیستم های نهفته، ارتباط کمتری با دنیای بیرون دارند.
]

#tool.list()[
    اهمیت سیستم های نهفته:
    + بیشتر پردازنده های High-end در سیستم های نهفته استفاده می شوند.
    + تقریبا همه وسایلی که با برق کار می کنند، درونشان سیستم نهفته ای وجود دارد.
    + اهمیت کلیدی در صنایع.
        مانند: صنعت خودران
]

#tool.list()[
    مشخصات سیستم های نهفته:
    + Dependability:
        + Reliability
        + Maintainability
        + Availability
        + Safety
        + Security
    + Energy efficiency
    + Performance
    + Real-time constrations
    + Weight efficienct, Cost efficienct, Code-size efficienct
    + Dedicated toward a certain application
        - Minimize resources, Maximize robustness
    + Dedicated user interface
        - No mouse, keyboard and screen
    + Frequently connected to physical environment through sensors and actuators
    + Hybrid systems (analog + digital parts)
]

#tool.tip()[
    برای سیستم های بدون درنگ، جواب های درستی که دیر می رسند، غلط اند (اشاره به مورد شماره ۴ که در بالا آمده است).
]

#tool.tip()[
    اینگونه نیست که هر سیستم نهفته ای تمامی خصوصیات لیست بالا را داشته باشد.   
]

#tool.tip()[
    سیستم های سایبر فیزیکی و نهفته شباهت زیادی به یکدیگر دارند.
    تفاوت اصلی این دو آن است که سیستم های سایبر فیزیکی ارتباط بیشتری با محیط فیزیکی دارند.
    (بنابراین مواردی که در لیست بالا به عنوان مشخصات سیستم های نهفته آورده شده، برای سیستم های سایبر فیزیکی نیز، صدق می کند.)
]

#tool.tip()[
    تفاوت بین Availability و Reliability: #sym.dots
]

#tool.tip()[
    فرق Safety با Security این است که Safety به جنبه ایمن بودن سیستم برای جان آدم ها در ارتباط است و Security با مثلاً حفظ امنیت داده های سیستم در ارتباط است.
]

= جلسه دوم

#tool.question()[
    در بحث Reliability، افزونگی به کار می رود.
    چه تعداد افزونگی برای سیستم کفایت می کند؟
]

#tool.true_answer()[
    بستگی به میزان افزونگی مورد نیاز سیستم دارد ولی حداقل ۳ عدد؛ تا اگر یکی از منابع دچار آسیب شد بتوانیم با رأی گیری از ۲ منبع سالم دیگر به نتیجه درست برسیم.
]

#tool.comparision()[
    ارتباطات Embedded system ها با Real time system ها:
    - بیشتر Embedded system ها Real time system هستند.
    - بیشتر Real time system ها Embedded system هستند.

    #tool.custom_figure(image("images/CPS/02_01.png"), caption: "بیشتر ES ها RT هستند و بر عکس.")
]

#tool.list()[
    چالش های سیستم های نهفته:
    + حوزه ای چند رشته ای است
    + اهداف طراحی مختلفی وجود دارد
    + چالش در مشخصات سیستم، طراحی و تایید
    + ویژگی های خاص سیستم های نهفته
        - Weight efficienct, Cost efficienct, Code-size efficienct, Diskless systems
]

#tool.list()[
    تعامل اهداف طراحی
    - اهداف طراحی:
        - Fault tolerance (Dependability)
        - Energy efficiency
        - Real-time
        - Cost efficient

]

#tool.example()[
    برای بهبود تحمل پذیری خطا، افزونگی را افزایش می دهیم که باعث افزایش مصرف انرژی می شود.
]

== سیستم های واکنشی (Reactive systems)

#tool.definition()[
    یک Reactive system در تعامل پیوسته با محیط خود می باشد و با سرعتی که توسط آن محیط تعیین می شود، اجرا می شود.
]

#tool.list()[
    سیستم های واکنشی (Reactive systesms):

    - عموما سیستم های نهفته، سیستم های واکنشی هستند.
    - Reactive systems = Event-based systems
    - رویکرد برنامه نویسی این سیستم ها به صورت سنتی نیست؛ چرا که در ذات، Event-based هستند.
    - مدل مناسب برای Reactive system ها:
        - رویکرد برنامه نویسی بر پایه Automata
]

=== Automata-based programming
#tool.definition()[
    نوعی رویکرد برنامه نویسی است که در آن از ماشین حالت متناهی برای توصیف رفتار برنامه، استفاده می شود.
]

#tool.simple_context()[
    گراف انتقال یک State machine در تمامی مراحل توسعه نرم افزار، استفاده می شود.

    - Specification
    - Implementation
    - debugging
    - documentation
]

#tool.example()[
    در چند تصویر زیر، مثالی از یک سیستم تهویه هوا آورده شده است:
    
    #tool.custom_figure(
        [
            #image("images/CPS/02_02.png")
            #image("images/CPS/02_03.png")
            #image("images/CPS/02_04.png")
        ],
        caption: none
    )

    #tool.custom_figure(
        [
            #image("images/CPS/02_05.png")
            #image("images/CPS/02_06.png")
        ],
        caption: "مثالی از ماشین حالت متناهی (به شیوه Moore)"
    )
]


#tool.tip()[
    برای مثال تهویه هوا درست این است که از Range استفاده کنیم تا سیستم دائم دچار نوسان نشود (کولر یا بخاری تند تند خاموش و روشن نشود).
]

#tool.exercise(extra_score: true)[
    مثال تهویه هوا را به صورت گرافیکی شبیه سازی کنید.
]

#tool.list()[
    بعضی از مزایای این رویکرد (Automata-based programming):
    
    #text(dir: ltr)[
        - Suitable for reactive systems
        - Hierarchical (e.g. Super-states)
            - Human beings are not capable of comprehending systems with more than 3 #sym.tilde 5 objects.
        - Verification
            - Each automata is simple and easy to understand
            - Each automata has to comply with the super-state that it belongs to.
        - Automatic code generation
    ]
]

= جلسه سوم

== سیستم های سایبر فیزیکی
#tool.simple_context()[
    سیستم های نهفته، پر از تناقض در نیازمندی هایشان هستند.

    امروزه سیستم های نهفته دیگر فقط راجع به Information technology نمی باشند.
]

#tool.list()[
    نمونه هایی از تنقاض های مربوط به نیازمندی های سیستم های سایبر فیزیکی:

    - High connectivity vs. Security and Privacy
    - High performance vs. Low Energy
    - Asynchrony vs. Coordination/Cooperation
    - Scalability vs. Reliability and Predictability
    - Laws and Regulations vs. Technical Possibilities
    - Economies of scale (cloud) vs. Locality (fog)
    - Open vs. Proprietary

    برای رفع تناقض های بالا نیاز به روش ها و مدل های مهندسی جدید می باشد.
]

#tool.tip()[
    سیستم های سایبر فیزیکی مبحثی چند رشته ای است و که این باعث ایجاد چالش هایی برای آن می شود.
]

#tool.definition()[
    اینترنت اشیاء: سیستم های سایبر فیزیکی + اینترنت
]

#tool.list()[
    مثال هایی از سیستم های سایبر فیزیکی:
    + خودرو های خودران:
    + تنظیم نسبت سوخت و هوا برای کاهش آلایندگی
]

#tool.definition()[
    سیستم های سایبر فیزیکی:
    رویکردی علمی برای طراحی و پیاده سازی سیستم های نهفته.
]

== Model based design

#tool.tip()[
    سه گام اصلی برای ساخت سیستم های سایبر فیزیکی:
    + Modeling:
        بیانگر این هستند که یک سیستم چه کاری را انجام می دهد.
    + Design:
        بیانگر این است که یک سیستم چگونه کارش را انجام می دهد.
    + Analysis:
        بیانگر این است که یک سیستم چرا کاری که انجام می دهد را انجام می دهد.
]

#tool.simple_context()[
    هدف این درس این است که یاد بگیریم امروزه چگونه کار ها انجام می شوند، و این چرا به اندازه کافی خوب نیست؛ 
    بدون اینکه وابسته به تکنولوژی شویم چرا که تکنولوژی دائم تغییر می کند.
]

#tool.comparision()[
    فرق مدل با واقعیت: در مدل سازی وسیله مورد نظر را با استفاده از قوانین علمی مدل می کنیم.
    حال این مدل سازی ممکن است جزئیات زیادی داشته باشد و بسیار نزدیک به واقعیت باشد و یا حالتی کلی داشته باشد و فقط کمی به واقعیت نزدیک باشد.
]

#tool.example()[
    معادلات نیوتون، مدلی از فیزیک دنیای واقعی است.
]

#tool.definition()[
    Fidelity: میزان خوب بودن انطباق مدل و هدف مربوط به آن.
]

#tool.definition()[
    هدف (Target): چیزی که مدل از روی آن ساخته می شود.
]

#tool.definition()[
    هم مدل و هم هدف هر دو در جای خود ارزشمند هستند و نباید به جای یکدیگر استفاده شوند.
]

#tool.example()[
    نقشه مناطق نفت خیز (مدل) برای نفت برداری کاربرد زیادی دارد اما نمی توان به جای زمین نفت خیز (هدف) آن را سوراخ کرده و از آن نفت استخراج کرد!
]

#tool.definition()[
    پیش بینی پذیری (Determinacy): یک مدل، قطعی (Deterministic) است اگر، با داشتن حالت آغازین و ورودی های یکسان، مدل دقیقاً یک رفتار را از خود نشان دهد.

    بعضی از با ارزش ترین مدل ها، مدل های قطعی هستند.
]

#tool.question()[
    آیا مدل های قطعی در سیستم های سایبر فیزیکی معنا دارند؟
]

#tool.true_answer()[
    خیر - چرا که در دنیای واقعی عدم قطعیت های زیادی وجود دارد که باید آن ها را در نظر بگیریم.
]

#tool.example()[
    دو سیستمی محاسباتی که هر یک وظیفه ای دارند و به وسیله یک کابل فیزیکی به هم متصل اند، ممکن است در روند کاری شان عدم قطعیت هایی اتفاق بیافتد.
    مثلا: بسته های داده این دو سیستم محاسباتی در یک بار کار کردن کل سیستم سالم به یکدیگر منتقل شود اما در یک بار دیگر تعدادی Packet loss رخ دهد.
]