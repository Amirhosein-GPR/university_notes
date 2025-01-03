#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": *

= جلسه نوزدهم

== Reinforcement Learning
#tool.definition()[
  Reinforcement Learning
  نوعی یادگیری است که در آن منتظر نمی مانیم تا Data جمع شود و از روی آن یک مدلی بسازیم.
  بلکه در طول زمان این مدل را پرورش می دهیم و از آن استفاده می کنیم.
]

=== مؤلفه های Reinforcement Learning
#tool.definition(pause: true)[
  - Actor / Agent:
    موجودی که در محیط فعالیت می کند.
  - Action: کاری که Agent انجام می دهد.
  - Environment:
    هر چیزی که غیر از خود Actor وجود دارد و Actor با آن در تعامل است.
    محیط در مقابل عملی که Agent انجام می دهد، Reward و New State را بر می گرداند.
  - Reward:
    محیط در مقابل عملی که Actor انجام می دهد، به آن پاداش یا مجازات می دهد.
    دقت شود که در این جا Reward علاوه بر پاداش، می تواند مفهوم مجازات هم بدهد.

  $
    s_t: "State of agent at time t"
    \
    a_t: "Action taken at time t"
  $
]

#tool.tip()[
  در اینجا فرض می کنیم که زمان سیستم، State سیستم و Action های Actor گسسته اند.
  اما Reward ای که از سیستم می گیریم لزوماً گسسته نیست.
]

#tool.definition(continuation: true)[
  - عملی که Actor در لحظه t انجام می دهد، منجر به دریافت Reward و State جدید در لحظه t + 1 می شود.
  $
    "In" s_t, "action" a_t "is taken, clock ticks and reward"
    \
    r_(t+1) "is received and state changes to" s_(t+1)
  $
  - گاهی اوقات عملی که Agent انجام می دهد، Deterministic است.
    به این معنا که حتما منجر به Reward و State مشخصی می شود.
  - گاهی اوقات عملی که Agent انجام می دهد، Stochastic (شانسی / احتمالاتی) است.
    به این معنا که لزوماً منجر به Reward و State مشخصی نمی شود.
  $
    "Next state probability": P(S_(t+1) | s_t, a_t)
  $
  $
    "Reward probability": P(r_(t+1) | s_t, a_t)
  $
  - معمولاً زمانی که سیستم ما محدود است، مثل بازی شطرنج، وضعیت (های) شروع و پایان داریم.
  $
    "Initial state(s), goal state(s)"
  $
  - Episode: مجموعه Action هایی که Actor برای رسیدن از State شروع به State پایانی انجام می دهد را یک Episode می گوییم.
  $
    "Episode (trial) of actions from initial state to goal"
  $
]

=== Policy and Cumulative Reward
#tool.definition()[
  Policy (سیاست): تابعی است که Action ای که Actor باید در هر State انجام دهد را مشخص می کند.
  $
    "Policy": pi: S arrow A #h(1em) a_t = pi(s_t)
  $
  در فرمول بالا برای آن که دچار اشتباه نشویم، به اولین $pi$، پای و به دومین $pi$ که برای احتمال است، همان پی می گوییم.
  تابع $pi$ تابعی است که مجموعه State های $S$ را به مجموعه Action های $A$ نگاشت می کند.
  $a_t$ همان Action ای است که Agent باید در لحظه t اعمال کند.
  $
    "Value of a policy": V^pi (s_t)
  $
  $
    "Finite-horizon": V^pi (s_t) &= E[r_(t+1) + r_(t+2) + dots + r_(t+T)]
    \
    &= E[sum_(i=1)^T r_(t+i)]
  $
  $
    "Infinite horizon": V^pi (s_t) &= E[r_(t+1) + gamma r_(t+2) + gamma^2 r_(t+3) + dots]
    \
    &= E[sum_(i=1)^infinity gamma^(i-1) r_(t+i)]
    \
    0 <= gamma < 1 "is the discount rate"
  $
]

#tool.tip()[
  Finite Horizon (افق دید محدود) مربوط به مسائلی است که در آن ها می خواهیم به حالت هدف مشخصی برسیم.
  مانند مسأله موش و پنیر.
  اما Infinite Horizon (افق دید نامحدود) مربوط به مسائلی است که در آن ها هدف این است که همواره سود کسب کرد و پایان مشخصی ندارد.
  مانند مسأله فروشنده کالا.
  چرا که فروشنده همواره به دنبال کسب سود است و پایان مشخصی ندارد.
  مگر آن که خودش از کارش دست بکشد و مثلاً بازنشسته شود.
]

