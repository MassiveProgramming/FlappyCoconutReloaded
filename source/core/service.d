module core.service;

import core.configuration;

struct Service {
	
	private static Configuration _config;
	
	static @property ref Configuration config()
	{
		return _config;
	}
	
	static @property ref Configuration config(ref Configuration c)
	{
		_config = c;
		return _config;
	}
	
}