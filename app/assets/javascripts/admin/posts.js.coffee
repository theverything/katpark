# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('.add-image').click ->
  imageUrl = $(@).data('image-url')
  imageName = $(@).data('image-name')
  $("#post_body").insertAtCaret("![#{imageName}](#{imageUrl})")
