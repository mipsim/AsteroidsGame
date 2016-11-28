//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


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

    bulletRotation = 0;
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

  public void setBulletRotation(int x) {bulletRotation = x;}

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////