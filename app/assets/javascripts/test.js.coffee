$ ->
  demo = new Vue(
    el: "#demo"
    data:
      firstName: "太郎"
      lastName: "山田"
    methods:
      execute: ->
        @message = "実行しました"
        return
  )

  return
