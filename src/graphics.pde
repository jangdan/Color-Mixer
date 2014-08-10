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
PFont georgiaText = createFont("Georgia",18);
PFont georgiaTitle = createFont("Georgia",48);

public void textinit(){
  //Textlabels
   
   colorTextr = cp5.addTextlabel("colorTextr")
                   .setPosition(200,200)
                   .setFont(courierText)
                   .setText("Red\n" + r) //Where to change initial Textlabel values - will be fixed
                   ;
   colorTextg = cp5.addTextlabel("colorTextg")
                   .setPosition(300,200)
                   .setFont(courierText)
                   .setText("Green\n" + g) //Where to change initial Textlabel values - will be fixed
                   ;
   colorTextb = cp5.addTextlabel("colorTextb")
                   .setPosition(400,200)
                   .setFont(courierText)
                   .setText("Blue\n" + b) //Where to change initial Textlabel values - will be fixed
                   ;
   colorTexta = cp5.addTextlabel("colorTexta")
                   .setPosition(500,200)
                   .setFont(courierText)
                   .setText("Alpha\n" + a) //Where to change initial Textlabel values - will be fixed
                   ;
                  
   hexText = cp5.addTextlabel("hexText")
                  .setPosition(200,300)
                  .setFont(courierText)
                  .setText("Hexadecimal [RGB]\n#808080") //Where to change initial Textlabel values - will be fixed
                  ;
   hex8Text = cp5.addTextlabel("hex8Text")
                  .setPosition(200,400)
                  .setFont(courierText)
                  .setText("Hexadecimal [aRGB]\n0xFF808080") //Where to change initial Textlabel values - will be fixed
                  ;
}

public void aboutTextinit(){
  aboutTitle = cp5.addTextlabel("title")
                   .setPosition(125,50)
                   .setFont(georgiaTitle)
                   .setTab("About")
                   .setText("Color Mixer.")
                   ;
  aboutText = cp5.addTextlabel("text")
                   .setPosition(145,175)
                   .setWidth(550)
                   .setFont(georgiaText)
                   .setTab("About")
                   .setText("\t Color is art. This application makes it easier to make colors. \nIt might have some bugs... It's not perfect . Just send me \nsome screenshots and information, and Leocarbon will try to \nfix it. \n\t Color Mixer is licensed under a \nCreative Commons Attribution-NonCommercial 3.0 Unported \n\t license which is good I guess\n\n\t v 3.0.0 \n\n\t github.com/leocarbon/cm \n\n\t Also, check out my website by clicking the orange button in the \nbottom left corner.")
                   ;
}
