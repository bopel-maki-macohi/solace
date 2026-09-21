package solace;

import solace.save.SaveFlags;
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
		SaveFlags.init();
		SaveFlags.save();

		super.create(_);
	}
}
