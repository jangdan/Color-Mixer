/* Color Mixer
       by electricmango
  https://electricmango.github.io

  functions.pde
    Calculating.
*/

int i;

long hexc;

public void controlEvent(ControlEvent e){
  if(e.isFrom(cp)){
    currentColor = cp.getColorValue();
    hexcolor.setText("#" + hex(currentColor,6));
    hexcolora.setText("0x" + hex(currentColor,8));
    redt.setText("" + ((currentColor >> 16) & 0xFF));
    greent.setText("" + ((currentColor >> 8) & 0xFF));
    bluet.setText("" + (currentColor & 0xFF));
    alphat.setText("" + ((currentColor >> 24) & 0xFF));
    
    r = (currentColor >> 16) & 0xFF; 
    g = (currentColor >> 8) & 0xFF;  
    b = currentColor & 0xFF;   
    a = (currentColor >> 24) & 0xFF; 
    
    if((r <= 136 && r >= 120)&&(g <= 136 && g >= 120)&&(b <= 136 && b >= 120)
    ||((r <= 136 && r >= 120)&&(g <= 136 && g >= 120))&&(b <= 255 && b >= 64)
    ||((r <= 136 && r >= 120)&&(b <= 136 && b >= 120))&&(g <= 192 && g >= 64)
    ||((g <= 136 && g >= 120)&&(b <= 136 && b >= 120))&&(r <= 192 && r >= 64)
    ){
      colorTextr.setColorValue(color(255));
      colorTextg.setColorValue(color(255));
      colorTextb.setColorValue(color(255));
      colorTexta.setColorValue(color(255));
      hexText.setColorValue(color(255));
      hex8Text.setColorValue(color(255));
      aboutText.setColorValue(color(255));
    }
    else if(!(r <= 136 && r >= 120)||!(g <= 136 && g >= 120)||!(b <= 136 && b >= 120)){
      colorTextr.setColorValue(~color(r,g,b,0));
      colorTextg.setColorValue(~color(r,g,b,0));
      colorTextb.setColorValue(~color(r,g,b,0));
      colorTexta.setColorValue(~color(r,g,b,0));
      hexText.setColorValue(~color(r,g,b,0));
      hex8Text.setColorValue(~color(r,g,b,0));
      aboutText.setColorValue(~color(r,g,b,0));
    }
    aboutTitle.setColorValue(color(r,g,b,255));
    
    colorTextr.setText("Red\n"+r);
    colorTextg.setText("Green\n"+g);
    colorTextb.setText("Blue\n"+b);
    colorTexta.setText("Alpha\n"+a);
    
    hexText.setText("Hexadecimal [RGB]\n#" + hex(currentColor,6));
    hex8Text.setText("Hexadecimal [aRGB]\n0x" + hex(currentColor,8));
  }
}

public void scroll(){
  i++;          //increment counter
  fill(0);
  if(i < 255 && b != 0){
    b--;
  }
  else{
    if (i < 255){    //first phase of fades
      r -= 1; //red down
      g += 1; //green up
      b = 0; //blue low
    }
    else if (255 <= i && i< 511){ //second phase of fades
      r = 0; //red low
      g -= 1; //green down
      b += 1; //blue up
    } 
    else if (511 <= i && i < 767){ //third phase of fades
      r += 1; //red up
      g = 0; //green low
      b -= 1; //blue down
    }
    else{ //re-set the counter, and start the fades again
      i = 0;
    }
  }  
  cp.setColorValue(color(r,g,b,a)); //Reset to initial color
}

public void randomColor(){
  r = (int)random(255);
  g = (int)random(255);
  b = (int)random(255);
  cp.setColorValue(color(r,g,b,255));
}

public void invertColor(){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF;   
  cp.setColorValue(~color(r,g,b,0));
}

public void refresh(){
  cpinit();
}

public void reset(){
  cp.setColorValue(color(128,128,128,255));
}

public void cpinit(){
  currentColor = cp.getColorValue();
  
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF;  
  a = (currentColor >> 24) & 0xFF; 
  
  hexcolor.setText("#" + hex(currentColor,6));
  hexcolora.setText("0x" + hex(currentColor,8));
  
  redt.setText("" + r);
  greent.setText("" + g);
  bluet.setText("" + b);
  alphat.setText("" + a);
}

public Color hexToColor(String hex){
  return new Color(
    Integer.valueOf(hex.substring(1,3),16),
    Integer.valueOf(hex.substring(3,5),16),
    Integer.valueOf(hex.substring(5,7),16)
  );
}
