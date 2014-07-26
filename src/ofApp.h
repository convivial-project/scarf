#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#include "ofxGui.h"
#include "ofxUI.h"
#include "simpleButtons.h"
#include "globalVar.h"
//#include "ofxEasyTextBlock.h"
//#include "ofxFontStash.h"

#include "ofxTextSuite.h"
#include "ofxColorGradient.h"

#define MAX_COLOR 7
#define MIN_COLOR 2
//#define widthScarf 768//2580
//#define heightScarf 1024//2580



//#define widthPreview 768
//#define heightPreview 1024

class ofApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
	
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
  
    void guiEvent(ofxUIEventArgs &e);
    void setupGui();

    ofTrueTypeFont font;
    ofShader shader;
    
    ofShader shader2;
    
    bool doShader;
    
    //ofxControlPanel gui;
    ofxPanel gui;
   // ofxFloatSlider red[2];
   // ofxFloatSlider green[2];
   // ofxFloatSlider blue[2];
    
    //float red[2];
	//float green[2];
	//float blue[2];
    
    float timeMotion;
    float fluidity[3];
    ofxIntSlider fluidityI;
    
    ofxFloatSlider colorBlendingGradientX;
    ofxFloatSlider colorBlendingGradientY;
    
    ofxFloatSlider addBlurSurface1;
    ofxFloatSlider addBlurSurface2;
    
    ofxFloatSlider addInnerSurface1;
    ofxFloatSlider addInnerSurface2;
    
    ofxFloatSlider moveContrast;
    ofxFloatSlider fillThreshold;
    
    float width;
    float height;
    
    //int wVid;
    //int hVid;
    
    //ofxIntSlider scale;
    float scale;
    
    int name;
    bool takingStill;
    bool saveVideo=false;
    
    ofFbo FBO;
    
    ofImage background; //initially I got some weird artifacts without creating a background image large enough for your print it drew part of my screen desktop to the FBO...
    ofPixels pix;
    ofPixels vidPix;
    
     //ofxUICanvas *GUI;
    
    globalVar g;
    simpleButtons bt[4];
    simpleButtons buy[2];
    
    simpleButtons btColor[MAX_COLOR];
    simpleButtons btPlus;
    simpleButtons btMinus;
    simpleButtons btLink;
    
    //delete this var later
    float complexity;
    
    ofxUICanvas *guiShape;
    ofxUICanvas *guiColor;
    ofxUICanvas *guiColorG[MAX_COLOR];
    
    //ofxUICanvas *guiBuy;
    //ofxUICanvas *guiAbout;

    int prevX;
    int prevY;
    
    int state;
    
    ofRectangle UIrect;
    
    ofxTextBlock   normal;
    ofxTextBlock   bold;
    
    ofxTextBlock   textDescription;
    ofxTextBlock   textTitleDescription;
    ofxTextBlock   textLinkWebsite;
    ofxTextBlock   textTechnology;
    ofxTextBlock   textTitleTechnology;
    ofxTextBlock   textSend;
    ofxTextBlock   textCapture;
    ofxTextBlock   textColor;
    ofxTextBlock   textShape;
    ofxTextBlock   textDisclaimer;
    
    ofTrueTypeFont * ttf;
    
    ofImage gradient;
    
    ofxColorGradient grad;
    float red[MAX_COLOR],green[MAX_COLOR],blue[MAX_COLOR];
  
    
    float widthThings;
    float xThings;
    
    
    
    int currentColorNum=MIN_COLOR;
    
    float bWidth;
    float bWidth2;
    ofxXmlSettings xml;
    
    
    int flashLight;
    
    bool debugTouch=false;
    int debugX;
    int debugY;
    
    //ofxiPhoneAppDelegate * delegate = ofxiPhoneGetAppDelegate();
    //ofxiPhoneScreenGrab(delegate);
};

