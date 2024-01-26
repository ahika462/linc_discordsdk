package discordsdk;

import discordsdk.Types;
#if cpp
import discordsdk._internal.native.NativeCore;
import cpp.RawPointer;

class Core {
	@:access(discordsdk)
	var native:RawPointer<NativeCore>;
	@:functionCode('
		discord::Core* temp{};
		native = temp;
	')
	function __init__() {}

	public function new() {
		__init__();
	}

	@:functionCode('
		discord::Core* temp = instance->native;
		return (int)discord::Core::Create(clientId, flags, &temp);
	')
	public static function create(clientId:ClientId, flags:CreateFlags, instance:Core):Result {
		return Ok;
	}

	@:functionCode('return (int)native->RunCallbacks();')
	public function runCallbacks():Result {
		return Ok;
	}

	/*@:functionCode('
		native->SetLogHook(minLevel, [hook = std::move(hook)](discord::LogLevel minLevel, const char* message) {
			hook((int)minLevel, message);
		});
	')*/
	public function setLogHook(minLevel:LogLevel, hook:LogLevel->String->Void) {}

	/*var _activityManager:ActivityManager = new ActivityManager();
	public var activityManager(get, never):ActivityManager;
	@:functionCode('
		_activityManager->native = native->ActivityManager();
	')
	function get_activityManager():ActivityManager {
		return _activityManager;
	}*/
}
#end