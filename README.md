# linc/DiscordSDK
<img src="richpresence.png" alt="drawing" width="75%" height=50%/>

Bindings for the Discord GameSDK

```actionscript
import sys.thread.Thread;
import discordsdk.DiscordSDK;

class Main {
	static final CLIENT_ID:String = "your_client_id_here";

	static function main() {
		DiscordSDK.init(CLIENT_ID, onInit, onError);
	}

	static function onInit() {
		DiscordSDK.updateActivity("", "", "", "", "icon", "", Playing, Sys.time(), 0);

		Thread.create(function() {
			while (true) {
				DiscordSDK.runCallbacks();
				Sys.sleep(0.4);
			}
		});
	}
}
```

This is work in progress, expect things to change.

# Todo
* [x] Not have race conditions
* [x] Parties
* [ ] Working invite callbacks'