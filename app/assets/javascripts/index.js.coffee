$ ->
  start_petit = new Vue(
    el: "#getting_started"
    data:
      demodata: "demodata"
    methods:
      getSignupForm: ->
        console.log("test")

      getLoginForm: ->
        console.log("test2")
  )
