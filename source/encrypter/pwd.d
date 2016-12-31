module encrypter.pwd;
import std.stdio;
import std.random; //random module


ubyte[256] seedgen(char[] pwd){
	ubyte[] pw=cast(ubyte[]) pwd; //char[] to ubyte[]
	debug writeln("PW generated");
	uint seed = 0;
	for (int i=0;i<pw.length-1;i+=2){ //generate seed
		
		seed=2*(seed+(pw[i]*pw[i+1]%256));
		
	}
	seed=2*(seed+2*pw[pw.length-2]*pw[pw.length-1]);
	debug writeln("SEED GENERATED");
	debug writeln(seed);
	Random gen; //random generator
	gen.seed(seed); //and seed it
	int x; //skip x ints
	debug writeln("Skipping random num of integers");
	for (int i=uniform(120,1250);i>0;i--){
		x=uniform(0,255); //do nothing with x
	}
	debug writeln("Ints skipped");
	debug writeln("Generating pwd:");
	ubyte[256] ret;
	for (int i=0;i<256;i++){ //generating ubyte[256] random
		ubyte b=cast(ubyte) uniform(0,255,gen);
		ret[i]=b;
		debug writeln(b);
	}
	debug{
	writeln("PWD:");
	writeln(ret);
	}
	return ret;
}