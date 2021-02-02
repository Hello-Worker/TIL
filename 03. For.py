# 3-1) 구구단
N = int(input())
for i in range(1,10):
    print("%d * %d = %d" % (N, i, N*1))

# 3-2) A+B - 3
T = int(input())
for i in range(T):
    A,B = input().split()
    A = int(A)
    B = int(B)
    print(A+B)