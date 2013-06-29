# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $(".instagram").instagram
      hash: 'katpark'
      clientId: 'c3901ab170794c17a0c29c77a565c23a'
      show: 1
      image_size: 'low_resolution'

