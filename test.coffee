Phaser = require './lib/main.js'

game = new Phaser.Game 500, 500, Phaser.HEADLESS

game.state.add 'main',
	preload: () ->
		@game.time.desiredFps = 10
		@game.updateLogic()

	update: () ->
		console.log 'frame'

game.state.start 'main'
