module gamestates.menu.menu;

import dsfml.graphics;
import dsfml.audio;
import dsfml.network;
import dsfml.window;
import dsfml.system;

import core.service;
import core.gamestate;

import gamestates.singleplayer.singleplayer;

class MenuState : GameState {
	
	Texture startTex;
	Sprite startSpr;
	
	Texture bgTex;
	Sprite bgSpr;
	
	void init()
	{
		auto c = Service.config;
		startTex = new Texture();
		startTex.loadFromFile(c.getTexturePath() ~ "start.png");
		startSpr = new Sprite();
		startSpr.origin(Vector2f(startTex.getSize().x / 2,
				startTex.getSize().y / 2));
		startSpr.setTexture(startTex);
		startSpr.position(Vector2f(800 / 2, 400 / 2));
		
		bgTex = new Texture();
		bgTex.loadFromFile(c.getTexturePath() ~ "background.png");
		bgSpr = new Sprite();
		bgSpr.setTexture(bgTex);
	}
	
	void finalize()
	{
		delete startSpr;
		delete startTex;
		
		delete bgSpr;
		delete bgTex;
	}
	
	void update()
	{
		
	}
	
	GameState handleInput(ref Event e)
	{
		switch (e.type) {
		case Event.EventType.Closed:
			return null;
		case Event.EventType.KeyPressed:
			if (e.key.code == Keyboard.Key.Space) {
				return new SingleplayerState();
			}
			if (e.key.code == Keyboard.Key.Escape) {
				return null;
			}
			return this;
		default:
			return this;
		}
	}
	
	void render(RenderTarget win)
	{
		win.draw(bgSpr);
		win.draw(startSpr);
	}
	
}