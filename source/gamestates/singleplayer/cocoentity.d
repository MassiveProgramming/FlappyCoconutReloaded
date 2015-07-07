module gamestates.singleplayer.cocoentity;

import dsfml.graphics;
import dsfml.audio;
import dsfml.network;
import dsfml.window;
import dsfml.system;

import core.service;

class CocoEntity {
	
	private InputComponent inputComp;
	
	this()
	{
		
	}
	
	void handleInput(ref Event e)
	{
		inputComp.handleInput(this, e);
	}
	
	void update(SingleplayerState s)
	{
		
	}
	
	void render(RenderTarget w)
	{
		
	}
	
	
	void jump()
	{
		
	}
}


struct InputComponent {
	
	void handleInput(CocoEntity c, ref Event e)
	{
		switch (e.type) {
		case Event.EventType.KeyPressed:
			if (e.key.code == Keyboard.Key.Space) {
				c.jump();
			}
			break;
		default:
			break;
		}
	}
	
}