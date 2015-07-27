window.$ = window.jQuery    = require 'jquery'
bootstrap                   = require 'bootstrap'
window.fullpage             = require './fullpage.js'
window.url                  = require 'url'
window._ = _                = require 'underscore'
angular                     = require 'angular'
ngSanitize                  = require 'angular-sanitize'
ngAnimate                   = require 'angular-animate'

$ = window.$
jQuery = window.jquery
fullpage = window.fullpage

# Document Ready Function
$(document).ready require './modules/DocumentReady.coffee'
  
# Window Resize Handler
$(window).on 'resize', require './modules/ResizeFunction.coffee'

# Anguluarjs app displaying the /glossar page

GlossarController = require './angular/GlossarController.coffee'

 
airqoo = angular.module 'airqoo',['ngSanitize', 'ngAnimate'], () ->

airqoo.controller 'glossarController', ['$scope', GlossarController]  

airqoo.filter 'noSpace', ->
  (value) ->
    if !value then '' else value.replace(RegExp(' ', 'g'), '')
    
airqoo.filter 'rawHtml', [
  '$sce'
  ($sce) ->
    (val) ->
      $sce.trustAsHtml val
]

airqoo.filter 'highlight', ['$sce',($sce) ->
  (text, phrase) ->
    if phrase
      text = text.replace(new RegExp('(' + phrase + ')', 'gi'), '<mark>$1</mark>')
    $sce.trustAsHtml text
  ]

airqoo.filter 'truncate', ->
  (text, length, end) ->
    if isNaN(length)
      length = 10
    if end == undefined
      end = '<small>  [ ... ]</small>'
    if text.length <= length or text.length - (end.length) <= length
      text
    else
      String(text).substring(0, length - (end.length)) + end 
      
airqoo.filter 'markdown', ['$sce', ($sce) ->
  converter = new Showdown.converter()
  (value) ->
    html = converter.makeHtml(value or '')
    $sce.trustAsHtml html
  ]
  
# Fetch the news feed items by tag name

# Anguluarjs app displaying the /news page

NewsController = require './angular/NewsController.coffee'
 
news = angular.module 'airqoo-news',['ngSanitize', 'ngAnimate','ui.bootstrap'], () ->
    
news.controller 'newsController', ['$scope', '$q', '$http', NewsController]