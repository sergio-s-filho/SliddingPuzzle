Main main;
MainScreenGraphics mg;
int indexToRender;
boolean menu_start;
boolean game_start;

void setup(){
  size(600,600);
  menu_start = true;
  game_start = false;
  mg = new MainScreenGraphics();
  indexToRender = 0;
  main = new Main();
}

void draw(){
  background(#BA8E79);
  frameRate(60);
 
  if(menu_start){
    main.callMenu();
  }
  
  if(game_start){
    main.drawMosaic(indexToRender);
    main.drawMainExternalGraphics();
  }
}

void mousePressed(){
  if(game_start){
    main.getMosaicoIndex(indexToRender);
    main.activeResetButton(indexToRender);
    main.activeBackButton(indexToRender);    
  }
}
