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
  Just leave the white text on the bottom right with the Creative Commons image.
  
  -----------------------------------------------------------------------------
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
int[] buffer = new int[1024];
int bg = 209;

color currentColor;

boolean[] keys = new boolean[1024];

PImage blogger;
PImage blogovr;
PImage blogclk;
PImage license;

void setup(){
  size(800,800);
  noStroke();
  
  frame.setTitle("Color Mixer");
  PImage icon = loadImage("icons/sketch.jpg");
  frame.setIconImage((Image)icon.getNative());
  
  blogger = loadImage("images/blogger.png");
  blogovr = loadImage("images/blogovr.png");
  blogclk = loadImage("images/blogclk.png");
  license = loadImage("images/license.png");
  
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

