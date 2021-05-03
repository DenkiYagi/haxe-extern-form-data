package js.npm;

import haxe.extern.EitherType;
import js.lib.Error;
import js.node.Buffer;
import js.node.Http.HttpRequestOptions;
import js.node.http.ClientRequest;
import js.node.http.IncomingMessage;
import js.node.stream.Readable;

@:jsRequire("form-data")
extern class FormData extends Readable<FormData> {
    function new(?options:FormDataNewOptions);
    function append(key:String, value:Any, ?options:EitherType<FormDataAppendOptions, String>):Void;
    function getHeaders(?userHeaders:Dynamic<String>):Dynamic<String>;
    function submit(params:EitherType<String, HttpRequestOptions>, ?callback:(error:Null<Error>, response:IncomingMessage)->Void):ClientRequest;
    function getBuffer():Buffer;
    function setBoundary(boundary:String):Void;
    function getBoundary():String;
    function getLength(callback:(err:Null<Error>, length:Int)->Void):Void;
    function getLengthSync():Int;
    function hasKnownLength():Bool;
}

typedef FormDataNewOptions = ReadableNewOptions & {
    var ?writable:Bool;
    var ?readable:Bool;
    var ?dataSize:Int;
    var ?maxDataSize:Int;
    var ?pauseStreams:Bool;
}

typedef FormDataAppendOptions = {
    var ?header:EitherType<String, Dynamic<String>>;
    var ?knownLength:Int;
    var ?filename:String;
    var ?filepath:String;
    var ?contentType:String;
}
