manager = require './manager'

menuTemplate = [{
	label: '&Control',
	submenu: [{
		label: '&Start',
		accelerator: 'CmdOrCtrl+Shift+S',
		role: 'Start Simulation',
		click: manager.start()
	}, {
		label: "&Stop",
		accelerator: "CmdOrCtrl+Shift+T",
		role: "Stop Simulation",
		click: manager.stop()
	}]
}]

module.exports =
	getTemplate: ->
		if process.platform == 'darwin'
			menuTemplate.unshift darwinMenu.app
			menuTemplate.push darwinMenu.window
			menuTemplate
		else
			menuTemplate

darwinMenu =
	app:
		label: 'Electron Dashboard'
		submenu: [{
			role: 'about'
		}, {
			type: 'separator'
		}, {
			role: 'services'
			submenu: []
		}, {
			type: 'separator'
		}, {
			role: 'hide'
		}, {
			role: 'hideothers'
		}, {
			role: 'unhide'
		}, {
			type: 'separator'
		}, {
			role: 'quit'
		}]
	window:
		label: 'Window'
		submenu: [{
			label: 'Close'
			accelerator: 'CmdOrCtrl+W'
			role: 'close'
		}, {
			label: 'Minimize'
			accelerator: 'CmdOrCtrl+M'
			role: 'minimize'
		}, {
			label: 'Zoom'
			role: 'zoom'
		}, {
			type: 'separator'
		}, {
			label: 'Bring All to Front'
			role: 'front'
		}]
