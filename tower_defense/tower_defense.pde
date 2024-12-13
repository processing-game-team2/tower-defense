ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
PFont TCfont;
PImage level1, level2, level3, tower_img, chill_enemy, usagi_enemy, bubble,title;
PImage previous;

import ddf.minim.*;             //deal with sound
Minim minim;
AudioPlayer in;                 //click sound
AudioPlayer bump;               //bomb sound

int lives = 3;                  // 玩家初始生命值
int coins = 6;                  // 玩家金幣數
int kills = 0;                  // 玩家消滅怪物數
int leftenemy=0;                // 剩餘敵人數
int level = 0;                  // 目前關卡
int enemySpawnInterval = 3000;  // 敵人產出間隔時間（10 秒）
int lastEnemySpawnTime = 0;     // 上次敵人產生的時間
int enemyNumber[] = {3,15,20};  // 勝利條件：每一關有多少數量的敵人
int scene = 0;                  // 0Recap 1TitleScreen 2menu 3Rule 4About 5end 11~13game
int start=0;                    // 確認使用者是否已經點選開始
int level3_entry=1;
float scrollSpeed=2,yOffset=0;
// 防禦塔位置
int towerPos[][][] = {{{200,100},{300,280},{400,110},{150,270}},//level 1
{{80,85},{280,45},{230,300},{505,345},{500,130}},   //level 2
{{210,100},{40,170},{365,200},{210,250},{300,350}}};            //level 3
String endmessage = "";         //遊戲結束訊息

void setup() {
  size(600, 400, P3D);
  TCfont = createFont("NaikaiFont-Bold.ttf", 50); //建立字形庫
  textFont(TCfont);
  title = loadImage("title.png");
  level1 = loadImage("level1.png");
  level2 = loadImage("level2.png");
  level3 = loadImage("level3.png");
  tower_img = loadImage("tower.png");
  chill_enemy = loadImage("chill_enemy.png");
  usagi_enemy = loadImage("usagi_enemy.png");
  bubble = loadImage("bubble.png");
  scene = 0;
  yOffset=height;
    //Title=loadImage("title.png");
  previous=loadImage("previous.png");
  
  minim = new Minim(this);
  in = minim. loadFile("clickSound.mp3");
  in.setGain(-20);
  minim = new Minim(this);
  bump = minim. loadFile("bomb.mp3");
  bump.setGain(-20);
}

void draw() {
  if(scene == 0){
    Recap();
    Copyright();
  }
  else if(scene == 1){
    TitleScreen();
    Copyright();
  }
  else if(scene == 2){//start and choose level
    menu();
    Copyright();
  }
  else if(scene == 3){//rule
    Rule();
  }
  else if(scene == 4){//about us
    About();
    Copyright();
  }
  else if(scene == 5){//end
    end();
  }
  else{
    game();
  }
  
}

void mousePressed() {
  in.pause();
  // 開始畫面點擊事件
  if(scene == 2 || scene == 3 || scene == 4){
    if(mouseX>=25 && mouseX<=75 && mouseY>=35 && mouseY<=105){//返回
      in.rewind();
      in.play();
      scene = 1;
    }
  }

  if(scene == 0){
    if(mouseX >= width - 100 && mouseX <= width - 20 && mouseY >= height - 50 && mouseY <= height - 20){//跳過
      in.rewind();
      in.play();
      scene = 1;
      
    }
  }

  else if(scene == 1){
    if(mouseX>=width/2.0-65 && mouseX<=width/2.0+65 && mouseY>=height/2+65 && mouseY<=height/2+135){
        in.rewind();
        in.play();
        scene = 2;
    } 
    if(mouseX>=width/4.0-65 && mouseX<=width/4.0+65 && mouseY>=height/2+65 && mouseY<=height/2+135){
        in.rewind();
        in.play();
        scene = 3;
    } 
    if(mouseX>=width*3/4.0-65 && mouseX<=width*3/4.0+65 && mouseY>=height/2+65 && mouseY<=height/2+135){
        in.rewind();
        in.play();
        scene = 4;
    } 
  }

  else if(scene == 2){
    if(mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= height - 375 && mouseY <= height-275){//選擇第一關
      in.rewind();
      in.play();
      scene=11;
      game_init();
    }
    else if(mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= height - 250 && mouseY <= height-150){//選擇第二關
      in.rewind();
      in.play();
      scene=12;
      game_init();
    }
    else if(mouseX >= width/2 - 100 && mouseX <= width/2 + 100 && mouseY >= height-125 && mouseY <= height-25){//選擇第三關
      in.rewind();
      in.play();
      scene=13;
      game_init();
    }
  }

  else if(scene == 5){
    if(mouseX >= 180 && mouseX <= 280 && mouseY >= 250 && mouseY <= 320){ //回主頁
      in.rewind();
      in.play();
      scene=1;
    }
    if(mouseX >= 320 && mouseX <= 420 && mouseY >= 250 && mouseY <= 320){ //離開
      in.rewind();
      in.play();
      exit();
    }
  }

  // 遊戲中點擊事件
  else if(scene >= 11 && scene <= 13){
    for(Tower tower : towers){
      tower.mouse(mouseX, mouseY);
    }
  }
}
