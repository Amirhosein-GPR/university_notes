#import "../assets/typst/tools/tool.typ"
#import "../assets/typst/tools/tool.typ": red_color, orange_color, green_color

= جلسه بیست و یکم
== طراحی و اجرای آزمایش های یادگیری ماشین

=== تقویت مهارت ML Enginner خوب بودن
#tool.special()[
  #align(center)[
    این بخش احتمالاً نمیاد تو امتحان اما به عنوان نصیحت از استاد بپذیرید!#emoji.face.red#emoji.face.salute
  ]

  #list(marker: emoji.peach)[
    به عنوان یک ML Engineer سعی کنین که فقط تو یه حوزه متمرکز نشید!#emoji.face.cold#emoji.face.woozy

    مثلاً فقط در حوزه تحلیل تصاویر پزشکی فعالیت کردن خوب نیست.
    چون به تعداد کافی پروژه در یک حوزه تخصصی وجود نداره و از طرفی همه فن حریف می شین اگه تو حوزه های مختلف کار کنید!#emoji.face.bandage#emoji.face.beam
  ]

  #list(marker: emoji.watermelon)[
    مسائل حوزه یادگیری ماشین گاهی اوقات به همدیگه شباهت دارن و میشه با کمی تغییر، راه حل یک حوزه رو برای حوزه دیگه ای استفاده کرد.
    این کار منجر به نوآوری هم میشه که باعث میشه ایده هایی رو از رشته های مختلف ترکیب کنین و راهکار جدیدی رو ارائه بدین.#emoji.face.stars#emoji.face.party
  ]

  پس
  نکته ها:
  + #emoji.cherries گستردگی مطالعات داشته باشین تا به زایش فکری برسین!#emoji.face.hug#emoji.face.halo
  + #emoji.apple با هر روشی که در دسترس تون هست با داده ها بازی کنید!#emoji.face.goofy#emoji.controller
    + #emoji.blueberries اول چشمی بررسی کنید ویژگی های داده ها در چه بازه ای هستن.#emoji.face.think#emoji.face.tired
    + #emoji.banana بعد مثلاً Scatter Plot اشون رو رسم کنید تا به صورت تصویری ببینید داده ها چه رابطه ای دارن#emoji.face.skeptic#emoji.chart
    + میشه از فاصله اقلیدسی نقاط داده ها در فضا هم کمک گرفت تا رابطه شون رو بررسی کنید.#emoji.face.tear.withheld#emoji.star.shoot
      // - اگه تعداد نقاط یا همون تعداد ویژگی ها ۱۰۰ عدد باشه، فاصله اقلیدسی همچنان یه عدده پس
    + #emoji.tomato مدل های مختلف رو روشون تست کنید و ببینین کدوما عملکرد بهتری روی این داده ها دارن!#emoji.face#emoji.face.wink
    + #emoji.kiwi از Confusion Matrix برای اندازه گیری Precision و Accuracy مدل های مختلف روی این داده ها استفاده کنید.#emoji.face.monocle#emoji.fingers.pinch
  + #emoji.pineapple در یادگیری ماشین، ویژگی هایی که انتخاب می کنین باید مرتبط با Task و نتیجه ای که می خواین به دست بیارین، باشه.#emoji.face.eyeroll#emoji.face.flush
  + #emoji.pear خیلی وقتا ML Engineer باید در علمی یا خودش استاد باشه یا از اساتید اون رشته برای به دست آوردن ویژگی های مناسب، استفاده کنه.#emoji.face.disguise#emoji.face.nerd

  درس اخلاق:
  + #emoji.carrot سعی کنین تو کار های تیمی که افراد با تخصص های مختلفی کار می کنن، همدیگه رو تحمل کنید.#emoji.face.sneeze#emoji.face.triumph
]
=== Confusion Matrix
#tool.definition()[
  در جدول زیر، برای کلاس Iris-versicolor، عدد ۲، False Negative و عدد ۱، False Positive است.

  در Confusion Matrix:
  - Precision (Or Reliability):
    جمع تعداد نمونه های درست دسته بندی شده در هر ستون، تقسیم بر مجموع اعداد آن ستون.

  - Accuracy:
    جمع تعداد نمونه های درست دسته بندی شده در هر سطر، تقسیم بر مجموع اعداد آن سطر.

  #tool.custom_figure(caption: "نمونه ای از یک Confusion Matrix برای داده های Iris", kind: table, inset: 1em)[
    #table(
      columns: 6,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      table.cell(stroke: none)[], table.cell(stroke: none)[], table.cell(colspan: 3, "Predicted"), table.cell(
        stroke: none,
      )[],
      table.cell(stroke: none)[], table.cell(
        stroke: none,
      )[], "Iris-\nsetosa", "Iris-\nversicolor", "Iris-\nvirginica", $sum$,
      table.cell(rowspan: 3, "Actual"), "Iris-\nsetosa", table.cell(fill: green_color.lighten(60%))[50], "0", "0", "50",
      "Iris-\nversicolor", "0", table.cell(fill: green_color.lighten(60%))[48], table.cell(
        fill: red_color.lighten(60%),
      )[2], "50",
      "Iris-\nvirginica", "0", table.cell(fill: red_color.lighten(60%))[1], table.cell(
        fill: green_color.lighten(60%),
      )[49], "50",
      table.cell(stroke: none)[], $sum$, "50", "49", "51", "150"
    )
  ]
  مثال Precision با توجه به جدول بالا:
  $
    "Precision" = 50 / 50 + 48 / 49 + 49 / 51
  $

  مثال Accuracy با توجه به جدول بالا:
  $
    "Accuracy" = 50 / 50 + 48 / 50 + 49 / 50
  $
]

