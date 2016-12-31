module encrypter.fileio;


import std.stdio;
import std.file;
import std.string;



ubyte[] readData(string name){ //read a file
	
	
	debug writeln("Starting read of file ",name, "...");
	ubyte[] data=[];
	
	if (exists(name))
	{
		File f=File(name);
		int s=cast(int) getSize(name);
		for (int i=0;i<s;i=i+256){ //read by 256 byte clusters
			ubyte[] b;
			if (s>=256){
				b = f.rawRead(new ubyte[256]);
			}
			else{
				b = f.rawRead(new ubyte[s%256]);
			}
			data~=b;
		}
		f.close();
		debug writeln("Reading finished!");
	}
	else {
		writeln("Input file ",name," not found");
	}
	
	return data;
}


void writeData(string name,ubyte[] dt){ //write output data
    if (exists(name))
	{
	string name2=name ~ ".new";
		writeln("Warning! Target file ",name," already exists! Writing to ",name2);
	writeData(name2, dt);
	return;
	}
	debug writeln("Starting writing data to file %s...",name);
	File f=File(name,"w+");
	f.rawWrite(dt);
	f.close();
	debug writeln("Writing finished, file closed!");
}
