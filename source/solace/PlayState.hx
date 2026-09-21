package solace;

import solace.flixel.SolaceSprite;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var watcher:FlxSprite;
	var watcherPatience:Int = 10000;

	var pickaxde:SolaceSprite;
	var shovil:SolaceSprite;

	override function create()
	{
		super.create();

		watcher = new FlxSprite('assets/watcher/happy.png');
		add(watcher);
		watcher.screenCenter();
		watcher.x = watcher.width / -2;

		add(pickaxde = new SolaceSprite('assets/tools/pickaxe.png'));
		pickaxde.scaleTo(2, 2);
		pickaxde.screenCenter();
		pickaxde.x -= pickaxde.width;

		add(shovil = new SolaceSprite('assets/tools/shovel.png'));
		shovil.scaleTo(2, 2);
		shovil.screenCenter();
		shovil.x += shovil.width;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		watcherPatience--;
	}
}
