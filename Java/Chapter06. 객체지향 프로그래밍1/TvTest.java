class TV {
	// TV�� �Ӽ�(�������)
	String color;         // ����
	boolean power;        // ��������(on/off)
	int channel;          // ä��
	
	// Tv�� ���(�޼���)
	void power() { power = !power; } // TV�� �Ѱų� ���� ����� �ϴ� �޼���
	void channelUp() { ++channel; }  // TV�� ä���� ���̴� ����� �ϴ� �޼���
	void channelDown() { --channel;} // TV�� ä���� ���ߴ� ����� �ϴ� �޼���
}

public class TVTEST {
	public static void main(String ards[]) {
		TV t;                // TV �ν��Ͻ��� �����ϱ� ���� ���� t�� ����
		t = new TV();        // TV �ν��Ͻ��� �����Ѵ�.
		t.channel = 7;       // TV �ν��Ͻ��� ������� channel ���� 7�� �Ѵ�.
		t.channelDown();     // TV �ν��Ͻ��� �޼��� channelDown()�� ȣ���Ѵ�.
		System.out.println("���� ä���� "+t.channel + " �Դϴ�.");
		
	}
	
}
