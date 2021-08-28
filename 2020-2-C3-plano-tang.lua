-- This file:
--   http://angg.twu.net/LATEX/2020-2-C3-plano-tang.lua.html
--   http://angg.twu.net/LATEX/2020-2-C3-plano-tang.lua
--           (find-angg "LATEX/2020-2-C3-plano-tang.lua")
-- Author: Eduardo Ochs <eduardoochs@gmail.com>
--
-- (defun e () (interactive) (find-angg "LATEX/2020-2-C3-plano-tang.tex"))
-- (defun l () (interactive) (find-angg "LATEX/2020-2-C3-plano-tang.lua"))

-- «.V3»		(to "V3")
-- «.V3-tests»		(to "V3-tests")
-- «.pictreplace»	(to "pictreplace")
-- «.pictreplace-tests»	(to "pictreplace-tests")



-- «V3»  (to ".V3")
-- (find-es "dednat" "V3")
--
V3 = Class {
  type    = "V3",
  __tostring = function (v) return v:tostring() end,
  __add      = function (v, w) return V3{v[1]+w[1], v[2]+w[2], v[3]+w[3]} end,
  __sub      = function (v, w) return V3{v[1]-w[1], v[2]-w[2], v[3]-w[3]} end,
  __unm      = function (v) return v*-1 end,
  __mul      = function (v, w)
      local ktimesv   = function (k, v) return V3{k*v[1], k*v[2], k*v[3]} end
      local innerprod = function (v, w) return v[1]*w[1] + v[2]*w[2] + v[3]*w[3] end
      if     type(v) == "number" and type(w) == "table" then return ktimesv(v, w)
      elseif type(v) == "table" and type(w) == "number" then return ktimesv(w, v)
      elseif type(v) == "table" and type(w) == "table"  then return innerprod(v, w)
      else error("Can't multiply "..tostring(v).."*"..tostring(w))
      end
    end,
  __index = {
    tostring = function (v) return v:v3string() end,
    v3string = function (v) return pformat("(%s,%s,%s)", v[1], v[2], v[3]) end,
    v2string = function (v) return tostring(v:tov2()) end,
    --
    -- Convert v3 to v2 using a primitive kind of perspective.
    -- Adjust p1, p2, p3 to change the perspective.
    tov2 = function (v) return v[1]*v.p1 + v[2]*v.p2 + v[3]*v.p3 end,
    p1 = V{2,-1},
    p2 = V{2,1},
    p3 = V{0,2},
    --
    Line = function (A, v) return pformat("\\Line%s%s", A, A+v) end,
    Lines = function (A, v, w, i, j)
        local bprint, out = makebprint()
        for k=i,j do bprint((A+k*w):Line(v)) end
        return out()
      end,
    --
    xticks = function (_,n,eps)
        eps = eps or 0.15
        return v3(0,-eps,0):Lines(v3(0,2*eps,0), v3(1,0,0), 0, n)
      end,
    yticks = function (_,n,eps)
        eps = eps or 0.15
        return v3(-eps,0,0):Lines(v3(2*eps,0,0), v3(0,1,0), 0, n)
      end,
    zticks = function (_,n,eps)
        eps = eps or 0.15
        return v3(-eps,0,0):Lines(v3(2*eps,0,0), v3(0,0,1), 0, n)
      end,
    axeswithticks = function (_,x,y,z)
        local bprint, out = makebprint()
	bprint(v3(0,0,0):Line(v3(x+0.5, 0, 0)))
	bprint(v3(0,0,0):Line(v3(0, y+0.5, 0)))
	bprint(v3(0,0,0):Line(v3(0, 0, z+0.5)))
        bprint(_:xticks(x))
        bprint(_:yticks(y))
        bprint(_:zticks(z))
        return out()
      end,
    xygrid = function (_,x,y)
        local bprint, out = makebprint()
        bprint(v3(0,0,0):Lines(v3(0,y,0), v3(1,0,0), 0, x))
        bprint(v3(0,0,0):Lines(v3(x,0,0), v3(0,1,0), 0, y))
        return out()
      end,
  },
}

v3 = function (x,y,z) return V3{x,y,z} end

-- Choose one
V3.__index.tostring = function (v) return v:v3string() end
V3.__index.tostring = function (v) return v:v2string() end


-- «V3-tests»  (to ".V3-tests")
--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
loaddednat6()
dofile "2020-2-C3-plano-tang.lua"
= v3(2,3,4)
= v3(2,3,4)*10
= v3(2,3,4):v3string()
= v3(2,3,4):v2string()

= v3():xticks(4)
= v3():axeswithticks(2,3,4)
= v3():xygrid(2,3)

--]]




-- «pictreplace»  (to ".pictreplace")
-- (find-es "dednat" "pictreplace")

pictreplace = function (bigstr)
    local f = function (s) return tostring(expr(s)) end
    local g = function (line) return (line:gsub("<([^<>]+)>", f)) end
    return (bigstr:gsub("[^\n]+", g))
  end

registerhead "%P" {
  name   = "pictreplace",
  action = function ()
      local i,j,pictcode = tf:getblockstr(3)
      -- local chunkname = tf.name..":%P:"..i.."-"..j
      -- local luacode = table.concat(lualines, "\n")
      output(pictreplace(pictcode))
    end,
}

-- «pictreplace-tests»  (to ".pictreplace-tests")
--[[
 (eepitch-lua51)
 (eepitch-kill)
 (eepitch-lua51)
loaddednat6()
dofile "2020-2-C3-plano-tang.lua"
= pictreplace "ab <v3(2,3,4):v3string()> cd"
= pictreplace "ab <v3(2,3,4):v3string()> cd <\n>"

--]]




