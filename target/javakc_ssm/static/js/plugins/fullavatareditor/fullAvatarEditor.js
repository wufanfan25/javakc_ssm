function fullAvatarEditor() {
	var id				= 'fullAvatarEditor'			//flash鏂囦欢鐨処D
	var file			= 'plugins/fullavatareditor/fullAvatarEditor.swf';		//flash鏂囦欢鐨勮矾寰�
	var	version			= "10.1.0";						//鎾斁璇lash鎵€闇€鐨勬渶浣庣増鏈�
	var	expressInstall	= 'expressInstall.swf';			//expressInstall.swf鐨勮矾寰�
	var	width			= 600;							//flash鏂囦欢鐨勫搴�
	var	height			= 430;							//flash鏂囦欢鐨勯珮搴�
	var container		= id;							//瑁呰浇flash鏂囦欢鐨勫鍣�(濡俤iv)鐨刬d
	var flashvars		= {};
	var callback		= function(){};
	var heightChanged	= false;
	//鏅鸿兘鑾峰彇鍙傛暟锛屽瓧绗︾被鍨嬩负瑁呰浇flash鏂囦欢鐨勫鍣�(濡俤iv)鐨刬d锛岀涓€涓暟瀛楃被鍨嬬殑涓洪珮搴︼紝绗簩涓负瀹藉害锛岀涓€涓猳bject绫诲瀷鐨勪负鍙傛暟瀵硅薄锛屽姝�4涓弬鏁扮殑椤哄簭鍙殢鎰忋€�
	for(var i = 0; i < arguments.length; i++)
	{
		if(typeof arguments[i] == 'string')
		{
			container = arguments[i];
		}
		else if(typeof arguments[i] == 'number')
		{
			if(heightChanged)
			{
				width = arguments[i];
			}
			else
			{
				height = arguments[i];
				heightChanged = true;
			}
		}
		else if(typeof arguments[i] == 'function')
		{
			callback = arguments[i];
		}
		else
		{
			flashvars = arguments[i];
		}
	}
	var vars = {
		id : id
	};
	//鍚堝苟鍙傛暟
	for (var name in flashvars)
	{
		if(flashvars[name] != null)
		{
			if(name == 'upload_url' || name == 'src_url')
			{
				vars[name] = encodeURIComponent(flashvars[name]);
			}
			else
			{
				vars[name] = flashvars[name];
			}
		}
	}
	var params = {
		menu				: 'true',
		scale				: 'noScale',
		allowFullscreen		: 'true',
		allowScriptAccess	: 'always',
		wmode				: 'transparent'
	};
	var attributes = {
		id	: vars.id,
		name: vars.id
	};
	var swf = null;
	var	callbackFn = function (e) {
		swf = e.ref;
		swf.eventHandler = function(json){
			callback.call(swf, json);
		};
	};
	swfobject.embedSWF(
		file,
		container,
		width,
		height,
		version,
		expressInstall,
		vars,
		params,
		attributes,
		callbackFn
	);
	return swf;
}