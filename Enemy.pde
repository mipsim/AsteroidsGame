//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Enemy extends Floater  
{ 
  private int health;
  private boolean collision;
  private boolean dead;
  private int enemyTimer;

  public Enemy()
  {
    corners = 17;
    int[] xS = {(int)myCenterX-11, (int)myCenterX-7, (int)myCenterX, (int)myCenterX+5, (int)myCenterX+10, (int)myCenterX+15, (int)myCenterX+20,
                (int)myCenterX+15, (int)myCenterX+10, (int)myCenterX+5, (int)myCenterX, (int)myCenterX-7, (int)myCenterX-11, (int)myCenterX-11,
                (int)myCenterX-20, (int)myCenterX-20, (int)myCenterX-11};

    int[] yS = {(int)myCenterY-20, (int)myCenterY-15, (int)myCenterY-11, (int)myCenterY-7, (int)myCenterY-7, (int)myCenterY-4, (int)myCenterY,
                (int)myCenterY+4, (int)myCenterY+7, (int)myCenterY+7, (int)myCenterY+11, (int)myCenterY+15, (int)myCenterY+20, (int)myCenterY+4,
                (int)myCenterY+12, (int)myCenterY-12, (int)myCenterY-4}; 
    xCorners = xS;
    yCorners = yS;
    myColor = 255;
    myCenterX = 0;
    myCenterY = 0;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

    collision = false;
    health = 10;
    dead = true;
    enemyTimer = 0;
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
  public void setColor(int x) {myColor = x;}
  public int getHealth() {return health;}
  public void setHealth(int x) {health = x;}
  public boolean getDead() {return dead;}
  public void setDead(boolean x) {dead = x;}
  public int getEnemyTimer() {return enemyTimer;}
  public void setEnemyTimer(int x) {enemyTimer = x;}

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
      myCenterY = 110;    
    }   
    else if (myCenterY < 110)
    {     
      myCenterY = height;    
    }   
  } 

  public void show () 
  {             
    fill(255,0,0);   
    stroke(255,0,0);    
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
