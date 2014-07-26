#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){

    state=EMPTY;
    
    width=768;//widthScarf;
    height=1024;//heightScarf;
    if (iphone5==true ) {
        width = 640;
        height = 1136;
    }
    if (isiPad==false&&isRetina==true) {
        width = 640;
        height = 960;
    }
    
    fluidity[1]=3.5;
    fluidity[0]=0.2;
    fluidity[2]=4.0;
    timeMotion=0.001;
    scale=500;
    red[1]=255;
    green[1]=255;
    blue[1]=255;
    
    
    ofBackground(40);
	ofSetVerticalSync(false);
	ofEnableAlphaBlending();
    ofSetLogLevel(OF_LOG_VERBOSE);
    shader.load("shaders/perlin");
    gradient.loadImage( "gradient.png" );
    shader2.load("shaders/PhotoshopGradientMap");

    /*
    normal=new ofxFontStash;
    normal->setup("type/euphNormal.ttf", 4*g.retinaScale,1.0f,128);
    
    
    italic=new ofxFontStash;
  italic->setup("type/euphItalic.ttf", 4*g.retinaScale);
    
    
    bold=new ofxFontStash;
    bold->setup("type/euphBold.ttf", 4*g.retinaScale);
    */

    widthThings=g.screenWidth-(g.screenWidth/10);
    xThings=g.screenWidth/20;
    normal.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    bold.loadFont("type/Brandon_bld.otf", 12*g.retinaScale);
    
    textTitleDescription=bold;
    textTitleDescription.setText("About",g.screenWidth,g.screenHeight);
    textTitleDescription.setWidth(widthThings);
    
    textDescription=normal;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textDescription.setText("Generative Scarves is the debut collection from London-based Convivial Project, a design studio whose work sits at the intersection of art, design and technology. For this project a procedural algorithm commonly used to digitally generate patterns of the natural world was sampled in a bespoke application. Characterised by unexpected and unique results the program allows to generate intricate visual landscapes of melting shapes and colours. The Generative Scarves app, with its set of modifiable parameters enables the user to customise colours and patterns and create a unique print for an individual scarf. All scarves are manufactured locally in the UK.",g.screenWidth,g.screenHeight);
    textDescription.setWidth(widthThings);

    textLinkWebsite.loadFont("type/Brandon_reg_it.otf", 10*g.retinaScale);
    textLinkWebsite.setText("http://www.convivialproject.com",g.screenWidth,g.screenHeight);
    textLinkWebsite.setWidth(widthThings);
    
    textTitleTechnology=bold;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textTitleTechnology.setText("Technology Palette",g.screenWidth,g.screenHeight);
    textTitleTechnology.setWidth(widthThings);
    
    textTechnology=normal;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textTechnology.setText("This app was built using the open source coding toolkit openFrameworks and the library ofxUI. The generative shader algorithm is inspired by Inigo Quilez' domain warping experimentations. Find the source for the app at http://github.com/convivial-project", g.screenWidth,g.screenHeight);
    textTechnology.setWidth(widthThings); 
    
    textSend=normal;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textSend.setText("Order this scarf!*",g.screenWidth,g.screenHeight);
    textSend.setWidth(widthThings);
    
    
    
    textCapture=normal;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textCapture.setText("Screen grab",g.screenWidth,g.screenHeight);
    textCapture.setWidth(widthThings);
    
    
    textColor=normal;//.loadFont("type/Brandon_light.otf", 10*g.retinaScale);
    textColor.setText("Select a colour marker to start. Modify hues by dragging the RED, GREEN and BLUE sliders. Press + to add and - to remove colour markers.",g.screenWidth,g.screenHeight);
    textColor.setWidth(widthThings);
    
    
    textDisclaimer.loadFont("type/Brandon_light.otf", 7*g.retinaScale);
    textDisclaimer.setText("* When ordering a unique scarf pattern, your chosen settings will be sent to our studio. Here we will generate a high resolution image suitable for a detailed digital print on silk. To make sure you will receive your desired scarf we will email you a selection of prints with the exact same parameter settings and colours. Just pick one and your scarf will be produced and delivered to your door within 3 weeks. The purchase will only be effective once you confirmed the design.",g.screenWidth,g.screenHeight);
    textDisclaimer.setWidth(widthThings);
    //Initially wrap the text to the screen width
   // myText._wrapTextX(g.screenWidth);
    
 //   text.init(normal);
  //  text.wrdspace=0.64;
    
  //     text.setText("Aliquam neque diam, rhoncus a ante eget, blandit laoreet enim. Vivamus vestibulum dapibus leo id consectetur.", g.screenWidth-(g.screenWidth/10));
    
    
    
    
    /*
    for(int i=0;i<2;i++){
        //gui.addLabel("color"+ofToString(i+1));
        //gui.addSlider("red"+ofToString(i+1),"RED"+ofToString(i+1),0,-2,2,false);
        //gui.addSlider("green"+ofToString(i+1),"GREEN"+ofToString(i+1),0,-2,2,false);
        //gui.addSlider("blue"+ofToString(i+1),"BLUE"+ofToString(i+1),0,-2,2,false);
        gui.add(red[i].setup("red"+ofToString(i+1),0,-2,2));
        gui.add(green[i].setup("green"+ofToString(i+1),0,-2,2));
        gui.add(blue[i].setup("blue"+ofToString(i+1),0,-2,2));
        
	}
    */
    //scale=width;
    //gui.add(scale.setup("scale x",width,0,60000));
    
    //gui.add(red[i].setup("scale",width,0,12000);
    //gui.add(red[i].setup("scale y",width,0,12000);
	//gui.addSlider("scale y","sy",height,0,12000,false);
    
	gui.add(colorBlendingGradientX.setup("colorBlendingGradientX",2,-2,2));
	gui.add(colorBlendingGradientY.setup("colorBlendingGradientY",2,-2,2));
	gui.add(addBlurSurface1.setup("addBlurSurface1",2,-10,10));
	gui.add(addBlurSurface2.setup("addBlurSurface2",2,-10,10));
    gui.add(addInnerSurface1.setup("addInnerSurface1",1,-10,10));
	gui.add(addInnerSurface2.setup("addInnerSurface2",1,-10,10));
    
	gui.add(moveContrast.setup("move contrast",0,-10,10));
	gui.add(fillThreshold.setup("fillThreshold",0,-10,10));
    
