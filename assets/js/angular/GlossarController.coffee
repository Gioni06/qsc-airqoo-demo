_ = require 'underscore'
showdown = require 'showdown'

module.exports = class GlossarController
  constructor: ($scope) ->
    $scope.affix = []
    $scope.items = []
    data = window.glossarItemsRaw
    
    #convert the raw markdown from contentful to html
    converter = new showdown.Converter()
    
    _.mapObject data, (item)->
       item.excerpt = converter.makeHtml(item.excerpt)
        
    $scope.affix = data;
    $scope.items = data
    
    $scope.travel = ($event) ->
      console.log $event
      $event.preventDefault()
      console.log angular.element('<body>')
      angular.element('<body>').animate { scrollTop: angular.element($event.hash).top + 120 }, 300, ->
      return