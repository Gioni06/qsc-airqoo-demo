module.exports = {
  menu: '#menu'
  anchors:['Start']
  navigation: false
  navigationPosition: 'right'
  slidesNavigation: false
  slidesNavPosition: 'bottom'
  responsive: 1025
  responsiveHeight: 740
  css3: true
  scrollingSpeed: 900
  autoScrolling: true
  fitToSection: false
  scrollBar: true
  easing: 'easeInOutCubic'
  easingcss3: 'ease'
  loopBottom: false
  loopTop: false
  loopHorizontal: false
  continuousVertical: false
  scrollOverflow: false
  touchSensitivity: 15
  
  #Accessibility
  keyboardScrolling: true
  animateAnchor: true
  recordHistory: true
  
  #Design
  controlArrows: false
  verticalCentered: true
  resize : false
  paddingTop: '60px'
  paddingBottom: '60px'
  fixedElements: ''
  
  #Custom selectors
  sectionSelector: '.section'
  slideSelector: '.slide'
  
  onLeave: ( index, nextIndex, directon ) ->
  afterLoad: ( anchorLink, index ) ->
  afterRender: () ->
  afterResize: () ->
  afterSlideLoad: ( anchorLink, index, slideAnchor, slideIndex ) ->
  onSlideLeave: ( anchorLink, index, slideIndex, direction ) ->
}