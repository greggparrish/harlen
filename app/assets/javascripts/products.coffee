setPrice = () ->
  p = $('#image-set.active').attr('data-price') 
  $('p#price').text('$'+p)
  return

$(document).ready ->
  setPrice()
  return

$(document).on 'turbolinks:load', ->
  $('div#colorbox').click ->
    a = $(this).attr('class')
    b = a.split('_')[1]
    c = $('#image-main.active').attr('class').replace(' active', '').split('_')[1]
    $('#image-set ').removeClass 'active', 100
    $('#image-main ').removeClass 'active', 100
    $('#image-set.' + a).addClass 'active', 100
    $('#image-main.' + b + '_' + c).addClass 'active', 100
    setPrice()
  $('img#image-option').click ->
    a = $(this).attr('class')
    $('#image-main ').removeClass 'active', 100
    $('#image-main.' + a).addClass 'active', 100
    setPrice()
