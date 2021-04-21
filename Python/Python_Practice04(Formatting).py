'''문자열 포매팅 : 문자열 내 특정한 값을 바꾸고 싶을 때 사용.'''


print("I eat %d apples."%3)
print("I eat %s apples."%"five")
'''%d : 문자열 포맷 코드(숫자)
   %s : 문자열 포맷 코드(문자)'''

number=3
day=5
print("I ate %d apples. So I was sick for %s days." %(number, day))

'''
문자열 포맷 코드
%s 문자열(String)
%c 문자 1개(Character)
%d 정수(Integer)
%f 부동소수(floating-point)
%o 8진수
%x 16진수
%% Literal%(문자'%' 자체)
'''


print("Error is %d%%"%98)
'''%d와 %가 같은 문자열 내에 존재하는경우, %를 나타내려면 반드시 %%로 써야한다.'''


print("%10s"%"hi")
'''
          1
01234567890
         hi 오른쪽 정렬 (-는 왼쪽 정렬)
         '''

print("%0.4f"%3.42134234)
'''소수점 4번째 자리까지 나타내라.'''

print("%10.4f"%3.42134234)
'''소수점 4번쩨 자리까지 나타내고, 전체길이가 10개인 문자열 공간에서 오른쪽으로 정렬'''


