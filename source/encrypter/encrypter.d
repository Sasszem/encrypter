module encrypter.encrypter;
debug import std.stdio;

ubyte[] encode(ubyte[] data, ubyte[] key){
	debug writeln("Starting encrypting data...");
	ubyte[] ret;
	ret.length=data.length; //the return's length is the same as input's
	for (int i=0;i<data.length;i++){
	debug writeln(i);
		ubyte b=cast(ubyte) (data[i]+key[i%256]);
		ret[i]=b;
	}
	debug writeln("Encryption finished!");
	return ret;
}
ubyte[] decode(ubyte[] data, ubyte[] key){
	debug writeln("Starting decrypting data...");
	ubyte[] ret;
	ret.length=data.length;
	for (int i=0;i<data.length;i++){
		ubyte b=cast(ubyte) (data[i]-key[i%256]);
		ret[i]=b;
	}
	debug writeln("Decryption finished!");
	return ret;
}


