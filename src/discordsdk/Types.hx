package discordsdk;

import cpp.Int8;
import haxe.macro.Expr.Constant;
import cpp.UInt32;
import cpp.UInt8;
import cpp.UInt64;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.Int64;

@:include("types.h")

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

@:native("discord::CreateFlags")
enum abstract CreateFlags(Int) from Int to Int {
	var Default = 0;
	var NoRequireDiscord = 1;
}

@:native("discord::LogLevel")
enum abstract LogLevel(Int) from Int to Int {
	var Error = 1;
	var Warn = 2;
	var Info = 3;
	var Debug = 4;
}

@:native("discord::UserFlag")
enum abstract UserFlag(Int) from Int to Int {
	var Partner = 2;
	var HypeSquadEvents = 4;
	var HypeSquadHouse1 = 64;
	var HypeSquadHouse2 = 128;
	var HypeSquadHouse3 = 256;
}

@:native("discord::PremiumType")
enum abstract PremiumType(Int) from Int to Int {
	var None = 0;
	var Tier1 = 1;
	var Tier2 = 2;
}

@:native("discord::ImageType")
enum abstract ImageType(Int) from Int to Int {
	var User = 0;
}

@:native("discord::ActivityType")
enum abstract ActivityType(Int) from Int to Int {
	var Playing = 0;
	var Streaming = 1;
	var Listening = 2;
	var Watching = 3;
}

@:native("discord::ActivityActionType")
enum abstract ActivityActionType(Int) from Int to Int {
	var Join = 1;
	var Spectate = 2;
}

@:native("discord::ActivityJoinRequestReply")
enum abstract ActivityJoinRequestReply(Int) from Int to Int {
	var No = 0;
	var Yes = 1;
	var Ignore = 2;
}

@:native("discord::Status")
enum abstract Status(Int) from Int to Int {
	var Offline = 0;
	var Online = 1;
	var Idle = 2;
	var DoNotDisturb = 3;
}

@:native("discord::RelationshipType")
enum abstract RelationshipType(Int) from Int to Int {
	var None = 0;
	var Friend = 1;
	var Blocked = 2;
	var PendingIncoming = 3;
	var PendingOutgoing = 4;
	var Implicit = 5;
}

@:native("discord::LobbyType")
enum abstract LobbyType(Int) from Int to Int {
	var Private = 1;
	var Public = 2;
}

@:native("discord::LobbySearchComparison")
enum abstract LobbySearchComparison(Int) from Int to Int {
	var LessThanOrEqual = -2;
	var LessThan = -1;
	var Equal = 0;
	var GreaterThan = 1;
	var GreaterThanOrEqual = 2;
	var NotEqual = 3;
}

@:native("discord::LobbySearchCast")
enum abstract LobbySearchCast(Int) from Int to Int {
	var String = 1;
	var Number = 2;
}

@:native("discord::LobbySearchDistance")
enum abstract LobbySearchDistance(Int) from Int to Int {
	var Local = 0;
	var Default = 1;
	var Extended = 2;
	var Global = 3;
}

@:native("discord::EntitlementType")
enum abstract EntitlementType(Int) from Int to Int {
	var Purchase = 1;
	var PremiumSubscription = 2;
	var DeveloperGift = 3;
	var TestModePurchase = 4;
	var FreePurchase = 5;
	var UserGift = 6;
	var PremiumPurchase = 7;
}

@:native("discord::SkuType")
enum abstract SkuType(Int) from Int to Int {
	var Application = 1;
	var DLC = 2;
	var Consumable = 3;
	var Bundle = 4;
}

@:native("discord::InputModeType")
enum abstract InputModeType(Int) from Int to Int {
	var VoiceActivity = 0;
	var PushToTalk = 1;
}