//	gui.add(timeMotion.setup("time",0.001f,0.00001f,0.01f));
//	gui.add(fluidity[0].setup("fluidity1",2.3f,0.001f,5));
//	gui.add(fluidity[1].setup("fluidity2",0.4f,0.001f,1));
//	gui.add(fluidity[2].setup("fluidity3",10,1,40));
    
    bWidth=g.screenWidth/8;
    bWidth2=bWidth/2;
    float sideMargin=g.screenWidth/6;
    float inBetweenSpace=g.screenWidth-(sideMargin*2);
    float spaceButton=inBetweenSpace/4;// /number of buttons
    int centerButton=(spaceButton-bWidth)/2;
    
    //sideMargin + centerButton + (spaceButton*0)
   
    bt[0].setupSimpleButtons(sideMargin + centerButton + (spaceButton*0), bWidth/2, bWidth, bWidth, "icons/icons-02w.png", SHAPE, 0);
    bt[1].setupSimpleButtons(sideMargin + centerButton + (spaceButton*1), bWidth/2, bWidth, bWidth, "icons/icons-01w.png", COLOR, 0);
    bt[2].setupSimpleButtons(sideMargin + centerButton + (spaceButton*2), bWidth/2, bWidth, bWidth, "icons/icons-03w.png", BUY, 0);
    bt[3].setupSimpleButtons(sideMargin + centerButton + (spaceButton*3), bWidth/2, bWidth, bWidth, "icons/icons-04w.png", ABOUT, 0);
    //cout<<g.screenWidth<<" :"<<g.screenHeight<<endl;
    buy[0].setupSimpleButtons(xThings, (bWidth*3), widthThings, bWidth, "icons/transparent.png", 6, 0);
    buy[1].setupSimpleButtons(xThings, (bWidth*5)-bWidth/2, widthThings, bWidth, "icons/transparent.png", 6, 0);
    
    
    
    float widthThings2=widthThings-bWidth;
    for (int i=0; i<currentColorNum; i++) {
        
        btColor[i].setupSimpleButtons(xThings+bWidth2+((widthThings2/(currentColorNum-1))*i)-(bWidth2/2),
                                      6*(g.screenHeight/10)-bWidth2, bWidth2, bWidth2, "icons/frame-w.png", ABOUT, 0);
    }
    
    
    btPlus.setupSimpleButtons(xThings, 6*(g.screenHeight/10), bWidth2, bWidth2, "icons/plus.png", 0, 0);
    btMinus.setupSimpleButtons((g.screenWidth-xThings)-bWidth2, 6*(g.screenHeight/10), bWidth2, bWidth2, "icons/minus.png", 0, 0);
    

    
    
    ofFbo::Settings settings;
    settings.width = width;
    settings.height = height;
    settings.internalformat = GL_RGB; // GL_RGB or GL_RGBA
    settings.numSamples = 0;
    settings.useDepth = false;
    settings.useStencil = false;

    FBO.allocate(settings);
    //FBO.allocate(width,height,true);
    
    setupGui();
    //timeMotion=20;
    
    if(xml.load("settings.xml")){
    currentColorNum=xml.getValue("color", MIN_COLOR);
    }
    
    //custom gradient design
    grad.setup(256, 256);
    for (int i=0; i<currentColorNum; i++) {
    ofColor c;
        c.set(red[i], green[i], blue[i]);
    grad.addColor(c);
    }
    
    int yAdd=UIrect.y+g.screenWidth/20;
    yAdd+=textTitleDescription.getTextHeight()+g.screenHeight/40;
    yAdd+=textDescription.getTextHeight()+g.screenHeight/40;
    cout<<yAdd<<"Y ADD!"<<endl;
    btLink.setupSimpleButtons(xThings, yAdd, widthThings, textLinkWebsite.getTextHeight()*3, "icons/plus.png", 0, 0);
    
    //int yAdd=UIrect.y+g.screenWidth/20;
    //textTitleDescription.draw(xThings,yAdd);
    //yAdd+=textTitleDescription.getTextHeight()+g.screenHeight/40;
    //textDescription.draw(xThings,yAdd);
    //yAdd+=textDescription.getTextHeight()+g.screenHeight/40;
    //textLinkWebsite.draw(xThings,yAdd);
   
	
}

