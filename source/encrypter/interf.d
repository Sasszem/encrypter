module encrypter.interf;
import std.stdio;
import std.string;

enum string SOURCE="data.txt"; //source file name
enum string TARGET="output.txt"; //target file name

string inputPassword(){ //inputting en/decryption pwd
	writeln("Please input en/decription password:");
	string r=readln();
	return r;
}

bool encodeDecode(){ //choose between encode/decode E=1
	writeln("Do you wish to Encode or Decode(E/D):");
	string a=readln();
	
	if (a=="E\n"){
		return true;
	}
	else{
		if (a=="D\n"){
			return false;
		}
		else{
			writeln("Use (E/D)!");
			return encodeDecode();
		}
	}
}