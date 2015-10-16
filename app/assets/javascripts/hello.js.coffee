# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#$ ->
init = ->

  class Sample
    constructor: (@name) ->
      result = document.getElementById 'result'
      result.onclick = =>
        alert "안녕하세요. #{@name} 님!"

  s = new Sample('윤인성')
