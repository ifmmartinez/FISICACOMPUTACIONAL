module DerivadasNumericas

  using Base
  import Base.exp, Base.sin, Base.cos, Base.log, Base.tan
  importall Base.Operators
  export NumDerive, +, -, *, /, sin, cos, exp, tan, log, ^

  type NumDerive
      f
      d
  end

    function +(u::NumDerive, v::NumDerive)
    NumDerive(u.f + v.f, u.d + v.d)
    end

    function -(u::NumDerive, v::NumDerive)
    NumDerive(u.f - v.f, u.d - v.d)
    end

    function +(u::NumDerive, n::Number)
    NumDerive(u.f + n, u.d)
    end

    function -(u::NumDerive, n::Number)
    NumDerive(u.f - n, u.d)
    end

    function -(u::NumDerive)
      NumDerive(-u.f,-u.d)
    end

    function -(n::Number,u::NumDerive)
    NumDerive(n - u.f, -u.d)
    end

    function +(n::Number, x::NumDerive) #Para que en la suma no importe el orden
    return +(x::NumDerive, n::Number)
    end


    function *(u::NumDerive, v::NumDerive)
    NumDerive(u.f*v.f, u.f*v.d + u.d*v.f)
    end

    function *(n::Number, u::NumDerive)
    NumDerive(n*u.f, n*u.d)
    end

    function *(x::NumDerive, n::Number)
        return *(n::Number, x::NumDerive)
    end

    function /(u::NumDerive, v::NumDerive)
    NumDerive(u.f/v.f, (u.d*v.f - v.d*u.f)/(v.f^2))
    end

    function /(n::Number, u::NumDerive)
    NumDerive(n/u.f, -(n*u.d)/(u.f^2))
    end

    function ^(u::NumDerive, n::Real)
    NumDerive(u.f^n, n*u.f^(n-1))
    end

    function Base.sin(u::NumDerive)
    NumDerive(sin(u.f), cos(u.f)*u.d)
    end

    function Base.cos(u::NumDerive)
    NumDerive(cos(u.f), -sin(u.f)*u.d)
    end

    function Base.exp(u::NumDerive)
    NumDerive(exp(u.f), exp(u.f)*u.d)
    end

    function Base.log(u::NumDerive)
    NumDerive(log(u.f), u.d/u.f)
    end

end #endmodule

