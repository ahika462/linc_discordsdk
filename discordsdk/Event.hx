package discordsdk;

class Event<T> {
	var onConnect:T->Int;
	var onDisconnect:Int->Void;
	var onDisconnectAll:Void->Void;
	
	public function new(onConnect:T->Int, onDisconnect:Int->Void, onDisconnectAll:Void->Void) {
		this.onConnect = onConnect;
		this.onDisconnect = onDisconnect;
		this.onDisconnectAll = onDisconnectAll;
	}

	public function connect(slot:T):Int {
		return onConnect(slot);
	}

	public function disconnect(token:Int) {
		onDisconnect(token);
	}

	public function disconnectAll() {
		onDisconnectAll();
	}
}