#pragma once
#include "ofMain.h"


#define SHAPE 0
#define COLOR 1
#define BUY 2
#define ABOUT 3
#define NOTHING 4
#define DISCLAIMER 5
#define EMPTY 6

/*
OVERALL STYLING
 */
#define MARGINRIGHT 0.06
#define MARGINLEFT 0.06
#define MARGINTOP 0.04
#define MARGINBOTTOM 0.04


#define SPACINGLIST 2
#define NORMALSPACING 6



extern BOOL isRetina,iphone5,isiPad;
extern float scaleWidth,scaleHeight, windowWidth,windowHeight;

class globalVar {
public:
    globalVar();
    virtual ~globalVar(){};
    
    void setup();
int screenWidth,screenHeight;
    float marginBottom,marginRight,marginTop,marginLeft;
    int retinaScale;
    
};




