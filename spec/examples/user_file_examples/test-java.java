public class Main
{
	public static void main(String[] args) {
        int x = 77;
        int y = "23";
        System.out.println(x + " + " + y + " = " + add(x,y));
	}
	
	public static int add(int a, int b) {
      return a + b;
	}
}