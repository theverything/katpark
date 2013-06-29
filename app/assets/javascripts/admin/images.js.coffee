# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height()
        $('.pagination').text("")
        $('.pagination').append("Fetching more stuff <img src='/assets/ajax-loader.gif' />")
        $.getScript(url)
    $(window).scroll()
