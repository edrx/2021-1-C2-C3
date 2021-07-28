-- This file:
--   http://angg.twu.net/LATEX/2021-1-C2-critical-points.lua.html
--   http://angg.twu.net/LATEX/2021-1-C2-critical-points.lua
--           (find-angg "LATEX/2021-1-C2-critical-points.lua")
-- Author: Eduardo Ochs <eduardoochs@gmail.com>
--
-- (defun l () (interactive) (find-LATEX "2021-1-C2-critical-points.lua"))
-- Used by: (find-LATEX "2021-1-C2-integral-figuras.tex")

-- «.Approxer-tests»	(to "Approxer-tests")


-- (c2m211somas2p 8 "imagens-de-intervalos")
-- (c2m211somas2a   "imagens-de-intervalos")
f_do_slide_8 = function (x)
    if            x <= 3 then return x+3 end
    if 3 <  x and x <  8 then return 9-x end
    if 8 <= x            then return x-7 end
  end

--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
dofile "2021-1-C2-critical-points.lua"
f = f_do_slide_8
= f(0)
= f(2)
= f(3)
= f(4)
= f(7)
= f(8)
= f(9)

--]]



Partition = Class {
  type = "Partition",
  new  = function (a, b) return Partition {points={a,b}} end,
  __index = {
    a = function (ptn) return ptn.points[1] end,
    b = function (ptn) return ptn.points[#ptn.points] end,
    N = function (ptn) return #ptn.points - 1 end,
    ai = function (ptn, i) return ptn.points[i] end,
    bi = function (ptn, i) return ptn.points[i+1] end,
    bminusa = function (ptn) return ptn:b() - ptn:a() end,
    splitn = function (ptn, N)
        local points = {}
        local Delta = ptn:bminusa()
        for k=0,N do table.insert(points, ptn:a() + Delta*(k/N)) end
        return Partition {points=points}
      end,
  },
}

--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
dofile "2021-1-C2-critical-points.lua"

ptn = Partition.new(2, 10)
PPV(ptn)
PPV(ptn:splitn(4))

ptn = Partition.new(2, 10):splitn(4)
for i=1,ptn:N() do
  print(i, ptn:ai(i), ptn:bi(i))
end

--]]



CriticalPoints = Class {
  type  = "CriticalPoints",
  new   = function (f, allcriticalpoints)
      return CriticalPoints {f=f, allcriticalpoints=allcriticalpoints}
    end,
  __index = {
    criticalpointsin = function (cp, a, b)
        local A = {}
        for _,x in ipairs(cp.allcriticalpoints) do
          if a < x and x < b then table.insert(A, x) end
        end
        return A
      end,
    infin = function (cp, a, b)
        local inf = cp.f(a)
        local add = function (x) inf = min(inf, cp.f(x)) end
        add(b)
        for _,x in ipairs(cp:criticalpointsin(a, b)) do add(x) end
        return inf
      end,
    supin = function (cp, a, b)
        local sup = cp.f(a)
        local add = function (x) sup = max(sup, cp.f(x)) end
        add(b)
        for _,x in ipairs(cp:criticalpointsin(a, b)) do add(x) end
        return sup
      end,
    method = function (cp, method, a, b)
        return cp[method](cp, a, b)
      end,
  },
}


--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
dofile "2021-1-C2-critical-points.lua"
cpf = CriticalPoints.new(f_do_slide_8, {3,8})
= cpf:supin(7, 9)
= cpf:infin(7, 9)
= cpf:method("supin", 7, 9)

--]]



-- (find-es "tex" "pict2e")
--
Rect0 = Class {
  type = "Rect0",
  new  = function (a, b, y) return Rect0 {a=a, b=b, y=y} end,
  __index = {
    corners = function (r0) 
      local a, b, y = r0.a, r0.b, r0.y
        return pformat("(%s,%s)(%s,%s)(%s,%s)(%s,%s)", a,y, b,y, b,0, a,0)
      end,
    pict = function (r0, what)
        str = ""
        corners = r0:corners()
        if what:match"c" then str = str .. "\\polygon*" .. corners .. "%\n" end
        if what:match"a" then str = str .. "\\polygon"  .. corners .. "%\n" end
        return str
      end,
  },
}

--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
dofile "2021-1-C2-critical-points.lua"
r0 = Rect0.new(1, 2, 3)
= r0:pict("a")
= r0:pict("c")
= r0:pict("ac")

--]]




Approxer = Class {
  type    = "Approxer",
  __index = {
    pict = function (ap, N, method, what)
        bigstr = ""
        local cp = CriticalPoints.new(ap.f, ap.allcps)
        local pt = Partition.new(ap.a, ap.b):splitn(N or ap.N)
        for i=1,pt:N() do
          local ai,bi = pt:ai(i), pt:bi(i)
          local y = cp:method(method or ap.method, ai, bi)
          local pict = Rect0.new(ai, bi, y):pict(what or ap.what)
          bigstr = bigstr .. pict
        end
        return bigstr
      end,
  },
}

-- «Approxer-tests»  (to ".Approxer-tests")
--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
dofile "2021-1-C2-critical-points.lua"

appr = Approxer {
    f      = f_do_slide_8,
    allcps = {3,8},
    a      = 2,
    b      = 10,
    N      = 4,
    method = "supin",
    what   = "ac",
  }

= appr:pict()
= appr:pict(2, "infin", "c")

--]]


