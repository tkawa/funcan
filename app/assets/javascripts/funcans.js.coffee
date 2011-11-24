# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('form#new_funcan')
    .live 'ajax:beforeSend', (event, xhr, settings) ->
      $('.button-container button').prop('disabled', true)
      $('#new_indicator').show()
    .live 'ajax:success', (event, data, status, xhr) ->
      $('#stream-items').prepend(data).children(':first').hide().fadeIn();
      $('#new_funcan').get(0).reset()
    .live 'ajax:complete', (event, xhr, status) ->
      $('#new_indicator').hide()
      $('.button-container button').prop('disabled', false)

  $('.vote-container form')
    .live 'ajax:beforeSend', (event, xhr, settings) ->
      $(this).children('button').prop('disabled', true)
    .live 'ajax:success', (event, data, status, xhr) ->
      elem = $(this).children('.count')
      elem.text(parseInt(elem.text()) + 1)
      elem.effect('highlight')
    .live 'ajax:complete', (event, xhr, status) ->
      $(this).children('button').prop('disabled', false)

  $('a.label.count')
    .live 'ajax:beforeSend', (event, xhr, settings) ->
      event.stopPropagation()
    .live 'ajax:success', (event, data, status, xhr) ->
      dialog = $('#vote-users')
      dialog.empty()
      dialog.append(data)
      dialog.css('top', $(this).position().top)
#      dialog.modal(backdrop: 'static')
      dialog.show()
      event.stopPropagation()
    .live 'ajax:complete', (event, xhr, settings) ->
      event.stopPropagation()

  $(document).bind 'end.pjax', (event, xhr, options) ->
    $('ul.tabs li').removeClass('active')
    $("ul.tabs li:has(a[href='#{location.pathname}'])").addClass('active')

  $('.close').live 'click', ->
    $('#vote-users').hide()
