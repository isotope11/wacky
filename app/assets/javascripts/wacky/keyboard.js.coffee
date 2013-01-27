$ ->
  eKeyPressed = (e) ->
    e.which == 69

  goToEditPage = ->
    if editPageLink()
      window.location = editPageLink().href

  editPageLink = ->
    $('a[rel=edit-page]')[0]

  $(window).on 'keyup', (e) ->
    if eKeyPressed(e)
      goToEditPage()
