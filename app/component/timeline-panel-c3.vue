<template>
	<div class="col-6 timeline-panel">
		<div class="row panel-1">
			<div class="col">
				<h4>Time-line 1 graph</h4>
			</div>
		</div>
		<vue-c3 :handler="chartHandler1"></vue-c3>
		<div class="row panel-2">
			<div class="col">
				<h4>Time-line 2 graph</h4>
			</div>
		</div>
		<vue-c3 :handler="chartHandler2"></vue-c3>
	</div>
</template>

<style lang="stylus">
	.timeline-panel
		background-color #343333
		padding-bottom 2em
		h4
			font-size: 1.2em
			color: #A6A6A6
			margin: 1.8em 0 0.6em 1em
	.c3 line, .c3 path
		stroke #5C5C5C
	.c3 text
		stroke #7C7C7D
	.c3-line
		stroke-width 2px
</style>

<script lang="coffee">
	Vue = require 'vue'
	VueC3 = require 'vue-c3'
	{ RealTimeC3Data } = require '../lib/data.coffee'

	graphLimit = 20

	chartOption =
		size:
			width: undefined
		data:
			x: 'timestamp'
		axis:
			x: { type: 'timeseries', tick: { format: '%H:%M:%S' } }
			y: { max: 100, min: 1 }
		color:
			pattern: ['#FC9141', '#F67541', '#F77576']
		tooltip:
			show: false
		legend:
			show: false
		grid:
			x: { show: true }
			y: { show: true }

	realTimeData1 = new RealTimeC3Data(1, graphLimit)
	data1 = realTimeData1.history()

	chartData1 = Object.assign {}, chartOption, data:
		x: 'timestamp'
		columns: data1
		type: 'spline'

	realTimeData2 = new RealTimeC3Data(3, graphLimit)
	data2 = realTimeData2.history()

	chartData2 = Object.assign {}, chartOption, data:
		x: 'timestamp'
		columns: data2
		types: { data3: 'bar' }

	module.exports =
		# caution: this vue-c3 package export 'default' module in commonjs system
		components: { VueC3: VueC3['default'] }
		data: ->
			chartHandler1: new Vue()
			chartHandler2: new Vue()

		mounted: ->
			@updateGraph('1st')

			setInterval () =>
				@updateGraph('loop')
			, 1000

			@chartHandler1.$emit 'init', chartData1
			@chartHandler2.$emit 'init', chartData2
		methods:
			updateGraph: (msg)->
				realTimeData1.next (newData) =>
					@chartHandler1.$emit 'dispatch', (chart) =>
						chart.flow
							length: 1
							columns: newData

				realTimeData2.next (newData) =>
					@chartHandler2.$emit 'dispatch', (chart) =>
						chart.flow
							length: 1
							columns: newData

</script>
