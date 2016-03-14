$ ->
  # トップページのログイン、サインアップボタン動作用
  start_petit = new Vue(
    el: "#getting_started"
    methods:
      getSignupForm: ->
        if $('#button_login').css('display') == 'none'
          $("#button_signup").animate { opacity: 'toggle' }, { duration: 300, easing: 'swing' }
        else
          $("#button_login").animate { opacity: 'hide' }, { duration: 300, easing: 'swing' }
          # タイマ処理
          end_count = 0
          interval = setInterval((->
            end_count++
            # タイマリセット
            if end_count == 3
              clearInterval interval
              $("#button_signup").animate { opacity: 'toggle' }, { duration: 300, easing: 'swing' }
          ), 100)

      getLoginForm: ->
        if $('#button_signup').css('display') == 'none'
          $("#button_login").animate { opacity: 'toggle' }, { duration: 300, easing: 'swing' }
        else
          $("#button_signup").animate { opacity: 'hide' }, { duration: 300, easing: 'swing' }
          # タイマ処理
          end_count = 0
          interval = setInterval((->
            end_count++
            # タイマリセット
            if end_count == 3
              clearInterval interval
              $("#button_login").animate { opacity: 'toggle' }, { duration: 300, easing: 'swing' }
          ), 100)
  )
