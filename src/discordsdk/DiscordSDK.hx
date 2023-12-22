package discordsdk;

import haxe.Int64Helper;
import cpp.abi.Abi;
import cpp.Int64;
import cpp.ConstCharStar;
import cpp.Function;

class DiscordSDK {
	public static function runCallbacks() {
		_DiscordSDK.runCallbacks();
	}

	public static function onActivityJoinRequest(callback:Function<(username:ConstCharStar, id:Int64, avatar:ConstCharStar)->Void, Abi>) {
		_DiscordSDK.onActivityJoinRequest(callback);
	}

	public static function makeParty(id:String = "", joinId:String = "", spectateId:String = "", currentSize:Int = 1, maxSize:Int = 10, onPartyMake:(result:Result)->Void) {
		_DiscordSDK.makeParty(cast id, cast joinId, cast spectateId, currentSize, maxSize, onPartyMake);
	}

	public static function registerCommand(url:String = "") {
		_DiscordSDK.registerCommand(cast url);
	}

	public static function init(clientId:String, onInit:()->Void, onError:(result:Result)->Void) {
		_DiscordSDK.init(Int64Helper.parseString(clientId), onInit, onError);
	}

	public static function updateActivity(details:String = "", state:String = "", smallImage:String = "", smallText:String = "", largeImage:String = "", largeText:String = "", type:ActivityType = Playing, startTimestamp:Float = 0, endTimestamp:Float = 0, callback:()->Void = null) {
		if (callback == null)
			callback = function() {}

		_DiscordSDK.updateActivity(cast details, cast state, cast smallImage, cast smallText, cast largeImage, cast largeText, type, startTimestamp, endTimestamp, callback);
	}
}

@:keep
@:include('linc_discordsdk.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('discordsdk'))
#end
extern private class _DiscordSDK {
	@:native("linc::discordsdk::runCallbacks")
	static function runCallbacks():Void;

	@:native('linc::discordsdk::onActivityJoinRequest')
	static function onActivityJoinRequest(callback:Function<(username:ConstCharStar, id:Int64, avatar:ConstCharStar)->Void, Abi>):Void;

	@:native('linc::discordsdk::makeParty')
	static function makeParty(id:ConstCharStar, joinId:ConstCharStar, spectateId:ConstCharStar, currentSize:Int = 1, maxSize:Int = 10, onPartyMake:(result:Result)->Void):Void;

	@:native('linc::discordsdk::registerCommand')
	static function registerCommand(url:ConstCharStar):Void;

	@:native('linc::discordsdk::init')
	static function init(clientId:haxe.Int64, onInit:()->Void, onError:(result:Result)->Void):Void;

	@:native('linc::discordsdk::updateActivity')
	static function updateActivity(details:ConstCharStar = cast "", state:ConstCharStar = cast "",
		smallImage:ConstCharStar = cast "",
		smallText:ConstCharStar = cast "",
		largeImage:ConstCharStar = cast "",
		largeText:ConstCharStar = cast "",
		type:ActivityType = Playing,
		startTimestamp:Float = 0,
		endTimestamp:Float = 0,
		callback:()->Void
	):Void;
}

@:native("discord::Result")
enum abstract Result(Int) from Int to Int {
	var Ok = 0;
	var ServiceUnavailable = 1;
	var InvalidVersion = 2;
	var LockFailed = 3;
	var InternalError = 4;
	var InvalidPayload = 5;
	var InvalidCommand = 6;
	var InvalidPermissions = 7;
	var NotFetched = 8;
	var NotFound = 9;
	var Conflict = 10;
	var InvalidSecret = 11;
	var InvalidJoinSecret = 12;
	var NoEligibleActivity = 13;
	var InvalidInvite = 14;
	var NotAuthenticated = 15;
	var InvalidAccessToken = 16;
	var ApplicationMismatch = 17;
	var InvalidDataUrl = 18;
	var InvalidBase64 = 19;
	var NotFiltered = 20;
	var LobbyFull = 21;
	var InvalidLobbySecret = 22;
	var InvalidFilename = 23;
	var InvalidFileSize = 24;
	var InvalidEntitlement = 25;
	var NotInstalled = 26;
	var NotRunning = 27;
	var InsufficientBuffer = 28;
	var PurchaseCanceled = 29;
	var InvalidGuild = 30;
	var InvalidEvent = 31;
	var InvalidChannel = 32;
	var InvalidOrigin = 33;
	var RateLimited = 34;
	var OAuth2Error = 35;
	var SelectChannelTimeout = 36;
	var GetGuildTimeout = 37;
	var SelectVoiceForceRequired = 38;
	var CaptureShortcutAlreadyListening = 39;
	var UnauthorizedForAchievement = 40;
	var InvalidGiftCode = 41;
	var PurchaseError = 42;
	var TransactionAborted = 43;
}

enum abstract ActivityType(Int) from Int to Int {
	var Playing = 0;
	var Streaming = 1;
	var Listening = 2;
	var Watching = 3;
}

@:native("discord::User")
extern class User {
	@:native("discord::User::GetUsername")
	function GetUsername():ConstCharStar;
	@:native("discord::User::GetDiscriminator")
	function GetDiscriminator():ConstCharStar;
	@:native("discord::User::GetAvatar")
	function GetAvatar():ConstCharStar;
}