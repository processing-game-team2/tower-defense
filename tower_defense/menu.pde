// 開始選單
void menu(){
  background(#858585);

  Previous();

  rectMode(CORNER); 
  fill(#cca87c);
  noStroke();                                    //第一關選單
  rect(width/2 - 100, height - 375, 200, 100, 25);
  textAlign(CENTER,CENTER);
  textSize(50);
  fill(255);
  text("簡單", width/2, height-325);

  fill(#cca87c);                    //第二關選單
  rect(width/2 - 100, height - 250, 200, 100, 25);
  textAlign(CENTER,CENTER);
  fill(255);
  text("一般", width/2, height-200);

  fill(#cca87c);                                    //第三關選單
  rect(width/2 - 100, height-125, 200, 100, 25);
  textAlign(CENTER,CENTER);
  fill(255);
  text("困難", width/2, height-75);
}

// 遊戲結束畫面
void end(){
  background(#858585);
  rectMode(CORNER); 
  fill(255);
  textSize(50);
  textAlign(CENTER, CENTER);
  text(endmessage, width / 2, 150);

  // 回主頁、離開按鈕
  fill(#cca87c);
  noStroke();
  rect(180, 250, 100, 70, 25);
  rect(320, 250, 100, 70, 25);
  textAlign(CENTER, CENTER);
  textSize(28);
  fill(255);
  text("回主頁", 230, 285);
  text("離開", 370, 285);
}
