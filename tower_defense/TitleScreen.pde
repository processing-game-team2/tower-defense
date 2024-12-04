PFont font; // Font for the text
PImage previous;
String crawlText = "很久以前有一位叫卡皮巴拉的國王\n"
                 + "在他的統治下人民過的淒慘\n"
                 + "他無惡不作，而人民受夠了卡皮巴拉的統治\n"
                 + "他們聯合把卡皮巴拉從王位上拉了下來\n"
                 + "最終，他被流放至遙遠的邊疆\n"
                 + "在無人知曉的地方失去了生命\n\n"
                 + "卡皮巴拉不甘心就這樣死去\n"
                 + "他的執念匯聚了周圍的不祥之氣\n"
                 + "聚集的亡魂展開攻勢，朝著他曾風光無比的\n"
                 + "「城堡」\n";
float scrollSpeed=3,yOffset=0;
boolean showTitle=false;
int page=0;
//PImage Title;

void setup(){
    fullScreen(P3D);
    font=createFont("NaikaiFont-Bold.ttf",50,true);
    textFont(font);
    yOffset=height;
    //Title=loadImage("title.png");
    previous=loadImage("previous.png");
}
void draw(){
    if(!showTitle){
        Recap();
    }
    if(showTitle){
        if(page==0){
            TitleScreen();
        }else if(page==1){
            Rule();
        }else if(page==2){
            About();
        }
    }
    Copyright();
}
void TitleScreen(){
    background(#858585);//Change to title screen background
    noStroke();
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    fill(#cca87c);
    rect(width/2,height/2+100,500,150,50);
    rect(width/2,height/2+300,500,150,50);
    rect(width/2,height/2+500,500,150,50);
    fill(255);
    textSize(80);
    for(int i=-2;i<=2;i+=1){
        for(int j=-2;i<=2;i+=1){
            text("開始遊戲",width/2,height/2+100);
        }
    }
    for(int i=-2;i<=2;i+=1){
        for(int j=-2;i<=2;i+=1){
            text("規則說明",width/2,height/2+300);
        }
    }
    for(int i=-2;i<=2;i+=1){
        for(int j=-2;i<=2;i+=1){
            text("關於我們",width/2,height/2+500);
        }
    }
    if(mousePressed&&mouseX>=width/2-250&&mouseX<=width/2+250&&mouseY>=height/2+25&&mouseY<=height/2+175){
        //switch to start
    } 
    if(mousePressed&&mouseX>=width/2-250&&mouseX<=width/2+250&&mouseY>=height/2+225&&mouseY<=height/2+375){
        page=1;
    } 
    if(mousePressed&&mouseX>=width/2-250&&mouseX<=width/2+250&&mouseY>=height/2+425&&mouseY<=height/2+575){
        page=2;
    } 
}
void Previous(){
    fill(#cca87c);
    rect(100,100,100,100,50);
    imageMode(CENTER);
    image(previous,100,100,80,80);
    if(mousePressed&&mouseX>=50&&mouseX<=150&&mouseY>=50&&mouseY<=150){
        page=0;
    }
}
void About(){
    background(#858585); //Change to title screen background
    Previous();
    noStroke();
    rectMode(CENTER);
    fill(#cca87c);
    rect(width/2,150,500,150,50);
    rect(width/4.0,height/4.0,500,150,50);
    rect(width*3/4.0,height/4.0,500,150,50);
    rect(width/4.0,height/2.0,500,150,50);
    rect(width*3/4.0,height/2.0,500,150,50);
    rect(width/4.0,height*3/4.0,500,150,50);
    rect(width*3/4.0,height*3/4.0,500,150,50);
    fill(255);
    textAlign(CENTER,CENTER);
    text("關於我們",width/2.0,150);
    text("文本",width/4.0,height/4.0);
    text("41073234H 蔡茂豐",width/4.0,height*3/8.0);
    text("美工",width*3/4.0,height/4.0);
    text("41347025S 郭文仲",width*3/4.0,height*3/8.0);
    text("場景",width/4.0,height/2.0);
    text("41347021S 李宥廷",width/4.0,height*5/8.0);
    text("敵人",width*3/4.0,height/2.0);
    text("41347013S 趙偉恆",width*3/4.0,height*5/8.0);
    text("音效",width/4.0,height*3/4.0);
    text("41347009S 周聖詠",width/4.0,height*7/8.0);
    text("防禦塔",width*3/4.0,height*3/4.0);
    text("41347014S 姚承希",width*3/4.0,height*7/8.0);
}
void Recap(){
    background(#858585);
    camera(width/2,height/2,(height/2.0)/tan(PI/6.0),width/2,height/2,0,0,1,0);
    translate(width/2,height*1.5,-200);
    rotateX(PI/8.0);
    pushMatrix();
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(100);
    translate(0,yOffset+(height/2),0);
    text(crawlText,0,-height*1.6);
    popMatrix();
    yOffset-=scrollSpeed;
    if(yOffset<-height*2){
        showTitle=true;
    }
}
void Rule(){
    background(#858585);
    Previous();
    noStroke();
    rectMode(CENTER);
    fill(#cca87c);
    rect(width/2,150,500,150,50);
    fill(255);
    textAlign(CENTER,CENTER);
    text("規則說明",width/2.0,150);
}
void Copyright(){
    textAlign(RIGHT,BOTTOM);
    fill(0);
    textSize(50);
    text("Copyright © All Rights Reserved",width-10,height-10);
}
