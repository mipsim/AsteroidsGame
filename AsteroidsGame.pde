/////////////////////////////////////////////////////////////////--GLOBAL--//////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
  //mousePressed();


  //STARS//
  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    stars[i].move();
  }  
  

  //BULLETS//
  for(int i = 0; i < bulletList.size(); i++)
  {
    bulletList.get(i).show();
    bulletList.get(i).move();
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


/////////////////////////////////////////////////////////////////--CLASSES--//////////////////////////////////////////////////////////////////////////////////////////////////////////////


class SpaceShip extends Floater  
{ 
  private boolean inHyperSpace;

  public SpaceShip()
  {
    corners = 4;
    int[] xS = {(int)myCenterX-8, (int)myCenterX+18, (int)myCenterX-8, (int)myCenterX-5};
    int[] yS = {(int)myCenterY-8, (int)myCenterY, (int)myCenterY+8, (int)myCenterY}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

    inHyperSpace = false;
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Star extends Floater
{
  private int starSize;
  private int myColor2;
  private int myColor3;

  public Star(int arg)
  {
    myColor = (int)(Math.random()*255);
    myColor2 = (int)(Math.random()*255);
    myColor3 = (int)(Math.random()*255);
    myCenterX = (int)(Math.random()*1080);
    myCenterY = (int)(Math.random()*750);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    starSize = (int)(Math.random()*3);
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move () 
  {      
    if (keyPressed == true)
    {
      if( key == 'w' || key == 'W' )
      {
        accelerate(-0.004);
      }
    }

    else if( key == 'd' || key == 'D')
    {
      rotate(10);
    }

    else if( key == 'a' || key == 'A')
    {
      rotate(-10);
    }

    super.move();   
  }

  public void show()
  {
    fill(myColor,myColor2,myColor3);
    noStroke();
    ellipse((int)myCenterX, (int)myCenterY, starSize, starSize);
  }   
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Asteroid extends Floater
{
  private int astRotation;

  public Asteroid()
  {
    corners = 6;
    int[] xS = {(int)myCenterX-12, (int)myCenterX-21, (int)myCenterX-12, (int)myCenterX+12, (int)myCenterX+21, (int)myCenterX+12};
    int[] yS = {(int)myCenterY-18, (int)myCenterY, (int)myCenterY+18, (int)myCenterY+18, (int)myCenterY, (int)myCenterY-18}; 
    xCorners = xS;
    yCorners = yS;
    myColor = (int)(Math.random()*75+75);
    myCenterX = (int)(Math.random()*1080);
    myCenterY = (int)(Math.random()*750);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    astRotation = (int)(Math.random()*3-1);
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move () 
  { 
    if (astRotation == 0)
    {
      astRotation = -1;
    }

    rotate(astRotation);

    super.move();   
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Asteroidbits extends Floater
{
  private int astRotation;

  public Asteroidbits()
  {
    corners = 6;
    int[] xS = {(int)myCenterX-6, (int)myCenterX-15, (int)myCenterX-6, (int)myCenterX+6, (int)myCenterX+15, (int)myCenterX+6};
    int[] yS = {(int)myCenterY-12, (int)myCenterY, (int)myCenterY+12, (int)myCenterY+12, (int)myCenterY, (int)myCenterY-12}; 
    xCorners = xS;
    yCorners = yS;
    myColor = (int)(Math.random()*75+75);
    myCenterX = (int)(Math.random()*1080);
    myCenterY = (int)(Math.random()*750);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    astRotation = (int)(Math.random()*3-1);
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void move () 
  { 
    if (astRotation == 0)
    {
      astRotation = -1;
    }

    rotate(astRotation);

    super.move();   
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Bullet extends Floater
{
  private int bulletRotation;

  public Bullet(SpaceShip theShip)
  {
    corners = 4;
    int[] xS = {(int)myCenterX-4, (int)myCenterX+8, (int)myCenterX+4, (int)myCenterX-8};
    int[] yS = {(int)myCenterY-4, (int)myCenterY-4, (int)myCenterY+4, (int)myCenterY+4}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;
    myPointDirection = theShip.myPointDirection;
    double dRadians =myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.myDirectionX;
    myDirectionY = 5 * Math.sin(dRadians) + theShip.myDirectionY;

    bulletRotation = 100;
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return  (int)(myCenterX);}  
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)(myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void show()
  {
    fill(0,255,255);
    noStroke();               
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);
  }

  public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;

    rotate(bulletRotation); 
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 
 
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   

  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   

  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  } 

  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}