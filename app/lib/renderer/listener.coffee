{ ipcRenderer } = require 'electron'

module.exports =
	start: ->
		ipcRenderer.on 'request-control', (event, message) ->
			el = document.querySelector('#wrap')
			el.dataset.control = message || 'start'