ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
PFont TCfont;
PImage level1,level2,level3;
int lives = 3;                  // 玩家初始生命值
int coins = 10;                 // 玩家金幣數
int kills = 0;                  // 玩家消滅怪物數
int leftenemy=0;                // 剩餘敵人數
int level = 0;                  // 目前關卡
int enemySpawnInterval = 3000;  // 敵人產出間隔時間（10 秒）
int lastEnemySpawnTime = 0;     // 上次敵人產生的時間
int enemyNumber[] = {3,15,20};  // 勝利條件：每一關有多少數量的敵人
int scene;                      // 0開始畫面 1結束畫面 2~4遊戲畫面 
int start=0;                      // 確認使用者是否已經點選開始
                      //first level                              second level
int towerPos[][][] = {{{200,150},{300,250},{400,150},{150,250}},{{50,150},{125,100},{200,200},{200,250},{300,150},{400,150}}}; // 防禦塔位置
String endmessage = "";         //遊戲結束訊息

void setup() {
  size(600, 400);
  TCfont = createFont("NaikaiFont-Bold.ttf", 28); //建立字形庫
  textFont(TCfont);
  level1 = loadImage("level1.png");
  level2 = loadImage("level2.png");
  level3 = loadImage("level3.png");
  scene = 0;
}

void draw() {
  if(scene == 0){
    menu();
  }
  else if(scene == 1){
    end();
  }
  else{
    game();
  }
}

void mousePressed() {
  // 開始畫面點擊事件
  if(scene == 0){
    if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 50 && mouseY < height/2 + 50 && start==0){
      start=1;
      menu();
    }
    else if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height - 375 && mouseY < height-275 && start==1){//選擇第一關
      scene=2;
      game_init();
    }
    else if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height - 250 && mouseY < height-150 && start==1){//選擇第二關
      scene=3;
      game_init();
    }
    else if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height-125 && mouseY < height-25 && start==1){//選擇第三關
      scene=4;
      game_init();
    }
  }

  // 結束畫面點擊事件
  else if(scene == 1){
  }

  // 遊戲中點擊事件
  else{
    for(Tower tower : towers){
      tower.mouse(mouseX, mouseY);
    }
  }
}
