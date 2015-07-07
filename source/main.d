module main;

import std.stdio;
import std.json;

import core.service;
import core.configuration;

import core.flappygame;

int main(string[] args)
{
	setupServices();
	
	FlappyGame fg = new FlappyGame();
	
	fg.init();
	
	fg.main();
	
	return 0;
}


void setupServices()
{
	Configuration c = setupConfiguration();
	Service.config(c);
}

Configuration setupConfiguration()
{
	import std.c.stdlib;
	import std.string;
	import std.algorithm;
	
	
	Configuration c = new Configuration();
	string userdataPath;
	version (Windows) {
		auto t = (char x) => x == '\\' ? '/' : x;
		userdataPath = (cast(string) getenv(toStringz("APPDATA"))
						.fromStringz()).map!(t);
				~ "/.flappycoconutreloaded/";
	} else {
		userdataPath = cast(string) getenv(toStringz("HOME"))
						.fromStringz()
				~ "/.flappycoconutreloaded/";
	}
	c.homePath = userdataPath;
	loadConfigFile(c);
	return c;
}


void loadConfigFile(Configuration c)
{
	File f = File(c.homePath ~ "config.json", "r+");
	char[] buffer = new char[f.size()];
	f.rawRead(buffer);
	
	auto j = parseJSON(buffer);
	c.title = j["title"].str();
	c.width = cast(uint) j["width"].integer();
	c.height = cast(uint) j["height"].integer();
}
