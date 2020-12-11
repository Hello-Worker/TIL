'''문자열 연산하기'''

head = "Python"
tail = "is fun!"
print(head+tail)

a = "Python"
print(a*2)

print("="*50)
print("My program")
print("="*50)

'''문자열 인덱싱과 슬라이싱'''

a = "Life is too short, You need Python"
''' 0         1         2         3
    01234567890123456789012345678901234  -> 문자열 자리 번호'''

print(a[3])
print(a[23])
print(a[0])
print(a[-1])
'''-는 뒤에서부터 센다.'''


print(a[0:4])
'''0<=a<4'''
print(a[3:6])

print(a[19:])
'''a[시작번호:끝번호]에서 끝번호 부분을 생략하면 시작번호부터 그 문자열의 끝까지 뽑아낸다.'''

print(a[:])
'''문자열의 처음부터 끝까지 뽑아낸다.'''

print(a[19:-7])
'''a[19]에서 a[-8]까지를 말한다. a[-7]은 포함하지 않는다.'''


a="20010331Rainy"
print("date="+a[:8])
print("weather="+a[8:])

