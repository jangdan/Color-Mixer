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
     .setFont(Monaco14)
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
     .setFont(Monaco14)
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
     .setFont(Monaco14)
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
     .setFont(Monaco14)
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
                 .setFont(Monaco14)
                 .setLabel("Hexdecimal\n(Web)")
                 .setWidth(8*8+1)
                 ; 
   hexcolora = cp5.addTextfield("hexcolora")
                 .setPosition(514+8*8+1+3,66)
                 .setSize(88,15)
                 .setAutoClear(false)
                 .setColorBackground(128)
                 .setColorActive(255)
                 .setColorForeground(100)
                 .setLabelVisible(false)
                 .setFont(Monaco14)
                 .setLabel("Hexdecimal with alpha\n(Android)")
                 .setWidth(8*11+1)
                 ; 
}

void repo(){
  link("http://github.com/leocarbon/Color-Mixer");
} void license(){
  link("https://creativecommons.org/licenses/by-sa/4.0/");
} void osi(){
  link("http://opensource.org/licenses/MIT");
}


public void red(String nr){
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF; 
  a = (currentColor >> 24) & 0xFF;
  
  r = int(nr); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void green(String ng){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  b = currentColor & 0xFF; 
  a = (currentColor >> 24) & 0xFF;
  
  g = int(ng); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void blue(String nb){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  a = (currentColor >> 24) & 0xFF;
  
  b = int(nb); //String to int
  cp.setColorValue(color(r,g,b,a)); //set color
}

public void alpha(String na){
  currentColor = cp.getColorValue();
  r = (currentColor >> 16) & 0xFF; 
  g = (currentColor >> 8) & 0xFF;  
  b = currentColor & 0xFF; 
  
  a = int(na); //String to int
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