=== Bellman's Equation
#tool.definition(pause: true)[
  - $s_t$: وضعیت Agent در لحظه t.
  - $V(s_t)$: ارزش وضعیت در لحظه t.
  - $V^*(s_t)$: بیشترین ارزش وضعیت در لحظه t.
  $
    V^*(s_t) &= max_pi V^pi (s_t), forall s_t
    \
    &= max_a_t E[sum_(i=1)^infinity gamma^(i-1) r_(t+i)]
    \
    &= max_a_t E[r_(t+1) + gamma sum_(i=1)^infinity gamma^(i-1) r_(t+i+1)]
    \
    &= max_a_t E[r_(t+1) + gamma V^*(s_(t+1))]
  $ <equation_19_12>
]
#tool.example()[
  یک فرد ۲۰ ساله بعد از گرفتن دیپلم می تواند چندین مسیر را پیش بگیرد.
  ارزش ۲۰ ساله بودن، ماکزیمم ارزشی است که از دنبال کردن مسیر های مختلف پیش رویش می تواند به دست بیاورد.
  مثلاً به تحصیل ادامه دهد فلان قدر درآمد خواهد داشت یا بازار برود فلان قدر #sym.dots که ماکزیمم بین این ها، ارزش بودن در سن ۲۰ سالگی را نشان می دهد.
]

#tool.definition(continuation: true)[
  در @equation_19_12 به این دلیل Expected Value (امید ریاضی) $r_(t+1)$ استفاده می شود که Reward ها می توانند Stochastic باشند.
  همچنین چون در $s_(t+1)$ با شانس های مختلفی می توانیم به State های بعد از آن برویم، $V^*(s_(t+1))$ را نیز درون تابع امید ریاضی ($E$) قرار می دهیم.

  همچنین در @equation_19_12 به $gamma$ Discount Rate (ضریب تخفیف) می گویند که برای این استفاده می شود که هر چقدر سود را زودتر به دست بیاوریم بهتر است.
  مثلاً وقتی $gamma = 0.9$ یعنی سودی که در زمان بعدی به دست می آوریم ۹۰٪ ارزش سودی که در زمان فعلی به دست می آوریم را خواهد داشت.
  این کار باعث می شود سیستم برای بیشتر کردن سود، متمایل شود تا آن ها را سریع تر کسب کند.

  $
    V^*(s_t) = max_a_t (E[r_(t+1)] + gamma sum_s_(t+1) P(s_(t+1) | s_t, a_t) V^*(s_(t+1)))
  $ <equation19_13>
  $
    V^*(s_t) = max_a_t Q^*(s_t, a_t) arrow "Value of" a_t "in" s_t
  $
  $
    \
    Q^*(s_t, a_t) = E[r_(t+1)] + gamma sum_s_(t+1) P(s_(t+1) | s_t, a_t) max_a_(t+1) Q^*(s_(t+1), a_(t+1))
  $

  $Q(s_t, a_t)$: ارزش انجام عمل $a_t$ را در $s_t$ نشان می دهد.

  $Q^*(s_t, a_t)$: بیشترین ارزش انجام عمل $a_t$ را در $s_t$ نشان می دهد.

  خاصیت بازگشتی معادله بالا کمک می کند تا برای هر عملی یک Value اولیه ای در نظر بگیریم و با این رابطه بازگشتی، ارزش آن را به مرور به روز رسانی کنیم.
]

=== Model-Based Learning
#tool.definition()[
  وقتی می گوییم می خواهیم یادگیری را انجام دهیم یعنی Actor در هر لحظه با چه احتمالی چه عملی را انجام می دهد و در ازای آن چه Reward ای را دریافت می کند.
  یعنی می خواهیم موارد زیر را یاد بگیریم:
  $
    "Environment", P(s_(t+1) | s_t, a_t), p(r_(t+1) | s_t, a_t)
  $
  - در این روش، ۳ مورد بالا معلوم هستند.
  - بنابراین چون موارد بالا برای ما شناخته شده هستند، نیاز به Exploration (کاوش) نداریم.
  - و می توان با Dynamic Programming مسئله های مرتبط را حل کرد.
    مانند حل مسئله موش و پنیر. (@equation19_17 همان @equation19_13 است که مجددا در زیر آورده شده است)
  $
    V^*(s_t) = max_a_t (E[r_(t+1)] + gamma sum_s_(t+1) P(s_(t+1) | s_t, a_t) V^*(s_(t+1)))
  $ <equation19_17>
  - Optimal Policy:
    #box[Policy] ای است که طبق آن باید در هر State ای عملی انجام شود که امید ریاضی Reward به علاوه ارزش قابل انتظار State های بعدی ماکزیمم شود:
  $
    \
    pi^*(s_t) = limits(arg max)_a_t (E[r_(t+1) | s_t, a_t] + gamma sum_(s_(t+1)) P(s_(t+1) | s_t, a_t) V^*(s_(t+1)))
  $
  به این دلیل از State بعدی ماکزیمم می گیریم که عمل مان Stochastic است و ممکن است ما را به State های مختلف ببرد.
]

