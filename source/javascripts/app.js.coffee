#= require vendor/jquery
#= require foundation
$(document).foundation()

$ ->
  # Manually fix up download links
  $('a:contains("download-icon")').addClass('foundicon-down-arrow').text('')
