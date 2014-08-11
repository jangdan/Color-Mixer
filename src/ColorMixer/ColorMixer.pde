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