@:native("discord::ClientId")
typedef ClientId = Int64;
@:native("discord::Version")
typedef Version = Int32;
@:native("discord::Snowflake")
typedef Snowflake = Int64;
@:native("discord::Timestamp")
typedef Timestamp = Int64;
@:native("discord::UserId")
typedef UserId = Snowflake;
@:native("discord::Locale")
typedef Locale = ConstCharStar;
@:native("discord::Branch")
typedef Branch = ConstCharStar;
@:native("discord::LobbyId")
typedef LobbyId = Snowflake;
@:native("discord::LobbySecret")
typedef LobbySecret = ConstCharStar;
@:native("discord::MetadataKey")
typedef MetadataKey = ConstCharStar;
@:native("discord::MetadataValue")
typedef MetadataValue = ConstCharStar;
@:native("discord::NetworkPeerId")
typedef NetworkPeerId = UInt64;
@:native("discord::NetworkChannelId")
typedef NetworkChannelId = UInt8;
@:native("discord::Path")
typedef Path = ConstCharStar;
@:native("discord::DateTime")
typedef DateTime = ConstCharStar;

@:native("discord::User")
extern class User {
	@:native("SetId")
	public function SetId(id:UserId):Void;
	@:native("GetId")
	public function GetId():UserId;
	@:native("SetUsername")
	public function SetUsername(userName:ConstCharStar):Void;
	@:native("GetUserame")
	public function GetUsername():ConstCharStar;
	@:native("SetDiscriminator")
	public function SetDiscriminator(discriminator:ConstCharStar):Void;
	@:native("GetDiscriminator")
	public function GetDiscriminator():ConstCharStar;
	@:native("SetAvatar")
	public function SetAvatar(avatar:ConstCharStar):Void;
	@:native("GetAvatar")
	public function GetAvatar():ConstCharStar;
	@:native("SetBot")
	public function SetBot(bot:Bool):Void;
	@:native("GetBot")
	public function GetBot():Bool;
}

@:native("discord::OAuth2Token")
extern class OAuth2Token {
	@:native("SetAccessToken")
	public function SetAccessToken(accessToken:ConstCharStar):Void;
	@:native("GetAccessToken")
	public function GetAccessToken():ConstCharStar;
	@:native("SetScopes")
	public function SetScopes(scopes:ConstCharStar):Void;
	@:native("GetScopes")
	public function GetScopes():ConstCharStar;
	@:native("SetExpires")
	public function SetExpires(expires:Timestamp):Void;
	@:native("GetExpires")
	public function GetExpires():Timestamp;
}

@:native("discord::ImageHandle")
extern class ImageHandle {
	@:native("SetType")
	public function SetType(type:ImageType):Void;
	@:native("GetType")
	public function GetType():ImageType;
	@:native("SetId")
	public function SetId(id:Int64):Void;
	@:native("GetId")
	public function GetId():Int64;
	@:native("SetSize")
	public function SetSize(size:UInt32):Void;
	@:native("GetSize")
	public function GetSize():UInt32;
}

@:native("discord::ImageDimensions")
extern class ImageDimensions {
	@:native("SetWidth")
	public function SetWidth(width:UInt32):Void;
	@:native("GetWidth")
	public function GetWidth():UInt32;
	@:native("SetHeight")
	public function SetHeight(height:UInt32):Void;
	@:native("GetHeight")
	public function GetHeight():UInt32;
}

@:native("discord::ActivityTimestamps")
extern class ActivityTimestamps {
	@:native("SetStart")
	public function SetStart(start:Timestamp):Void;
	@:native("GetStart")
	public function GetStart():Timestamp;
	@:native("SetEnd")
	public function SetEnd(end:Timestamp):Void;
	@:native("GetEnd")
	public function GetEnd():Timestamp;
}

@:native("discord::ActivityAssets")
extern class ActivityAssets {
	@:native("SetLargeImage")
	public function SetLargeImage(largeImage:ConstCharStar):Void;
	@:native("GetLargeImage")
	public function GetLargeImage():ConstCharStar;
	@:native("SetLargeText")
	public function SetLargeText(largeText:ConstCharStar):Void;
	@:native("GetLargeText")
	public function GetLargeText():ConstCharStar;
	@:native("SetSmallImage")
	public function SetSmallImage(smallImage:ConstCharStar):Void;
	@:native("GetSmallImage")
	public function GetSmallImage():ConstCharStar;
	@:native("SetSmallText")
	public function SetSmallText(smallText:ConstCharStar):Void;
	@:native("GetSmallText")
	public function GetSmallText():ConstCharStar;
}

