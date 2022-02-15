class Product {
	int price; //��ǰ�� ����
	int bonusPoint;
	
	Product(int price) {
		this.price = price;
		bonusPoint = (int)(price/10.0); //���ʽ� ������ ��ǰ ������ 10%
	}
}

class Tv extends Product {
	Tv() {
		// �θ�Ŭ������ ������ Product(int Price)�� ȣ���Ѵ�.
		super(100); //Tv�� ������ 100�������� �Ѵ�.
	}
	// ObjectŬ������ toStirong()�� �������̵��Ѵ�.
	public String toString() { return "Tv"; }
}

class Computer extends Product {
	Computer() { super(200); }
	
	public String toString() { return "Computer"; }
}

class Buyer { //��, ������ ��� ���
	int money = 1000; //�����ݾ�
	int bonusPoint = 0; //���ʽ� ����
	
	void buy(Product p) {
		if(money<p.price) {
			System.out.println("�ܾ��� �����Ͽ� ������ �� �� �����ϴ�.");
			return;
		}
		
		money -= p.price;
		bonusPoint += p.bonusPoint;
		System.out.println(p + "��/�� �����ϼ̽��ϴ�.");
	}
}

public class PolyArgumentTest {

	public static void main(String[] args) {
		Buyer b = new Buyer();
		
		b.buy(new Tv());
		b.buy(new Computer());
		
		System.out.println("���� ���� ���� " + b.money + "�����Դϴ�.");
		System.out.println("���� ���ʽ� ������ " + b.bonusPoint + "���Դϴ�.");

	}

}
