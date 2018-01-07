<template>
	<div class="col timeline-panel">
		<div class="row panel-1">
			<div class="col">
				<h4>Time-line 1 graph</h4>
			</div>
		</div>
		<chartist type="Line" :data="chartData1" :options="chartOption"></chartist>
		<div class="row panel-2">
			<div class="col">
				<h4>Time-line 2 graph</h4>
			</div>
		</div>
		<chartist type="Line" :data="chartData2" :options="chartOption"></chartist>
		<div class="row panel-3">
			<div class="col">
				<h4>Time-line 3 graph</h4>
			</div>
		</div>
		<chartist type="Line" :data="chartData3" :options="chartOption"></chartist>
	</div>
</template>

<style lang="stylus">
	.timeline-panel
		background-color #343333
		h4
			font-size: 1.2em
			color: #A6A6A6
			margin: 1.8em 0 0.6em 1em
	.ct-label
		color: #7C7C7D
	.ct-grid
		stroke: #5C5C5C
		stroke-dasharray 4px
	.ct-line
		stroke-width 2px
	.ct-point
		stroke-width 8px
	.ct-series-a .ct-line
		stroke: #FC9141
	.ct-series-a .ct-point
		stroke: #FC9141
	.ct-series-b .ct-line
		stroke: #F67541
	.ct-series-b .ct-point
		stroke: #F67541
</style>

<script lang="coffee">
	Vue = require 'vue'
	Chartist = require 'vue-chartist'
	{ RealTimeChartistData } = require '../lib/data.coffee'

	Vue.use(Chartist)

	graphLimit = 15

	realTimeData1 = new RealTimeChartistData(1, graphLimit)
	data1 = realTimeData1.history()

	chartData1 =
		labels: data1.labels
		series: data1.series

	realTimeData2 = new RealTimeChartistData(2, graphLimit)
	data2 = realTimeData2.history()

	chartData2 =
		labels: data2.labels
		series: data2.series

	realTimeData3 = new RealTimeChartistData(1, graphLimit)
	data3 = realTimeData3.history()

	chartData3 =
		labels: data3.labels
		series: data3.series

	chartOption =
		lineSmooth: false
		high: 150

	module.exports =
		data: ->
			{ chartData1, chartData2, chartData3, chartOption }
		mounted: ->
			@updateGraph('1st')

			setInterval () =>
				@updateGraph('loop')
			,1000
		methods:
			updateGraph: (msg)->
				data1 = realTimeData1.next()
				data2 = realTimeData2.next()
				data3 = realTimeData3.next()

				@chartData1.labels.push data1.labels
				@chartData1.series.map (series, index) ->
					series.push data1.series[index]

				@chartData1.labels.shift() if @chartData1.labels.length > graphLimit
				@chartData1.series.map (series) ->
					series.shift() if series.length > graphLimit

				@chartData2.labels.push data2.labels
				@chartData2.series.map (series, index) ->
					series.push data2.series[index]

				@chartData2.labels.shift() if @chartData2.labels.length > graphLimit
				@chartData2.series.map (series) ->
					series.shift() if series.length > graphLimit

				@chartData3.labels.push data3.labels
				@chartData3.series.map (series, index) ->
					series.push data3.series[index]

				@chartData3.labels.shift() if @chartData3.labels.length > graphLimit
				@chartData3.series.map (series) ->
					series.shift() if series.length > graphLimit

#	todo: should remove if condition in `vue-chartist` index.js:64
#				@chartData1 =
#					labels: @chartData1.labels
#					series: @chartData1.series

</script>
