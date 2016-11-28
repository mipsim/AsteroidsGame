//////////////////////////////////////////////////////////////--DECLARATION--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


Star [] stars = new Star[600];

ArrayList <Asteroid> astList = new ArrayList <Asteroid>();

SpaceShip player;

ArrayList <Bullet> bulletList = new ArrayList <Bullet>();


/////////////////////////////////////////////////////////////////--SETUP--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void setup() 
{
  size(1080,750);


  //STARS//
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(i);
  }


  //PLAYERS//
  player = new SpaceShip();
  player.setX(540);
  player.setY(375);
  player.setDirectionX(0);
  player.setDirectionY(0); 


  //ASTEROIDS//
  for (int i = 0; i < 16; i++)
  {
    astList.add(new Asteroid());

    astList.get(i).setDirectionX((int)(Math.random()*3-1));
    if (astList.get(i).myDirectionX == 0) {astList.get(i).setDirectionX(-1);}

    astList.get(i).setDirectionY((int)(Math.random()*3-1));
    if (astList.get(i).myDirectionY == 0) {astList.get(i).setDirectionY(-1);}
  }
}


//////////////////////////////////////////////////////////////////--DRAW--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void draw() 
{
  background(0);


  keyTyped();


  //STARS//
  for (Star starTemp : stars)
  {
    starTemp.show();
    starTemp.move();
  }  
  

  //BULLETS//
  for(Bullet bullets : bulletList)
  {
    bullets.setBulletRotation(100);
    bullets.show();
    bullets.move();
  }


  //SHIP//
  player.show();
  player.move();


  //ASTEROIDS//
  for(int i = 0; i < astList.size(); i++) 
  {
    //Prevents player from losing/taking damage if touches asteroid while in hyperspace
    if (player.inHyperSpace == false && dist((int)player.myCenterX, (int)player.myCenterY, (int)astList.get(i).myCenterX, (int)astList.get(i).myCenterY) < 35 )
    {
      astList.remove(i);
      i--;
    }

    else 
    {
      astList.get(i).show();
      astList.get(i).move();
    }
  }
}


/////////////////////////////////////////////////////////////////--FUNCTIONS--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


public void keyTyped()
{
  if (keyPressed == true)
   {
    if( key == 'w' || key == 'W' )
    {  player.accelerate(0.05); }
    

    else if( key == 's' || key == 'S')
    {
      player.inHyperSpace = true;
      player.setDirectionX(0);
      player.setDirectionY(0);
      player.setPointDirection((int)(Math.random()*360));
      player.setX((int)(Math.random()*1080));
      player.setY((int)(Math.random()*750));
    }
   

    else if( key == 'd' || key == 'D')
    {  player.rotate(10); }


    else if( key == 'a' || key == 'A')
    {  player.rotate(-10); }
  }
  else 
    {player.inHyperSpace = false;}
}


public void mousePressed()
{
  if (mousePressed == true)
  {  bulletList.add(new Bullet(player)); }
}