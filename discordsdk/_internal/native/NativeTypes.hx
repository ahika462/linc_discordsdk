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
	var Warn;
	var Info;
	var Debug;
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
	var User;
}

@:native('discord::ActivityType')
extern enum abstract NativeActivityType(Int) from Int to Int {
	var Playing;
	var Streaming;
	var Listening;
	var Watching;
}

@:native('discord::ActivityActionType')
extern enum abstract NativeActivityActionType(Int) from Int to Int {
	var Join = 1;
	var Spectate;
}

@:native('discord::ActivityJoinRequestReply')
extern enum abstract NativeActivityJoinRequestReply(Int) from Int to Int {
	var No;
	var Yes;
	var Ignore;
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
	var None;
	var Friend;
	var Blocked;
	var PendingIncoming;
	var PendingOutgoing;
	var Implicit;
}

@:native('discord::LobbyType')
extern enum abstract NativeLobbyType(Int) from Int to Int {
	var Private = 1;
	var Public;
}

@:native('discord::LobbySearchComparison')
extern enum abstract NativeLobbySearchComparison(Int) from Int to Int {
	var LessThanOrEqual = -2;
	var LessThan;
	var Equal;
	var GreaterThan;
	var GreaterThanOrEqual;
	var NotEqual;
}

@:native('discord::LobbySearchCast')
extern enum abstract NativeLobbySearchCast(Int) from Int to Int {
	var String = 1;
	var Number;
}

@:native('discord::LobbySearchDistance')
extern enum abstract NativeLobbySearchDistance(Int) from Int to Int {
	var Local;
	var Default;
	var Extended;
	var Global;
}

@:native('discord::EntitlementType')
extern enum abstract NativeEntitlementType(Int) from Int to Int {
	var Purchase = 1;
	var PremiumSubscription;
	var DeveloperGift;
	var TestModePurchase;
	var FreePurchase;
	var UserGift;
	var PremiumPurchase;
}

@:native('discord::SkuType')
extern enum abstract NativeSkuType(Int) from Int to Int {
	var Application = 1;
	var DLC;
	var Consumable;
	var Bundle;
}

@:native('discord::InputModeType')
extern enum abstract NativeInputModeType(Int) from Int to Int {
	var VoiceActivity = 0;
	var PushToTalk;
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

@:include('discord.h')
@:native('discord::User')
@:structAccess extern class NativeUser {}

@:native('discord::OAuth2Token')
@:structAccess extern class NativeOAuth2Token {}

@:native('discord::ImageHandle')
@:structAccess extern class NativeImageHandle {}

@:native('discord::ImageDimensions')
@:structAccess extern class NativeImageDimensions {}

@:native('discord::ActivityTimestamps')
@:structAccess extern class NativeActivityTimestamps {}

@:native('discord::ActivityAssets')
@:structAccess extern class NativeActivityAssets {}

@:native('discord::PartySize')
@:structAccess extern class NativePartySize {}

@:native('discord::ActivityParty')
@:structAccess extern class NativeActivityParty {}

@:native('discord::ActivitySecrets')
@:structAccess extern class NativeActivitySecrets {}

@:native('discord::Activity')
@:structAccess extern class NativeActivity {}

@:native('discord::Presence')
@:structAccess extern class NativePresence {}

@:native('discord::Relationship')
@:structAccess extern class NativeRelationship {}

@:native('discord::Lobby')
@:structAccess extern class NativeLobby {}

@:native('discord::FileStat')
@:structAccess extern class NativeFileStat {}

@:native('discord::Entitlement')
@:structAccess extern class NativeEntitlement {}

@:native('discord::SkuPrice')
@:structAccess extern class NativeSkuPrice {}

@:native('discord::Sku')
@:structAccess extern class NativeSku {}

@:native('discord::InputMode')
@:structAccess extern class NativeInputMode {}

@:native('discord::UserAchievement')
@:structAccess extern class NativeUserAchievement {}

@:native('discord::LobbyTransaction')
@:structAccess extern class NativeLobbyTransaction {}

@:native('discord::LobbyMemberTransaction')
@:structAccess extern class NativeLobbyMemberTransaction {}

@:native('discord::LobbySearchQuery')
@:structAccess extern class NativeLobbySearchQuery {}