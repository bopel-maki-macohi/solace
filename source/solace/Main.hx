package solace;

import solace.game.PlayState;
import solace.save.Save;
import openfl.events.Event;
import flixel.FlxGame;

class Main extends FlxGame
{
	public function new()
	{
		super(0, 0, PlayState);
	}

	override function create(_:Event)
	{
		Save.init();

		super.create(_);
	}
}
