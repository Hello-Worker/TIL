class Tv {
	boolean power; //��������(on/off)
	int channel;
	
	void power() { power = !power;}
	void channelUp() {  ++channel; }
	void channelDown() { --channel; }
}

class CaptionTv extends Tv {
	boolean caption; //ĸ�ǻ���(on/off)
	void displayCaption(String text) {
		if (caption) { //ĸ�� ���°� on(true)�� ���� text�� �����ش�.
			System.out.println(text);
		}
	}
}

public class CaptionTvTest {
	public static void main(String[] args) {
		CaptionTv ctv = new CaptionTv();
		ctv.channel = 10; // �θ� Ŭ�����κ��� ��ӹ��� ���
		ctv.channelUp(); // �θ� Ŭ�����κ��� ��ӹ��� ���
		System.out.println(ctv.channel);
		ctv.displayCaption("Hello world");
		ctv.caption = true; //ĸ�� ����� �Ҵ�.
		ctv.displayCaption("Hello world");
	}

}
