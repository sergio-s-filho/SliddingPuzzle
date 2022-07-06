//classe responsavel por por controlar toda a mecânica do tabuleiro
//<----------------------------------------------------------------->

class Mosaic{
  MainScreenGraphics mg;
  PVector[][] cells_position;
  PVector cells_size;
  int[][] values;
  int i_index;
  int j_index;
  color cells_color;
  color cells_text_color;

  Mosaic(int index_i_temp, int index_j_temp){
    i_index = index_i_temp;
    j_index = index_j_temp;
    mg = new MainScreenGraphics();
    
    cells_position = new PVector[i_index][j_index];
    cells_size = new PVector(mg.pFrameSize.x/i_index,mg.pFrameSize.y/j_index);
    values = new int[i_index][j_index];
    cells_color = color(#6C0424);
    cells_text_color = color(#BA8E79);

    setCellsValue();
    setCellsPosition();
    shuffleCellsValue();
  }
  
  //seta os valores para cada bloco de acordo com o numero de peças
  //<-------------------------------------------------------------->
  
  void setCellsValue(){
    int n = 0;
    for(int i = 0; i < i_index; i ++){
      for(int j= 0; j < j_index; j ++){
        values[i][j] = n;
        n++; 
      }
    }
  }
  
  //seta a posicao de cada bloco baseado no resultado da expressão (largura da tela / quantidade de blocos no eixo x ) e (largura da tela / quantidade de blocos no eixo y)
  //<--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
  
  void setCellsPosition(){
    for(int i = 0; i < i_index; i ++){
      for(int j =0; j < j_index; j ++){
        cells_position[i][j] = new PVector(mg.pFramePosition.x + (j * cells_size.x),mg.pFramePosition.y + (i * cells_size.y));
      }
    }
  }
  
  //desenha os blocos na tela junto com o texto contendo o seu valor
  //<--------------------------------------------------------------->
  
  void drawCells(){
    for(int i = 0; i < i_index; i ++){
      for(int j =0; j < j_index; j ++){
        if(values[i][j] != 0){
          stroke(#933C4B);
          strokeWeight(2);
          fill(cells_color);
          rect(cells_position[i][j].x,cells_position[i][j].y,cells_size.x,cells_size.y);
          drawTextValue(i,j);
        }
      }
    }
  }
  
  //metodo criado para quando iniciar o game os valores dos blocos serem embaralhados
  //<-------------------------------------------------------------------------------->
  
  void shuffleCellsValue(){
    for(int i =0; i < i_index; i ++){
      for(int j =0; j <  j_index; j++){
        int value_temp = values[i][j];
        int random_index_i = int(random(i_index));
        int random_index_j=  int(random(j_index));
        values[i][j] =  values[random_index_i][random_index_j];
        values[random_index_i][random_index_j] = value_temp;
      }
    }
  }
  
  //metodo responsavel por verificar se o mouse foi pressionado em cima de um bloco e assim passar
  //o index i e j para o metodo de verificação de celula vazia
  //<---------------------------------------------------------------------------------------------->
  
  void getCellsIndex(){
    for(int i =0; i < i_index; i++){
        for(int j =0; j < j_index; j ++){
          if(mousePressed && mouseX > cells_position[i][j].x && mouseX < cells_position[i][j].x + cells_size.x && mouseY > cells_position[i][j].y && mouseY < cells_position[i][j].y + cells_size.y){
            checkEmptyCell(i,j);
          }
        }
    }
  }
  
  //metodo que faz a verificação de bloco vazio adjacente,baseado no bloco clicado pelo usuario
  //<------------------------------------------------------------------------------------------->
  
  void checkEmptyCell(int i, int j){
    if(i - 1 >= 0){
      if(values[i -1][j] == 0){
        move(i,j,i -1,j);
      }
    }
    if(i + 1 <= i_index -1){
      if(values[i + 1][j] == 0){
        move(i,j,i + 1,j);
      }
    }
    if(j - 1 >= 0){
      if(values[i][j -1] == 0){
        move(i,j,i,j -1);
      }
    }
    if(j + 1 <= j_index -1){
      if(values[i][j + 1] == 0){
        move(i,j,i,j+1);
      }
    }
  }
  
  //metodo responsavel por fazer a troca de valores com o bloco clicado com o bloco vazio
  //<----------------------------------------------------------------------------------->
  
  void move(int i, int j, int i_2, int j_2){
    int value_temp = values[i][j];
    values[i][j] = values[i_2][j_2];
    values[i_2][j_2] = value_temp;
  }
  
  
  // metodo responsavel por desenhar os valores designados a cada celula
  //<------------------------------------------------------------------>
  
  void drawTextValue(int i, int j){
    fill(cells_text_color);
    textSize(cells_size.x/4);
    text(values[i][j],cells_position[i][j].x + cells_size.x/3,cells_position[i][j].y + cells_size.y/3);  
  }
}
