{parseString} = require 'xml2js'
_ = require 'underscore'


module.exports = class NewsController
  constructor: ($scope,$q,$http) ->
    data =   @getNews($q,$http)
    feedItems2D = []
    #setTimeout ()->,

    #while data[0]
      #feedItems2D.push data.splice(0, 4)
    #console.log feedItems2D
    $scope.items = data
    
  getNews: ($q,$http)->
      def = $q.defer()
      feedItems = []
      $http.get('https://oygo.hadar.uberspace.de/feedProxy/proxy.php').success (xml)->
        parseString xml, (err,res) ->
          items = res.rss.channel[0].item
          _.each items, (item)->
             feedItems.push item
        feedItems
      return feedItems