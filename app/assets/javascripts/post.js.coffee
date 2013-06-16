# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
    $(document).ready ->
        $("div#loadgif").hide()
    $("#PostNew").submit (e) ->
        $("div#loadgif").show()