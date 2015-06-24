window.RZI = {} if typeof window.RZI == "undefined"

#$(window).on("scroll", ->
  #if $(window).scrollTop() == $(document).height() - $(window).height()
    #console.log "yes"
#)

$ ->
  RZI.curPage = 1
  RZI.totalPages = parseInt $(document.body).attr('data-pages'), 10
  RZI.logo = document.getElementById("logo")
  RZI.$footer = $("footer#footer .center-block")
  RZI.resizeFixed = (viewport) ->
    if viewport.is '>xs'
      RZI.logoWidth = Math.ceil(logo.parentNode.parentNode.offsetWidth)
    else
      RZI.logoWidth = "100%"
    $("header h1").css('width', RZI.logoWidth)
    RZI.$footer.css('width', RZI.logoWidth)

  RZI.setResize = ($, viewport) ->
    RZI.resizeFixed(viewport)
    $(window).bind('resize', ->
      RZI.resizeFixed(viewport)
    )
  RZI.setResize(jQuery, ResponsiveBootstrapToolkit)




  RZI.scrollListener = ->
    $(window).one("scroll", -> # unbinds itself every time it fires
      if $(window).scrollTop() >= $(document).height() - $(window).height() - 100
        RZI.fetchPage()

      if RZI.curPage < RZI.totalPages
        setTimeout(RZI.scrollListener, 200) # rebinds itself after 200ms
    )

  RZI.scrollListener()


  RZI.fetchPage = ->
    nextPage = RZI.curPage + 1
    $.get("/page/#{nextPage}", ->
    ).done( (data) ->
      RZI.curPage = nextPage
      $entries = $("#main .entry", data)
      $("#main").append($entries)
    )


  # wrap main entry image in same link as title (without text)
  # not needed if no summary...
  #if $("#main.listing").length > 0
    #$(".entry").each ->
      ##link = $('h2 a', this).attr("href")
      #$anchor = $('h2 a', this)
      #$img = $('img:first', this)
      #$img.wrap($anchor.clone().empty())
