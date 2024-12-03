ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
PFont TCfont;
int lives = 3;                  // 玩家初始生命值
int coins = 10;                 // 玩家金幣數
int kills = 0;                  // 玩家消滅怪物數
int level = 0;                  // 目前關卡
int enemySpawnInterval = 3000;  // 敵人產出間隔時間（10 秒）
int lastEnemySpawnTime = 0;     // 上次敵人產生的時間
int enemyNumber[] = {10,15,20};          // 勝利條件：每一關有多少數量的敵人
int scene;                      // 0開始畫面 1結束畫面 2~4遊戲畫面 
int towerPos[][][] = {{{200,150},{300,250},{400,150},{150,250}}}; // 防禦塔位置
String endmessage = "";         //遊戲結束訊息

void setup() {
  size(600, 400);
  TCfont = createFont("NaikaiFont-Bold.ttf", 28); //建立字形庫
  textFont(TCfont);
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
    if(mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height/2 - 50 && mouseY < height/2 + 50){
      scene = 2;
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
