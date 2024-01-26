package discordsdk;

#if cpp
import discordsdk.std.Int64;
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

typedef ClientId = Int64;
typedef Version = Int;
typedef Snowflake = Int64;
typedef Timestamp = Int64;
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

@:include('types.h')
@:structInit class User {
	@:access(discordsdk)
	var native:NativeUser;
	@:functionCode('
		native = discord::User();
		native.SetId(id);
		native.SetUsername(username);
		native.SetDiscriminator(discriminator);
		native.SetAvatar(avatar);
		native.SetBot(bot);
	')
	function __init__(id:UserId, username:String, discriminator:String, avatar:String, bot:Bool) {}

	public function new(?id:UserId, ?username:String, ?discriminator:String, ?avatar:String, ?bot:Bool) {
		__init__(
			id != null ? id : 0,
			username != null ? username : '',
			discriminator != null ? discriminator : '',
			avatar != null ? avatar : '',
			bot != null ? bot : false
		);
	}

	public var id(get, set):UserId;
	@:functionCode('return native.GetId();')
	function get_id():UserId {
		return 0;
	}
	@:functionCode('native.SetId(value);')
	function set_id(value:UserId):UserId {
		return value;
	}

	public var username(get, set):String;
	@:functionCode('return native.GetUsername();')
	function get_username():String {
		return '';
	}
	@:functionCode('native.SetUsername(value);')
	function set_username(value:String):String {
		return value;
	}

	public var discriminator(get, set):String;
	@:functionCode('return native.GetDiscriminator();')
	function get_discriminator():String {
		return '';
	}
	@:functionCode('native.SetDiscriminator(value);')
	function set_discriminator(value:String):String {
		return value;
	}

	public var avatar(get, set):String;
	@:functionCode('return native.GetAvatar();')
	function get_avatar():String {
		return '';
	}
	@:functionCode('native.SetAvatar(value);')
	function set_avatar(value:String):String {
		return value;
	}

	public var bot(get, set):Bool;
	@:functionCode('return native.GetBot();')
	function get_bot():Bool {
		return false;
	}
	@:functionCode('native.SetBot(value);')
	function set_bot(value:Bool):Bool {
		return value;
	}
}

@:include('types.h')
@:structInit class OAuth2Token {
	@:access(discordsdk)
	var native:NativeOAuth2Token;
	@:functionCode('
		native = discord::OAuth2Token();
		native.SetAccessToken(accessToken);
		native.SetScopes(scopes);
		native.SetExpires(expires);
	')
	function __init__(accessToken:String, scopes:String, expires:Timestamp) {}

	public function new(?accessToken:String, ?scopes:String, ?expires:Timestamp) {
		__init__(
			accessToken != null ? accessToken : '',
			scopes != null ? scopes : '',
			expires != null ? expires :0
		);
	}

	public var accessToken(get, set):String;
	@:functionCode('return native.GetAccessToken();')
	function get_accessToken():String {
		return '';
	}
	@:functionCode('native.SetAccessToken(value);')
	function set_accessToken(value:String):String {
		return value;
	}

	public var scopes(get, set):String;
	@:functionCode('return native.GetScopes();')
	function get_scopes():String {
		return '';
	}
	@:functionCode('native.SetScopes(value);')
	function set_scopes(value:String):String {
		return value;
	}

	public var expires(get, set):Timestamp;
	@:functionCode('return native.GetExpires();')
	function get_expires():Timestamp {
		return 0;
	}
	@:functionCode('native.SetExpires(value);')
	function set_expires(value:Timestamp):Timestamp {
		return value;
	}
}

@:include('types.h')
@:structInit class ImageHandle {
	@:access(discordsdk)
	var native:NativeImageHandle;
	@:functionCode('
		native = discord::ImageHandle();
		native.SetType((discord::ImageType)type);
		native.SetId(id);
		native.SetSize(size);
	')
	function __init__(type:ImageType, id:Int64, size:UInt) {}

	public function new(?type:ImageType, ?id:Int64, ?size:UInt) {
		__init__(
			type != null ? type : User,
			id != null ? id : 0,
			size != null ? size : 0
		);
	}

	public var type(get, set):ImageType;
	@:functionCode('return (int)native.GetType();')
	function get_type():ImageType {
		return User;
	}
	@:functionCode('native.SetType((discord::ImageType)value);')
	function set_type(value:ImageType):ImageType {
		return value;
	}

	public var id(get, set):Int64;
	@:functionCode('return native.GetId();')
	function get_id():Int64 {
		return 0;
	}
	@:functionCode('native.SetId(value);')
	function set_id(value:Int64):Int64 {
		return value;
	}

	public var size(get, set):UInt;
	@:functionCode('return native.GetSize();')
	function get_size():UInt {
		return 0;
	}
	@:functionCode('native.SetSize(value);')
	function set_size(value:UInt):UInt {
		return value;
	}
}

@:structInit class ImageDimensions {
	@:access(discordsdk)
	var native:NativeImageDimensions;
	@:functionCode('
		native = discord::ImageDimensions();
		native.SetWidth(width);
		native.SetHeight(height);
	')
	function __init__(width:UInt, height:UInt) {}

	public function new(?width:UInt, ?height:UInt) {
		__init__(
			width != null ? width : 0,
			height != null ? height : 0
		);
	}

	public var width(get, set):UInt;
	@:functionCode('return native.GetWidth();')
	function get_width():UInt {
		return 0;
	}
	@:functionCode('native.SetWidth(value);')
	function set_width(value:UInt):UInt {
		return value;
	}

	public var height(get, set):UInt;
	@:functionCode('return native.GetHeight();')
	function get_height():UInt {
		return 0;
	}
	@:functionCode('native.SetHeight(value);')
	function set_height(value:UInt):UInt {
		return value;
	}
}

@:structInit class ActivityTimestamps {
	@:access(discordsdk)
	var native:NativeActivityTimestamps;
	@:functionCode('
		native = discord::ActivityTimestamps();
		native.SetStart(start);
		native.SetEnd(end);
	')
	function __init__(start:Timestamp, end:Timestamp) {}

	public function new(?start:Timestamp, ?end:Timestamp) {
		__init__(
			start != null ? start : 0,
			end != null ? end : 0
		);
	}

	public var start(get, set):Timestamp;
	@:functionCode('return native.GetStart();')
	function get_start():Timestamp {
		return 0;
	}
	@:functionCode('native.SetStart(value);')
	function set_start(value:Timestamp):Timestamp {
		return value;
	}

	public var end(get, set):Timestamp;
	@:functionCode('return native.GetEnd();')
	function get_end():Timestamp {
		return 0;
	}
	@:functionCode('native.SetEnd(value);')
	function set_end(value:Timestamp):Timestamp {
		return value;
	}
}

@:structInit class ActivityAssets {
	@:access(discordsdk)
	var native:NativeActivityAssets;
	@:functionCode('
		native = discord::ActivityAssets();
		native.SetLargeImage(largeImage);
		native.SetLargeText(largeText);
		native.SetSmallImage(smallImage);
		native.SetSmallText(smallText);
	')
	function __init__(largeImage:String, largeText:String, smallImage:String, smallText:String) {}

	public function new(?largeImage:String, ?largeText:String, ?smallImage:String, ?smallText:String) {
		__init__(
			largeImage != null ? largeImage : '',
			largeText != null ? largeText : '',
			smallImage != null ? smallImage : '',
			smallText != null ? smallText : ''
		);
	}

	public var largeImage(get, set):String;
	@:functionCode('return native.GetLargeImage();')
	function get_largeImage():String {
		return '';
	}
	@:functionCode('native.SetLargeImage(value);')
	function set_largeImage(value:String):String {
		return value;
	}

	public var largeText(get, set):String;
	@:functionCode('return native.GetLargeText();')
	function get_largeText():String {
		return '';
	}
	@:functionCode('native.SetLargeText(value);')
	function set_largeText(value:String):String {
		return value;
	}

	public var smallImage(get, set):String;
	@:functionCode('return native.GetSmallImage();')
	function get_smallImage():String {
		return '';
	}
	@:functionCode('native.SetSmallImage(value);')
	function set_smallImage(value:String):String {
		return value;
	}

	public var smallText(get, set):String;
	@:functionCode('return native.GetSmallText();')
	function get_smallText():String {
		return '';
	}
	@:functionCode('native.SetSmallText(value);')
	function set_smallText(value:String):String {
		return value;
	}
}

@:structInit class PartySize {
	@:access(discordsdk)
	var native:NativePartySize;
	@:functionCode('
		native = discord::PartySize();
		native.SetCurrentSize(currentSize);
		native.SetMaxSize(maxSize);
	')
	function __init__(currentSize:Int, maxSize:Int) {}

	public function new(?currentSize:Int, ?maxSize:Int) {
		__init__(
			currentSize != null ? currentSize : 0,
			maxSize != null ? maxSize : 0
		);
	}

	public var currentSize(get, set):Int;
	@:functionCode('return native.GetCurrentSize();')
	function get_currentSize():Int {
		return 0;
	}
	@:functionCode('native.SetCurrentSize(value);')
	function set_currentSize(value:Int):Int {
		return value;
	}

	public var maxSize(get, set):Int;
	@:functionCode('return native.GetMaxSize();')
	function get_maxSize():Int {
		return 0;
	}
	@:functionCode('native.SetMaxSize(value);')
	function set_maxSize(value:Int):Int {
		return value;
	}
}

@:include('discordsdk/PartySize.h')
@:structInit class ActivityParty {
	@:access(discordsdk)
	var native:NativeActivityParty;
	@:functionCode('
		native = discord::ActivityParty();
		native.SetId(id);
	')
	function __init__(id:String) {}

	public function new(?id:String) {
		__init__(
			id != null ? id : ''
		);
	}

	public var id(get, set):String;
	@:functionCode('return native.GetId();')
	function get_id():String {
		return '';
	}
	@:functionCode('native.SetId(value);')
	function set_id(value:String):String {
		return value;
	}

	var _size:PartySize = {};
	public var size(get, never):PartySize;
	@:functionCode('_size->native = native.GetSize();')
	function get_size():PartySize {
		return _size;
	}
}

@:structInit class ActivitySecrets {
	@:access(discordsdk)
	var native:NativeActivitySecrets;
	@:functionCode('
		native = discord::ActivitySecrets();
		native.SetMatch(match);
		native.SetJoin(join);
		native.SetSpectate(spectate);
	')
	function __init__(match:String, join:String, spectate:String) {}

	public function new(?match:String, ?join:String, ?spectate:String) {
		__init__(
			match != null ? match : '',
			join != null ? join : '',
			spectate != null ? spectate : ''
		);
	}

	public var match(get, set):String;
	@:functionCode('return native.GetMatch();')
	function get_match():String {
		return '';
	}
	@:functionCode('native.SetMatch(value);')
	function set_match(value:String):String {
		return value;
	}

	public var join(get, set):String;
	@:functionCode('return native.GetJoin();')
	function get_join():String {
		return '';
	}
	@:functionCode('native.SetJoin(value);')
	function set_join(value:String):String {
		return value;
	}

	public var spectate(get, set):String;
	@:functionCode('return native.GetSpectate();')
	function get_spectate():String {
		return '';
	}
	@:functionCode('native.SetSpectate(value);')
	function set_spectate(value:String):String {
		return value;
	}
}

@:structInit class Activity {
	@:access(discordsdk)
	var native:NativeActivity;
	@:functionCode('
		native = discord::Activity();
		native.SetType((discord::ActivityType)type);
		native.SetApplicationId(applicationId);
		native.SetName(name);
		native.SetState(state);
		native.SetDetails(details);
	')
	function __init__(type:ActivityType, applicationId:Int64, name:String, state:String, details:String) {}

	public function new(?type:ActivityType, ?applicationId:Int64, ?name:String, ?state:String, ?details:String) {
		__init__(
			type != null ? type : Playing,
			applicationId != null ? applicationId : 0,
			name != null ? name : '',
			state != null ? state : '',
			details != null ? details : ''
		);
	}

	public var type(get, set):ActivityType;
	@:functionCode('return (int)native.GetType();')
	function get_type():ActivityType {
		return Playing;
	}
	@:functionCode('native.SetType((discord::ActivityType)value);')
	function set_type(value:ActivityType):ActivityType {
		return value;
	}

	public var applicationId(get, set):Int64;
	@:functionCode('return native.GetApplicationId();')
	function get_applicationId():Int64 {
		return 0;
	}
	@:functionCode('native.SetApplicationId(value);')
	function set_applicationId(value:Int64):Int64 {
		return value;
	}

	public var name(get, set):String;
	@:functionCode('return native.GetName();')
	function get_name():String {
		return '';
	}
	@:functionCode('native.SetName(value);')
	function set_name(value:String):String {
		return value;
	}

	public var state(get, set):String;
	@:functionCode('return native.GetState();')
	function get_state():String {
		return '';
	}
	@:functionCode('native.SetState(value);')
	function set_state(value:String):String {
		return value;
	}

	public var details(get, set):String;
	@:functionCode('return native.GetDetails();')
	function get_details():String {
		return '';
	}
	@:functionCode('native.SetDetails(value);')
	function set_details(value:String):String {
		return value;
	}

	var _timestamps:ActivityTimestamps = {};
	public var timestamps(get, never):ActivityTimestamps;
	@:functionCode('_timestamps->native = native.GetTimestamps();')
	function get_timestamps():ActivityTimestamps {
		return _timestamps;
	}

	var _assets:ActivityAssets = {};
	public var assets(get, never):ActivityAssets;
	@:functionCode('_assets->native = native.GetAssets();')
	function get_assets():ActivityAssets {
		return _assets;
	}

	var _party:ActivityParty;
	public var party(get, never):ActivityParty;
	@:functionCode('_party->native = native.GetParty();')
	function get_party():ActivityParty {
		return _party;
	}

	var _secrets:ActivitySecrets;
	public var secrets(get, never):ActivitySecrets;
	@:functionCode('_secrets->native = native.GetSecrets();')
	function get_secrets():ActivitySecrets {
		return _secrets;
	}

	public var instance(get, set):Bool;
	@:functionCode('return native.GetInstance();')
	function get_instance():Bool {
		return false;
	}
	@:functionCode('native.SetInstance(value);')
	function set_instance(value:Bool):Bool {
		return value;
	}
}
#end