#tool.tip()[
  اگر محیط ناشناخته باشد و ندانیم با انجام یک عمل چه اتفاقی می افتد، آن را کاوش می کنیم.
]

=== Value Iteration
#tool.definition()[
  الگوریتمی به صورت زیر است:
  #tool.custom_figure(
    image("../images/ML/19_01.png"),
    caption: "الگوریتم Value Iteration",
    inset: 1em,
    kind: raw,
  )
]

=== Policy Iteration
#tool.definition()[
  دوگان الگوریتم Value Iteration به صورت زیر است:
  #tool.custom_figure(
    image("../images/ML/19_02.png"),
    caption: "الگوریتم Policy Iteration",
    inset: 1em,
  )
  که $pi(s)$ (پایِ اِس) از جنس Action است.
  یعنی در حالت s چه Action ای انجام شود.

  وقتی Value ها را با بهترین Policy ای که تا به حال داشتیم، به روز رسانی کردیم، Policy را با Value ها به روز رسانی می کنیم.
]

#tool.tip()[
  همچون الگوریتم K-Means که مراکز اولیه را به صورت تصادفی انتخاب می کردیم، در الگوریتم Policy Iteration، می توان Policy اولیه را کاملاً تصادفی تعیین کرد یا از Default Policy استفاده کرد که در آن احتمال انجام تمام عمل های ممکن در یک State با یکدیگر برابر است.
]

=== Model-Free Learning
#tool.definition()[
  در حالتی که محیط، حالت و پاداش معلوم نباشد:
  $
    "Environment", P(s_(t+1) | s_t, a_t), p(r_(t+1) | s_t, a_t),
    \
    "is not known; model-free learning"
  $
  نیاز به کاوش آن محیط پیدا می کنیم.
  یعنی عملی را انجام می دهیم که در پی آن، ممکن است State جدیدی کشف شود.
  سپس Reward محیط را جمع آوری کرده و از این طریق سعی می کنیم محیط، حالت و پاداش را بشناسیم:
  $
    "There is need for exploration to sample from"
    \
    P(s_(t+1) | s_t, a_t) "and" p(r_(t+1) | s_t, a_t)
  $
  برای این کار باید تعداد زیادی عمل را تولید کنیم.
  مثل محاسبه احتمال که نمونه برداری انجام می دهیم و پارامتر های توزیع احتمالاتی را حدس می زنیم.
]

==== Temporal Difference Learning
#tool.definition()[
  Temporal Difference Learning:
  در این روش، برای هر عمل، ارزش فعلی در نظر گرفته و آن عمل را انجام می دهیم.
  سپس ارزش State ای که در آن قرار می گیریم را با ارزش State فعلی مقایسه می کنیم.
]

#tool.example()[
  در حال حاضر در State ای با ارزش ۷۰ هستیم.
  با انجام عمل a به State ای با ارزش ۸۰ می رویم.
  از آن جایی که ارزش State جدید بیشتر از State فعلی است ($۸۰ - ۷۰ = ۱۰$)، می گوییم ارزش انجام عمل a در State فعلی برابر با ۱۰ است.
  سپس مجدد در State فعلی با انجام عمل a به State ای با ارزش ۷۰ می رویم.
  این بار اختلاف ارزش State جدید با State فعلی برابر ۰ است.
  به این ترتیب تمامی ارزش های ممکن برای عمل a در State فعلی را حساب می کنیم و رفته رفته برای آن ارزش میانگین خوبی را پیدا می کنیم.
]

