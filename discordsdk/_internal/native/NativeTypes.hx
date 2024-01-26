package discordsdk._internal.native;

import cpp.UInt8;
import cpp.UInt64;
import cpp.ConstCharStar;
import cpp.Int32;
import cpp.Int64;

@:include('discord.h')

@:native('discord::Result')
extern enum abstract NativeResult(Int) from Int to Int {
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

@:native('discord::CreateFlags')
extern enum abstract NativeCreateFlags(Int) from Int to Int {
	var Default = 0;
	var NoRequireDiscord = 1;
}

@:native('discord::LogLevel')
extern enum abstract NativeLogLevel(Int) from Int to Int {
	var Error = 1;
	var Warn = 2;
	var Info = 3;
	var Debug =4 ;
}

@:native('discord::UserFlag')
extern enum abstract NativeUserFlag(Int) from Int to Int {
	var Partner = 2;
	var HypeSquadEvents = 4;
	var HypeSquadHouse1 = 64;
	var HypeSquadHouse2 = 128;
	var HypeSquadHouse3 = 256;
}

@:native('discord::PremiumType')
extern enum abstract NativePremiumType(Int) from Int to Int {
	var None = 0;
	var Tier1 = 1;
	var Tier2 = 2;
}

@:native('discord::ImageType')
extern enum abstract NativeImageType(Int) from Int to Int {
	var User = 0;
}

@:native('discord::ActivityType')
extern enum abstract NativeActivityType(Int) from Int to Int {
	var Playing = 0;
	var Streaming = 1;
	var Listening = 2;
	var Watching = 3;
}

@:native('discord::ActivityActionType')
extern enum abstract NativeActivityActionType(Int) from Int to Int {
	var Join = 1;
	var Spectate = 2;
}

@:native('discord::ActivityJoinRequestReply')
extern enum abstract NativeActivityJoinRequestReply(Int) from Int to Int {
	var No = 0;
	var Yes = 1;
	var Ignore = 2;
}

@:native('discord::Status')
extern enum abstract NativeStatus(Int) from Int to Int {
	var Offline = 0;
	var Online = 1;
	var Idle = 2;
	var DoNotDisturb = 3;
}

@:native('discord::RelationshipType')
extern enum abstract NativeRelationshipType(Int) from Int to Int {
	var None = 0;
	var Friend = 1;
	var Blocked = 2;
	var PendingIncoming = 3;
	var PendingOutgoing = 4;
	var Implicit = 5;
}

@:native('discord::LobbyType')
extern enum abstract NativeLobbyType(Int) from Int to Int {
	var Private = 1;
	var Public = 2;
}

@:native('discord::LobbySearchComparison')
extern enum abstract NativeLobbySearchComparison(Int) from Int to Int {
	var LessThanOrEqual = -2;
	var LessThan = -1;
	var Equal = 0;
	var GreaterThan = 1;
	var GreaterThanOrEqual = 2;
	var NotEqual = 3;
}

@:native('discord::LobbySearchCast')
extern enum abstract NativeLobbySearchCast(Int) from Int to Int {
	var String = 1;
	var Number = 2;
}

@:native('discord::LobbySearchDistance')
extern enum abstract NativeLobbySearchDistance(Int) from Int to Int {
	var Local = 0;
	var Default = 1;
	var Extended = 2;
	var Global = 3;
}

@:native('discord::EntitlementType')
extern enum abstract NativeEntitlementType(Int) from Int to Int {
	var Purchase = 1;
	var PremiumSubscription = 2;
	var DeveloperGift = 3;
	var TestModePurchase = 4;
	var FreePurchase = 5;
	var UserGift = 6;
	var PremiumPurchase = 7;
}

@:native('discord::SkuType')
extern enum abstract NativeSkuType(Int) from Int to Int {
	var Application = 1;
	var DLC = 2;
	var Consumable = 3;
	var Bundle = 4;
}

@:native('discord::InputModeType')
extern enum abstract NativeInputModeType(Int) from Int to Int {
	var VoiceActivity = 0;
	var PushToTalk = 1;
}

@:native('discord::ClientId')
extern typedef NativeClientId = Int64;
@:native('discord::Version')
extern typedef NativeVersion = Int32;
@:native('discord::Snowflake')
extern typedef NativeSnowflake = Int64;
@:native('discord::Timestamp')
extern typedef NativeTimestamp = Int64;
@:native('discord::UserId')
extern typedef NativeUserId = NativeSnowflake;
@:native('discord::Locale')
extern typedef NativeLocale = ConstCharStar;
@:native('discord::Branch')
extern typedef NativeBranch = ConstCharStar;
@:native('discord::LobbyId')
extern typedef NativeLobbyId = NativeSnowflake;
@:native('discord::LobbySecret')
extern typedef NativeLobbySecret = ConstCharStar;
@:native('discord::MetadataKey')
extern typedef NativeMetadataKey = ConstCharStar;
@:native('discord::MetadataValue')
extern typedef NativeMetadataValue = ConstCharStar;
@:native('discord::NetworkPeerId')
extern typedef NativeNetworkPeerId = UInt64;
@:native('discord::NetworkChannelId')
extern typedef NativeNetworkChannelId = UInt8;
@:native('discord::Path')
extern typedef NativePath = ConstCharStar;
@:native('discord::DateTime')
extern typedef NativeDateTime = ConstCharStar;

@:include('types.h')
@:native('discord::User')
@:structAccess extern class NativeUser {}

@:include('types.h')
@:native('discord::OAuth2Token')
@:structAccess extern class NativeOAuth2Token {}

@:include('types.h')
@:native('discord::ImageHandle')
@:structAccess extern class NativeImageHandle {}

@:include('types.h')
@:native('discord::ImageDimensions')
@:structAccess extern class NativeImageDimensions {}

@:include('types.h')
@:native('discord::ActivityTimestamps')
@:structAccess extern class NativeActivityTimestamps {}

@:include('types.h')
@:native('discord::ActivityAssets')
@:structAccess extern class NativeActivityAssets {}

@:include('types.h')
@:native('discord::PartySize')
@:structAccess extern class NativePartySize {}

@:include('types.h')
@:native('discord::ActivityParty')
@:structAccess extern class NativeActivityParty {}

@:include('types.h')
@:native('discord::ActivitySecrets')
@:structAccess extern class NativeActivitySecrets {}

@:include('types.h')
@:native('discord::Activity')
@:structAccess extern class NativeActivity {}

@:include('types.h')
@:native('discord::Presence')
@:structAccess extern class NativePresence {}

@:include('types.h')
@:native('discord::Relationship')
@:structAccess extern class NativeRelationship {}

@:include('types.h')
@:native('discord::Lobby')
@:structAccess extern class NativeLobby {}

@:include('types.h')
@:native('discord::FileStat')
@:structAccess extern class NativeFileStat {}

@:include('types.h')
@:native('discord::Entitlement')
@:structAccess extern class NativeEntitlement {}

@:include('types.h')
@:native('discord::SkuPrice')
@:structAccess extern class NativeSkuPrice {}

@:include('types.h')
@:native('discord::Sku')
@:structAccess extern class NativeSku {}

@:include('types.h')
@:native('discord::InputMode')
@:structAccess extern class NativeInputMode {}

@:include('types.h')
@:native('discord::UserAchievement')
@:structAccess extern class NativeUserAchievement {}

@:include('types.h')
@:native('discord::LobbyTransaction')
@:structAccess extern class NativeLobbyTransaction {}

@:include('types.h')
@:native('discord::LobbyMemberTransaction')
@:structAccess extern class NativeLobbyMemberTransaction {}

@:include('types.h')
@:native('discord::LobbySearchQuery')
@:structAccess extern class NativeLobbySearchQuery {}