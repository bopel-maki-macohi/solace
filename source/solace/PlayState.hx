package solace;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var watcher:FlxSprite;
	var watcherPatience:Int = 10000;

	override function create()
	{
		super.create();

		watcher = new FlxSprite('assets/watcher/happy.png');
		add(watcher);
		watcher.screenCenter();
		watcher.x = watcher.width / -2;
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		watcherPatience--;
	}
}
