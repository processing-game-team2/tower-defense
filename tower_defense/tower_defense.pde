ArrayList<Enemy> enemies = new ArrayList<Enemy>();
ArrayList<Tower> towers = new ArrayList<Tower>();
int lives = 3;               // 玩家初始生命值
int coins = 0;               // 玩家金幣數
int kills = 0;               // 玩家消滅怪物數
int enemySpawnInterval = 3000; // 敵人產出間隔時間（10 秒）
int lastEnemySpawnTime = 0;     // 上次敵人產生的時間
PFont TCfont;
int WIN_CONDITION = 3; // 勝利條件：消滅三隻怪物

void setup() {
  size(600, 400);
  TCfont = createFont("NotoSansTC-Regular.otf", 28); //建立字形庫
  textFont(TCfont);
  towers.add(new Tower(300, 200, 100));  // 初始化防禦塔(x,y,range)
}

void draw() {
  background(255);

  // 檢查遊戲是否結束（勝利或失敗）
  if (lives <= 0) {
    displayEndMessage("遊戲結束");
    return;
  }
  if (kills >= WIN_CONDITION) {
    displayEndMessage("遊戲勝利");
    return;
  }

  // 顯示生命值與金幣數
  fill(0);
  textSize(16);
  text("生命值: " + lives, width - 120, 30);
  text("金幣: " + coins, width - 120, 50);

  // 生成敵人
  if (millis() - lastEnemySpawnTime >= enemySpawnInterval) {
    enemies.add(new Enemy(0, 200, 2)); //(x,y,speed)
    lastEnemySpawnTime = millis();         // 更新敵人生成時間
  }

  // 更新和顯示敵人
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.display();

    // 如果敵人到達螢幕右邊，扣除玩家生命值並移除敵人
    if (enemy.x > width) {
      lives--;
      enemies.remove(i);
    } else if (enemy.health <= 0) {
      // 敵人被消滅，增加金幣與擊殺數，並移除敵人
      coins++;
      kills++;
      enemies.remove(i);
    }
  }

  // 更新和顯示防禦塔
  for (int i = towers.size() - 1; i >= 0; i--) {
    Tower tower = towers.get(i);
    tower.shoot(enemies);
    tower.display();
  }
}

// 顯示結束訊息
void displayEndMessage(String message) {
  fill(0);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(message, width / 2, height / 2);
  noLoop();  // 停止 draw() 的迴圈
}

void mousePressed() {
  // 使用三枚金幣新增防禦塔
  if (coins >= 3) {
    towers.add(new Tower(mouseX, mouseY, 100));
    coins -= 3;  // 扣除金幣
  }
}
