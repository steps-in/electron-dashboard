<template>
	<div class="col-3 realtime-panel">
		<div class="row panel-1">
			<div class="col">
				<h4>Real-time 1 graph</h4>
			</div>
		</div>
		<chartist type="Bar" :data="chartData1" :options="chartOption"></chartist>
		<div class="row panel-2">
			<div class="col">
				<h4>Real-time 2 graph</h4>
			</div>
		</div>
		<chartist type="Bar" :data="chartData2" :options="chartOption"></chartist>
	</div>
</template>

<style lang="stylus">
	.realtime-panel
		background-color #2D2D2D
		h4
			font-size: 1.2em
			color: #A6A6A6
			margin: 1.8em 0 0.6em 1em
	.ct-label
		color: #7C7C7D
	.ct-grid
		stroke: #5C5C5C
		stroke-dasharray 4px
	.ct-bar
		stroke-width 6px
	.ct-series-a .ct-bar
		stroke: #F77576
</style>

<script lang="coffee">
	Vue = require 'vue'
	Chartist = require 'vue-chartist'
	{ RealTimeChartistData } = require '../lib/data.coffee'

	Vue.use(Chartist)

	graphLimit = 9

	realTimeData1 = new RealTimeChartistData(1, graphLimit, 50)
	data1 = realTimeData1.history()

	chartData1 =
		labels: data1.labels
		series: data1.series

	realTimeData2 = new RealTimeChartistData(1, graphLimit, 50)
	data2 = realTimeData2.history()

	chartData2 =
		labels: data2.labels
		series: data2.series

	chartOption =
		height: 262
		high: 50,

	module.exports =
		data: ->
			{ chartData1, chartData2, chartOption }
		mounted: ->
			@updateGraph('1st')

			setInterval () =>
				@updateGraph('loop')
			, 1000
		methods:
			updateGraph: (msg)->
				controlEl = document.querySelector('#wrap').dataset.control

				if controlEl == 'start'
					data1 = realTimeData1.next()

					@chartData1.labels.push data1.labels
					@chartData1.series.map (series, index) ->
						series.push data1.series[index]

					@chartData1.labels.shift() if @chartData1.labels.length > graphLimit
					@chartData1.series.map (series) ->
						series.shift() if series.length > graphLimit

					data2 = realTimeData2.next()

					@chartData2.labels.push data2.labels
					@chartData2.series.map (series, index) ->
						series.push data2.series[index]

					@chartData2.labels.shift() if @chartData2.labels.length > graphLimit
					@chartData2.series.map (series) ->
						series.shift() if series.length > graphLimit
</script>
