import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.awt.Color; 
import java.awt.Image; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ColorMixer extends PApplet {

/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/Color-Mixer
  Use it, mod it, share it (as open source).
  Just don't change the license.
  
  -----------------------------------------------------------------------------
  ColorMixer.pde
  
  The actual sketch.
*/

 //Control P5 library



int r = 128;
int g = 128;
int b = 128;
int a = 255;
int bg = 209;

int currentColor;

boolean[] keys = new boolean[1024];

PImage github, licensel, osil;

public void setup(){
  size(800,800);
  noStroke();
  
  frame.setTitle("Color Mixer");
  PImage icon = loadImage("icons/sketch.jpg");
  frame.setIconImage((Image)icon.getNative());
  
  github = loadImage("images/GitHub-Mark-32px.png");
  licensel = loadImage("images/license/by-sa.png");
  licensel.resize(91,32);
  osil = loadImage("images/license/osi_greyscale_logo.png");
  osil.resize(91,104);
  guiinit();
  cpinit();
  textinit();
  aboutTextinit();
}     

public void draw(){
  background(bg);
  
  fill(cp.getColorValue());
  rect(125,125,550,550,0,7,7,7); //Rectangle
}
/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/Color-Mixer
  Use it, mod it, share it (as open source).
  Just don't change the license.
  
  -----------------------------------------------------------------------------
  algorithms.pde
  
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
    
    hexText.setText("Hexadecimal [RGB] \n#" + hex(currentColor,6));
    hex8Text.setText("Hexadecimal [aRGB] \n0x" + hex(currentColor,8));
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
  println("Refreshing...");
  cpinit();
  println("Refreshed");
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
/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/Color-Mixer
  Use it, mod it, share it (as open source).
  Just don't change the license.
  
  -----------------------------------------------------------------------------
  graphics.pde
  
  Text display and more...
*/

Textlabel colorTextr;
Textlabel colorTextg;
Textlabel colorTextb;
Textlabel colorTexta;
Textlabel hexText;
Textlabel hex8Text;
Textlabel aboutText;
Textlabel aboutTitle;

PFont courierText = createFont("Monaco",24);
PFont georgiaText = createFont("Monaco",14);
PFont georgiaTitle = createFont("Georgia",48);

int textcolor = 0xFFFFFFFF;

public void textinit(){
  //Textlabels
   
   colorTextr = cp5.addTextlabel("colorTextr")
                   .setPosition(200,200)
                   .setFont(courierText)
                   .setText("Red\n" + r)
                   ;
   colorTextg = cp5.addTextlabel("colorTextg")
                   .setPosition(300,200)
                   .setFont(courierText)
                   .setText("Green\n" + g)
                   ;
   colorTextb = cp5.addTextlabel("colorTextb")
                   .setPosition(400,200)
                   .setFont(courierText)
                   .setText("Blue\n" + b)
                   ;
   colorTexta = cp5.addTextlabel("colorTexta")
                   .setPosition(500,200)
                   .setFont(courierText)
                   .setText("Alpha\n" + a)
                   ;
                  
   hexText = cp5.addTextlabel("hexText")
                  .setPosition(200,300)
                  .setFont(courierText)
                  .setText("Hexadecimal [RGB]\n#808080")
                  ;
   hex8Text = cp5.addTextlabel("hex8Text")
                  .setPosition(200,400)
                  .setFont(courierText)
                  .setText("Hexadecimal [aRGB]\n0xFF808080")
                  ;
}

public void aboutTextinit(){
  aboutTitle = cp5.addTextlabel("title")
                   .setPosition(125,50)
                   .setFont(georgiaTitle)
                   .setTab("About")
                   .setText("Color Mixer")
                   .setColorValue(cp.getColorValue());
                   ;
  aboutText = cp5.addTextlabel("text")
                   .setPosition(200,200)
                   .setWidth(550)
                   .setFont(georgiaText)
                   .setTab("About")
                   .setText("Color is an art.\nThis application makes it easier to make colors.\nColor Mixer is licensed under the MIT license.\nUse it, mod it, share it (as open source).\nJust don't change the license.\n\nLast Updated 3.2.14 @ 3.0.1 v 2.0.4\nBuild #0014\n\ngithub.com/leocarbon/Color-Mixer")
                   ;
}
/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/cm
  Use it, mod it, share it.
  Just leave the white text on the bottom right with the Creative Commons image.Color Mixer is open source!
  http://github.com/leocarbon/Color-Mixer
  Use it, mod it, share it (as open source).
  Just don't change the license.
  
  -----------------------------------------------------------------------------
  gui.pde
  
  Handles gui stuff.
*/

ControlP5 cp5;

ColorPicker cp;

Button repo, license, osi;
Button randomColor;
Button invertColor;

Textfield hexcolor;
Textfield hexcolora;
Textfield redt;
Textfield greent;
Textfield bluet;
Textfield alphat;

Tab about;
Tab program;



PFont monaco14 = createFont("monaco",14);

public void guiinit(){
  
  cp5 = new ControlP5(this); //Library initialization
  
  cp5.getTab("default")
     .setColorBackground(color(102))
     .setColorForeground(color(51))
     .setColorLabel(color(255))
     .setColorActive(color(153))
     .activateEvent(true)
     .setLabel("Program")
     ;
  about = cp5.addTab("About")
     .setColorBackground(color(102))
     .setColorForeground(color(51))
     .setColorLabel(color(255))
     .setColorActive(color(153))
     ;
  
  //Color picker
  cp = cp5.addColorPicker("cp")
          .setPosition(125,66)
          .setColorValue(color(r,g,b,a)) //initial color
          ;
          
  //Buttons
  cp5.addButton("randomColor")
     .setPosition(381,103)
     .setSize(66,21)
     .setLabel("Random Color")
     ;
  cp5.addButton("invertColor")
     .setPosition(448,103)
     .setSize(66,21)
     .setLabel("Invert Color")
     ;
  cp5.addButton("refresh")
     .setPosition(515,103)
     .setSize(45,21)
     .setLabel("Refresh")
     ;
  cp5.addButton("reset")
     .setPosition(561,103)
     .setSize(32,21)
     .setLabel("Reset")
     ;   
  cp5.addButton("repo")
     .setPosition(301,400)
     .setSize(32,32)
     .setImages(github, github, github)
     .setTab("About")
     ;
  cp5.addButton("license")
     .setPosition(200,400)
     .setSize(91,32)
     .setImages(licensel,licensel,licensel)
     .setTab("About")
     ;
  cp5.addButton("osi")
     .setPosition(200,432)
     .setSize(91,104)
     .setImages(osil,osil,osil)
     .setTab("About")
     ;
     
  //Textboxes
  redt = cp5.addTextfield("red")
     .setPosition(382,66)
     .setAutoClear(false)
     .setColorBackground(128)
     .setColorActive(255)
     .setColorForeground(100)
     .setLabelVisible(false) 
     .setSize(30,15)
     .setFont(monaco14)
     .setLabel("Red")
     .setColorLabel(color(255,0,0))
     ;
  greent = cp5.addTextfield("green")
     .setPosition(415,66)
     .setAutoClear(false)
     .setColorBackground(128)
     .setColorActive(255)
     .setColorForeground(100)
     .setLabelVisible(false) 
     .setSize(30,15)
     .setFont(monaco14)
     .setLabel("Green")
     .setColorLabel(color(0,255,0))
     ;
  bluet = cp5.addTextfield("blue")
     .setPosition(448,66)
     .setAutoClear(false)
     .setColorBackground(128)
     .setColorActive(255)
     .setColorForeground(100)
     .setLabelVisible(false) 
     .setSize(30,15)
     .setFont(monaco14)
     .setLabel("Blue")
     .setColorLabel(color(0,0,255))
     ;
  alphat = cp5.addTextfield("alpha")
     .setPosition(481,66)
     .setAutoClear(false)
     .setColorBackground(128)
     .setColorActive(255)
     .setColorForeground(100)
     .setSize(30,15)
     .setFont(monaco14)
     .setLabel("Alpha")
     .setColorLabel(~color(bg))
     ; 
         
   hexcolor = cp5.addTextfield("hexcolor")
                 .setPosition(514,66)
                 .setSize(62,15)
                 .setAutoClear(false)
                 .setColorBackground(128)
                 .setColorActive(255)
                 .setColorForeground(100)
                 .setLabelVisible(false)
                 .setFont(monaco14)
                 .setLabel("Hexdecimal")
                 ; 
   hexcolora = cp5.addTextfield("hexcolora")
                 .setPosition(579,66)
                 .setSize(88,15)
                 .setAutoClear(false)
                 .setColorBackground(128)
                 .setColorActive(255)
                 .setColorForeground(100)
                 .setLabelVisible(false)
                 .setFont(monaco14)
                 .setLabel("Hexdecimal with alpha (android)")
                 ; 
}

public void repo(){
  link("http://github.com/leocarbon/Color-Mixer");
} public void license(){
  link("https://creativecommons.org/licenses/by-sa/4.0/");
} public void osi(){
  link("http://opensource.org/licenses/MIT");
}


public void red(String nr){
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF; 
  a = (currentColor >> 24) & 0xFF;
  
  r = PApplet.parseInt(nr); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void green(String ng){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  b = currentColor & 0xFF; 
  a = (currentColor >> 24) & 0xFF;
  
  g = PApplet.parseInt(ng); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void blue(String nb){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  a = (currentColor >> 24) & 0xFF;
  
  b = PApplet.parseInt(nb); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void alpha(String na){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF; 
  
  a = PApplet.parseInt(na); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void hexcolor(String hex){
  r = hexToColor(hex).getRed();
  g = hexToColor(hex).getGreen();
  b = hexToColor(hex).getBlue();
  
  cp.setColorValue(color(r,g,b,255));
}


public void hexcolora(String hex){
  a = Integer.valueOf(hex.substring(2,4),16);
  r = hexToColor(hex.substring(3)).getRed();
  g = hexToColor(hex.substring(3)).getGreen();
  b = hexToColor(hex.substring(3)).getBlue();
  
  cp.setColorValue(color(r,g,b,a));
}
/*Color Mixer
       by Leocarbon
  https://leocarbon.github.io
      realleocarbon@gmail.com

  Color Mixer is licensed under

  The MIT License (MIT)

  Copyright (c) 2012 ~ 2014 Leocarbon

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
  THE SOFTWARE.
  
  Color Mixer is open source!
  http://github.com/leocarbon/Color-Mixer
  Use it, mod it, share it (as open source).
  Just don't change the license.
  
  -----------------------------------------------------------------------------
  ui.pde
  
  Keyboard & mouse input and handling.
*/

public void keyPressed(){  //If keys are pressed...
  if(key == ESC){   //Intercept the ESC key in the application
    key = 0;        //Don't quit even if ESC was pressed
  }
  
  keys[keyCode] = true; //Keys pressed are true
  
  //Reset
  if(checkKey(CONTROL) && checkKey('R')) reset(); //Reset to initial color
  if(checkKey(157)     && checkKey('R')) reset();
  
 //Scroll
  if(checkKey(CONTROL) && checkKey('S')) scroll();
  if(checkKey(157)     && checkKey('S')) scroll();
  
  if(checkKey(CONTROL) && checkKey('N')) randomColor();
  if(checkKey(157)     && checkKey('N')) randomColor();
}

public void keyReleased(){ //If keys are released...
  keys[keyCode] = false; //Keys pressed are false
}

public boolean checkKey(int k){
  if(keys.length >= k){
    return keys[k];  
  }
  return false;
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ColorMixer" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
