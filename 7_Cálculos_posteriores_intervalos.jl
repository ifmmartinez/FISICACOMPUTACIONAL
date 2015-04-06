using Intervalos
Pkg.add("PyPlot")
using PyPlot


function SumaPi(n) #Cálculo del notebook_5
  Suma=Interval(0.0, 0.0)
  for i=1.0:n
    Suma=Suma + Interval(1.0, 1.0)/Interval(i^2, i^2)
  end
  Suma
end

SumaPi(10.0)

function Pii(n) #Cálculo de pi utilizando la suma infinita
  a=sqrt(SumaPi(n).left*6.0)
  b=sqrt(SumaPi(n).right*6.0)
  Interval(a,b)
end

Pii(80.0)

#PROBANDO LA DEFINICIÓN DE LA POTENCIA CON INTERVALOS

M=Interval(-1.0, 1.0)

M^3
M^2

M*M==M^2



#PROBANDO LA LEY ASOCIATIVA

Interval(-1.0,1.0)*(Interval(-1.0,0.0)+Interval(3.0,4.0))

Interval(-1.0,1.0)*Interval(-1.0,0.0)+Interval(-1.0,1.0)*Interval(3.0,4.0)

#La multiplicación, en intervalos, no es asociativa



#OPERACIONES DE POLINOMIOS CON INTÉRVALOS

P_1(x)=(x-1.0)(x-2.0)
P_2(x)=x^2-2.0

function EjeY(x::Interval)# Valores de el polinomio desde x.left hasta x.right en saltos de 0.125 (2^-3)
  RangInterval=Float64[]
  for i in x.left:0.125:x.right
    push!(RangInterval, P_1(i))
  end
end

function EjeX(x::Interval)
  RangInterval=Float64[]
  for i in DomInterval.left:0.125:DomInterval.right
    push!(RangInterval, i)
  end
end


plot(EjeX, EjeY)

