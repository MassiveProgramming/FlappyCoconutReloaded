module core.configuration;

class Configuration {
	
	public string homePath;
	
	public string title;
	
	public uint width;
	public uint height;
	
	public string getAssetsPath()
	{
		return homePath ~ "assets/";
	}
	
	public string getFontPath()
	{
		return getAssetsPath() ~ "fonts/";
	}
	
	public string getSoundPath()
	{
		return getAssetsPath() ~ "sounds/";
	}
	
	public string getTexturePath()
	{
		return getAssetsPath() ~ "textures/";
	}
	
}