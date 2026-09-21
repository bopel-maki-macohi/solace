package solace.save;

import flixel.FlxG;

class Save
{
	public static var data:SaveData;

	public static function init()
	{
		FlxG.save.bind('solace', '.Maverick');

		load();
	}

	public static function load()
	{
		data = FlxG.save.data.game;

		data ??= {
			MONEY: null
		};

		data.MONEY ??= 0.0;

		save();
	}

	public static function save()
	{
		FlxG.save.data.game = data;
	}

	public static function flush()
	{
		save();

		FlxG.save.flush();
	}
}