//--------------------------------------------------------------
void ofApp::update(){
    
    switch (state) {
        case COLOR:
            for(int i=0;i<grad.getNumColors();i++){
                if (btColor[i].buttonState==true) {
                ofColor c;
                c.set(red[i], green[i],blue[i]);
                grad.replaceColorAtIndex(i, c);
                }
            }
            break;
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    
    ofSetColor(255);
  
    FBO.begin();
 
    shader.begin();

    //shader.setUniform1f("width",width);
    //shader.setUniform1f("height",height);
 
    
    
    
    shader.setUniform1f("colorBlendingGradientX",colorBlendingGradientX);
    shader.setUniform1f("colorBlendingGradientY",colorBlendingGradientY);
    shader.setUniform1f("addBlurSurface1",addBlurSurface1);
    shader.setUniform1f("addBlurSurface2",addBlurSurface2);
    shader.setUniform1f("addInnerSurface1",addInnerSurface1);
    shader.setUniform1f("addInnerSurface2",addInnerSurface2);
    shader.setUniform1f("moveContrast",moveContrast);
    shader.setUniform1f("fillThreshold",fillThreshold);
    //shader.setUniform1f("red",red[0]);
    //shader.setUniform1f("green",green[0]);
    //shader.setUniform1f("blue",blue[0]);
    
    
    shader.setUniform1f("time", ofGetFrameNum() * timeMotion);
    shader.setUniform1f("fluidity2",fluidity[0]);
    shader.setUniform1f("fluidity1",fluidity[1]);
    shader.setUniform1i("fluidity3",fluidity[2]);
    shader.setUniform1f("scaleWidth",scale);
    shader.setUniform1f("scaleHeight",scale);
    //ofSetColor(red[1], green[1], blue[1]);
    ofRect(0,0,width,height);
    
    shader.end();
    
    FBO.end();
    //gui.draw();
    
     ofFbo f=grad.getRef(256, 256);
    //f.draw(0, 0);
    ofSetColor(255, 255, 255);
    ofPushMatrix();
    
    shader2.begin();
   
    shader2.setUniformTexture( "gradient", f.getTextureReference(), 1 );

    FBO.draw(0,0,g.screenWidth,g.screenHeight);
    shader2.end();
    ofPopMatrix();
    
    
    ofEnableAlphaBlending();
    if (state!=NOTHING) {
    ofSetColor(0, 0, 0,200);
    ofRect(0,0, g.screenWidth, bt[0].simpleButtonsRect.height*2);
    }
    
    ofSetColor(255, 255, 255,255);
    
    switch (state) {
        case SHAPE:
            ofSetColor(0, 0, 0,150);
            ofRect(UIrect);
            ofSetColor(255, 255,255,255);
            guiShape->draw();
            guiShape->setVisible(true);
            guiColor->setVisible(false);
            for (int i=0; i<currentColorNum; i++) {
                guiColorG[i]->setVisible(false);
            }
            break;
        case COLOR:{
            ofSetColor(0, 0, 0,150);
            ofRect(UIrect);
            guiShape->setVisible(false);
            guiColor->setVisible(true);
            
            grad.drawDebug(xThings+bWidth2,6*(g.screenHeight/10),widthThings-(bWidth2*2),bWidth2);
            ofNoFill();
            ofSetLineWidth(1);
            ofSetColor(115, 115, 115, 255);
            ofRect(xThings+bWidth2,6*(g.screenHeight/10),widthThings-(bWidth2*2),bWidth2);
           // ofSetLineWidth(7);
            ofRect(btPlus.simpleButtonsRect);
            ofRect(btMinus.simpleButtonsRect);
            //ofSetLineWidth(1);
            ofFill();
            btMinus.drawSimpleButtons();
            btPlus.drawSimpleButtons();
            
            bool checkVisible=false;
            for (int i=0; i<currentColorNum; i++) {
                
                float q=1.0/(currentColorNum-1)*(float)i;
                ofSetColor(grad.getColorAtPercent(q));//(1.0/(MAX_COLOR-1))*(float)i)
                ofRect(btColor[i].simpleButtonsRect.x+btColor[i].simpleButtonsRect.width/20,btColor[i].simpleButtonsRect.y,btColor[i].simpleButtonsRect.width*0.9,btColor[i].simpleButtonsRect.height*0.9);
                btColor[i].drawSimpleButtons();
                if(guiColorG[i]->isVisible()){
                    checkVisible=true;
                }
                //checkVisible=guiColorG[i]->isVisible();
            }
            
            if (checkVisible==false) {
                ofSetColor(255, 255, 255);
                textColor.draw(xThings, 3*(g.screenHeight/10));
            }
            //textColor.draw(bWidth, 6*(g.screenHeight/10));
        }
            break;
        case BUY:
        {
            guiShape->setVisible(false);
            guiColor->setVisible(false);
            for (int i=0; i<currentColorNum; i++) {
                guiColorG[i]->setVisible(false);
            }
            ofSetColor(0, 0, 0,150);
            ofRect(UIrect.x,UIrect.y,UIrect.width,UIrect.height+bWidth*1.5);
            ofSetColor(255, 255,255,255);
            ofNoFill();
            for (int i=0; i<2; i++) {
                ofSetLineWidth(7);
                buy[i].drawSimpleButtons();
                ofRect(buy[i].simpleButtonsRect);
            }
            ofSetLineWidth(1);
            ofFill();
            ofSetColor(255, 255, 255, 255);
            textCapture.draw(buy[0].simpleButtonsRect.x, buy[0].simpleButtonsRect.y+((buy[0].simpleButtonsRect.height/2)-(textCapture.getTextHeight()*0.7)));
            textSend.draw(buy[1].simpleButtonsRect.x, buy[1].simpleButtonsRect.y+((buy[1].simpleButtonsRect.height/2)-(textSend.getTextHeight()*0.7)));
        
            textDisclaimer.draw(xThings, bWidth*6);
        
        }
            break;
        case ABOUT:
        {
            guiShape->setVisible(false);
            guiColor->setVisible(false);
            for (int i=0; i<currentColorNum; i++) {
                guiColorG[i]->setVisible(false);
            }
            ofSetColor(0, 0, 0,150);
            ofRect(UIrect.x,UIrect.y,UIrect.width,g.screenHeight);
           // ofDisableAlphaBlending();
            ofSetColor(255, 255,255,255);
            int yAdd=UIrect.y+g.screenWidth/20;
            textTitleDescription.draw(xThings,yAdd);
            yAdd+=textTitleDescription.getTextHeight()+g.screenHeight/40;
            textDescription.draw(xThings,yAdd);
            yAdd+=textDescription.getTextHeight()+g.screenHeight/40;
            ofSetColor(200, 200, 200,255);
            textLinkWebsite.draw(xThings,yAdd);
            yAdd+=textLinkWebsite.getTextHeight()+g.screenHeight/40;
            ofSetColor(255, 255,255,255);
            textTitleTechnology.draw(xThings, yAdd);
            yAdd+=textTitleTechnology.getTextHeight()+g.screenHeight/40;
            textTechnology.draw(xThings,yAdd);
        }
            break;
        case NOTHING:
            guiShape->setVisible(false);
            guiColor->setVisible(false);
            for (int i=0; i<currentColorNum; i++) {
                guiColorG[i]->setVisible(false);
            }
            break;
            
        case EMPTY:
            guiShape->setVisible(false);
            guiColor->setVisible(false);
            for (int i=0; i<currentColorNum; i++) {
                guiColorG[i]->setVisible(false);
            }
            break;
            
        default:
            guiShape->setVisible(false);
            break;
    }
    ofSetColor(255, 255, 255,255);
    for (int i=0; i<4; i++) {
        if (state!=NOTHING) {
            
        
        bt[i].drawSimpleButtons();
            }
    }
    
    
    ofEnableAlphaBlending();
    
    if(flashLight != 0 && state==BUY){
        flashLight-=5;
        if (flashLight<0) {
            flashLight=0;
        }
        ofSetColor(255,255,255,flashLight);
        
        ofRect(0, 0, g.screenWidth, g.screenHeight);
        
    }
    
    
    if(debugTouch){
    ofEnableAlphaBlending();
        ofSetColor(255, 255, 255,70);
    ofCircle(debugX,debugY, 60);
    //ofDisableAlphaBlending();
    }
    
    ofSetColor(255, 255, 255);
   // grad.getRef(256,256);
    
   
    //grad.drawDebug(0, 200, g.screenWidth, g.screenHeight/10);
    //normal->
    //normal->draw("TEST", 24, 20, 20);
 //    text.draw(0,0);
}

//--------------------------------------------------------------
void ofApp::exit(){
    guiShape->saveSettings(ofxiOSGetDocumentsDirectory()+"settingsShape.xml");
    delete guiShape;
    
    guiColor->saveSettings(ofxiOSGetDocumentsDirectory()+"settingsColor.xml");
    delete guiColor;
    
    for (int i=0; i<currentColorNum; i++) {
        guiColorG[i]->saveSettings(ofxiOSGetDocumentsDirectory()+"settingsColor"+ofToString(i)+".xml");
        delete guiColorG[i];
    }
    
    xml.setValue("color", currentColorNum);
    xml.save(ofxiOSGetDocumentsDirectory()+"settings.xml");
}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    prevX=touch.x;
    prevY=touch.y;
     debugTouch=true;
    debugX=touch.x;
    debugY=touch.y;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
   // debugTouch=true;
    debugX=touch.x;
    debugY=touch.y;
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

    debugTouch=false;
    //int ct=0;
    if(state==ABOUT){
        if (btLink.updateSimpleButtons(touch.x, touch.y, prevX, prevY)) {
            string url = "http://www.convivialproject.com";
            cout<<"LINK LAUNCH"<<endl;
            ofxiOSLaunchBrowser(url);
        }
    }
    
    bool inUI=false;
    if (touch.x>UIrect.x&&touch.x<UIrect.x+UIrect.width && touch.y>UIrect.y&&touch.y<UIrect.y+UIrect.height) {
        inUI=true;
        
    }else{state=NOTHING;}
    
    for (int i=0; i<4; i++) {
        if (inUI==false) {
        bool ok=bt[i].updateSimpleButtons(touch.x, touch.y, prevX, prevY);
            
        if (ok==true) {
            //ct++;
            
            for (int j=0; j<4; j++) {
                    bt[j].buttonState=false;
                }
            
            for (int j=0; j<currentColorNum; j++) {
            guiColorG[j]->setVisible(false);
            }
            //if (i!=0) {
            bt[i].buttonState=true;
            state=i;
                
            }
            //}
        }
    }
    
    if(state==COLOR){
        if(touch.x>btColor[0].simpleButtonsRect.x && touch.x<btColor[currentColorNum-1].simpleButtonsRect.x+btColor[currentColorNum-1].simpleButtonsRect.width && touch.y>btColor[0].simpleButtonsRect.y&&touch.y<btColor[0].simpleButtonsRect.y+btColor[0].simpleButtonsRect.height){
        
      for (int i=0; i<currentColorNum; i++) {
          
          bool ok=btColor[i].updateSimpleButtons(touch.x, touch.y, prevX, prevY);
          if(ok==true)
          {
              guiColorG[i]->setVisible(true);
              btColor[i].buttonState=true;
              for (int j=0; j<currentColorNum; j++) {
                  cout<<"i"<<i<<" j"<<j<<endl;
                  if(i!=j){
                    cout<<"valid i"<<i<<" j"<<j<<endl;
                  btColor[j].buttonState=false;
                  guiColorG[j]->setVisible(false);
                  }
              }
              
              
              
          }
      }
    }
        
        if (btPlus.updateSimpleButtons(touch.x, touch.y, prevX, prevY)) {
            if (currentColorNum<MAX_COLOR) {
                cout<<"NEW COLOR"<<endl;
                grad.addColor(grad.getColorAtPercent(1));
                currentColorNum++;
                btPlus.buttonState=false;
                float widthThings2=widthThings-bWidth;
                for (int i=0; i<currentColorNum; i++) {
                    
                    btColor[i].setupSimpleButtons(xThings+bWidth2+((widthThings2/(currentColorNum-1))*i)-(bWidth2/2),
                                                  6*(g.screenHeight/10)-bWidth2, bWidth2, bWidth2, "icons/frame-w.png", ABOUT, 0);
                }
                
                
                }
        }
        if (btMinus.updateSimpleButtons(touch.x, touch.y, prevX, prevY)) {
            if (currentColorNum>MIN_COLOR) {
                cout<<"REMOVED COLOR"<<endl;
                grad.deleteColor();
                currentColorNum--;
                btMinus.buttonState=false;
                float widthThings2=widthThings-bWidth;
                for (int i=0; i<currentColorNum; i++) {
                    
                    btColor[i].setupSimpleButtons(xThings+bWidth2+((widthThings2/(currentColorNum-1))*i)-(bWidth2/2),
                                                  6*(g.screenHeight/10)-bWidth2, bWidth2, bWidth2, "icons/frame-w.png", ABOUT, 0);
                }
                
            }
        }
    }
    
    
    if (state==BUY) {
        
   
    
    bool send=buy[1].updateSimpleButtons(touch.x, touch.y, prevX, prevY);;
        string contact="scarf@convivialproject.com";
        string titleT="Thank you for your order! Please send to proceed";
        string disclaimer="Disclaimer: When ordering a unique scarf pattern, your chosen settings will be sent to our studio. Here we will generate a high resolution image suitable for a detailed digital print on silk. To make sure you will receive your desired scarf we will email you a selection of prints with the exact same parameter settings and colours. Just pick one and your scarf will be produced and delivered to your door within 3 weeks. The purchase will only be effective once you confirmed the design.";
    string content=disclaimer+"Your unique scarf code: "+ofToString(fluidity[0])+";"+ofToString(fluidity[1])+";"+ofToString(fluidity[2])+";"+ofToString(scale)+";";
        
        for (int i=0; i<currentColorNum; i++) {
        content+=ofToString(red[i])+";";
        content+=ofToString(green[i])+";";
        content+=ofToString(blue[i])+";";
            }
        
        
    if(send==true){
    NSString *turl = [NSString stringWithCString:titleT.c_str()
                                        encoding:[NSString defaultCStringEncoding]];
    NSString *url = @"mailto:scarf@convivialproject.com?cc=&subject=";
    NSString *result = [url stringByAppendingString:turl]; // Prints "AB"
    NSString *adds=@"&body=";
    NSString *result2=[result stringByAppendingString:adds];
    NSString *curl =[NSString stringWithCString:content.c_str()
                                       encoding:[NSString defaultCStringEncoding]];
    NSString *result3=[result2 stringByAppendingString:curl];
    NSString *escaped = [result3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString: escaped]];
    }
    
    
    bool screenGrab=buy[0].updateSimpleButtons(touch.x, touch.y, prevX, prevY);
    if(screenGrab==true){
        state=NOTHING;
        draw();
        
        ofxiPhoneAppDelegate * delegate = ofxiPhoneGetAppDelegate();
        ofxiPhoneScreenGrab(delegate);
        state=BUY;
        flashLight=255;
        buy[0].buttonState=false;
    }
    }
    
  
    