#tool.example()[
  فرض کنید می دانیم که گوگل ۲۰ میلیارد صفحه را Index کرده است:
  $
    "تعداد کل صفحات": 2 times 10^10
  $
  از طرفی می دانیم تعداد واقعی صفحات گرده پزی های همدان ۱ میلیون عدد است:
  $
    "تعداد واقعی صفحات گرده پزی های همدان": 10^6
  $
  از گوگل می خواهیم تمام این ۱ میلیون صفحه را برایمان لیست کند.
  گوگل این تعداد صفحه را به ما می دهد، اما فقط ۱۰۰ هزار عدد از آن ها درست است:
  $
    "تعداد کل صفحات برگردانده شده": 10^6
    \
    "تعداد صفحات درست و مرتبط برگردانده شده": 10^5
    \
    "تعداد صفحات نادرست و غیر مرتبط برگردانده شده": 9 times 10^5
  $
  با توجه به این اطلاعات، Confusion Matrix مرتبط با آن ها را رسم می کنیم:
  #tool.custom_figure(caption: "Confusion Matrix داده ها", kind: table, inset: 1em)[
    #table(
      columns: 3,
      inset: 1em,
      stroke: black,
      align: center + horizon,
      table.cell(stroke: none)[], $+$, $-$,
      $+$, table.cell(fill: green_color.lighten(60%))[$10^5$], table.cell(fill: red_color.lighten(60%))[$9 times 10^5$],
      $-$, table.cell(fill: red_color.lighten(60%))[$9 times 10^5$], table.cell(
        fill: green_color.lighten(60%),
      )[$199,981 times 10^5$],
    )
  ]

  در آخر، Accuracy و Precision آن ها را به دست می آوریم:

  $
    "Accuracy" = (199,981 times 10^5) / (2 times 10^10) tilde.eq 0.99
  $
  $
    "Precision" = 10^5 / 10^6 = 0.1
  $
  در این مثال Accuracy به درد نمی خورد و به جای آن از Precision استفاده می کنیم.
]

#tool.tip()[
  Accuracy برای مواقعی که تعداد کلاس ها و اهمیت شان نزدیک به یکدیگر باشد، مناسب است.
  اگر این گونه نبود، از Precision استفاده می کنیم.
]
