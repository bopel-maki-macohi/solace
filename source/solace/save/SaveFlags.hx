package solace.save;

import flixel.FlxG;

class SaveFlags
{
	@:allow(solace.save.SaveFlag)
	private static var flags:Array<SaveFlag<Any>> = [];

	public static var MONEY:SaveFlag<Float> = new SaveFlag<Float>('MONEY', 0.0);

	public static function init()
	{
		FlxG.save.bind('solace', '.Maverick');

		var saveFlags = FlxG.save.data.flags;

		if (saveFlags != null)
		{
			trace(saveFlags);
			for (flag in Reflect.fields(saveFlags)) setFlag(flag, Reflect.field(saveFlags, flag));
		}

		adapt();

		save();
	}

	public static function adapt()
	{
		var curAPI:Int = FlxG.save.data.api;

		switch (curAPI) {}
	}

	public static function save()
	{
		var flagsData = {};

		for (flag in flags) Reflect.setField(flagsData, flag.flag, flag.value);

		FlxG.save.data.flags = flagsData;
		FlxG.save.data.api = API;

		FlxG.save.flush();
	}

	private static var API:Int = 0;

	public static function setFlag<T>(flag:String, value:Null<T>)
	{
		for (_flag in flags) if (_flag.flag == flag)
		{
			try
			{
				_flag.value = value;
			}
			catch (e)
			{
				trace(e);
			}
		}
	}

	public static function getFlag(flag:String)
	{
		for (_flag in flags) if (_flag.flag == flag) return _flag.value;

		return null;
	}
}
