void game(){
  background(255);

  // 顯示生命值與金幣數
  fill(0);
  textSize(16);
  text("生命值: " + lives, width - 120, 30);
  text("金幣: " + coins, width - 120, 50);
  text("消滅敵人數: "+kills, width-120, 70);

  // 生成敵人
  if (millis() - lastEnemySpawnTime >= enemySpawnInterval) {
    enemies.add(new Enemy(0, 200, 2)); //(敵人初始x,敵人初始y,speed)
    lastEnemySpawnTime = millis();         // 更新敵人生成時間
  }

  // 更新和顯示敵人，及敵人移動
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy enemy = enemies.get(i);
    if(scene==2) enemy.move1();//first level
    if(scene==3) enemy.move2();//second level
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
  for (Tower tower : towers) {
    tower.shoot(enemies);
    tower.display();
  }

  // 更新子彈
  for(int i = bullets.size() - 1; i >= 0; i--){
    Bullet bullet = bullets.get(i);
    if(bullet.show() <= 0){ //子彈射到敵人
      bullet.to.health -= bullet.from.damage;
      bullets.remove(i);
    }
  }

  // 檢查遊戲是否結束（勝利或失敗）
  if (lives <= 0) {
    endmessage = "DEFEAT";
    scene = 1;
  }
  if (kills >= enemyNumber[level]) {
    level++;
    if(level==1) scene=3;
    if(level==2) scene=4;
    if(level==3){//game end
      endmessage = "VICTORY";
      scene = 1;
    }
  }
}

// 遊戲初始化
void game_init(){
  // 新增防禦塔
  for(int i[] : towerPos[scene-2]){
    towers.add(new Tower(i[0], i[1]));
  }
  lives = 3;
  coins = 10;
  kills = 0;
  enemySpawnInterval = 3000;
  lastEnemySpawnTime = 0;
}
