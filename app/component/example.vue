<template lang="jade">
	div
		h2 A minimal Electron application with {{msg}}
		#container.col
			if condition
				p You are amazing
			else
				p Get on it!
			p.
				make it easy with electron app
				jade(pub) template, stylus css pre-processor and coffee script!
			ul
				li
					a(href='https://google.com', target='_blank') Google
				li
					a(href='https://facebook.com', target='_blank') Facebook

			button(class='button') Save

</template>

<script lang="coffee">
	condition = 'Your Vue.js App'

	module.exports =
		data: () ->
			msg: condition
</script>

<style lang="stylus">
	border-radius()
		-webkit-border-radius arguments
		-moz-border-radius arguments
		border-radius arguments

	.col
		font-size 14px
		color #666

	p
		font 1.2em Helvetica, Arial, sans-serif

	button.button
		border-radius 5px
		border solid 1px gainsboro
		padding 10px

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