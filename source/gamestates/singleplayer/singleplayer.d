module gamestates.singleplayer.singleplayer;

import dsfml.graphics;
import dsfml.audio;
import dsfml.network;
import dsfml.window;
import dsfml.system;

import core.service;
import core.gamestate;

class SingleplayerState : GameState {
	
	Texture wallTTex;
	Texture wallBTex;
	
	Sprite wallTSpr;
	Sprite wallBSpr;
	
	Texture cocoTex;
	Sprite cocoSpr;
	
	Texture bgTex;
	Sprite bgSpr;
	
	Vector2f[8] wallTs;
	Vector2f[8] wallBs;
	
	ulong bgOffset = 0;
	bool goLeft = false;
	
	Font f;
	Text t;
	
	void init()
	{
		
	}
	
	void finalize()
	{
		
	}
	
	void update()
	{
		// update background
		// update all walls
		// update birds
		// update coco
		// coco.collide(walls[nearest])
		// coco.collide(birds[nearest])
	}
	
	GameState handleInput(ref Event e)
	{
		
		
		switch (e.type) {
		case Event.EventType.Closed:
			return null;
		case Event.EventType.KeyPressed:
			if (e.key.code == Keyboard.Key.Escape) {
				return null;
			}
			return this;
		default:
			return this;
		}
	}
	
	void render(RenderTarget w)
	{
		
	}
	
}