/*Color Mixer Application
  by Daniel Min Hyuk Jang
  
  Color Mixer is open source. Use it, mod it, share it.
  Just leave the white text on the right bottom
  
  Last Updated 3.2.13 @ 2.0.2 v 0.7.6
  
  0013
  
  minhyukjang@gmail.com
  
  Thanks to the Control P5 Library
            http://wiki.processing.org/w/Export_Info_and_Tips
            http://processing.org/discourse/beta/num_1245332832.html
            http://wiki.processing.org/w/Multiple_key_presses
            http://www.sojamo.de/libraries/controlP5/examples/ControlP5color
            Picker/ControlP5colorPicker.pde
            http://www.iconspedia.com/icon/blogger-logo-4346.html (Blogger 
            icon)
            
  
*/
import controlP5.*; //Control P5 library

ControlP5 cp5;

ColorPicker cp;
Button blog;

int r = 128;
int g = 128;
int b = 128;
int a = 255;

String nr;
String ng;
String nb;
String na;

int wait;
int i;

boolean[] keys = new boolean[526];

int colorstring; 

PImage blogger;
PImage blogovr;
PImage blogclk;
PImage license;

void setup(){
  size(700,700);    //700 x 700 pixels
  noStroke();
  blogger = loadImage("blogger.png");
  blogovr = loadImage("blogovr.png");
  blogclk = loadImage("blogclk.png");
  license = loadImage("license.png");
  cp5 = new ControlP5(this); //New color picker
  cp = cp5.addColorPicker("Color_Mixer") /*The color picker's name is 'Color_
                                           Mixer'
                                          */
          .setPosition(125,81) //position
          .setColorValue(color(r,g,b,a)) //initial color
          ;
  blog = cp5.addButton("blog")
            .setPosition(4,634)
            .setImages(blogger,blogovr,blogclk)
            .updateSize()
            ;
  cp5 = new ControlP5(this); //Textboxes
  cp5.addTextfield("red") //red
            .setPosition(384,81)
            .setAutoClear(true)
            .setColorBackground(128)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            .setWidth(30)
            ;
  cp5.addTextfield("green") //green
            .setPosition(384,92)
            .setAutoClear(true)
            .setColorBackground(128)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            .setWidth(30)
            ;
  cp5.addTextfield("blue") //blue
            .setPosition(384,103)
            .setAutoClear(true)
            .setColorBackground(128)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            .setWidth(30)
            ;
  cp5.addTextfield("alpha") //alpha
            .setPosition(384,114)
            .setAutoClear(true)
            .setColorBackground(128)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            .setWidth(30)
            ;          
}     

void draw(){
  background(209);    //Gray background
  fill(0); //Text is black
  text("red", 123, 87); //Text...
  textAlign(RIGHT);
  text("green", 123, 98); 
  textAlign(RIGHT);
  text("blue", 123, 109); 
  textAlign(RIGHT);
  text("alpha", 123, 120); 
  textAlign(RIGHT);
  text("", 695, 656); 
  textAlign(RIGHT);
  text("v. 2.0.2", 695, 669); 
  textAlign(RIGHT);
  //text("MangoLabs", 695, 682); 
  //textAlign(RIGHT);
  text("Creative Commons Attribution-NonCommercial 3.0 Unported", 695, 695); 
  textAlign(RIGHT);
  
  text("Hey! We're working on a better Color Mixer!", 695, 682); 
  textAlign(RIGHT);
  
  image(license, 70, 660);
  fill(cp.getColorValue()); /*Rectangle color is the color from the color 
                              picker
                             */
  rect(125,125,450,450,7); //Rectangle
}

public void blog(){
  link("http://leocarbonate.com/");
}

boolean checkKey(int k){
  if(keys.length >= k){
    return keys[k];  
  }
  return false;
}

public void red(String nr){
    r = int(nr); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void green(String ng){
    g = int(ng); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void blue(String nb){
    b = int(nb); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void alpha(String na){
    a = int(na); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

void keyPressed(){  //If keys are pressed...
  if(key == ESC){   //Intercept the ESC key in the application
    key = 0;        //Don't quit even if ESC was pressed
  }
  keys[keyCode] = true; //Keys pressed are true
  if(checkKey(CONTROL) && checkKey('R')){ /*If keys are Control+R(ese
                                                      t)
                                                     */
    cp.setColorValue(color(r,g,b,a)); //Reset to initial color
  }
  if(checkKey(157) && checkKey('S')){ //If keys are Command+R(eset)
    cp.setColorValue(color(r,g,b,a)); //Reset to initial color
  }
  if(checkKey(CONTROL) && checkKey('S')){ /*If keys are Control+S(cro
                                                      ll)
                                                     */
    scroll();                         //scroll
  }
  if(checkKey(157) && checkKey('S')){ //If keys are Command+S(croll)
    scroll();                         //scroll
  }
}

void scroll(){
  wait = 0;
  i += 1;          //increment counter
  if (i < 255){    //first phase of fades
    r   -= 1; //red down
    g   += 1; //green up
    b    = 1; //blue low
  }
  else if (i < 509){ //second phase of fades
    r    = 1; //red low
    g   -= 1; //green down
    b  += 1; //blue up
  } 
  else if (i < 763){ //third phase of fades
    r   += 1;  //red up
    g    = 1;  //green low
    b   -= 1;  //blue down
  }
  else{            //re-set the counter, and start the fades again
    i = 1;
  }  
  cp.setColorValue(color(r,g,b,a)); //Reset to initial color
}

void keyReleased(){ //If keys are released...
  keys[keyCode] = false; //Keys pressed are false
}
