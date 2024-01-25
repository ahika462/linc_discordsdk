package linc;

import haxe.macro.Type;
import haxe.io.Path;
import haxe.macro.Expr;
import haxe.macro.Context;

using haxe.macro.PositionTools;

class Linc {
	/**
	 * Adds a private internal inline static variable called __touch,
	 * which sets the value to the current time so that builds are always
	 * updated by the code, and native changes are dragged in automatically (except for header only changes)
	 * @return Array<Field>
	 */
	public static macro function touch():Array<Field> {
		var _fields:Array<Field> = Context.getBuildFields();

		_fields.push({
			name: '__touch', pos: Context.currentPos(),
			doc: null, meta: [], access: [APrivate, AStatic, AInline],
			kind: FVar(macro : String, macro $v{ Std.string(Date.now().getTime()) }),
		});

		return _fields;
	}

	/**
	 * Adds a @:buildXml meta node with a linc <set> and an <import> tag.
	 * The set is named LINC_${_lib}_PATH, and points to the root folder of the library.
	 * That path is calculated from the calling file using the optional _relative_root, default ../
	 * This means that somelib/ is the root.
	 * somelib/somelib/Somelib.hx is the calling file.
	 * LINC_SOMELIB_PATH is set to somelib/
	 * ${LINC_SOMELIB_PATH}/linc/linc_${_lib}.xml is added directly.
	 * @param _lib 
	 * @param _relative_root 
	 * @return Array<Field>
	 */
	public static macro function xml(_lib:String, _relative_root:String = '../'):Array<Field> {
		var _pos:Position = Context.currentPos();
		var _pos_info = _pos.getInfos();
		var _class:Null<Ref<ClassType>> = Context.getLocalClass();

		var _source_path:String = Path.directory(_pos_info.file);
		if (!Path.isAbsolute(_source_path))
			_source_path = Path.join([Sys.getCwd(), _source_path]);
		_source_path = Path.normalize(_source_path);

		var _linc_lib_path:String = Path.normalize(Path.join([_source_path, _relative_root]));
		var _linc_include_path:String = Path.normalize(Path.join([_linc_lib_path, './linc/linc_$_lib.xml']));
		var _linc_lib_var:String = 'LINC_${_lib.toUpperCase()}_PATH';

		var _define:String = '<set name="$_linc_lib_var" value="$_linc_lib_path/"/>';
		var _import_path:String = '$${$_linc_lib_var}linc/linc_$_lib.xml';
		var _import:String = '<include name="$_import_path"/>';

		_class.get().meta.add(":buildXml", [{
			expr: EConst(CString('$_define\n$_import')),
			pos:_pos
		}], _pos);

		return Context.getBuildFields();
	}
}