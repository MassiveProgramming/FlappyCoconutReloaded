module core.gamestate;

import dsfml.graphics;
import dsfml.audio;
import dsfml.network;
import dsfml.window;
import dsfml.system;

interface GameState {
	
	void init();
	
	void finalize();
	
	void update();
	
	GameState handleInput(ref Event e);
	
	void render(RenderTarget w);
	
}