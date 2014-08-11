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

PFont Monaco14 = createFont("Monaco",14,false);
PFont Monaco24 = createFont("Monaco",24,false);
PFont Monaco48 = createFont("Monaco",48,false);

public void textinit(){
  //Textlabels
   
   colorTextr = cp5.addTextlabel("colorTextr")
                   .setPosition(200,200)
                   .setFont(Monaco24)
                   .setText("Red\n" + r)
                   ;
   colorTextg = cp5.addTextlabel("colorTextg")
                   .setPosition(300,200)
                   .setFont(Monaco24)
                   .setText("Green\n" + g)
                   ;
   colorTextb = cp5.addTextlabel("colorTextb")
                   .setPosition(400,200)
                   .setFont(Monaco24)
                   .setText("Blue\n" + b)
                   ;
   colorTexta = cp5.addTextlabel("colorTexta")
                   .setPosition(500,200)
                   .setFont(Monaco24)
                   .setText("Alpha\n" + a)
                   ;
                  
   hexText = cp5.addTextlabel("hexText")
                  .setPosition(200,300)
                  .setFont(Monaco24)
                  .setText("Hexadecimal [RGB]\n#808080")
                  ;
   hex8Text = cp5.addTextlabel("hex8Text")
                  .setPosition(200,400)
                  .setFont(Monaco24)
                  .setText("Hexadecimal [aRGB]\n0xFF808080")
                  ;
}

public void aboutTextinit(){
  aboutTitle = cp5.addTextlabel("title")
                   .setPosition(125,50)
                   .setFont(Monaco48)
                   .setTab("About")
                   .setText("Color Mixer")
                   .setColorValue(cp.getColorValue());
                   ;
  aboutText = cp5.addTextlabel("text")
                   .setPosition(200,200)
                   .setWidth(550)
                   .setFont(Monaco14)
                   .setTab("About")
                   .setText("Color is too, an art.\nThis application makes it easier to make colors.\nColor Mixer is licensed under the MIT license.\nUse it, mod it, share it (as open source).\nJust don't change the license.\n\nv 3.1.0\nLast Updated 8.11.14\n\ngithub.com/leocarbon/Color-Mixer")
                   ;
}
