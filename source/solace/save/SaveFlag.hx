package solace.save;

class SaveFlag<T>
{
	public var value:T;

	public var flag(default, null):String;

	public function new(flag:String, ?value:Null<T>)
	{
		this.flag = flag;
		this.value = value;

		if (!SaveFlags.flags.contains(this)) SaveFlags.flags.push(this);
	}
}
