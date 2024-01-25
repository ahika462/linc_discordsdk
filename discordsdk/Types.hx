package discordsdk;

#if cpp
import haxe.Int64Helper;
import haxe.Int64;

import discordsdk._internal.native.NativeTypes;

typedef Result = NativeResult;
typedef CreateFlags = NativeCreateFlags;
typedef LogLevel = NativeLogLevel;
typedef UserFlag = NativeUserFlag;
typedef PremiumType = NativePremiumType;
typedef ImageType = NativeImageType;
typedef ActivityType = NativeActivityType;
typedef ActivityActionType = NativeActivityActionType;
typedef ActivityJoinRequestReply = NativeActivityJoinRequestReply;
typedef Status = NativeStatus;
typedef RelationshipType = NativeRelationshipType;
typedef LobbyType = NativeLobbyType;
typedef LobbySearchComparison = NativeLobbySearchComparison;
typedef LobbySearchCast = NativeLobbySearchCast;
typedef LobbySearchDistance = NativeLobbySearchDistance;
typedef EntitlementType = NativeEntitlementType;
typedef SkuType = NativeSkuType;
typedef InputModeType = NativeInputModeType;

abstract ClientId(Int64) from Int64 to Int64 {
	@:from
	public static function fromString(value:String):ClientId {
		return Int64Helper.parseString(value);
	}
}
typedef Version = Int;
abstract Snowflake(Int64) from Int64 to Int64 {
	@:from
	public static function fromString(value:String):Snowflake {
		return Int64Helper.parseString(value);
	}
}
abstract Timestamp(Int64) from Int64 to Int64 {
	@:from
	public static function fromString(value:String):Timestamp {
		return Int64Helper.parseString(value);
	}
}
typedef UserId = Snowflake;
typedef Locale = String;
typedef Branch = String;
typedef LobbyId = Snowflake;
typedef LobbySecret = String;
typedef MetadataKey = String;
typedef MetadataValue = String;
typedef NetworkPeerId = UInt;
typedef NetworkChannelId = UInt;
typedef Path = String;
typedef DateTime = String;

@:cppFileCode('
	#include <iostream>
')

@:structInit class User {
	var internal_:NativeUser;
	@:functionCode('
		internal_ = discord::User();
	')
	public function new(?id:UserId, ?username:String, ?discriminator:String, ?avatar:String, ?bot:Bool) {
		if (id != null)
			this.id = id;
		if (username != null)
			this.username = username;
		if (discriminator != null)
			this.discriminator = discriminator;
		if (avatar != null)
			this.avatar = avatar;
		if (bot != null)
			this.bot = bot;
	}

	public var id(get, set):UserId;
	function get_id():UserId {
		return untyped internal_.GetId();
	}
	function set_id(value:UserId):UserId {
		untyped internal_.SetId(value);
		return value;
	}

	public var username(get, set):String;
	function get_username():String {
		return untyped internal_.GetUsername();
	}
	function set_username(value:String):String {
		untyped internal_.SetUsername(value);
		return value;
	}

	public var discriminator(get, set):String;
	function get_discriminator():String {
		return untyped internal_.GetDiscriminator();
	}
	function set_discriminator(value:String):String {
		untyped internal_.SetDiscriminator(value);
		return value;
	}

	public var avatar(get, set):String;
	function get_avatar():String {
		return untyped internal_.GetAvatar();
	}
	function set_avatar(value:String):String {
		untyped internal_.SetAvatar(value);
		return value;
	}

	public var bot(get, set):Bool;
	function get_bot():Bool {
		return untyped internal_.GetBot();
	}
	function set_bot(value:Bool):Bool {
		untyped internal_.SetBot(value);
		return value;
	}
}
#end