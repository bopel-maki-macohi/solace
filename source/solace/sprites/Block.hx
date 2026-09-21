package solace.sprites;

import flixel.FlxSprite;

class Block extends FlxSprite
{
	override public function new(block:String, ?x:Float, ?y:Float)
	{
		super(x, y);

		loadGraphic('assets/gameplay/blocks/$block.png');
	}
}
