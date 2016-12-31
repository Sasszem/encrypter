module encrypter.interf2;
import std.stdio;
import std.string;

bool params(string[] args, string* source, string* target, string* key, bool* cmd)
{

if (args.length<4)
{
	writeln("Usage:\n"~args[0]~" <Command(E/D)> <sourcefile> <password> [targetfile]");
	return false;
}	

if (!encodeDecode(args[1],cmd))
{
debug writeln("encodeDecode() falied!");
	return false;
}
*source=args[2];
*key=args[3];
if ((*key).length < 2)
{
writeln("Use at least 3 charas as a key!");
return false;
}
*target=*source~".encrypted";

if (args.length>4)
{
*target=args[4];
}

  return true;
}


bool encodeDecode(string V, bool* b){ //choose between encode/decode E=1
	if (V=="E"){
		*b=true;
	}
	else{
		if (V=="D"){
			*b=false;
		}
		else{
			writeln("Use E or D to Enrypt or Decrypt!");
			return false;
			
		}
	}
	return true;
}