void game(){
  //background
  if(scene==11) background(level1);
  if(scene==12) background(level2);
  if(scene==13) background(level3);
  
  // 顯示生命值與金幣數
  //leftenemy=enemyNumber
  fill(0);
  textSize(16);
  textAlign(RIGHT,TOP);
  text(String.format("生命值:%2d", lives), width-20, 30);
  // text("生命值: " + lives, width-20, 30);
  text(String.format("金幣:%2d", coins), width-20, 50);
  text(String.format("剩餘敵人數:%2d", enemyNumber[scene-11]-kills), width-20, 70);
  // text("金幣: " + coins, width-20, 50);
  // text("剩餘敵人數: "+(enemyNumber[scene-11]-kills), width-20, 70);
  
  // 生成敵人
  if (millis() - lastEnemySpawnTime >= enemySpawnInterval) {
    enemies.add(new Enemy(0, 200, 2)); //(敵人初始x,敵人初始y,speed)
    lastEnemySpawnTime = millis();         // 更新敵人生成時間
  }

  // 更新和顯示敵人，及敵人移動
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
    scene = 5;
  }
  else if (kills >= enemyNumber[level]){//game end
    endmessage = "VICTORY";
    scene = 5;
  }
  /*if (kills >= enemyNumber[level]) {
    level++;
    if(level==1){
      //println("check");
      start=0;
      scene=0;
      menu();
    }
    if(level==2){
      start=0;
      scene=0;
      menu();
    }
    if(level==3){//game end
      endmessage = "VICTORY";
      scene = 1;
    }
  }*/
}

// 遊戲初始化
void game_init(){
  // 新增防禦塔
  for(int i[] : towerPos[scene-11]){
    towers.add(new Tower(i[0], i[1]));
  }
  lives = 3;
  coins = 10;
  kills = 0;
  enemySpawnInterval = 3000;
  lastEnemySpawnTime = 0;
  // println("init complete");
}
