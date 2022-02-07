
public class TvTest4 {

	public static void main(String[] args) {
		TV[] TVArr = new TV[3];
		
		// TV객체를 생성해서 TV객체 배열의 각 요소에 저장
		for(int i=0; i < TVArr.length; i++) {
			TVArr[i] = new TV();
			TVArr[i].channel = i+10; // TVArr[i]의 channel에 i+10을 저장
		}
		
		for (int i=0; i <TVArr.length; i++) {
			TVArr[i].channelUp(); // TVArr[i]의 메서드를 호출. 채널이 1증가
			System.out.printf("TVArr[%d].channel=%d%n",i,TVArr[i].channel);
			
		}

	}

}

//class TV{
//	String color;
//	boolean power;
//	int channel;
//	
//	void power() { power = !power; } // TV를 켜거나 끄는 기능을 하는 메서드
//	void channelUp() { ++channel; }  // TV의 채널을 높이는 기능을 하는 메서드
//	void channelDown() { --channel;} // TV의 채널을 낮추는 기능을 하는 메서드
//}