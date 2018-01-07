{ Line, Bar, mixins } = require 'vue-chartjs'
{ reactiveProp } = mixins

options =
	responsive: true
	maintainAspectRatio: false
	title:
		display: false
	legend:
		display: false
	tooltips:
		enabled: false
	scales:
		xAxes: [{
			gridLines:
				display: true
				color: ['#5C5C5C', '#4b4b4b', '#4b4b4b', '#4b4b4b', '#4b4b4b']
			ticks:
				fontColor: '#7C7C7D'
			type: "time"
			time:
				displayFormats:
					second: "mm:ss"
		}]
		yAxes: [{
			gridLines:
				display: true
				color: ['#3e3e3e', '#4b4b4b', '#4b4b4b', '#4b4b4b', '#4b4b4b']
				zeroLineColor: '#5C5C5C'
				zeroLineWidth: 2
			ticks:
				max: 100
				min: 0
				fontColor: '#7C7C7D'
		}]

module.exports =
	BarChart:
		extends: Bar
		mixins: [reactiveProp]
		mounted: ->
			@renderChart @chartData, options

	LineChart:
		extends: Line
		mixins: [reactiveProp]
		mounted: ->
			@renderChart @chartData, options