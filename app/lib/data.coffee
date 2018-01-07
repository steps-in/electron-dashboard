{ format, subSeconds } = require('date-fns')

class RealTimeData
	constructor: (layers, ranges, bounds) ->
		@layers = layers || 1
		@bounds = bounds || 100
		@ranges = ranges || 1
		@timestamp = (new Date()).getTime() / 1000 | 0
		@titles = @makeTitles(@layers)

	makeTitles: (count) ->
		titles = ['timestamp']
		for i in [1..count]
			titles.push('data' + i.toString())

		return titles

	getTimeStamp: ->
		@timestamp * 1000

	getTimeStamp1: ->
		@timestamp

	getTimeStamp2: ->
		time = format(@timestamp * 1000, 'mm:ss')
		if time == '00:00' then format(@timestamp * 1000, 'hh:mm:ss') else time

	getTimeStamp3: ->
		new Date(@timestamp * 1000)

	randomValue: (bound) ->
		bound = bound || @bounds
		parseInt(Math.random() * bound) + 1

class RealTimeChartistData extends RealTimeData
	history: (ranges) ->
		ranges = @ranges if typeof ranges != 'number' || !ranges

		data =
			timestamp: []
			values: []

		for i in [0...ranges]
			@timestamp = @timestamp + 1

			data.timestamp.push @getTimeStamp2()

		for i in [0...@layers]
			history = []

			for j in [0...ranges]
				history.push @randomValue(@bounds[j])

			data.values.push history

		{ labels: data.timestamp, series: data.values }

	next: ->
		@timestamp = @timestamp + 1

		series = []
		for i in [0...@layers]
			series.push @randomValue(@bounds[i])

		{ labels: @getTimeStamp2(), series: series }

class RealTimeC3Data extends RealTimeData
	history: (ranges) ->
		ranges = @ranges if typeof ranges != 'number' || !ranges
		# this title should be equal to chart data option's first label
		title = @titles[..]

		data = []

		timestamp = [title.shift()]
		now = new Date()
		for i in [ranges..1]
			timestamp.push subSeconds(now, i).getTime()

		data.push timestamp

		for i in [0...@layers]
			history = [title.shift()]

			for j in [0...ranges]
				history.push @randomValue(@bounds[j])

			data.push history

		return data

	next: (callback) ->
		title = @titles[..]
		series = []

		timestamp = [title.shift()]
		timestamp.push (new Date()).getTime()

		series.push timestamp

		for i in [0...@layers]
			series.push [title.shift(), @randomValue(@bounds[i])]

		callback series

class RealTimeChartJSData extends RealTimeData
	constructor: (layers, ranges, bounds) ->
		super(layers, ranges, bounds)
		@colorSet = ['#f77576', '#c44c4a', '#a32a26']

	history: (ranges) ->
		ranges = @ranges if typeof ranges != 'number' || !ranges

		data =
			labels: []
			datasets: []

		for i in [0...ranges]
			@timestamp = @timestamp + 1

			data.labels.push @getTimeStamp3()

		for i in [0...@layers]
			d = []

			for j in [0...ranges]
				d.push @randomValue(@bounds[j])

			data.datasets.push
				data: d
				backgroundColor: @colorSet[i]
				borderColor: @colorSet[i]
				borderWidth: 2
				fill: false
				lineTension: 0

		{ labels: data.labels, datasets: data.datasets }

	next: ->
		@timestamp = @timestamp + 1

		set = []
		for i in [0...@layers]
			set.push @randomValue(@bounds[i])

		{ label: @getTimeStamp3(), set }

module.exports = { RealTimeChartistData, RealTimeC3Data, RealTimeChartJSData }
