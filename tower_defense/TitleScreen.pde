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
                 
String rule = "玩法:在設置點中放置防禦塔攻擊敵人。\n"
+"機制:玩家有三條血。當敵人到達終點將扣玩家血量。\n\n"
+"第一關:\n"
+"目標:消滅3隻敵人。\n\n"
+"第二關:\n"
+"目標:消滅15隻敵人。\n\n"
+"第三關:\n"
+"目標:消滅20隻敵人。" ;

void TitleScreen(){
    background(#858585);//Change to title screen background
    textSize(28);
    noStroke();
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    imageMode(CENTER);
    image(title,width/2,height/2-50,500,200);
    fill(#cca87c);
    rect(width/4.0,height/2+100,130,70,25);
    rect(width/2.0,height/2+100,130,70,25);
    rect(width*3/4.0,height/2+100,130,70,25);
    fill(255);
    text("規則說明",width/4.0,height/2+100);
    text("開始遊戲",width/2.0,height/2+100);
    text("關於我們",width*3/4.0,height/2+100);
}
void Previous(){
    rectMode(CENTER);
    fill(#cca87c);
    rect(50,50,70,70,25);
    imageMode(CENTER);
    image(previous,50,50,50,50);
}
void About(){
    background(#858585); //Change to title screen background
    Previous();
    noStroke();
    rectMode(CENTER);
    fill(#cca87c);
    rect(width/2,50,130,70,25);
    rect(width/4.0,height/4.0,130,60,25);
    rect(width*3/4.0,height/4.0,130,60,25);
    rect(width/4.0,height/2.0,130,60,25);
    rect(width*3/4.0,height/2.0,130,60,25);
    rect(width/4.0,height*3/4.0,130,60,25);
    rect(width*3/4.0,height*3/4.0,130,60,25);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(28);
    text("關於我們",width/2.0,50);
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
    pushMatrix();
    camera(width/2,height/2,(height/2.0)/tan(PI/6.0),width/2,height/2,0,0,1,0);
    translate(width/2,height*1.5,-200);
    rotateX(PI/8.0);
    fill(0);
    textSize(50);
    textAlign(CENTER,CENTER);
    translate(0,yOffset+600,0);
    text(crawlText,0,-height*1.6);
    popMatrix();
    yOffset-=scrollSpeed;
    if(yOffset<-height*2){
        scene = 1;
    }
    rectMode(CORNER);
    fill(#cca87c);
    noStroke();
    rect(width-100, height-50,80,30,10);
    fill(255);
    textSize(20);
    text("跳過", width-60, height-35);
}
void Rule(){
    background(#858585);
    Previous();
    noStroke();
    rectMode(CENTER);
    fill(#cca87c);
    rect(width/2,50,130,70,25);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(28);
    text("規則說明",width/2.0,50);
    fill(0);
    textSize(20);
    //textAlign(CENTER,CENTER);
    text(rule,300,240);
}
void Copyright(){
    textAlign(LEFT,BOTTOM);
    fill(0);
    textSize(15);
    text("僅供教育使用", 10, height-30);
    text("Copyright © All Rights Reserved", 10, height-10);
}
