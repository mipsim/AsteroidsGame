////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Star [] stars = new Star[600];

ArrayList <Asteroid> astList = new ArrayList <Asteroid>();

SpaceShip player;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void setup() 
{
  size(1080,750);

  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star(i);
  }

  for (int i = 0; i < astList.size(); i++)
  {
    Asteroid asteroids = new Asteroid(i);
    astList.add(asteroids);
  }

  player = new SpaceShip();
  player.setX(540);
  player.setY(375);
  player.setDirectionX(0);
  player.setDirectionY(0); 
}

public void draw() 
{
  background(0);

  for (int i = 0; i < stars.length; i++)
  {
    stars[i].show();
    stars[i].move();
  }

  keyTyped();
  player.show();
  player.move();
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

public void keyTyped()
{
  if (keyPressed == true)
   {
    if( key == 'w' || key == 'W' )
    {
      player.accelerate(0.05);
    }
    
    else if( key == 's' || key == 'S')
    {
      player.setDirectionX(0);
      player.setDirectionY(0);
      player.setPointDirection((int)(Math.random()*360));
      player.setX((int)(Math.random()*1080));
      player.setY((int)(Math.random()*750));
    }
   

    else if( key == 'd' || key == 'D')
    {
      player.rotate(10);
    }

    else if( key == 'a' || key == 'A')
    {
      player.rotate(-10);
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class SpaceShip extends Floater  
{ 
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

  public Asteroid(int arg)
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