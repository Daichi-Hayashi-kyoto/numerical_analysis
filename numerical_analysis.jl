function tasu(a, b)
    c = a + b
    return c
end

function tasukakeru(a,b)
    c = a + b
    d = 2a + 3c
    return c, d
end

a = 2
b = 11
tasu(a, b)
tasukakeru(a,b)

c = tasukakeru(a, b)

c,d = tasukakeru(a,b)
println("$c,$d")

tasu(a,b) = a+b
a = 44
b = -32
tasu(a,b)

# 行列の定義
A = [1 3
     3 4]

print(A)

A = zeros(Int64, 3, 3)
print(A)
A[1,1] = 8

using LinearAlgebra

A = [2 3 1
     3 1 1
     0 0 1]
B = [0 0 1
     1 0 0
     0 0 1]
C = B*A   # 行列の積

# 対角化等
using LinearAlgebra
A = [2 3 3
     3 1 0
     3 0 1]
eigen(A)   # 対角化

n = 10
for i in 1:n
    println("i = $i")
end

for i in 1:100
    if i%2 == 0
        println("$iは 偶数です")
    else
        println("$iは奇数です")
    end
end

# 台形則
function daikei(a, b, n, f)
    h = (b-a)/n
    sum = 0
    for i in 1:(n-1)
        sum += f(a+i*h)
    end
    sum = (f(a) + sum + f(b)) * h
    return sum
end

f(x) = sin(x) + x^2

hasuu_sekibun = 1\2π * daikei(-π, π, 500, f)

using QuadGK
f(x) = sin(x) + x^2
quadgk(f,-π, π)./(2π)   #quadgk(f, a, b)でfの関数を区間(a, b)で積分する

# 補間
using Dierckx
x = [0., 1., 2., 3., 4.]
y = zeros(length(x))

for i in 1:length(x)
    y[i] = x[i]^3 - 1
end
y

spl = Spline1D(x, y)
spl([1.5, 2.5])  # result = [2.375, 14.625]
spl(1.5)  # result = 2.375

derivative(spl, 1.5)   # x = 1.5での微分係数の値を求める
integrate(spl, 0, 4)  # spl の x=0, x=4までの範囲の積分を求める
roots(spl)    # 0点を求める

# 特殊関数の使用
using SpecialFunctions
z = 0.2
a = besselj0(z)   # v=0のベッセル関数

z = 0.1
for v in 1:10
    Jv = besselj(v,z)
    println("J_{$v}(0.1) = $Jv")
end

# Bessel 関数のぜろ点が欲しい時は
using FunctionZeros
n = 10   # n番目のゼロ点を探す
for v in 1:10
    Jv = besselj_zero(v,n)
    println("J_{$v}の$n 番目のゼロ点は $Jv です．")
end

# マクロを使用する例
f(x) = cos(x)*sin(x)
@time daikei(0,1,1000, f)

using DifferentialEquations
f(u,p,t) = 1.01u   # 関数の形を定義
u0 = 1/2    # 初期値
tspan = (0.0, 1.0)   # t = 0 から1まででとく
prob = ODEProblem(f, u0, tspan)
