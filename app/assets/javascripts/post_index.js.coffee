$ ->
  $('img.img-crop').each ->
    $img = $(this)
    $img.height $img.width() * .75

$(window).resize ->
  $('img.img-crop').each ->
    $img = $(this)
    $img.height $img.width() * .75
