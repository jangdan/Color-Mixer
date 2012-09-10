/*Color Mixer Application
  by Daniel Min Hyuk Jang
  
  Color Mixer is open source. Use it, mod it, share it.
  Just leave the white text on the right bottom
  
  Version Notes
  
  Last Updated 9.10.12 @ 2.0.0 v 0.7.5
  
  0012
  
  2.0.1 (9.10.12)
   - Minor Auto clear bug fixed
   
  2.0.0 (9.10.12)
   - Major Breakthrough!!!
     - Minor errors fixed
       - Copyright version updated
       - Release number added
       - brightness to alpha
       - Fixed broken blog link
       - Removed some text in the bottom corner
     - NOW WE HAVE NUMBER INPUT!!!
       - Brought from version 0.2.a0 (4.14.12)
       - Four text input boxes
       - NUI™
         - Number User Interface
     - Graphics
       - Repositioned the UIs
       - Bigger output
         
  1.1.6 (8.26.12)
   - Added Scroll™ feature
     - Choose a color you like with scrolling!
     - Control/Command+S
   - Minor adjustments to version notes

  1.1.5 (8.25.12)
   - Fixed gray screen bug in MacOSX
   - Minor changes to README.txt
   
  1.1.4 (8.25.12)
   - Added licence picture
   - Patch for version notes
   
  1.1.3 (8.24.12)
   - Works with Processing 2.0 [developers]
   - We are working on an Android app!
   - Now works with Linux
   - Edited the README
   
  1.1.2 (7.8.12)
   - Version Notes Edit
   - Electric Mango Blog ad (my blog)
   - Removed color saving debug code
   
  1.1.1
   - Seperate variables for colors (red, green, blue, alpha)
   - Now supports ControlP5 0.7.5
   
  1.1.0 v 0.7.2 (6.10.12)
   - Edited the version (added ControlP5 version) 
   - Lowered the slider for a better look
   
  1.0.0 v 0.7.2 (5.12.12)
   - Released with Naver Blog and Blogger
   
  0.4.rc4 (5.9.12)
   - Open Source license
   - More code commenting
   - Ready to release!!!
   
  0.4.rc3 (5.3.12)
   - Now press Contol(Command)+R to reset
   
  0.4.rc2 (5.3.12)
   - Removed red, green, blue shortcut keys
   - Removed debug code
   
  0.4.rc1 (4.30.12)
   - Reduced file size (a little)
   
  0.4.rc0 (4.30.12)
   - Shortcut keys feature
     - Press control+n to reset
     - Press command+n to reset (Mac OS X)
     - Press control+r for color red
     - Press command+r for color red (Mac OS X)
     - Press control+g for color green
     - Press command+g for color green (Mac OS X)
     - Press control+b for color blue
     - Press command+b for color blue (Mac OS X)
     
  0.3.rc0 (4.27.12)
   - Fixed Escape key quit bug
   - Commenting for code
  
  0.2.b5 (4.20.12)
   - Added copyright message
   
  0.2.b4 (4.18.12)
   - Added definition for bars under customer request
   
  0.2.a3 (4.17.12)
   - Added new Mac OS X icon (permanent)
   
  0.2.a2 (4.16.12)
   - Added new Mac OS X icon
   
  0.2.a1 (4.16.12)
   - Added Mac OS X icon
   
  0.2.a0 (4.14.12)
   - Changed the interface from text input to bar input
   - added color rectangle
   
  0.1.a1 (4.14.12)
   - Fixed reading number input bug
   
  0.1.a0 (4.14.12)
   - text input interface
  
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

int r = 0;
int g = 0;
int b = 0;
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
            .setColorBackground(0)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            ;
  cp5.addTextfield("green") //green
            .setPosition(384,92)
            .setAutoClear(true)
            .setColorBackground(0)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            ;
  cp5.addTextfield("blue") //blue
            .setPosition(384,103)
            .setAutoClear(true)
            .setColorBackground(0)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            ;
  cp5.addTextfield("alpha") //alpha
            .setPosition(384,114)
            .setAutoClear(true)
            .setColorBackground(0)
            .setColorActive(255)
            .setColorForeground(100)
            .setLabelVisible(false) 
            .setHeight(10)
            ;          
}     

void draw(){
  background(0);    //Black background
  fill(255, 255, 255); //Text is white
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
  text("v. 2.0.0", 695, 669); 
  textAlign(RIGHT);
  text("MangoLabs", 695, 682); 
  textAlign(RIGHT);
  text("Creative Commons Attribution-NonCommercial 3.0 Unported", 695, 695); 
  textAlign(RIGHT);
  image(license, 70, 660);
  fill(cp.getColorValue()); /*Rectangle color is the color from the color 
                              picker
                             */
  rect(125,125,450,450); //Rectangle
}

public void blog(){
  link("http://electronicmango.blogspot.com/");
}

boolean checkKey(int k){
  if(keys.length >= k){
    return keys[k];  
  }
  return false;
}

public void red(String nr){
    r = Integer.parseInt(nr); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void green(String ng){
    g = Integer.parseInt(ng); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void blue(String nb){
    b = Integer.parseInt(nb); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

public void alpha(String na){
    a = Integer.parseInt(na); //String to int
    cp.setColorValue(color(r,g,b,a)); //set color
}

void keyPressed(){  //If keys are pressed...
  if(key == ESC){   //Intercept the ESC key in the application
    key = 0;        //Don't quit even if ESC was pressed
  }
  keys[keyCode] = true; //Keys pressed are true
  if(checkKey(CONTROL) && checkKey(KeyEvent.VK_R)){ /*If keys are Control+R(ese
                                                      t)
                                                     */
    cp.setColorValue(color(r,g,b,a)); //Reset to initial color
  }
  if(checkKey(157) && checkKey(KeyEvent.VK_R)){ //If keys are Command+R(eset)
    cp.setColorValue(color(r,g,b,a)); //Reset to initial color
  }
  if(checkKey(CONTROL) && checkKey(KeyEvent.VK_S)){ /*If keys are Control+S(cro
                                                      ll)
                                                     */
    scroll();                         //scroll
  }
  if(checkKey(157) && checkKey(KeyEvent.VK_S)){ //If keys are Command+S(croll)
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
