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
	var strip:FlxStrip;

	var pickaxde:SolaceSprite;
	var shovil:SolaceSprite;

	var cashmonee:FlxText;

	override function create()
	{
		super.create();

		add(blockBackdrop = new SolaceGridBackdrop(0, 0, 'assets/blocks/dirt.png', Math.floor(FlxG.width / 16) + 1, Math.floor(FlxG.height / 16) + 1));
		blockBackdrop.screenCenter();

		// https://github.com/UncertainProd/FlxStrip-testbench/tree/main
		// add(strip = new FlxStrip(0, 0, 'assets/blocks/dirt.png'));
		// strip.repeat = true;

		// var points = [
		// 	FlxPoint.weak(0, 0),
		// 	FlxPoint.weak(0, FlxG.height),
		// 	FlxPoint.weak(FlxG.width, 0),
		// 	FlxPoint.weak(FlxG.width, FlxG.height),
		// ];

		// var newVertices = [];
		// for (p in points)
		// {
		// 	newVertices.push(p.x);
		// 	newVertices.push(p.y);
		// }

		// var i = 0;
		// var newIndices = [];
		// while (true)
		// {
		// 	if (i + 2 >= points.length) break;
		// 	else
		// 	{
		// 		newIndices.push(i);
		// 		newIndices.push(i + 1);
		// 		newIndices.push(i + 2);
		// 	}

		// 	if (i + 3 >= points.length) break;
		// 	else
		// 	{
		// 		newIndices.push(i + 1);
		// 		newIndices.push(i + 3);
		// 		newIndices.push(i + 2);
		// 	}

		// 	i += 2;
		// }

		// var newUVData:Array<Float> = [];
		// var curV = 0.0;
		// for (j in 0...points.length)
		// {
		// 	var widthBit = (FlxG.width / strip.graphic.width);
		// 	var heightBit = (FlxG.height / strip.graphic.height);

		// 	newUVData.push(j % 2);
		// 	newUVData.push(curV);
		// 	// the 't' in uvtData (technically optional but keeping it for the sake of completeness)
		// 	newUVData.push(1.0);
		// 	if (j % 2 == 1) curV += widthBit / (Math.ceil(points.length * 0.5) - 1);
		// }
		// strip.vertices = DrawData.ofArray(newVertices);
		// strip.indices = DrawData.ofArray(newIndices);
		// strip.uvtData = DrawData.ofArray(newUVData);

		// trace(newUVData);

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
