int x = 200; // 角色的初始x座標
int y = 200; // 角色的初始y座標
int speed = 3; // 移動速度
int size = 40; // 角色的大小
int move1 = 0;

int pipeWidth = 50; // 水管的寬度
int pipeGap = 120; // 水管的上下間距
int pipeX = 600; // 初始水管的x座標
int pipeY = int(random(50, 250)); // 水管的隨機y座標
int pipeX2 = 600;
int pipeY2 = int(random(50, 250));
int[][] cloud = new int[2][2];

int msSec = 0; // millisecond
int counter = 20;
boolean startSwitch = false;

int score = 0;
boolean scoreCounted = false;

PImage img1,img2,cloudimg;

boolean rightPressed = false;
boolean upPressed = false;
boolean gameOver = false;

void setup() {
  size(600, 600);
  
  img1 = loadImage("bird1.png");
  img2 = loadImage("bird2.png");
  cloudimg = loadImage("cloud.png");
  
  frameRate(60);

  for(int i = 0 ; i<2 ; i++){
    cloud[i][0] = int(random(0,500));
    cloud[i][1] = int(random(i*200, i*200+200));
  }
}

void draw() {
  background(255);
  
  if(!gameOver && startSwitch) {
    //畫背景
    strokeWeight(3);
    stroke(110,180,255);
    fill(130,200,255);
    for(int i = move1 ; i<660+move1 ; i+=60){
      for(int j = 0 ; j<600 ; j+=60){
        square(i, j, 60);
      }
    }

    for(int i = 0 ; i<cloud.length ; i++){
      image(cloudimg, cloud[i][0], cloud[i][1], 200, 200);
    }

    // 生成新水管
    if(pipeX <= -pipeWidth){
      pipeY = int(random(50, 300));
      pipeX = 600;
      scoreCounted = false;
    }
    
    // 檢查按鍵狀態
    if (rightPressed) {
      pipeX -= 8;
      move1 -= 3;
      for(int i = 0 ; i<2 ; i++){
        cloud[i][0] -= 5;
        if(cloud[i][0]<-220){
          cloud[i][0] = int(random(600,900));
          cloud[i][1] = int(random(i*200, i*200+200));
        }
      }
      if(move1<-60){
        move1+=60;
      }
    }
    if (upPressed) {
      y -= 5;
    }
    y+=2;
    
    // 限制角色不會超出畫面
    x = constrain(x, 0, width - size);
    y = constrain(y, -25, height - size*2 +30);
    
    // 碰撞檢測
    if(checkCollision()) {
      gameOver = true;
    }
    
    // 計分檢測
    if(!scoreCounted && pipeX + pipeWidth < x) {
      score++;
      scoreCounted = true;
    }
    
    timeCounter();
    
    // 畫出角色
    if(counter%2==0){
      image(img1,x, y, size, size*2);
    }
    else{
      image(img2, x, y, size, size*2);
    }
    
    //畫水管
    strokeWeight(5);
    stroke(0, 100, 0);
    fill(34, 139, 34);
    rect(pipeX, 0, pipeWidth, pipeY); // 上水管
    rect(pipeX, pipeY + pipeGap, pipeWidth, height - pipeY - pipeGap); // 下水管
    
    // 顯示分數
    fill(0);
    textSize(32);
    text("Score: " + score, 20, 40);
  } else if(gameOver) {
    // 遊戲結束畫面
    fill(255, 0, 0);
    textSize(48);
    text("Game Over!", width/2 - 120, height/2);
    textSize(32);
    text("Final Score: " + score, width/2 - 80, height/2 + 50);
    text("Press R to restart", width/2 - 100, height/2 + 100);
  } else {
    noStroke();
    fill(0, 0, 255);
    rect(240,267,140,60);
    fill(255,255,255);
    textSize(20);
    text("start the game",250,300);
    
    if(mouseX > 240 && mouseX < 380 && mouseY > 267 && mouseY < 327){
      cursor(HAND);
    }
    else{
      cursor(ARROW);
    }
    startKey();
  }
}

boolean checkCollision() {
  float birdLeft = x;
  float birdRight = x + size;
  float birdTop = y + 25;
  float birdBottom = y + size*2 - 35;
  
  boolean topPipeCollision = (birdRight > pipeX && birdLeft < pipeX + pipeWidth && birdTop < pipeY);
  boolean bottomPipeCollision = (birdRight > pipeX && birdLeft < pipeX + pipeWidth && birdBottom > pipeY + pipeGap);
  
  return topPipeCollision || bottomPipeCollision;
}

void startKey(){
  if(mouseX > 240 && mouseX < 380 && mouseY > 267 && mouseY < 327 && mousePressed){
    resetGame();
  } else if(!startSwitch) {
    counter = 20;
    msSec = 0;
  }
}

void timeCounter(){
  msSec++;
  if(msSec == 60){
    counter--;
    msSec = 0;
  }
    
  if(counter > 0){
    fill(0, 0, 255);
    textSize(40);
    text(counter, 530, 530);
  } else {
    startSwitch = false;
    gameOver = true;
  }
}

// 新增：重設遊戲的函數
void resetGame() {
    startSwitch = true;
    gameOver = false;
    score = 0;
    x = 200;
    y = 200;
    pipeX = 600;
    counter = 20;  // 重設計時器
    msSec = 0;     // 重設毫秒計數
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      rightPressed = true;
    }
    if (keyCode == UP) {
      upPressed = true;
    }
  }
  // 重新開始遊戲
  if (key == 'r' || key == 'R') {
    if(gameOver) {
      resetGame();  // 使用重設函數
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      rightPressed = false;
    }
    if (keyCode == UP) {
      upPressed = false;
    }
  }
}