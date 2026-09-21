package solace;

import solace.sprites.Block;
import flixel.FlxState;

class PlayState extends FlxState
{
	var width = 16;
	var height = 16;

	override function create()
	{
		super.create();

		for (y in 0...height) for (x in 0...width) add(new Block('dirt', x * 16, y * 16));
	}
}
