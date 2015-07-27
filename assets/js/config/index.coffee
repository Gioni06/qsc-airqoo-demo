module.exports = {
  menu: '#menu'
  anchors:['Home','retail','corporate','hospitality', 'Kontakt']
  navigation: true
  slidesNavigation: true
  slidesNavPosition: 'bottom'
  responsive: 1025
  responsiveHeight: 830
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
  sectionsColor : ['#ccc', '#fff']
  paddingTop: '121px'
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