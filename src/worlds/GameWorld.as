package worlds 
{
	import adobe.utils.CustomActions;
	import game.Alien;
	import game.colorers.AlienColorer;
	import game.colorers.AlternatingColorer;
	import game.directors.AlienDirector;
	import game.directors.BackAndForthDirector;
	import game.directors.CyclicDirector;
	import game.directors.RolloverDirector;
	import game.GameData;
	import game.Hud;
	import game.PictureGrabber;
	import game.Player;
	import game.spawners.AlienSpawner;
	import game.spawners.ColumnSpawner;
	import game.spawners.GridSpawner;
	import game.spawners.SingleSpawner;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import values.Game;
	import values.Teams;
	import util.EntityQueries;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var _spawner:AlienSpawner;
		private var _director:AlienDirector;
		private var _data:GameData;
		private var _hud:Hud;
		private var _colorer:AlienColorer;
		private var _player:Player;
		
		public function GameWorld(gameData:GameData = null) 
		{
			super();
			
			_data = gameData? gameData : new GameData;
			setUp();
			start();
		}
		
		private function setUp():void {
			
			_hud = new Hud(_data);
			add(_hud);
			
			_player = new Player(_data, Game.WIDTH / 2, Game.PLAYER_START_HEIGHT, new PictureGrabber().grab());
			add(_player);
			
			_director = new RolloverDirector(this, new BackAndForthDirector(this));
			_spawner = new GridSpawner(7, 4);
			_colorer = new AlternatingColorer;
		}
		
		private function start():void {
			
			var aliens:Vector.<Alien> = _spawner.spawn();
			
			_colorer.color(aliens);
			_director.resetState();
			for each (var alien:Alien in aliens) add(alien);
			
			_data.startPlaying();
			_player.enable();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.check(Key.BACKSPACE)) {
				
				FP.world = new TitleScreen;
				return;
			}
			
			_director.update();
			
			if (waitingForConfirmation()) {
				
				if (Input.pressed("shoot")) {
					
					if (_data.isWon()) doVictory();
					else if (_data.isLost()) doDefeat();
				}
			}
			
			else if (aliensHaveReachedGoal()) {
				
				lose();
			}
			
			else if (aliensAreDefeated()) {
				
				win();
			}
			
			else if (_data.playerIsDead()) {
				
				lose();
			}
		}
		
		private function waitingForConfirmation():Boolean	{ return _data.isLost() || _data.isWon() }
		private function doVictory():void					{ FP.world = new GameWorld(_data); }
		private function doDefeat():void					{ FP.world = new GameWorld(null); }
		
		private function lose():void {
			
			_player.disable();
			_data.setLost();
		}
		
		private function win():void {
			
			_data.setWon();
		}
		
		private function aliensAreDefeated():Boolean {
			
			var aliens:Vector.<Alien> = new Vector.<Alien>;
			getType(Teams.ALIEN, aliens);
			
			return aliens.length == 0;
		}
		
		public function get data():GameData {
			
			return _data;
		}
		
		public function aliensHaveReachedGoal():Boolean {
			
			var aliens:Vector.<Entity> = new Vector.<Entity>;
			getType(Teams.ALIEN, aliens);
			
			return EntityQueries.maxY(aliens) >= Game.ALIEN_WIN_HEIGHT;
		}
	}

}