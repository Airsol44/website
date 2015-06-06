// nice slider

$ (function () {
  $ (".as_work").each (function (i) {
    var work = $ (this)
    work.find (".as_slider__item:first-of-type").addClass ("as_slider__active")
    if (work.find (".as_slider__active").is (":last-of-type"))
      work.find (".as_slider__next").addClass ("as_hidden")
    work
      .find (".as_slider__toggle")
      .click (function (e) {
        e.preventDefault ()
        var btn = $ (this)
        var state = btn.attr ("data-toggle")
        var target = btn.attr ("data-target")
        var table = $ ("#" + target + " .as_work__table")
        var slider = $ ("#" + target + " .as_slider")
        switch (state) {
          case "table":
            btn
              .attr ("data-toggle", "slider")
              .text ("Fermer la galerie")
            table.addClass ("as_hidden")
            slider.removeClass ("as_hidden")
            break
          case "slider":
            btn
              .attr ("data-toggle", "table")
              .text ("Ouvrir la galerie")
            slider.addClass ("as_hidden")
            table.removeClass ("as_hidden")
            break
        }
      })
    work
      .find (".as_slider__next")
      .click (function (e) {
        e.preventDefault ()
        var target = $ (this).attr ("data-target")
        var active = $ ("#" + target + " .as_slider__active")
        var next = active.next ()
        active.removeClass ("as_slider__active")
        next.addClass ("as_slider__active")
        if (active.is (":first-of-type"))
          $ ("#" + target + " .as_slider__prev").removeClass ("as_hidden")
        if (next.is (":last-of-type"))
          $ (this).addClass ("as_hidden")
      })
    work
      .find (".as_slider__prev")
      .click (function (e) {
        e.preventDefault ()
        var target = $ (this).attr ("data-target")
        var active = $ ("#" + target + " .as_slider__active")
        var prev = active.prev ()
        active.removeClass ("as_slider__active")
        prev.addClass ("as_slider__active")
        if (active.is (":last-of-type"))
          $ ("#" + target + " .as_slider__next").removeClass ("as_hidden")
        if (prev.is (":first-of-type"))
          $ (this).addClass ("as_hidden")
      })
  })
})
