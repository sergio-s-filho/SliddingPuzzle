//classe principal,responsavel por organizar e chamar todos os metodos do programa
//----------------------------------------------------------------------------------

class Main{
  Mosaic[] mosaico;
  Menu menu;
  
//construtor da classe principal,responsavel por criar os objetos referentes a classes do programa
//------------------------------------------------------------------------------
  
  Main(){
    mg = new MainScreenGraphics();
    mosaico = new Mosaic[7];
    menu = new Menu();
    mg = new MainScreenGraphics();
    setMosaico();
    indexToRender = 0;
  }
  
  //metodo responsavel por definir os valores de linhas e colunas de cada nivel do jogo
  //cada nivel esta dividido em um objeto da classe mosaico, no qual se passa os argumentos e define 
  //a quantidade de linhas e colunas do nivel.
  //<---------------------------------------------------------------------------------------------->
  
  void setMosaico(){
      mosaico[0] = new Mosaic(3,3);
      mosaico[1] = new Mosaic(4,4);
      mosaico[2] = new Mosaic(5,5);
      mosaico[3] = new Mosaic(6,6);
      mosaico[4] = new Mosaic(7,7);
      mosaico[5] = new Mosaic(8,8);
      mosaico[6] = new Mosaic(9,9);
  }
  
  //conjunto de metodos que fazem o chamado de todos os metodos de cada objeto,sendo identificado pelo 
  //index passado como parametro para cada metodo
  //<------------------------------------------------------------------------------------------------>
  
  void drawMosaic(int i){
    mosaico[i].drawCells();  
  }
  void getMosaicoIndex(int i){
    mosaico[i].getCellsIndex();  
  }
  void shuffleValues(int i){
    mosaico[i].shuffleCellsValue();  
  }
  void drawMainExternalGraphics(){
    mg.drawBorderFrame();
    mg.drawButtons();
  }
  void callMenu(){
    menu.drawOptionsRect();
    menu.verificarBotaoPressionado();
  }
  //------------------------------------------------------------------------
  
  //metodo que faz o reset do tabuleiro , chamando o metodo shuffle
  //<--------------------------------------------------------------->
  
  void activeResetButton(int i){
    if(mousePressed && mouseX > mg.resetButtonPosition.x && mouseX < mg.resetButtonPosition.x + mg.resetButtonSize.x && mouseY > mg.resetButtonPosition.y && mouseY < mg.resetButtonPosition.y + mg.resetButtonSize.y){
      shuffleValues(i);  
    }
  }
  
  //back button volta para a tela de menu do game , no qual ao iniciar novamente o game chama o metodo shuffle
  //<-------------------------------------------------------------------------------------------------------->
  
  void activeBackButton(int i){
    if(mousePressed && mouseX > mg.backButtonPosition.x && mouseX < mg.backButtonPosition.x + mg.backButtonSize.x && mouseY > mg.backButtonPosition.y && mouseY < mg.backButtonPosition.y + mg.backButtonSize.y){
      menu_start = true;
      game_start = false;
      shuffleValues(i);
    }
  }
}