if(state==NOTHING){
    state=EMPTY;
}
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}


void ofApp::guiEvent(ofxUIEventArgs &e)
{
    
    /*
    if(e.getName() == "BACKGROUND")
    {
        ofxUISlider *slider = e.getSlider();
        ofBackground(slider->getScaledValue());
    }
    
    else if(e.getName() == "FULLSCREEN")
    {
        ofxUIToggle *toggle = e.getToggle();
        ofSetFullscreen(toggle->getValue());
    }
    */
}
//
void ofApp::setupGui(){

    
    //SHAPE
    guiShape= new ofxUICanvas();
    //
    guiShape->setPosition(0, bt[0].simpleButtonsRect.height*2);
    guiShape->setRetinaResolution();
    guiShape->setFont("type/Brandon_light.otf");
    guiShape->setFontSize(OFX_UI_FONT_LARGE, 10*g.retinaScale);
    guiShape->setFontSize(OFX_UI_FONT_MEDIUM, 8*g.retinaScale);
    guiShape->setFontSize(OFX_UI_FONT_SMALL, 6*g.retinaScale);
    guiShape->setWidgetSpacing(g.retinaScale*20);
    guiShape->setWidth(g.screenWidth);
    ofColor paddingColor2 = ofColor(255,255,255,200);
    ofColor paddingColor3 = ofColor(255,255,255,40);
    guiShape->setColorOutlineHighlight(paddingColor3);
    guiShape->setColorFill(paddingColor2);
    
    guiShape->addSlider("Complexity 1", 0.001f,1, &fluidity[0]);
    guiShape->addSlider("Complexity 2", 0.001f,5, &fluidity[1]);
    guiShape->addSlider("Complexity 3", 1,10, &fluidity[2]);
    guiShape->addSlider("Scale",0,10000,&scale);
    guiShape->addSlider("Speed", 0.00001f,0.01f, &timeMotion);
    //guiShape->set

    //    guiShape->ofxUIWidget::set
    guiShape->autoSizeToFitWidgets();
    
    ofAddListener(guiShape->newGUIEvent, this, &ofApp::guiEvent);
    
    guiShape->loadSettings(ofxiOSGetDocumentsDirectory()+"settingsShape.xml");
    
    
    //COLOR
    guiColor= new ofxUICanvas();
    //
    guiColor->setPosition(0, bt[0].simpleButtonsRect.height*2);
    guiColor->setRetinaResolution();
    guiColor->setFont("type/Brandon_light.otf");
    guiColor->setFontSize(OFX_UI_FONT_LARGE, 10*g.retinaScale);
    guiColor->setFontSize(OFX_UI_FONT_MEDIUM, 8*g.retinaScale);
    guiColor->setFontSize(OFX_UI_FONT_SMALL, 6*g.retinaScale);
    guiColor->setWidgetSpacing(g.retinaScale*20);
    guiColor->setWidth(g.screenWidth);
    guiColor->setColorOutlineHighlight(paddingColor3);
    guiColor->setColorFill(paddingColor2);
    

    
    guiColor->autoSizeToFitWidgets();
    
    ofAddListener(guiColor->newGUIEvent, this, &ofApp::guiEvent);
    
    guiColor->loadSettings(ofxiOSGetDocumentsDirectory()+"settingsColor.xml");
    
    //ALL COLORS
    for (int i=0; i<MAX_COLOR; i++) {
        guiColorG[i]= new ofxUICanvas();
        //
        guiColorG[i]->setPosition(0, bt[0].simpleButtonsRect.height*2);
        guiColorG[i]->setRetinaResolution();
        guiColorG[i]->setFont("type/Brandon_light.otf");
        guiColorG[i]->setFontSize(OFX_UI_FONT_LARGE, 10*g.retinaScale);
        guiColorG[i]->setFontSize(OFX_UI_FONT_MEDIUM, 8*g.retinaScale);
        guiColorG[i]->setFontSize(OFX_UI_FONT_SMALL, 6*g.retinaScale);
        guiColorG[i]->setWidgetSpacing(g.retinaScale*20);
        guiColorG[i]->setWidth(g.screenWidth);
        guiColorG[i]->setColorOutlineHighlight(paddingColor3);
        guiColorG[i]->setColorFill(paddingColor2);
        
    
    guiColorG[i]->addSlider("Red", 0,255,&red[i]);
    guiColorG[i]->addSlider("Green", 0,255,&green[i]);
    guiColorG[i]->addSlider("Blue", 0,255,&blue[i]);
        
        guiColorG[i]->autoSizeToFitWidgets();
        
        ofAddListener(guiColorG[i]->newGUIEvent, this, &ofApp::guiEvent);
        
        guiColorG[i]->loadSettings(ofxiOSGetDocumentsDirectory()+"settingsColor"+ofToString(i)+".xml");
        guiColorG[i]->setVisible(false);
    }
    //
UIrect.set(0,guiShape->getRect()->y,g.screenWidth,guiShape->getRect()->getHeight()+(g.screenHeight/20));
    //guiShape->loadSettings("settings.xml");
}
