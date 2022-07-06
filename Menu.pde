class Menu{ 
  PVector[] optionsRectPosition;
  String[] textValues;
  PVector[] optionsRectSize;
  color optionRectColor;
  color optionTextColor;
  PVector optionsFramePosition;
  PVector optionsFrameSize;
  
  Menu(){
    optionsRectPosition = new PVector[7];
    textValues =  new String[7];
    optionsRectSize = new PVector[7];
    optionRectColor = color(#6C0424);
    optionTextColor = color(#DBCCA0);
    optionsFramePosition = new PVector(75,75);
    optionsFrameSize = new PVector(width - 150,height - 150);
    setOptionsSize();
    setOptionsRect();
    setTextArrayValue();
  }
  
  //metodo que seta a posicao de cada botao do menu de opçoes
  //---------------------------------------------------------
  
  void setOptionsRect(){
    int y = 0;
    int x = 0;
    for(int i = 0; i < optionsRectPosition.length; i ++){
      optionsRectPosition[i] = new PVector(optionsFramePosition.x + (optionsRectSize[i].x * x),optionsFramePosition.y + (optionsRectSize[i].y * y));
      if(x == 2){
        x = 0;
        y++;
      }else{
        x++; 
      }
    }
  }
  
  //metodo responsavel por seta o tamanho de cada botao baseado na expressão de tamanho da tela dividido pela quantidade de botoes
  //------------------------------------------------------------------------------------------------------------------------------
  
  void setOptionsSize(){
    for(int i = 0; i < optionsRectSize.length -1; i ++){
      optionsRectSize[i] = new PVector(optionsFrameSize.x /3,optionsFrameSize.y/3);
      
    }
    optionsRectSize[optionsRectSize.length -1] = new PVector(optionsFrameSize.x,optionsFrameSize.y/3);
  }
  
  // metodo que seta os valores das strings de cada botao
  //-----------------------------------------------------
  
  void setTextArrayValue(){
    textValues[0] =  "3 X 3";
    textValues[1] =  "4 X 4";
    textValues[2] =  "5 X 5";
    textValues[3] =  "6 X 6";
    textValues[4] =  "7 X 7";
    textValues[5] =  "8 X 8";
    textValues[6] =  "9 X 9";
  }
  
  //metodo principal que desenha o frame,botoes e o texto de cada botao
  //-------------------------------------------------------------------
  
  void drawOptionsRect(){
    drawFrame();
    for(int i = 0; i < optionsRectPosition.length ; i ++){
      drawOptionButton(i);
      drawButtonText(i);
    }
  }
  
  //metodo que desenha os botoes
  //----------------------------
  
  void drawOptionButton(int index){
    fill(optionRectColor);
    stroke(#933C4B);
    rect(optionsRectPosition[index].x,optionsRectPosition[index].y,optionsRectSize[index].x,optionsRectSize[index].y);
  }
  
  //metodo que desenha o texto de cada botao
  //----------------------------------------
  
  void drawButtonText(int index){
    fill(#BA8E79);
    textSize(optionsRectSize[index].x/12);
    text(textValues[index],optionsRectPosition[index].x + optionsRectSize[index].x/2.5,optionsRectPosition[index].y + optionsRectSize[index].y/2);  
  }
  
  //metodo que desenha o frame que envolve os botoes
  //------------------------------------------------
  
  void drawFrame(){
    noFill();
    stroke(#5E041E);
    strokeWeight(2);
    rect(optionsFramePosition.x,optionsFramePosition.y,optionsFrameSize.x,optionsFrameSize.y);
    
    noFill();
    stroke(255);
    strokeWeight(2);
    rect(optionsFramePosition.x - 2,optionsFramePosition.y - 2,optionsFrameSize.x + 4,optionsFrameSize.y + 4);
  }
 
  //metodo responsavel por definir qual botao foi apertado e passar um novo valor para o index_render
  //variavel que define qual dos objetos que define a quantidade de peças sera acessado para renderizar
  //---------------------------------------------------------------------------------------------------
  
  
  void chooseOptionButton(int i){
    switch(i){
      case 0:
        indexToRender = 0;
        menu_start = false;
        game_start = true;
        break;
      case 1:
        indexToRender = 1;
        menu_start = false;
        game_start = true;
        break; 
      case 2:
        indexToRender = 2;
        menu_start = false;
        game_start = true;
        break;
      case 3:
        indexToRender = 3;
        menu_start = false;
        game_start = true;
        break;
      case 4:
       indexToRender = 4;
        menu_start = false;
        game_start = true;
        break;
      case 5:
        indexToRender = 5;
        menu_start = false;
        game_start = true;
        break;
      case 6:
        indexToRender = 6;
        menu_start = false;
        game_start = true;
        break;
    }
  }
  
  //metodo que verifica qual botao foi pressionado e passa o index do mesmo para o metodo choose_option_button()
  //------------------------------------------------------------------------------------------------------------
  
  void verificarBotaoPressionado(){
    for(int i = 0; i < optionsRectPosition.length; i ++){
      if(mousePressed && mouseX > optionsRectPosition[i].x && mouseX < optionsRectPosition[i].x + optionsRectSize[i].x && mouseY > optionsRectPosition[i].y && mouseY < optionsRectPosition[i].y +  optionsRectSize[i].y){
        chooseOptionButton(i);  
      }  
    }
  }
}
