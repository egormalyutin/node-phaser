# load modules
fs     = require 'fs'
path   = require 'path'
vm     = require 'vm'
jsdom  = require 'jsdom'

# get code of Phaser
codePath   = path.resolve __dirname, './phaser-source.min.js'
codeBuffer = fs.readFileSync codePath
code       = codeBuffer.toString()
# patch code
code = code.replace 'if(!this.device.canvas)throw new Error("Phaser.Game - Cannot create Canvas or WebGL context, aborting.");', ''

# create virtual DOM
DOM = new jsdom.JSDOM ''

# prepare context
DOMContext = vm.createContext(DOM.window)
DOMContext.focus    = ->
DOMContext.scrollTo = ->

# run Phaser in context of virtual DOM
vm.runInContext code, DOMContext

Phaser = DOMContext.Phaser

module.exports = Phaser