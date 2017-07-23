const loader = require('monaco-loader')

const { ipcRenderer } = require('electron')

const fs = require('fs')

loader().then((monaco) => {
  const div = document.getElementById('container')

  let editor = monaco.editor.create(div, {
    language: 'javascript',
    theme: 'vs-dark',
    automaticLayout: true
  })

  ipcRenderer.on('open-file', (e, url) => {
    // console.log(args);
    const data = fs.readFileSync(url, 'utf-8')
    // console.log(data);

    editor.setModel(monaco.editor.createModel(data, 'javascript'))

    // cheatsheet of event handlers https://electron.atom.io/docs/
  })
})
