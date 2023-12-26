package discordsdk;

import cpp.Int32;
import cpp.abi.Abi;
import cpp.Function;
import cpp.UInt8;
import discordsdk.Types;

@:include("achievement_manager.h")

@:native("discord::AchievementManager")
extern class AchievementManager {
	// @:native("~AchievementManager")

	@:native("SetUserAchievement")
	public function SetUserAchievement(achievementId:Snowflake, percentComplete:UInt8, callback:Function<Result->Void, Abi>):Void;
	@:native("FetchUserAchievements")
	public function FetchUserAchievements(callback:Function<Result->Void, Abi>):Void;
	@:native("CountUserAchievements")
	public function CountUserAchievements(count:Int32):Void;
	@:native("GetUserAchievement")
	public function GetUserAchievement(userAchievementId:Snowflake, userAchievement:UserAchievement):Result;
	@:native("GetUserAchievementAt")
	public function GetUserAchievementAt(index:Int32, userAchievement:UserAchievement):Result;
}