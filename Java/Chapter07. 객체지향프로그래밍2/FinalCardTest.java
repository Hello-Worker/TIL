class Card {
	final int NUMBER;  //상수이지만 선언과 함꼐 초기화 하지 않고
	final String KIND; //생성자에서 단 한번만 초기화 할 수 있다.
	static int width = 100;
	static int height = 250;
	
	Card(String kind, int num) {
		KIND = kind;   // 매개변수로 넘겨받은 값으로 
		NUMBER = num;  // KIND와 NUMBER를 초기화 한다.
	}
	
	Card() {
		this("HEART", 1);
	}
	
	public String toString() {
		return KIND + " " + NUMBER;
	}
}

public class FinalCardTest {

	public static void main(String[] args) {
		Card c = new Card("HEART", 10);
		// c.NUMBER = 5; 에러!! cannot assign a value to final variable NUMBER
		System.out.println(c.KIND);
		System.out.println(c.NUMBER);
		System.out.println(c); // System.out.println(c.toString());
	}

}
