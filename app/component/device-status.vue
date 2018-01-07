<template>
	<div class="device-status">
		<h3>{{deviceTitle}}</h3>
		<div class="row">
			<div class="col">
				<div class="info-count info-cpu">
					<span>16</span><br>
					CPUs
				</div>
			</div>
			<div class="col">
				<div class="info-count info-cpu">
					<span>32G</span><br>
					Memory
				</div>
			</div>
			<div class="col">
				<div class="info-count info-cpu">
					<span>96</span><br>
					Islands
				</div>
			</div>
			<div class="col">
				<div class="info-count info-cpu">
					<span>40G</span><br>
					Bandwidth
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="stylus">
	.device-status
		font-size: 10px
		text-align: center
		border-top: 1px solid #424242
		border-bottom: 1px solid #424242
		padding 8px 0
		margin 4em 10px 2em
		position: relative
		h3
			font-size: 15px
			text-align: left
			position: absolute
			top: -1.5em
			color: #FEBE57
	.info-count
		font-family: Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace
		color: #656565
		span
			font-size: 2em
			color: #ffffff
</style>

<script lang="coffee">
	module.exports =
		props: ['deviceTitle']
		data: () -> {}
</script>
