package solace.flixel;

import flixel.util.FlxAxes;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxBasic;
import flixel.FlxObject;

enum abstract SolaceGridBackdropAlignment(String) from String to String
{
	var LEFT = 'left';
	var CENTER = 'center';
	var RIGHT = 'right';
}

class SolaceGridBackdrop extends FlxBasic
{
	public var x:Float = 0.0;
	public var xAlignment:SolaceGridBackdropAlignment = CENTER;

	public var y:Float = 0.0;
	public var yAlignment:SolaceGridBackdropAlignment = CENTER;

	public var width:Int = 1;
	public var height:Int = 1;

	public var sprite:SolaceSprite;

	override public function new(?x:Null<Float>, ?y:Null<Float>, ?simpleGraphic:FlxGraphicAsset, ?width:Null<Int> = 16, ?height:Null<Int> = 16)
	{
		super();

		this.x = x ?? 0;
		this.y = y ?? 0;

		this.width = width ?? 0;
		this.height = height ?? 0;

		sprite = new SolaceSprite(this.x, this.y, simpleGraphic);
	}

	override function draw()
	{
		if (sprite == null || !exists || !sprite.exists) return;

		sprite.cameras = this.cameras;

		var xStart = (width == 0) ? 0 : (xAlignment == CENTER) ? width / -2 : (xAlignment == LEFT) ? 0 : (xAlignment == RIGHT) ? width : 0;
		var xInc = (xAlignment == RIGHT) ? -1 : 1;

		var yStart = (height == 0) ? 0 : (yAlignment == CENTER) ? height / -2 : (yAlignment == LEFT) ? 0 : (yAlignment == RIGHT) ? height : 0;
		var yInc = (yAlignment == RIGHT) ? -1 : 1;

		for (y in 0...height) for (x in 0...width)
		{
			sprite.setPosition(this.x + ((xStart + x) * xInc) * sprite.width, this.y + ((yStart + y) * yInc) * sprite.height);
			sprite.draw();
		}

		sprite.setPosition(this.x, this.y);
		#if debug
		if (flixel.FlxG.debugger.drawDebug) sprite.drawDebug();
		#end
	}

	override function destroy()
	{
		super.destroy();

		sprite.destroy();
	}

	override function revive()
	{
		super.revive();

		sprite.revive();
	}

	public function screenCenter(axes:FlxAxes = XY)
	{
		sprite.screenCenter(axes);

		this.x = sprite.x;
		this.y = sprite.y;
	}

	private var _alpha(default, null):Null<Float> = null;

	override function set_visible(vis:Bool):Bool
	{
		if (!visible)
		{
			if (_alpha == null) _alpha = sprite.alpha;
			sprite.alpha = 0.001;
		}
		else
		{
			if (_alpha != null) sprite.alpha = _alpha;
			_alpha = null;
		}

		return this.visible = vis;
	}
}
