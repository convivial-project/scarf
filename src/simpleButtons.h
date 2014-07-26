#pragma once

#include "ofMain.h"
//#include "ofxiPhone.h"
//#include "ofxiPhoneExtras.h"
//#include "ofxXmlSettings.h"
//#include "ofxTextSuite.h"
#include "globalVar.h"

class simpleButtons {
	
    public:
    
    simpleButtons();
    virtual ~simpleButtons(){};
        void setupSimpleButtons(int x,int y, int w,int h, string imgLocation,int linkModel, int indexNum);
    
        void setupSimpleButtons(int x,int y, int w,int h,int linkModel, int indexNum);
    
        bool updateSimpleButtons(int tapX, int tapY,int prevTapX, int prevTapY);
        void drawSimpleButtons();
        ofRectangle getDimension();
    
    ofRectangle simpleButtonsRect;
    bool buttonState;
    ofImage buttonImage;
    ofRectangle imgSize;
    
    int mylinkModel;
    int indexLink;
	
};


