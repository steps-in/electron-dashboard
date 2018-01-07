console.log 'i am a coffee maker!'

Vue = require 'vue'
Example = require './component/example.vue'

new Vue
    el: '#app'
    components:
        container: Example
    render: (h) ->
        return h 'container', {}