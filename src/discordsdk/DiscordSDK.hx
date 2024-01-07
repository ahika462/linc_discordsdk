package discordsdk;

import cpp.UInt64;
import cpp.UInt32;
import cpp.UInt8;
import cpp.Int8;
import cpp.Int32;
import cpp.Int64;
import cpp.ConstCharStar;
import cpp.Function;

#if !display
@:build(discordsdk.Macro.touch())
@:build(discordsdk.Macro.xml('discordsdk'))
#end

@:cppFileCode('
	#include <hxcpp.h>
	#include "./discord.h"
	#include <iostream>

	#include "discordsdk/ActivityTimestamps.h"
	#include "discordsdk/ActivityAssets.h"
	#include "discordsdk/ActivityParty.h"
	#include "discordsdk/PartySize.h"
	#include "discordsdk/ActivitySecrets.h"

	// #include "discordsdk/OAuth2Token.h"

	#include "discordsdk/ImageHandle.h"
	#include "discordsdk/ImageDimensions.h"

	discord::Core* __core{};
	discord::Activity __activity{};
')

@:structInit class Core {
	public static function create(clientId:Int64, flags:CreateFlags, onInit:Void->Void, onError:Result->Void, instance:Core):Result {
		return instance.init(clientId, flags, onInit, onError);
	}

	@:functionCode('
		auto result = discord::Core::Create(clientId, createFlags, &__core);
		if (!__core) {
			onError((int)result);
			return (int)result;
		}
		onInit();
		return (int)result;
	')
	@:noPrivateAccess function init(clientId:Int64, createFlags:CreateFlags, onInit:Void->Void, onError:Result->Void):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->RunCallbacks();
	')
	public function runCallbacks():Result {
		return Ok;
	}

	@:functionCode('
		__core->SetLogHook(discord::LogLevel(minLevel), [hook = std::move(hook)](discord::LogLevel level, const char* log) {
			const_cast<Dynamic&>(hook)((int)level, log);
		});
	')
	public function setLogHook(minLevel:LogLevel, hook:LogLevel->String->Void) {}

	// achievement manager

	public function achievementManager() {
		return {
			setUserAchievement: setUserAchievement,
			fetchUserAchievements: fetchUserAchievements,
			countUserAchievements: countUserAchievements,
			getUserAchievement: getUserAchievement,
			// getUserAchievementAt: getUserAchievementAt
		};
	}

	@:functionCode('
		__core->AchievementManager().SetUserAchievement(achievementId, percentComplete, [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function setUserAchievement(achievementId:Int64, percentComplete:UInt8, callback:Result->Void) {}

	@:functionCode('
		__core->AchievementManager().FetchUserAchievements([callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function fetchUserAchievements(callback:Result->Void) {}

	@:functionCode('
		__core->AchievementManager().CountUserAchievements(reinterpret_cast<std::int32_t*>(count));
	')
	@:noPrivateAccess function countUserAchievements(count:Int32) {}

	@:functionCode('
		discord::UserAchievement* __userAchievement{};
		__userAchievement->SetUserId(userAchievement->userId);
		__userAchievement->SetAchievementId(userAchievement->achievementId);
		__userAchievement->SetPercentComplete(userAchievement->percentComplete);
		__userAchievement->SetUnlockedAt(userAchievement->unlockedAt);

		return (int)__core->AchievementManager().GetUserAchievement(userAchievementId, __userAchievement);
	')
	@:noPrivateAccess function getUserAchievement(userAchievementId:Int64, userAchievement:UserAchievement):Int {
		return Ok;
	}

	@:functionCode('
		discord::UserAchievement* __userAchievement{};
		__userAchievement->SetUserId(userAchievement->userId);
		__userAchievement->SetAchievementId(userAchievement->achievementId);
		__userAchievement->SetPercentComplete(userAchievement->percentComplete);
		__userAchievement->SetUnlockedAt(userAchievement->unlockedAt);

		return (int)__core->AchievementManager().GetUserAchievementAt(index, __userAchievement);
	')
	@:noPrivateAccess function getUserAchievementAt(index:Int32, userAchievement:UserAchievement):Result {
		return Ok;
	}

	// activity manager

	public function activityManager() {
		return {
			registerCommand: registerCommand,
			registerSteam: registerSteam,
			updateActivity: updateActivity,
			clearActivity: clearActivity,
			sendRequestReply: sendRequestReply,
			sendInvite: sendInvite
		};
	}

	@:functionCode('
		return (int)__core->ActivityManager().RegisterCommand(command);
	')
	@:noPrivateAccess function registerCommand(command:String):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->ActivityManager().RegisterSteam(steamId);
	')
	@:noPrivateAccess function registerSteam(steamId:Int):Result {
		return Ok;
	}

	@:functionCode('
		try {
			if (__activity.GetType() != discord::ActivityType(activity->type))
				__activity.SetType(discord::ActivityType(activity->type));
			if (__activity.GetApplicationId() != activity->applicationId)
				__activity.SetApplicationId(activity->applicationId);
			if (__activity.GetName() != activity->name)
				__activity.SetName(activity->name);
			if (__activity.GetDetails() != activity->details)
				__activity.SetDetails(activity->details);
			if (__activity.GetTimestamps().GetStart() != activity->timestamps->start)
				__activity.GetTimestamps().SetStart(activity->timestamps->start);
			if (__activity.GetTimestamps().GetEnd() != activity->timestamps->end)
				__activity.GetTimestamps().SetEnd(activity->timestamps->end);
			if (__activity.GetAssets().GetLargeImage() != activity->assets->largeImage)
				__activity.GetAssets().SetLargeImage(activity->assets->largeImage);
			if (__activity.GetAssets().GetLargeText() != activity->assets->largeText)
				__activity.GetAssets().SetLargeText(activity->assets->largeText);
			if (__activity.GetAssets().GetSmallImage() != activity->assets->smallImage)
				__activity.GetAssets().SetSmallImage(activity->assets->smallImage);
			if (__activity.GetAssets().GetSmallText() != activity->assets->smallText)
				__activity.GetAssets().SetSmallText(activity->assets->smallText);
			if (__activity.GetParty().GetId() != activity->party->id)
				__activity.GetParty().SetId(activity->party->id);
			if (__activity.GetParty().GetSize().GetCurrentSize() != activity->party->size->currentSize)
				__activity.GetParty().GetSize().SetCurrentSize(activity->party->size->currentSize);
			if (__activity.GetParty().GetSize().GetMaxSize() != activity->party->size->maxSize)
				__activity.GetParty().GetSize().SetMaxSize(activity->party->size->maxSize);
			if (__activity.GetSecrets().GetMatch() != activity->secrets->match)
				__activity.GetSecrets().SetMatch(activity->secrets->match);
			if (__activity.GetSecrets().GetJoin() != activity->secrets->join)
				__activity.GetSecrets().SetJoin(activity->secrets->join);
			if (__activity.GetSecrets().GetSpectate() != activity->secrets->spectate)
				__activity.GetSecrets().SetSpectate(activity->secrets->spectate);
			if (__activity.GetInstance() != activity->instance)
				__activity.SetInstance(activity->instance);

			__core->ActivityManager().UpdateActivity(__activity, [callback = std::move(callback)](discord::Result result) {
				const_cast<Dynamic&>(callback)((int)result);
			});
		} catch(...) {
			std::cout << "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"; // it prevents crashes lol
		}
	')
	@:noPrivateAccess function updateActivity(activity:Activity, callback:Result->Void) {}

	@:functionCode('
		__core->ActivityManager().ClearActivity([callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function clearActivity(callback:Result->Void) {}

	@:functionCode('
		__core->ActivityManager().SendRequestReply(userId, discord::ActivityJoinRequestReply(reply), [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function sendRequestReply(userId:Int64, reply:ActivityJoinRequestReply, callback:Result->Void) {}

	@:functionCode('
		__core->ActivityManager().SendInvite(userId, discord::ActivityActionType(type), content, [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function sendInvite(userId:Int64, type:ActivityActionType, content:String, callback:Result->Void) {}

	@:functionCode('
		__core->ActivityManager().AcceptInvite(userId, [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function acceptInvite(userId:Int64, callback:Result->Void) {}

	// application manager

	public function applicationManager() {
		return {
			validateOrExit: validateOrExit,
			getCurrentLocale: getCurrentLocale,
			getCurrentBranch: getCurrentBranch,
			getOAuth2Token: getOAuth2Token,
			getTicket: getTicket
		};
	}

	@:functionCode('
		__core->ApplicationManager().ValidateOrExit([callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function validateOrExit(callback:Result->Void) {}

	/*@:functionCode('
		core->ApplicationManager().GetCurrentLocale(locale);
	')*/
	@:noPrivateAccess function getCurrentLocale(locale:String) {}

	/*@:functionCode('
		core->ApplicationManager().GetCurrentBranch(branch);
	')*/
	@:noPrivateAccess function getCurrentBranch(branch:String) {}

	/*@:functionCode('
		core->ApplicationManager().GetOAuth2Token([callback = std::move(callback)](discord::Result result, discord::Oauth2Token __token) {
			discordsdk::OAuth2Token_obj token{};
			token.accessToken = __token.GetAccessToken();
			token.scopes = __token.GetScopes();
			token.expires = __token.GetExpires();
			
			const_cast<Dynamic&>(callback)((int)result, token);
		});
	')*/
	@:noPrivateAccess function getOAuth2Token(callback:Result->OAuth2Token->Void) {}

	@:functionCode('
		__core->ApplicationManager().GetTicket([callback = std::move(callback)](discord::Result result, const char* ticket) {
			const_cast<Dynamic&>(callback)((int)result, ticket);
		});
	')
	@:noPrivateAccess function getTicket(callback:Result->String->Void) {}

	// image manager

	public function imageManager() {
		return {
			fetch: fetch,
			getDimensions: getDimensions,
			getData: getData
		};
	}

	/*@:functionCode('
		discord::ImageHandle __handle{};
		__handle.SetType(handle->type);
		__handle.SetId(handle->id);
		__handle.SetSize(handle->size);

		core->ImageManager().Fetch(__handle, refresh, [callback = std::move(callback)](discord::Result result, discord::ImageHandle imageHandle) {
			const_cast<Dynamic&>(callback)((int)result, imageHandle);
		});
	')*/
	@:noPrivateAccess function fetch(handle:ImageHandle, refresh:Bool, callback:Result->ImageHandle->Void) {}

	@:functionCode('
		discord::ImageHandle __handle{};
		__handle.SetType(discord::ImageType(handle->type));
		__handle.SetId(handle->id);
		__handle.SetSize(handle->size);

		discord::ImageDimensions* __dimensions{};
		__dimensions->SetWidth(dimensions->width);
		__dimensions->SetHeight(dimensions->height);
		return (int)__core->ImageManager().GetDimensions(__handle, __dimensions);
	')
	@:noPrivateAccess function getDimensions(handle:ImageHandle, dimensions:ImageDimensions):Result {
		return Ok;
	}

	@:functionCode('
		discord::ImageHandle __handle{};
		__handle.SetType(discord::ImageType(handle->type));
		__handle.SetId(handle->id);
		__handle.SetSize(handle->size);

		return (int)__core->ImageManager().GetData(__handle, reinterpret_cast<std::uint8_t*>(data), dataLength);
	')
	@:noPrivateAccess function getData(handle:ImageHandle, data:UInt8, dataLength:UInt32):Result {
		return Ok;
	}

	// lobby manager

	public function lobbyManager() {
		return {

		};
	}

	/*@:functionCode('
		return (int)core->LobbyManager().GetLobbyCreateTransaction(__transaction);
	')
	@:noPrivateAccess function getLobbyCreateTransaction(transaction:LobbyTransaction):Result {
		return Ok;
	}*/

	// network manager

	public function networkManager() {
		return {
			getPeerId: getPeerId,
			flush: flush,
			openPeer: openPeer,
			updatePeer: updatePeer,
			closePeer: closePeer,
			openChannel: openChannel,
			closeChannel: closeChannel,
			sendMessage: sendMessage
		};
	}

	@:functionCode('
		__core->NetworkManager().GetPeerId(reinterpret_cast<std::uint64_t*>(peerId));
	')
	@:noPrivateAccess function getPeerId(peerId:UInt64) {}

	@:functionCode('
		return (int)__core->NetworkManager().Flush();
	')
	@:noPrivateAccess function flush():Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().OpenPeer(peerId, routeData);
	')
	@:noPrivateAccess function openPeer(peerId:UInt64, routeData:String):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().UpdatePeer(peerId, routeData);
	')
	@:noPrivateAccess function updatePeer(peerId:UInt64, routeData:String):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().ClosePeer(peerId);
	')
	@:noPrivateAccess function closePeer(peerId:UInt64):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().OpenChannel(peerId, channelId, reliable);
	')
	@:noPrivateAccess function openChannel(peerId:UInt64, channelId:UInt8, reliable:Bool):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().CloseChannel(peerId, channelId);
	')
	@:noPrivateAccess function closeChannel(peerId:UInt64, channelId:UInt8):Result {
		return Ok;
	}

	@:functionCode('
		return (int)__core->NetworkManager().SendMessage(peerId, channelId, reinterpret_cast<std::uint8_t*>(data), dataLength);
	')
	@:noPrivateAccess function sendMessage(peerId:UInt64, channelId:UInt8, data:UInt8, dataLength:UInt32):Result {
		return Ok;
	}

	// overlay manager

	public function overlayManager() {
		return {
			isEnabled: isEnabled,
			isLocked: isLocked,
			setLocked: setLocked,
			openActivityInvite: openActivityInvite,
			openGuildInvite: openGuildInvite,
			openVoiceSettings: openVoiceSettings
		};
	}

	@:functionCode('
		__core->OverlayManager().IsEnabled(reinterpret_cast<bool*>(enabled));
	')
	@:noPrivateAccess function isEnabled(enabled:Bool) {}

	@:functionCode('
		__core->OverlayManager().IsLocked(reinterpret_cast<bool*>(locked));
	')
	@:noPrivateAccess function isLocked(locked:Bool) {}

	@:functionCode('
		__core->OverlayManager().SetLocked(locked, [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function setLocked(locked:Bool, callback:Result->Void) {}

	@:functionCode('
		__core->OverlayManager().OpenActivityInvite(discord::ActivityActionType(type), [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function openActivityInvite(type:ActivityActionType, callback:Result->Void) {}

	@:functionCode('
		__core->OverlayManager().OpenGuildInvite(code, [callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function openGuildInvite(code:String, callback:Result->Void) {}

	@:functionCode('
		__core->OverlayManager().OpenVoiceSettings([callback = std::move(callback)](discord::Result result) {
			const_cast<Dynamic&>(callback)((int)result);
		});
	')
	@:noPrivateAccess function openVoiceSettings(callback:Result->Void) {}

	// relationship manager

	public function relationshipManager() {
		return {

		};
	}

	/*@:functionCode('
		core->RelationshipManager().Filter([filter = std::move(filter)](discord::Relationship relationship) {
			return const_cast<Dynamic&>(filter)(relationship);
		});
	')
	@:noPrivateAccess function filter(filter:Relationship->Bool) {}*/

	// storage manager

	public function storageManager() {
		return {
			read: read,
			readAsync: readAsync
		};
	}

	@:functionCode('
		return (int)__core->StorageManager().Read(name, reinterpret_cast<std::uint8_t*>(data), dataLength, reinterpret_cast<std::uint32_t*>(read));
	')
	@:noPrivateAccess function read(name:String, data:UInt8, dataLength:UInt32, read:UInt32):Result {
		return Ok;
	}

	@:functionCode('
		__core->StorageManager().ReadAsync(name, [callback = std::move(callback)](discord::Result result, std::uint8_t* data, std::uint32_t dataLength) {
			const_cast<Dynamic&>(callback)((int)result, reinterpret_cast<std::uint8_t>(data), dataLength);
		});
	')
	@:noPrivateAccess function readAsync(name:String, callback:Result->UInt8->UInt32->Void) {}
}

enum abstract Result(Int) from Int to Int {
	public static var map:Map<Result, String> = Macro.buildMap('discordsdk.DiscordSDK.Result');

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

@:publicFields @:structInit class Activity {
	var type:ActivityType = Playing;
	var applicationId:Int64 = 0;
	var name:String = '';
	var state:String = '';
	var details:String = '';
	var timestamps(default, never):ActivityTimestamps = {};
	var assets(default, never):ActivityAssets = {};
	var party(default, never):ActivityParty = {};
	var secrets(default, never):ActivitySecrets = {};
	var instance:Bool = false;
}

enum abstract ActivityType(Int) from Int to Int {
	var Playing = 0;
	var Streaming = 1;
	var Listening = 2;
	var Watching = 3;
}

@:publicFields @:structInit class ActivityTimestamps {
	var start:Int64 = 0;
	var end:Int64 = 0;
}

@:publicFields @:structInit class ActivityAssets {
	var largeImage:String = '';
	var largeText:String = '';
	var smallImage:String = '';
	var smallText:String = '';
}

@:publicFields @:structInit class ActivityParty {
	var id:String = '';
	var size:PartySize = {};
}

@:publicFields @:structInit class PartySize {
	var currentSize:Int = 0;
	var maxSize:Int = 0;
}

@:publicFields @:structInit class ActivitySecrets {
	var match:String = '';
	var join:String = '';
	var spectate:String = '';
}

enum abstract CreateFlags(Int64) from Int to Int64 {
	var Default = 0;
	var NoRequireDiscord = 1;
}

enum abstract ActivityJoinRequestReply(Int) from Int to Int {
	var No = 0;
	var Yes = 1;
	var Ignore = 2;
}

enum abstract ActivityActionType(Int) from Int to Int {
	var Join = 1;
	var Spectate = 2;
}

@:publicFields @:structInit class UserAchievement {
	var userId:Int64 = 0;
	var achievementId:Int64 = 0;
	var percentComplete:UInt8 = 0;
	var unlockedAt:String = '';
}

@:publicFields @:structInit class OAuth2Token {
	var accessToken:String = '';
	var scopes:String = '';
	var expires:Int64 = 0;
}

@:publicFields @:structInit class ImageHandle {
	var type:ImageType;
	var id:Int64;
	var size:UInt32;
}

enum abstract ImageType(Int) from Int to Int {
	var User = 0;
}

@:publicFields @:structInit class ImageDimensions {
	var width:UInt32;
	var height:UInt32;
}

enum abstract LogLevel(Int) from Int to Int {
	var Error = 1;
	var Warn = 2;
	var Info = 3;
	var Debug = 4;
}