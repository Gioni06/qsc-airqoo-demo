# Configuration
indexOpts                 = require '../config/index.coffee'
retailOpts                = require '../config/retail.coffee'
aboutOpts                 = require '../config/about.coffee'
newsOpts                  = require '../config/news.coffee'
corporateOpts             = require '../config/corporate.coffee'
hospitalityOpts             = require '../config/hospitality.coffee'

module.exports = ()->
  pathObject = url.parse(window.location.href)
  longPath = pathObject.pathname.split('/')
  segment = _.last(longPath)
  pathname   = segment.split('.html')[0]
  console.log pathname
  switch pathname
    when '' then $('#index').fullpage(indexOpts)
    when 'index' then $('#index').fullpage(indexOpts)
    when 'retail' then $('#fp-retail').fullpage(retailOpts)
    when 'corporate' then $('#fp-corporate').fullpage(corporateOpts)
    when 'hospitality' then $('#fp-hospitality').fullpage(hospitalityOpts)
    when 'about' then $('#fp-about').fullpage(aboutOpts)
    when 'news' then $('#fp-news').fullpage(newsOpts)

  # Make the Site more mobile friendly

  contactContainer = $('#contactFormContainer')
  footer = $('.responsive-footer')
  footerHeight = footer.height()
  contactContainer.css 'padding-bottom': footerHeight + 'px'
  mainSlideContainer = $('#landingPage')
  banner = $('#bannerBottom')
  bannerHeight = banner.height()
  mainSlideContainer.css 'padding-bottom': bannerHeight + 'px'

  # Go to First slide on click

  $('.scrollToTop').on 'click', (e) ->
    e.preventDefault()
    $.fn.fullpage.moveTo(1)


  # Handle Slider

  watchBig = (data, i) ->
    # you can capture which attribute has changed
    propChanged = data.props[i]
    valChanged = data.vals[i]
    target.css
      '-webkit-transform': data.vals[0]
      'transform': data.vals[0]
      'left': data.vals[2]
    return

  watchSmall = (data, i) ->
    # you can capture which attribute has changed
    propChanged = data.props[i]
    valChanged = data.vals[i]
    el.css
      '-webkit-transform': data.vals[0]
      'transform': data.vals[0]
      'left': data.vals[2]
    return

  showInfo = (args) ->
    setHandleWidthOffset args.targetSlideNumber
    item = $('.iosSlider').find('.item:nth-child(' + args.targetSlideNumber + ')')
    $('.infoHeadline').text item.data('infoheadline')
    $('.infoText').text item.data('infotext')
    return

  getSliderItems = (slider) ->
    slider.find('.item').length

  setHandleWidthOffset = (slideNumber) ->

    calc = (slideNumber) ->
      slideNumber / getSliderItems($('.iosSlider')) * 100 - (100 / getSliderItems($('.iosSlider')))

    $('.pagination-bar-content').css
      '-webkit-transform': 'translate3d(' + calc(slideNumber) + '%' + ', 0px, 0px)'
      'transform': 'translate3d(' + calc(slideNumber) + '%' + ', 0px, 0px)'
    return

  $('.iosSlider').iosSlider
    desktopClickDrag: true
    snapToChildren: true
    sliderCSS: overflow: 'scroll!important'
    keyboardControls: false
    onSlideChange: showInfo

  $('#backgroundslider').iosSlider
    desktopClickDrag: true
    snapToChildren: true
    sliderCSS: overflow: 'scroll!important'
    keyboardControls: false
    onSlideChange: showInfo

  el = $('.slider')
  target = $('.background_slider')
  # Hook up CSS and Class watch operation
  target.watch
    properties: '-webkit-transform,transform,left'
    callback: watchSmall
  el.watch
    properties: '-webkit-transform,transform,left'
    callback: watchBig
  $('.pagination-bar-handle').css 'width': 100 / getSliderItems($('.iosSlider')) + '%'

  # Slider Operations And Helpers

  $('[data-toggle="tooltip"]').on 'click', (e) ->
    e.preventDefault()
    return

  $('[data-toggle="tooltip"]').tooltip()

  item = $('.iosSlider').find('.item:nth-child(1)')

  $('.infoHeadline').text item.data('infoheadline')

  $('.infoText').text item.data('infotext')

  $('.forward').on 'click', (e)->
    e.preventDefault()
    $.fn.fullpage.moveSectionDown()
    return

  # Pretty Scrolling for the glossar page

  $('body').on 'click', '.nav-ancor', (e) ->
    # prevent default anchor click behavior
    e.preventDefault()
    # animate
    $('html, body').animate { scrollTop: $(@hash).offset().top - 150 }, 300, ->
    return

  # Scroll Top Plugin

  $('body').materialScrollTop()

  # Form Wizard

  $('.bs-wizard').bs_wizard()
  $('#last-step-back-button').click($(".bs-wizard").bs_wizard('go_prev'))
  $('input').on 'blur', (event)->
    if not event.target.checkValidity() then event.target.classList.add('has-error') else event.target.classList.remove('has-error')

  # Hacky Form Validation
  validateEmail = (email) ->
    re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    re.test email

  $('.stepOne').find('.btn').attr({'disabled': 'disabled'})
  $('.stepFour').find('.btn-primary').attr({'disabled': 'disabled'})

  $('input').on 'change', ()->
    if ($('#salutation').val() != '') and ($('#first_name').val() != "") and ($('#last_name').val() != "") and ( ($('#email').val() != "") and validateEmail($('#email').val()) ) then $('.stepOne').find('.btn').removeAttr("disabled") else $('.stepOne').find('.btn').attr({'disabled': 'disabled'})

  $('textarea').on 'change', ()->
    if $('#message').val() != '' then $('.stepFour').find('.btn-primary').removeAttr("disabled") else $('.stepFour').find('.btn-primary').attr({'disabled': 'disabled'})

  # Contact Form Success
  checkFirstName = ()->
     selector = $('#first_name')
     if !Boolean selector.val() then selector.addClass 'has-error' else selector.removeClass 'has-error'
     Boolean selector.val()
  checkLastName = ()->
     selector = $('#last_name')
     if !Boolean selector.val() then selector.addClass 'has-error' else selector.removeClass 'has-error'
     Boolean selector.val()
  checkEmail = ()->
     selector = $('#email')
     if !Boolean selector.val() or validateEmail selector.val() then selector.addClass 'has-error' else selector.removeClass 'has-error'
     Boolean selector.val()

  $('#contactForm').on 'submit', (e) ->
    e.preventDefault()
    checkFirstName()
    checkLastName()
    checkEmail()
    if checkFirstName() and checkLastName() and checkEmail() and validateEmail($('#email').val())
      $.post('https://oygo.hadar.uberspace.de/feedProxy/salesforce.php', $('#contactForm').serialize()).done (data) ->
        console.log data
        $modal = $('.modal')
        $modal.modal 'show'
        return
    return
