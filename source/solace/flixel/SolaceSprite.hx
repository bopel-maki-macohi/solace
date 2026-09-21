package solace.flixel;

import flixel.FlxG;
import flixel.util.FlxSignal;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class SolaceSprite extends FlxSprite
{
	public var interactable:Bool = false;

	public function setInteractable(?set:Null<Bool>):SolaceSprite
	{
		this.interactable = set ?? true;
		return this;
	}

	public var onLeftClick:FlxSignal = new FlxSignal();
	public var onMiddleClick:FlxSignal = new FlxSignal();
	public var onRightClick:FlxSignal = new FlxSignal();

	overload public extern inline function scaleTo(z:Float) scaleTo(z, z);

	overload public extern inline function scaleTo(x:Float, y:Float)
	{
		this.scale.set(x, y);
		updateHitbox();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (interactable && FlxG.mouse.overlaps(this))
		{
			if (FlxG.mouse.justPressed && onLeftClick != null) onLeftClick.dispatch();
			if (FlxG.mouse.justPressedMiddle && onMiddleClick != null) onMiddleClick.dispatch();
			if (FlxG.mouse.justPressedRight && onRightClick != null) onRightClick.dispatch();
		}
	}

	override function makeGraphic(width:Int, height:Int, color:FlxColor = FlxColor.WHITE, unique:Bool = false,
			?key:String):SolaceSprite return cast super.makeGraphic(width, height, color, unique, key);

	public function loadGraphicFromSolaceSprite(Sprite:SolaceSprite):SolaceSprite return cast loadGraphicFromSprite(cast Sprite);
}
