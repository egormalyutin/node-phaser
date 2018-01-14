# node-phaser
Run Phaser on your Node.JS server!

```coffee
Phaser = require 'node-phaser'

game = new Phaser.Game 500, 500, Phaser.HEADLESS

game.state.add 'main',
	preload: ->
		@game.time.desiredFps = 10
		@game.updateLogic()

	update: ->
		console.log 'frame'

game.state.start 'main'
```

## WARNING!
You **must** call `game.state.add` and `game.state.start` instead of `new Phaser.Game width, height, Phaser.HEADLESS, { preload: ..., create: ..., update: ...}`! If you will not do it, events will not be triggered! Then, you **must** provide a `@game.updateLogic` inside `preload`, or events like `create` or `update` will not triggered!