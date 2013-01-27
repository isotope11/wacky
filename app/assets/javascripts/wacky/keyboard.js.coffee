$ ->
  helpContainer = ->
    $('.wacky-keyboard-commands')

  eKeyPressed = (e) ->
    e.which == 69

  vKeyPressed = (e) ->
    e.which == 86

  questionMarkPressed = (e) ->
    e.shiftKey && e.which == 191

  escPressed = (e) ->
    e.which == 27

  goToEditPage = ->
    if editPageLink()
      window.location = editPageLink().href

  goToPageVersions = ->
    if pageVersionsLink()
      window.location = pageVersionsLink().href

  editPageLink = ->
    $('a[rel=edit-page]')[0]

  pageVersionsLink = ->
    $('a[rel=page-versions]')[0]

  showHelp = ->
    helpContainer().show()

  hideHelp = ->
    helpContainer().hide()

  $(window).on 'keyup', (e) ->
    if eKeyPressed(e)
      goToEditPage()
    if vKeyPressed(e)
      goToPageVersions()
    if escPressed(e)
      hideHelp()

  $(window).on 'keydown', (e) ->
    if questionMarkPressed(e)
      showHelp()

  hideHelp()
