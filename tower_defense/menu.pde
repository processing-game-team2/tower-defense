// 開始選單
void menu(){
    //println("hello");
    background(#858585);
    fill(#cca87c);
    noStroke();                                    //第一關選單
    rect(width/2 - 100, height - 375, 200, 100);
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255);
    text("簡單", width/2, height-325);
    fill(#cca87c);
    noStroke();                                      //第二關選單
    rect(width/2 - 100, height - 250, 200, 100);
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255);
    text("一般", width/2, height-200);
    fill(#cca87c);
    noStroke();                                      //第三關選單
    rect(width/2 - 100, height-125, 200, 100);
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255);
    text("困難", width/2, height-75);
    //println("hello");
  // }
}

// 遊戲結束畫面
void end(){
  background(#858585);
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text(endmessage, width / 2, height / 2);
}
