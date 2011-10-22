# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('form#new_funcan')
    .live 'ajax:beforeSend', (xhr, settings) ->
      $('.button-container button').prop('disabled', true)
      $('#new_indicator').show()
    .live 'ajax:success', (data, status, xhr) ->
      $('#stream-items').prepend(status).children(':first').hide().fadeIn();
      $('#new_funcan').get(0).reset()
    .live 'ajax:complete', (xhr, status) ->
      $('#new_indicator').hide()
      $('.button-container button').prop('disabled', false)
