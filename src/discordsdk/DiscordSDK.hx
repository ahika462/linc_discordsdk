package discordsdk;

import haxe.Int64Helper;
import cpp.abi.Abi;
import cpp.Int64;
import cpp.ConstCharStar;
import cpp.Function;

class DiscordSDK {
	/**
	 * Run all callbacks. Exactly necessary to use in `while (true)` loop.
	 */
	public static function runCallbacks() {
		_DiscordSDK.runCallbacks();
	}

	public static function onActivityJoinRequest(callback:Function<(username:ConstCharStar, id:Int64, avatar:ConstCharStar)->Void, Abi>) {
		_DiscordSDK.onActivityJoinRequest(callback);
	}

	/**
	 * Make a party so people can join to your game.
	 * @param id Party ID.
	 * @param joinId Join secret.
	 * @param spectateId Spectate secret.
	 * @param currentSize Current party size.
	 * @param maxSize Max party size.
	 * @param onPartyMake Make party callback with result return.
	 */
	public static function makeParty(id:String = "", joinId:String = "", spectateId:String = "", currentSize:Int = 1, maxSize:Int = 10, onPartyMake:(result:Result)->Void) {
		if (id == null)
			id = "";
		if (joinId == null)
			joinId = "";
		if (spectateId == null)
			spectateId = "";

		_DiscordSDK.makeParty(cast id, cast joinId, cast spectateId, currentSize, maxSize, onPartyMake);
	}

	public static function registerCommand(url:String = "") {
		if (url == null)
			url = "";

		_DiscordSDK.registerCommand(cast url);
	}

	/**
	 * Initialize the GameSDK.
	 * @param clientId Game client ID.
	 * @param onInit Initialization callback with result return.
	 */
	public static function init(clientId:String, onInit:()->Void, onError:(result:Result)->Void) {
		if (clientId == null)
			clientId = "";
		
		_DiscordSDK.init(Int64Helper.parseString(clientId), onInit, onError);
	}

	/**
	 * Update the displaying activity.
	 * @param activity Activity options.
	 * @param callback Update callback.
	 */
	public static function updateActivity(activity:Activity, callback:()->Void = null) {
		if (activity == null)
			activity = {};
		if (activity.details == null)
			activity.details = "";
		if (activity.state == null)
			activity.state = "";
		if (activity.assets == null)
			activity.assets = {};
		if (activity.assets.smallImage == null)
			activity.assets.smallImage = "";
		if (activity.assets.smallText == null)
			activity.assets.smallText = "";
		if (activity.assets.largeImage == null)
			activity.assets.largeImage = "";
		if (activity.assets.largeText == null)
			activity.assets.largeText = "";
		if (activity.type == null)
			activity.type = Playing;
		if (activity.timestamps == null)
			activity.timestamps = {};
		if (activity.timestamps.start == null)
			activity.timestamps.start = 0;
		if (activity.timestamps.end == null)
			activity.timestamps.end = 0;
		if (callback == null)
			callback = function() {}

		var details:String = activity.details;
		var state:String = activity.state;
		var smallImage:String = activity.assets.smallImage;
		var smallText:String = activity.assets.smallText;
		var largeImage:String = activity.assets.largeImage;
		var largeText:String = activity.assets.largeText;
		var type:ActivityType = activity.type;
		var startTimestamp:Float = activity.timestamps.start;
		var endTimestamp:Float = activity.timestamps.end;

		_DiscordSDK.updateActivity(cast details, cast state, cast smallImage, cast smallText, cast largeImage, cast largeText, type, startTimestamp, endTimestamp, callback);
	}

	/**
	 * Shutdown GameSDK.
	 */
	public static function shutdown() {
		_DiscordSDK.shutdown();
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

	@:native("linc::discordsdk::onActivityJoinRequest")
	static function onActivityJoinRequest(callback:Function<(username:ConstCharStar, id:Int64, avatar:ConstCharStar)->Void, Abi>):Void;

	@:native("linc::discordsdk::makeParty")
	static function makeParty(id:ConstCharStar, joinId:ConstCharStar, spectateId:ConstCharStar, currentSize:Int = 1, maxSize:Int = 10, onPartyMake:(result:Result)->Void):Void;

	@:native("linc::discordsdk::registerCommand")
	static function registerCommand(url:ConstCharStar):Void;

	@:native("linc::discordsdk::init")
	static function init(clientId:haxe.Int64, onInit:()->Void, onError:(result:Result)->Void):Void;

	@:native("linc::discordsdk::updateActivity")
	static function updateActivity(details:ConstCharStar, state:ConstCharStar,
		smallImage:ConstCharStar,
		smallText:ConstCharStar,
		largeImage:ConstCharStar,
		largeText:ConstCharStar,
		type:ActivityType = Playing,
		startTimestamp:Float = 0,
		endTimestamp:Float = 0,
		callback:()->Void
	):Void;

	@:native("linc::discordsdk::shutdown")
	static function shutdown():Void;
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

typedef Activity = {
	var ?details:String;
	var ?state:String;
	var ?assets:ActivityAssets;
	var ?type:ActivityType;
	var ?timestamps:ActivityTimestamps;
}

typedef ActivityAssets = {
	var ?smallImage:String;
	var ?smallText:String;
	var ?largeImage:String;
	var ?largeText:String;
}

typedef ActivityTimestamps = {
	var ?start:Float;
	var ?end:Float;
}

@:native("discord::ActivityType")
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