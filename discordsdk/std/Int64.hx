package discordsdk.std;

import haxe.Int64Helper;
import haxe.Int64 as HaxeInt64;

abstract Int64(HaxeInt64) from HaxeInt64 to HaxeInt64 {
	@:from
	public static function fromString(value:String):Int64 {
		return Int64Helper.parseString(value);
	}
}