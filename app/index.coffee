Vue = require 'vue'
Main = require './component/main-wrap.vue'

new Vue
    el: '#app'
    components:
        container: Main
    render: (h) ->
        return h 'container', {}