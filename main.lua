local helium = require 'helium'
local input = require 'helium.core.input'
local useState = require 'helium.hooks.state'
local scene = helium.scene.new(true)
scene:activate()

local elementCreator = helium(function(param, view)
	local elementState = useState({down = false})

	input('clicked', function()
		elementState.down = not elementState.down
	end)

	return function()
		if elementState.down then
			love.graphics.setColor(1, 0, 0)
		else
			love.graphics.setColor(0, 1, 1)
		end
		love.graphics.print('button text')
	end
end)

local element = elementCreator({text = 'foo-bar'}, 100, 20)

element:draw(100, 100)

function love.update(dt)
	scene:update(dt)
end

function love.draw()
	scene:draw()
end