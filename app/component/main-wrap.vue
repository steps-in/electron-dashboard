<template lang="jade">
	div#wrap.container-fluid
		div.row.align-items-center.header
			div.col-auto.mr-auto.brand
				img.brand-img(src='asset/gurum-inc.png')
			div.col-auto.brand-title
				p {{appTitle}}
					span.oi.oi-fire
		div.row
			control-panel
			timeline-panel
			realtime-panel
</template>

<style lang="stylus">
	border-radius()
		-webkit-border-radius arguments
		-moz-border-radius arguments
		border-radius arguments

	body
		background-color #1B1B1B
		color #ffffff

	#wrap
		.header
			height 80px
			.brand
				height 40px
			.brand-title
				p
					color #a2a2a2
					font-size 0.9em
					font-family Helvetica, Arial, sans-serif
					margin-bottom 0
					text-decoration underline
				span.oi
					padding-left 0.5em
					padding-right 1.25em

	ul
		li a
			display block
			color blue
			padding 5px
			html.ie &
				padding 6px
			&:hover
				color red
</style>

<script lang="coffee">
	appTitle = "Electron Dashboard"
	condition = "Your Vue.js App"

	controlPanel = require './control-panel.vue'
	timelinePanel = require './timeline-panel-c3.vue'
	realtimePanel = require './realtime-panel-chartjs.vue'

	module.exports =
		components: { controlPanel, timelinePanel, realtimePanel }
		data: () -> { appTitle, msg: condition }
</script>
