import discordsdk.Types;

class Test {
	static function main() {
		try {
			var user:User = {
				username: 'アジカ',
				discriminator: 'ahika__'
			};
			trace(user.username);
			trace(user.discriminator);
		} catch(e) {
			trace(e);
		}

		var c:Int = 0;
		while (true)
			c++;
	}
}