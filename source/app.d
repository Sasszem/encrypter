//ENCRYPTER
//Inspired by Szalonczuker's java version
//made by Sasszem
import std.stdio;
//import encrypter.interf; //interface
import encrypter.interf2;
import encrypter.encrypter; //actual en/decryption methods
import encrypter.fileio; //file handling
import encrypter.pwd; //pwd generation

/*void main(){
	writeln("Encrpyter-decrypter program vby Sasszem");
	writeln("\n\n");
	bool enc=encodeDecode(); //choose between encode/decode
	char[] pwd=cast(char[]) inputPassword(); //input password
	ubyte[256] key=seedgen(pwd); //generate seed
	ubyte[] data=readData(SOURCE); //Read source file
	ubyte[] ret=ende(key,data,enc); //do en/decryption
	writeData(TARGET,ret); //write output to file
	writeln("Program finished!");
}
*/
void main(string[] args){
	writeln("Encrpyter-decrypter program by Sasszem");
	//writeln("\n\n");
	string source;
	string target;
	string keyraw;
	bool cmd;
	
	if (!params(args,&source, &target, &keyraw, &cmd))
	{
	debug writeln("params() failed, quitting");
	readln();
		return;
	}
	char[] pwd=cast(char[]) keyraw; //input password
	ubyte[256] key=seedgen(pwd); //generate seed
	debug writeln("PWD generated");
	ubyte[] data=readData(source); //Read source file
	if (!data)
	{
		readln();
		return;
	}
	debug writeln("Source read");
	ubyte[] ret=ende(key,data,cmd); //do en/decryption
	debug writeln("Data encrypted");
	writeData(target,ret); //write output to file
	debug writeln("Output written");
	writeln("Program finished!");
	readln();
}

ubyte[] ende(ubyte[] key, ubyte[] data,bool enc){//choose between encode/decode
	ubyte[] ret=[];
	if (enc){
		ret=encode(data,key);
	}
	else{
		ret=decode(data,key);
	}
	return ret;
}