@:native("discord::PartySize")
extern class PartySize {
	@:native("SetCurrentSize")
	public function SetCurrentSize(currentSize:Int32):Void;
	@:native("GetCurrentSize")
	public function GetCurrentSize():Int32;
	@:native("SetMaxSize")
	public function SetMaxSize(maxSize:Int32):Void;
	@:native("GetMaxSize")
	public function GetMaxSize():Int32;
}

@:native("discord::ActivityParty")
extern class ActivityParty {
	@:native("SetId")
	public function SetId(id:ConstCharStar):Void;
	@:native("GetId")
	public function GetId():ConstCharStar;
	@:native("GetSize")
	public function GetSize():PartySize;
}

@:native("discord::ActivitySecrets")
extern class ActivitySecrets {
	@:native("SetMatch")
	public function SetMatch(match:ConstCharStar):Void;
	@:native("GetMatch")
	public function GetMatch():ConstCharStar;
	@:native("SetJoin")
	public function SetJoin(join:ConstCharStar):Void;
	@:native("GetJoin")
	public function GetJoin():ConstCharStar;
	@:native("SetSpectate")
	public function SetSpectate(spectate:ConstCharStar):Void;
	@:native("GetSpectate")
	public function GetSpectate():ConstCharStar;
}

@:native("discord::Activity")
extern class Activity {
	@:native("SetType")
	public function SetType(type:ActivityType):Void;
	@:native("GetType")
	public function GetType():ActivityType;
	@:native("SetApplicationId")
	public function SetApplicationId(applicationId:Int64):Void;
	@:native("GetApplicationId")
	public function GetApplicationId():Int64;
	@:native("SetName")
	public function SetName(name:ConstCharStar):Void;
	@:native("GetName")
	public function GetName():ConstCharStar;
	@:native("SetState")
	public function SetState(state:ConstCharStar):Void;
	@:native("GetState")
	public function GetState():ConstCharStar;
	@:native("SetDetails")
	public function SetDetails(details:ConstCharStar):Void;
	@:native("GetDetails")
	public function GetDetails():ConstCharStar;
	@:native("GetTimestamps")
	public function GetTimestamps():ActivityTimestamps;
	@:native("GetAssets")
	public function GetAssets():ActivityAssets;
	@:native("GetSecrets")
	public function GetSecrets():ActivitySecrets;
	@:native("SetInstance")
	public function SetInstance(instance:Bool):Void;
	@:native("GetInstance")
	public function GetInstance():Bool;
}

@:native("discord::Presence")
extern class Presence {
	@:native("SetStatus")
	public function SetStatus(status:Status):Void;
	@:native("GetStatus")
	public function GetStatus():Status;
	@:native("GetActivity")
	public function GetActivity():Activity;
}

@:native("discord::Relationship")
extern class Relationship {
	@:native("SetType")
	public function SetType(type:RelationshipType):Void;
	@:native("GetType")
	public function GetType():RelationshipType;
	@:native("GetUser")
	public function GetUser():User;
	@:native("GetPresence")
	public function GetPresence():Presence;
}

@:native("discord::Lobby")
extern class Lobby {
	@:native("SetId")
	public function SetId(id:LobbyId):Void;
	@:native("GetId")
	public function GetId():LobbyId;
	@:native("SetType")
	public function SetType(type:LobbyType):Void;
	@:native("GetType")
	public function GetType():LobbyType;
	@:native("SetOwnerId")
	public function SetOwnerId(ownerId:UserId):Void;
	@:native("GetOwnerId")
	public function GetOwnerId():UserId;
	@:native("SetSecret")
	public function SetSecret(secret:LobbySecret):Void;
	@:native("GetSecret")
	public function GetSecret():LobbySecret;
	@:native("SetCapacity")
	public function SetCapacity(capacity:UInt32):Void;
	@:native("GetCapacity")
	public function GetCapacity():UInt32;
	@:native("SetLocked")
	public function SetLocked(locked:Bool):Void;
	@:native("GetLocked")
	public function GetLocked():Bool;
}

