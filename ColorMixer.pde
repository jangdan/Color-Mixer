/* Color Mixer
       by electricmango
  https://electricmango.github.io

  ColorMixer.pde
    The actual sketch.
*/

import controlP5.*; //Control P5 library
import java.awt.Color;
import java.awt.Image;

int r = 128;
int g = 128;
int b = 128;
int a = 255;
int bg = 209;

color currentColor;

boolean[] keys = new boolean[158];

PImage github, licensel, osil;

void setup(){
  size(800,800);
  noStroke();
  
  frame.setTitle("Color Mixer");
  
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

void draw(){
  background(bg);
  
  fill(cp.getColorValue());
  rect(125,125,550,550,0,7,7,7); //Rectangle
}
