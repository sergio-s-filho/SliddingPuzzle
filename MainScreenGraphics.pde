//classe responsavel pela organização da parte grafica da tela principal
//<-------------------------------------------------------------------->

class MainScreenGraphics{
  PVector pFrameSize;
  PVector pFramePosition;
  int pFrameBorderSize;
  color pFrameColor;
  
  PVector sFramePosition;
  PVector sFrameSize;
  int sFrameBorderSize;
  color sFrameColor;
  
  PVector resetButtonPosition;
  PVector resetButtonSize;
  color resetButtonColor;
  
  PVector backButtonPosition;
  PVector backButtonSize;
  color backButtonColor;
  
  MainScreenGraphics(){
    setBorderFrame();
    setButtonsSetings();
  }
  
   //metodo responsavel por definir a borda principal e a borda secundaria em volta do tabuleiro
   //<------------------------------------------------------------------------------------------>
   
   void setBorderFrame(){
     pFrameSize = new PVector(width - 150,height - 150);
     pFramePosition = new PVector(75,75);
     pFrameColor = color(#5E041E);
     pFrameBorderSize = 2;
     sFrameSize =  new PVector(width - 146,height - 146);
     sFramePosition = new PVector(73,73);
     sFrameColor = color(255);
     sFrameBorderSize = 2;
   }
   
   //metodo responsavel por definir a posicao,cor e tamanho dos botoes da tela principal
   //<--------------------------------------------------------------------------------->
   
   void setButtonsSetings(){
     backButtonPosition = new PVector(pFramePosition.x - 2,pFramePosition.y + pFrameSize.y + 10);
     backButtonSize = new PVector(80,25);
     backButtonColor = color(#5E041E);
     resetButtonPosition = new PVector(backButtonPosition.x,backButtonPosition.y + backButtonSize.y);
     resetButtonSize = new PVector(80,25);
     resetButtonColor = color(#5E041E);
   }
   
   //metodo que desenha as bordas em volta do tabuleiro
   //<------------------------------------------------>]
   
   void drawBorderFrame(){
     noFill();
     stroke(sFrameColor);
     strokeWeight(sFrameBorderSize);
     rect(sFramePosition.x,sFramePosition.y,sFrameSize.x,sFrameSize.y);
     noFill();
     stroke(pFrameColor);
     strokeWeight(pFrameBorderSize);
     rect(pFramePosition.x,pFramePosition.y,pFrameSize.x,pFrameSize.y);
   }
   
   //metodo que desenha os botoes de reset e back
   //<-------------------------------------------->
   
   void drawButtons(){
     stroke(#6C0424);
     noFill();
     rect(backButtonPosition.x,backButtonPosition.y,backButtonSize.x,backButtonSize.y); 
     stroke(#6C0424);
     noFill();
     rect(resetButtonPosition.x,resetButtonPosition.y,resetButtonSize.x,resetButtonSize.y);
     drawButtonText();
   }
   
   //metodo que desenha o texto que nomeia os botoes de back e reset
   //<------------------------------------------------------------->
   
   void drawButtonText(){
     fill(#5E041E);
     textSize(12);
     text("BACK",backButtonPosition.x + 2,backButtonPosition.y + 14);
     fill(#5E041E);
     text("RESET",resetButtonPosition.x + 2,resetButtonPosition.y + 14); 
   }
}
