import discordsdk.Core;
import discordsdk.Types;

class Test {
	static function main() {
		Sys.println('\tCompiled!\n');
		try {
			test();
		} catch(e:Dynamic) {
			trace(e);
		}
		var c:Int = 0;
		while (true)
			c++;
	}

	static function test() {
		// var core:Core = new Core();
		/*var result:Result = Core.create('1186993153513889792', NoRequireDiscord, core);
		if (result != Ok) {
			trace(result);
			return;
		}*/

		/*var activity:Activity = {
			state: 'Test',
			details: 'test'
		};*/
		// core.activityManager.updateActivity(activity, (result:Result) -> trace(result));
		
		/*var user:User = {
			id: '1176851258796150794',
			username: 'アジカ',
			discriminator: 'ahika__',
			avatar: '',
			bot: false
		};
		trace(user.id);
		trace(user.username);
		trace(user.discriminator);
		trace(user.avatar);
		trace(user.bot);*/
	}
}