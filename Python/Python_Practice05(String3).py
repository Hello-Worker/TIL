a="hobby"
print(a.count('b'))
''' 문자열 증 문자b의 개수를 반환한다.'''

a="Python is best choice"
print(a.find('b'))
print(a.find('k'))
'''문자열 중 문자b가 처음으로 나온위치를 반환한다. 존재하지 않는다면 -1을 반환한다.'''

a="Life is too short"
print(a.index('t'))
''' 문자열 중 문자 t가 맨 처음으로 나온 위치를 반환한다. 존재하지 않는다면 오류가 발생한다. print(a.index('k'))->오류
    find함수와 다른점은 오류발생 유무의 차이.'''

a=","
print(a.join('abcd'))
'''abcd라는 각각의 문자열 사이에 a의 값을 삽입'''


a="hi"
print(a.upper())
'''소문자를 대문자로 바꿔주는 함수.'''

a="HI"
print(a.lower())
'''대문자를 소문자로 바꿔주는 함수.'''

a="    hi    "
print(a.lstrip())
print(a.rstrip())
print(a.strip())
'''왼쪽(l)이나 오른쪽(r) 또는 양쪽에 있는 한 칸 이상의 연속된 공백들을 모두 지운다.'''

a="Life is too short"
print(a.split())
'''공백을 기준으로 문자열을 나눔'''

a="a:b:c:d"
print(a.split(':'))
'''공백을 기준으로 괄호안의 값을 구분자로 해서 문자열을 나눔'''

