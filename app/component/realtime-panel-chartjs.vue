<template>
	<div class="col-3 realtime-panel">
		<div class="row panel-1">
			<div class="col">
				<h4>Real-time 1 graph</h4>
			</div>
		</div>
		<bar-chart :chart-data="chartData1" :height="319"></bar-chart>
		<div class="row panel-2">
			<div class="col">
				<h4>Real-time 2 graph</h4>
			</div>
		</div>
		<line-chart :chart-data="chartData2" :height="319"></line-chart>
	</div>
</template>

<style lang="stylus">
	.realtime-panel
		background-color #2D2D2D
		h4
			font-size: 1.2em
			color: #A6A6A6
			margin: 1.8em 0 0.6em 1em
</style>

<script lang="coffee">
	Vue = require 'vue'
	{ BarChart, LineChart } = require '../lib/chartjs'
	{ RealTimeChartJSData } = require '../lib/data.coffee'

	graphLimit = 10

	realTimeData1 = new RealTimeChartJSData(2, graphLimit)
	chartData1 = realTimeData1.history()

	realTimeData2 = new RealTimeChartJSData(1, graphLimit)
	chartData2 = realTimeData2.history()

	module.exports =
		components: { BarChart, LineChart },
		data: ->
			chartData1: null
			chartData2: null
		mounted: ->
			@updateGraph('1st')

			setInterval () =>
				@updateGraph('loop')
			,1000
		methods:
			updateGraph: (msg) ->
				data1 = realTimeData1.next()

				chartData1.labels.push data1.label
				chartData1.datasets.map (set, index) ->
					set.data.push data1.set[index]

				chartData1.labels.shift() if chartData1.labels.length > graphLimit
				chartData1.datasets.map (sets) ->
					sets.data.shift() if sets.data.length > graphLimit

				@chartData1 =
					labels: chartData1.labels
					datasets: chartData1.datasets

				data2 = realTimeData2.next()

				chartData2.labels.push data2.label
				chartData2.datasets.map (set, index) ->
					set.data.push data2.set[index]

				chartData2.labels.shift() if chartData2.labels.length > graphLimit
				chartData2.datasets.map (sets) ->
					sets.data.shift() if sets.data.length > graphLimit

				@chartData2 =
					labels: chartData2.labels
					datasets: chartData2.datasets
</script>
