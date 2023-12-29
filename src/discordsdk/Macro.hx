package discordsdk;

import haxe.io.Path;
import haxe.macro.Type;
import haxe.macro.Context;
import haxe.macro.Expr;

using haxe.macro.PositionTools;
using haxe.macro.Tools;

class Macro {
	public static macro function buildMap(typePath:String, invert:Bool = false, ?exclude:Array<String>):Expr {
		var type = Context.getType(typePath);
		var values = [];

		if (exclude == null)
			exclude = [];

		switch (type.follow()) {
			case TAbstract(_.get() => ab, _):
				for (f in ab.impl.get().statics.get()) {
					switch (f.kind) {
						case FVar(AccInline, _):
							var value = 0;
							switch (f.expr().expr) {
								case TCast(Context.getTypedExpr(_) => expr, _):
									value = expr.getValue();
								default:
							}
							if (exclude.indexOf(f.name) == -1) // uppercase?
								values.push({name: f.name, value: value});

						default:
					}
				}
			default:
		}

		var finalExpr;
		if (invert)
			finalExpr = values.map(function(v) return macro $v{v.value} => $v{v.name});
		else
			finalExpr = values.map(function(v) return macro $v{v.name} => $v{v.value});

		return macro $a{finalExpr};
	}

	public static macro function touch():Array<Field> {
		return Context.getBuildFields().concat([{
			name: '__touch',
			pos: Context.currentPos(),
			doc: null,
			meta: [],
			access: [APrivate, AStatic, AInline],
			kind: FVar(macro:String, macro $v{Std.string(Date.now().getTime())})
		}]);
	}

	public static macro function xml(lib:String):Array<Field> {
		final _pos:Position = Context.currentPos();
		final _class:Null<Ref<ClassType>> = Context.getLocalClass();

		var _sourcePath:String = Path.directory(_pos.getInfos().file);
		if (!Path.isAbsolute(_sourcePath))
			_sourcePath = Path.join([Sys.getCwd(), _sourcePath]);

		_sourcePath = Path.normalize(_sourcePath);

		final _libPath:String = Path.normalize(Path.join([_sourcePath, '../']));
		final _libVar:String = 'LINC_${lib.toUpperCase()}_PATH';

		final _define:String = '<set name="$_libVar" value="$_libPath/"/>';
		final _importPath:String = '$${$_libVar}linc/linc_${lib}.xml';
		final _import:String = '<include name="$_importPath" />';

		_class.get().meta.add(':buildXml', [{
			expr: EConst(CString('$_define\n$_import')),
			pos: _pos
		}], _pos);

		return Context.getBuildFields();
	}
}