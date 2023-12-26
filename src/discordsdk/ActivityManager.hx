package discordsdk;

import cpp.abi.Abi;
import cpp.Function;
import cpp.UInt32;
import discordsdk.Types;
import cpp.ConstCharStar;

@:include("activity_manager.h")

@:native("discord::ActivityManager")
extern class ActivityManager {
	// @:native("~ActivityManager")

	@:native("RegisterCommand")
	public function RegisterCommand(command:ConstCharStar):Result;
	@:native("RegisterSteam")
	public function RegisterSteam(steamId:UInt32):Result;
	@:native("UpdateActivity")
	public function UpdateActivity(activity:Activity, callback:Function<Result->Void, Abi>):Void;
	@:native("ClearActivity")
	public function ClearActivity(callback:Function<Result->Void, Abi>):Void;
	@:native("SendRequestReply")
	public function SendRequestReply(userId:UserId, reply:ActivityJoinRequestReply, callback:Function<Result->Void, Abi>):Void;
	@:native("SendInvite")
	public function SendInvite(userId:UserId, content:ConstCharStar, callback:Function<Result->Void, Abi>):Void;
	@:native("AcceptInvite")
	public function AcceptInvite(userId:UserId, callback:Function<Result->Void, Abi>):Void;

	var OnActivityJoin:Event<ConstCharStar>;
	var OnActivitySpectate:Event<ConstCharStar>;
	var OnActivityJoinRequest:Event<User>;
	var OnActivityInvite:Event<ActivityActionType, User, Activity>
}