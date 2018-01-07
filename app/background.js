const electron = require('electron');
const path = require('path');
const url = require('url');

const app = electron.app;
const BrowserWindow = electron.BrowserWindow;

let mainWindow;

function createWindow() {
	let options = {
		width: 1400,
		height: 800,
		minWidth: 1200,
		minHeight: 600
	};

	mainWindow = new BrowserWindow(options);

	mainWindow.loadURL(url.format({
		pathname: path.join(__dirname, 'index.html'),
		protocol: 'file:',
		slashes: true
	}));

	// Open the DevTools.
	// mainWindow.webContents.openDevTools()

	mainWindow.on('closed', function () {
		mainWindow = null
	})
}

app.on('ready', createWindow);
app.on('window-all-closed', function () {
	if (process.platform !== 'darwin') {
		app.quit()
	}
});

app.on('activate', function () {
	if (mainWindow === null) {
		createWindow()
	}
});

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.
