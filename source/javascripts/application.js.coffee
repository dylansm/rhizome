window.RZI = {} if typeof window.RZI == "undefined"

$ ->
  RZI.logo = document.getElementById("logo")
  RZI.$footer = $("footer#footer .center-block")
  RZI.resizeFixed = (viewport) ->
    if viewport.is '>xs'
      RZI.logoWidth = Math.floor(logo.parentNode.parentNode.offsetWidth)
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
