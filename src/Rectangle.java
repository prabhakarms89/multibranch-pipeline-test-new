public class Rectangle
{
  public int length;
  public int width;

  public void Rectangle1(int length, int width) 
  {
    this.length = length;
    this.width = width;
  }

  public int getArea() {
    return length * width;
  }

  public int getPerimeter() {
    return 2 * (length + width);
  }
  
 
}

public class Main
{
  
  public static void main (String[] args) 
    {
    Rectangle  r = new Rectangle();
    r.Rectangle1(12,3);
    int a=r.getArea();
    int p=r.getPerimeter();
    
    System.out.println("Area="+a);
    System.out.println("Perimeter="+p);
    
    }

}
  


  
