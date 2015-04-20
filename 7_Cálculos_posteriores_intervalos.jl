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

x_interval = Interval(1.0, 2.0)
x = linspace(x_interval.left, x_interval.right, 50);
y = [i^2 - 3*i + 2 for i in x] #por alguna razón que desconozco al poner P_1(x) me daba error, asi que lo desarrollé

plot(x,y)

x_interval = Interval(-2.0,2.0)
x = linspace(x_interval.left, x_interval.right, 50);
y = [P_2(i) for i in x]

plot(x,y)


#EXTENSIÓN DE FUNCIONES A INTERVALOS

x_interval=Interval(1.0,2.0)

function f(x::Interval)
    return(x/(x^2+1.0))
end

P_3(x)=x/(1+x^2)
y_int=f(Interval(1.0,2.0))
y1 = linspace(y_int.left, y_int.right, 50)


x_interval = Interval(1.0,2.0)
x = linspace(x_interval.left, x_interval.right, 50);
y = [P_3(i) for i in x]

plot(x,y1,x,y) #este es el resultado correcto



#Rutina para encontrar raices


function RaicesCreciente(x::Symbol,F::Function, x_0::Float64)
  m_interval = Interval(0.0, x_0)
  m = linspace(m_interval.left, m_interval.right, 50)
  y = [F(i) for i in m]

    for i in m
      if y[i]<0 && y[i+1]>0
                  return Interval(i, i+1.0)
        else
                  return("no tiene raices")
      end
    end

end



function RaicesDecreciente(F::Function, x_0::Float64)
  m_interval = Interval(0.0, x_0)
  m = linspace(m_interval.left, m_interval.right, 50)
  y = [F(i) for i in m]

    for i in m
      if y[i]>0 && y[i+1]<0
                  return Interval(i, i+1.0)
        else
                  return("no tiene raices")
      end
    end

end

function Raices(F::Function, x_0::Float64)
  RaicesCreciente(F,x_0)
  RaicesDecrecientes(F,x_0)



