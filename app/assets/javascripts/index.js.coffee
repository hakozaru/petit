$ ->
  start_petit = new Vue(
    el: "#getting_started"
    data:
      demodata: "demodata"
    methods:
      getSignupForm: ->
        console.log("test")
        $("#button_signup").slideToggle(150);
        #$(".login_button").slideToggle(0.01);

      getLoginForm: ->
        console.log("test2")
        $("#button_login").slideToggle(150);
        #$(".signup_button").slideToggle(0.01);
  )