@:native("discord::FileStat")
extern class FileStat {
	@:native("SetFilename")
	public function SetFilename(filename:ConstCharStar):Void;
	@:native("GetFilename")
	public function GetFilename():ConstCharStar;
	@:native("SetSize")
	public function SetSize(size:UInt64):Void;
	@:native("GetSize")
	public function GetSize():UInt64;
	@:native("SetLastModified")
	public function SetLastModified(lastModified:UInt64):Void;
	@:native("GetLastModified")
	public function GetLastModified():UInt64;
}

@:native("discord::Entitlement")
extern class Entitlement {
	@:native("SetId")
	public function SetId(id:Snowflake):Void;
	@:native("GetId")
	public function GetId():Snowflake;
	@:native("SetType")
	public function SetType(type:EntitlementType):Void;
	@:native("GetType")
	public function GetType():EntitlementType;
	@:native("SetSkuId")
	public function SetSkuId(skuId:Snowflake):Void;
	@:native("GetSkuId")
	public function GetSkuId():Snowflake;
}

@:native("discord::SkuPrice")
extern class SkuPrice {
	@:native("SetAmount")
	public function SetAmount(amount:UInt32):Void;
	@:native("GetAmount")
	public function GetAmount():UInt32;
	@:native("SetCurrency")
	public function SetCurrency(currency:ConstCharStar):Void;
	@:native("GetCurrency")
	public function GetCurrency():ConstCharStar;
}

@:native("discord::Sku")
extern class Sku {
	@:native("SetId")
	public function SetId(id:Snowflake):Void;
	@:native("GetId")
	public function GetId():Snowflake;
	@:native("SetType")
	public function SetType(type:SkuType):Void;
	@:native("GetType")
	public function GetType():SkuType;
	@:native("SetName")
	public function SetName(name:ConstCharStar):Void;
	@:native("GetName")
	public function GetName():ConstCharStar;
	@:native("GetPrice")
	public function GetPrice():SkuPrice;
}

@:native("discord::InputMode")
extern class InputMode {
	@:native("SetType")
	public function SetType(type:InputModeType):Void;
	@:native("GetType")
	public function GetType():InputModeType;
	@:native("SetShortcut")
	public function SetShortcut(shortcut:ConstCharStar):Void;
	@:native("GetShortcut")
	public function GetShortcut():ConstCharStar;
}

@:native("discord::UserAchievement")
extern class UserAchievement {
	@:native("SetUserId")
	public function SetUserId(userId:Snowflake):Void;
	@:native("GetUserId")
	public function GetUserId():Snowflake;
	@:native("SetAchievementId")
	public function SetAchievementId(achievementId:Snowflake):Void;
	@:native("GetAchievementId")
	public function GetAchievementId():Snowflake;
	@:native("SetPercentComplete")
	public function SetPercentComplete(percentComplete:UInt8):Void;
	@:native("GetPercentComplete")
	public function GetPercentComplete():Int8;
	@:native("SetUnlockedAt")
	public function SetUnlockedAt(unlockedAt:DateTime):Void;
	@:native("GetUnlockedAt")
	public function GetUnlockedAt():DateTime;
}

@:native("discord::LobbyTransaction")
extern class LobbyTransaction {
	@:native("SetType")
	public function SetType(type:LobbyType):Result;
	@:native("SetOwner")
	public function SetOwner(ownerId:UserId):Result;
	@:native("SetCapacity")
	public function SetCapacity(capacity:UInt32):Result;
	@:native("SetMetadata")
	public function SetMetadata(key:MetadataKey, value:MetadataValue):Result;
	@:native("DeleteMetadata")
	public function DeleteMetadata(key:MetadataKey):Result;
	@:native("SetLocked")
	public function SetLocked(locked:Bool):Result;
}

@:native("discord::LobbyMemberTransaction")
extern class LobbyMemberTransaction {
	@:native("SetMetadata")
	public function SetMetadata(key:MetadataKey, value:MetadataValue):Result;
	@:native("DeleteMetadata")
	public function DeleteMetadata(key:MetadataKey):Result;
	// @:native("Recieve")
	// @:native("Internal")
}

// @:native("discord::LobbySearchQuery")