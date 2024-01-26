package discordsdk;

import discordsdk.Event;
import discordsdk.Types;
#if cpp
import discordsdk._internal.native.NativeActivityManager;

@:include('discord.h')
@:include('discordsdk/User.h')
@:include('discordsdk/ActivityActionType.h')
@:include('discordsdk/Activity.h')

class ActivityManager {
	@:access(discordsdk)
	var native:NativeActivityManager;
	
	public function new() {
		/*
		onActivityJoin = new Event(onActivityJoinConnect, onActivityJoinDisconnect, onActivityJoinDisconnectAll);
		onActivityJoinSpectate = new Event(onActivityJoinSpectateConnect, onActivityJoinSpectateDisconnect, onActivityJoinSpectateDisconnectAll);
		onActivityJoinRequest = new Event(onActivityJoinRequestConnect, onActivityJoinRequestDisconnect, onActivityJoinRequestDisconnectAll);
		onActivityInvite = new Event(onActivityInviteConnect, onActivityInviteDisconnect, onActivityInviteDisconnectAll);
		*/
	}

	@:functionCode('native.RegisterCommand(command);')
	public function registerCommand(command:String):Result {
		return Ok;
	}

	@:functionCode('native.RegisterSteam(steamId);')
	public function registerSteam(steamId:UInt):Result {
		return Ok;
	}

	@:functionCode('
		native.UpdateActivity(activity->native, [callback = std::move(callback)](discord::Result result) {
			callback((int)result);
		});
	')
	public function updateActivity(activity:Activity, callback:Result->Void) {}

	@:functionCode('
		native.ClearActivity([callback = std::move(callback)](discord::Result result) {
			callback((int)result);
		});
	')
	public function cleatActivity(callback:Result->Void) {}

	@:functionCode('
		native.SendRequestReply(userId, reply, [callback = std::move(callback)](discord::Result result) {
			callback((int)result);
		});
	')
	public function sendRequestReply(userId:UserId, reply:ActivityJoinRequestReply, callback:Result->Void) {}

	@:functionCode('
		native.SendInvite(userId, type, content, [callback = std::move(callback)](discord::Result result) {
			callback((int)result);
		});
	')
	public function sendInvite(userId:UserId, type:ActivityActionType, content:String, callback:Result->Void) {}

	@:functionCode('
		native.AcceptInvite(userId, [callback = std::move(callback)](discord::Result result) {
			callback((int)result);
		});
	')
	public function acceptInvite(userId:UserId, callback:Result->Void) {}

	/*
	// onActivityJoin

	public var onActivityJoin(default, null):Event<String->Void>;

	@:functionCode('
		return native.OnActivityJoin.Connect([slot = std::move(slot)](const char* secret) {
			slot(secret);
		});
	')
	function onActivityJoinConnect(slot:String->Void):Int {
		return 0;
	}

	@:functionCode('
		native.OnActivityJoin.Disconnect(token);
	')
	function onActivityJoinDisconnect(token:Int) {}

	@:functionCode('
		native.OnActivityJoin.DisconnectAll();
	')
	function onActivityJoinDisconnectAll() {}

	// onActivityJoinSpectate

	public var onActivityJoinSpectate(default, null):Event<String->Void>;

	@:functionCode('
		return native.OnActivityJoinSpectate.Connect([slot = std::move(slot)](const char* secret) {
			slot(secret);
		});
	')
	function onActivityJoinSpectateConnect(slot:String->Void):Int {
		return 0;
	}

	@:functionCode('
		native.OnActivityJoinSpectate.Disconnect(token);
	')
	function onActivityJoinSpectateDisconnect(token:Int) {}

	@:functionCode('
		native.OnActivityJoinSpectate.DisconnectAll();
	')
	function onActivityJoinSpectateDisconnectAll() {}

	// onActivityJoinRequest

	public var onActivityJoinRequest(default, null):Event<User->Void>;

	@:functionCode('
		return native.OnActivityJoinRequest.Connect([slot = std::move(slot)](const char* user) {
			discordsdk::User _user{};
			_user->native = user;
			slot(_user);
		});
	')
	function onActivityJoinRequestConnect(slot:User->Void):Int {
		return 0;
	}

	@:functionCode('
		native.OnActivityJoinRequest.Disconnect(token);
	')
	function onActivityJoinRequestDisconnect(token:Int) {}

	@:functionCode('
		native.OnActivityJoinRequest.DisconnectAll();
	')
	function onActivityJoinRequestDisconnectAll() {}

	// onActivityInvite

	public var onActivityInvite(default, null):Event<ActivityActionType->User->Activity->Void>;

	@:functionCode('
		return native.OnActivityInvite.Connect([slot = std::move(slot)](discord::ActivityActionType type, discord::User user, discord::Activity activity) {
			discordsdk::User _user{};
			_user->native = user;
			discordsdk::Activity _activity{};
			_activity->native = activity;
			slot(type, _user, _activity);
		});
	')
	function onActivityInviteConnect(slot:ActivityActionType->User->Activity->Void):Int {
		return 0;
	}

	@:functionCode('
		native.OnActivityInvite.Disconnect(token);
	')
	function onActivityInviteDisconnect(token:Int) {}

	@:functionCode('
		native.OnActivityInvite.DisconnectAll();
	')
	function onActivityInviteDisconnectAll() {}
	*/
}
#end