# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
    $(document).ready ->
        $("#exitLink").mouseenter (e) ->
            e.preventDefault(e)
            $(@).html("جوووووون مادرت نرو ");
        $("#exitLink").mouseleave (e) ->
            e.preventDefault(e)
            $(@).html("خروج از سایت");

        $("#ProfileLink").mouseenter (e) ->
            e.preventDefault(e)
            $(@).html("مال خومونه");
        $("#ProfileLink").mouseleave (e) ->
            e.preventDefault(e)
            $(@).html("صفحه شخصي");

        $("#newPostLink").mouseenter (e) ->
            e.preventDefault(e)
            $(@).html("پست رو بده بالا...");
        $("#newPostLink").mouseleave (e) ->
            e.preventDefault(e)
            $(@).html("پست جدید");