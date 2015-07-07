module core.flappygame;

import dsfml.graphics;
import dsfml.audio;
import dsfml.network;
import dsfml.window;
import dsfml.system;

import core.service;
import core.gamestate;

import gamestates.menu.menu;

class FlappyGame {
	
	private RenderWindow win;
	
	bool running = true;
	
	enum MS_PER_UPDATE = 4;
	
	GameState state;
	
	void init()
	{
		auto vm = VideoMode(Service.config.width, Service.config.height);
		auto st = Window.Style.DefaultStyle ^ Window.Style.Resize;
		win = new RenderWindow(vm, Service.config.title, st);
		
		state = new MenuState();
		state.init();
	}
	
	void main()
	{
		Clock c = new Clock();
		auto prev = c.getElapsedTime().asMilliseconds();
		auto lag = 0;
		while (running) {
			auto curr = c.getElapsedTime().asMilliseconds();
			auto elsd = curr - prev;
			prev = curr;
			lag += elsd;
			
			handleInput();
			
			while (lag >= MS_PER_UPDATE) {
				update();
				lag -= MS_PER_UPDATE;
			}
			
			render();
		}
		win.close();
	}
	
	void handleInput()
	{
		Event event;
		if (win.pollEvent(event)) {
			auto n = state.handleInput(event);
			if (n !is state) {
				if (n is null) {
					running = false;
					win.close();
					return;
				}
				state.finalize();
				delete state;
				state = n;
				state.init();
			}
		}
	}
	
	void update()
	{
		state.update();
	}
	
	void render()
	{
		win.clear(Color.Cyan);
		
		state.render(win);
		
		win.display();
	}
	
}