=== Exploration Strategies
#tool.simple_context()[
  تا این جا فهمیدیم که وقتی محیط برای ما نا آشنا است، با انجام حرکت های شانسی به کاوش در آن می پردازیم.
]
#tool.definition()[
  برای کاوش استراتژی های مختلفی را می توان پیش گرفت.
  یکی از این استراتژی ها، استراتژی greedy-$epsilon$ است.

  greedy-$epsilon$: با احتمال $epsilon$ عملی را به طور تصادفی یکنواخت انتخاب کن؛ و بهترین عمل را با احتمال $1-epsilon$ انتخاب کن.
  $
    "Probabilistic": P(a | s) = (exp Q(s, a)) / (sum_(b=1)^A exp Q(s, b))
  $
  در فرآیند کاوش با انجام سعی و خطا تجربه اولیه ای را کسب می کنیم و با آن $Q(s, a)$ را می سازیم.
  سپس از روی این $Q(s, a)$، $P(a | s)$ را می سازیم.
  به این ترتیب مدل مان را می سازیم و آموزش می دهیم.

  اما مسئله ای وجود دارد.
  از آن جایی که موارد بالا را با کاوش و به صورت نیم بند یاد گرفتیم، باید آن را بهبود ببخشیم.
  بنابراین مانند K-Means چندین بار این عمل را تکرار می کنیم.

  - Exploitation: یعنی سود جویی از بهترین وضعیتی که تا حالا می شناسیم.
    برای مثال وقتی Actor می خواهد عملی را انجام دهد، ابتدا سکه ای می اندازد.
    اگر پشت بیاید، بهترین عمل ممکنی که تا حالا به صورت نیم بند یاد گرفته است را انجام می دهد.
    اگر رو بیاید، به صورت تصادفی یکی از عمل ها را انجام می دهد.
    هرچه بیشتر این کار را انجام می دهیم، احتمال انتخاب یکی از عمل ها به صورت تصادفی کمتر می شود، یعنی مثلاً در این مثال، پس از مدتی، به جای سکه از تاس استفاده می کنیم.
    اگر ۱ تا ۵ آمد، بهترین عمل را انتخاب می کنیم و اگر عدد ۶ آمد یکی از عمل ها را به صورت تصادفی انتخاب می کنیم و به همین ترتیب، رفته رفته احتمال انتخاب یک عمل به صورت تصادفی را کم و کمتر می کنیم #sym.dots.

    این را به صورت فرمول زیر نشان می دهیم که در آن یک متغیر حرارتی به اسم $T$ را تعریف می کنیم.
    اگر $T$ عدد بزرگی باشد، یعنی سیستم حرارت و جنب و جوش بالایی داشته باشد، شانس انجام عمل تصادفی زیاد است.
    رفته رفته سیستم را خنک می کنیم و $T$ اگر به سمت ۰ یا ۱ میل کند، شانس انتخاب بهترین عمل ممکن، بیشتر می شود:
  $
    "Annealing": P(a | s) = (exp display([Q(s, a) / T])) / (sum_(b=1)^A exp display([Q(s, b) / T]))
  $
]

=== Deterministic Rewards and Actions
#tool.definition()[
  تا این جا فهمیدیم که اگر Action و Reward ما Probabilistic باشند، ارزش عمل a در حالت s و زمان t به صورت زیر محاسبه می شود:
  $
    &Q^*(s_t, a_t)
    \
    &= E[r_(t+1)] + gamma sum_(s_(t+1)) P(s_(t+1) | s_t, a_t) max_a_(t+1) Q^*(s_(t+1), a_(t+1))
  $
  اما اگر Action و Reward ما Deterministic باشند، ارزش عمل a در حالت s و زمان t به صورت زیر محاسبه می شود:
  $
    Q(s_t, a_t) = r_(t+1) + gamma max_a_(t+1) Q(s_(t+1), a_(t+1))
  $
  با شروع از ۰، مقادیر $Q$ افزایش می یابند، اما هیچ وقت کاهش نمی یابند.
  به این دلیل مقادیر حالت Non-Decreasing دارند که همیشه ماکزیمم ارزش عمل ها را انتخاب می کنیم.
  مثلاً در شکل زیر با Discount Rate = 0.9، هر کجا که باشیم، با انتخاب ارزش عمل ماکزیمم، هیچ گاه توالی ارزش ها به صورت نزولی نخواهد بود.
  #tool.custom_figure(
    image("../images/ML/19_03.png"),
    caption: $Q^* = 0.9 times max(100, 81) = 90$,
    inset: 1em,
  )
]
