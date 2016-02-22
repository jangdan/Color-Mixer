/* Color Mixer
       by electricmango
  https://electricmango.github.io

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
                   .setColorValue(cp.getColorValue())
                   ;
  aboutText = cp5.addTextlabel("text")
                   .setPosition(200,200)
                   .setWidth(550)
                   .setFont(Monaco14)
                   .setTab("About")
                   .setText("Color is too, an art.\nThis application makes it easier to make colors.\nColor Mixer is licensed under the GNU General\nPublic License.\n\nUse it, mod it, share it (as open source).\nJust don't change the license.\n\nv 3.1.1\nLast Updated 1.27.15\n\ngithub.com/electricmango/Color-Mixer")
                   ;
}
