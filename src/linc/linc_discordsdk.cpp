//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_discordsdk.h"

namespace linc {
	namespace discordsdk {
		discord::Core* core{};
		discord::Activity activity{};
		bool active = false;

		// Dynamic onInit; // using dynamic for functions probably is not a good idea, but eh 
		Dynamic onError;

		void runCallbacks() {
			if (active)
				core->RunCallbacks();
		}

		void onActivityJoinRequest(const std::function<void(const char*, int64_t, const char*)> callback) {
			if (active)
				core->ActivityManager().OnActivityJoinRequest.Connect([callback = std::move(callback)](discord::User user){
						callback(user.GetUsername(), user.GetId(), user.GetAvatar());
				});
		}

		void makeParty(const char* id, const char* joinId, const char* spectateId, int currentSize, int maxSize, Dynamic& onPartyMake) {
			if (!active)
				return;

			activity.GetParty().SetId(id);
			activity.GetParty().GetSize().SetCurrentSize(currentSize == 0 ? 1 : currentSize);
			activity.GetParty().GetSize().SetMaxSize(maxSize);
			activity.GetSecrets().SetJoin(joinId);
			activity.GetSecrets().SetSpectate(spectateId);
			core->ActivityManager().UpdateActivity(activity, [onPartyMake = std::move(onPartyMake)](discord::Result result) {
				const_cast<Dynamic&>(onPartyMake)(((int)result));
			});
		}

		void registerCommand(const char* url) {
			if (active)
				core->ActivityManager().RegisterCommand(url);
		}

		void updateActivity(const char* details, const char* state, const char* smallImage, const char* smallText, const char* largeImage, const char* largeText, int type, float startTimestamp, float endTimestamp, Dynamic& callback) {
			if (!active)
				return;

			discord::Activity& activity = discordsdk::activity; // too lazy kek
			activity.SetDetails(details);
			activity.SetState(state);
			activity.GetAssets().SetSmallImage(smallImage);
			activity.GetAssets().SetSmallText(smallText);
			activity.GetAssets().SetLargeImage(largeImage);
			activity.GetAssets().SetLargeText(largeText);
			activity.SetType((discord::ActivityType)type);
			activity.GetTimestamps().SetStart(startTimestamp);
			activity.GetTimestamps().SetEnd(endTimestamp);
			activity.SetInstance(true);
			core->ActivityManager().UpdateActivity(activity, [callback = std::move(callback)](discord::Result result) {
				(result == discord::Result::Ok) ? const_cast<Dynamic&>(callback)() : onError((int)result);
			});
		}

		void init(int64_t clientId, int64_t createFlags, Dynamic& onInit, Dynamic& onError) {
			if (active)
				return;
				
			auto result = discord::Core::Create(clientId, createFlags, &core);
			if (!core) {
				onError((int)result);
				return;
			}
			// discordsdk::onInit = std::move(onInit);
			discordsdk::onError = std::move(onError);
			onInit();

			active = true;
		}

		void shutdown() {
			if (!active)
				return;

			active = false;
			
			core->~Core();
			delete (core);
			core = {};
		}

		void toggleOverlayCallback(discord::Result result) {
			// i'm dumb
		}
		void toggleOverlay(bool enabled) {
			if (!active)
				return;

			core->OverlayManager().SetLocked(!enabled, toggleOverlayCallback);
			// core->OverlayManager().OpenVoiceSettings(toggleOverlayCallback);
			// core->OverlayManager().OpenActivityInvite(discord::ActivityActionType::Spectate, toggleOverlayCallback);
		}
	}
}