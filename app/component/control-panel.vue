<template>
	<div class="col-3 control-panel">
		<device-status device-title="Server"></device-status>
		<device-status device-title="Client"></device-status>
		<device-control></device-control>
	</div>
</template>

<style lang="stylus">
	.control-panel
		background-color #2D2D2D
		padding 1em
</style>

<script lang="coffee">
	deviceStatus = require './device-status.vue'
	deviceControl = require './device-control.vue'

	module.exports =
		components: { deviceStatus, deviceControl }
		data: () -> {}
</script>
