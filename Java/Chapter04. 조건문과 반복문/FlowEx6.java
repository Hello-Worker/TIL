import java.util.*;
public class FlowEx6 {

	public static void main(String[] args) {
		System.out.println("����� �ֹι�ȣ�� �Է��ϼ���. (123456-1234567)");
		
		Scanner scanner = new Scanner(System.in);
		String regNo = scanner.nextLine();
		
		char gender = regNo.charAt(7); //�Է¹��� ��ȣ�� 8��° ���ڸ� gender�� ����
		
		switch (gender) {
			case '1': case '3':
				System.out.println("����� �����Դϴ�.");
				break;
			case '2': case '4':
				System.out.println("����� �����Դϴ�.");
		}

	}

}
