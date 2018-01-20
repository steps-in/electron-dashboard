module.exports =
	start: ->
		(item, focusedWindow) ->
			focusedWindow.webContents.send('request-control', 'start')
	stop: ->
		(item, focusedWindow) ->
			focusedWindow.webContents.send('request-control', 'stop')