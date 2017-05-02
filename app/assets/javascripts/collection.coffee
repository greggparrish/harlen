$('body').click ->
  console.log 'clicked'
  return

$(document).on 'turbolinks:load', ->
	$('div#colorbox').click ->
		a = $(this).attr('class')
		$('#image-set ').removeClass 'active', 100
		$('#image-set.' + a).addClass 'active', 100
    

