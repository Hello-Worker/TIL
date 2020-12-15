'''포맷 함수'''
print("I eat {0} apples.".format(3))
print("I eat {0} apples.".format("three"))
number=3
print("I eat {0} apples.".format(number))
number=10
day="three"
print("I ate {0} apples. So I was sick for {1} days.".format(number,day))
print("I ate {number} apples. So I was sick for {day} days.".format(number=10, day="three"))
print("I ate {0} apples. so I was sick for {day} days.".format(10,day="three"))

'''정렬'''
print("{0:<10}".format("hi"))
print("{0:>10}".format("hi"))
print("{0:^10}".format("hi"))
''':<10 표현식은 문자열을 왼쪽으로 정렬, 총자릿수를 10으로 맞춘다.
   :>10 표현식은 문자열을 오른쪽으로 정렬, " 
   :^10 표현식은 문자열을 가운제로 정렬, " '''

print("{0:=^10}".format("hi"))
print("{0:!<10}".format("hi"))
'''공백을 문자로 채운다.'''

y=3.421434234
print("{0:0.4f}".format(y))
print("{0:10.4f}".format(y))
'''자릿수10으로 맞추고, 소수점 4자리까지만 표현'''

print("{{and}}".format())
'''포매팅문자가 아닌 문자 그대로 사용하고 싶은 경우에는{{}}로 2개연속해서 사용'''
