module.exports = ()->
  contactContainer = $('#contactFormContainer')
  footer = $('.responsive-footer')
  footerHeight = footer.height()
  contactContainer.css 'padding-bottom': footerHeight + 'px'
  mainSlideContainer = $('#landingPage')
  banner = $('#bannerBottom')
  bannerHeight = banner.height()
  mainSlideContainer.css 'padding-bottom': bannerHeight + 'px'
  return