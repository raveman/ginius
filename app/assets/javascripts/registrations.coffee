# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$("form#sign_in_user, form#sign_up_user").bind("ajax:success", (event, data, status, xhr) ->
		location.reload()    
		# $(this).parents('.modal').modal('hide')
	).bind("ajax:error", (event, data, status, xhr) ->
		# console.log(data)
		# console.log(status)
		if status == 'error'
			error_messages = "<div class='alert alert-danger'>" + data.responseText 
			error_messages += "<br><a href='/user/password/new'>Забыли пароль ?</a></div>"
			# error_messages += `<%= raw(render("devise/shared/links"))%`

		# error_messages = if data.responseJSON['error']
		#   "<div class='alert alert-danger pull-left'>" + data.responseJSON['error'] + "</div>"
		# else if data.responseJSON['errors']
		#   $.map(data.responseJSON["errors"], (v, k) ->
		#     "<div class='alert alert-danger pull-left'>" + k + " " + v + "</div>"
		#   ).join ""
		# else
		#   "<div class='alert alert-danger pull-left'>Unknown error</div>"
		$(this).parents('.modal-content').children('.modal-footer').html(error_messages)
	)