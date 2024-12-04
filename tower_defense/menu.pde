// 開始選單
void menu(){
  if(start==0){//start key
    background(255);
    fill(50);
    noStroke();
    rect(width/2 - 100, height/2 - 50, 200, 100);
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255);
    text("start!", width/2, height/2);
  }
  else{//choose level
    //println("hello");
    background(255);
    fill(50);
    noStroke();                                    //第一關選單
    rect(width/2 - 100, height - 375, 200, 100);
    //textAlign(CENTER,CENTER-50);
    textSize(50);
    fill(255);
    text("第一關", width/2, height-325);
    fill(50);
    noStroke();                                      //第二關選單
    rect(width/2 - 100, height - 250, 200, 100);
    //textAlign(CENTER,CENTER);
    textSize(50);
    fill(255);
    text("第二關", width/2, height-200);
    fill(50);
    noStroke();                                      //第三關選單
    rect(width/2 - 100, height-125, 200, 100);
    //textAlign(CENTER,CENTER+50);
    textSize(50);
    fill(255);
    text("第三關", width/2, height-75);
    //println("hello");
  }
}

// 遊戲結束畫面
void end(){
  background(255);
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(endmessage, width / 2, height / 2);
}
