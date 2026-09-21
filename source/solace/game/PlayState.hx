package solace.game;

import flixel.graphics.tile.FlxDrawTrianglesItem.DrawData;
import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxStrip;
import solace.flixel.SolaceGridBackdrop;
import solace.save.SaveFlags;
import flixel.text.FlxText;
import solace.flixel.SolaceSprite;
import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var blockBackdrop:SolaceGridBackdrop;

	var pickaxde:SolaceSprite;
	var shovil:SolaceSprite;

	var cashmonee:FlxText;

	override function create()
	{
		super.create();

		add(blockBackdrop = new SolaceGridBackdrop(0, 0, 'assets/blocks/dirt.png', Math.floor(FlxG.width / 16) + 1, Math.floor(FlxG.height / 16) + 1));
		blockBackdrop.screenCenter();

		add(pickaxde = new SolaceSprite('assets/tools/pickaxe.png').setInteractable());
		pickaxde.scaleTo(2, 2);
		pickaxde.screenCenter();
		pickaxde.x -= pickaxde.width;

		add(shovil = new SolaceSprite('assets/tools/shovel.png').setInteractable());
		shovil.scaleTo(2, 2);
		shovil.screenCenter();
		shovil.x += shovil.width;

		add(cashmonee = new FlxText(0, 0, 0, 'CASH MONEY', 16));
		cashmonee.screenCenter(X);
		cashmonee.y = cashmonee.size;

		pickaxde.onLeftClick.add(onPickClick);
		shovil.onLeftClick.add(onShovelClick);
	}

	function onPickClick()
	{
		SaveFlags.MONEY.value += 2 / 10;
	}

	function onShovelClick()
	{
		SaveFlags.MONEY.value += 1 / 10;
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		cashmonee.text = 'Money: ${SaveFlags.MONEY.value}';
		cashmonee.screenCenter(X);
	}
}
