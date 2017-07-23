// same as const app = require('electron').app

const { app, BrowserWindow } = require('electron')
app.on('ready', () => {
  const mainWindow = new BrowserWindow({})

  const file =  'file://' + __dirname + '/index.html'

  mainWindow.loadURL(file)

// can also open if wanted .openDevTools
// or on('will-navigate') < can capture URL
  mainWindow.webContents.on('will-navigate', (e,url) => {
    e.preventDefault()
    console.log(url)

    // const realPath = url.slice(7)
    mainWindow.webContents.send('open-file', url.slice(7))
  })


})
