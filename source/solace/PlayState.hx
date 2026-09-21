package solace;

import solace.flixel.SolaceSprite;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var pickaxde:SolaceSprite;
	var shovil:SolaceSprite;

	override function create()
	{
		super.create();

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
	}
}
