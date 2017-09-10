local function make_html_elem(el,t)
  local output = {}
  local attributes = {}
  for k,v in pairs(t) do
    if tonumber(k) == nil then
      table.insert(attributes, k .. '="' .. tostring(v) .. '"')
    end
  end
  local attribute_string = table.concat(attributes, " ")
  local space = " "
  if attribute_string == "" then space = "" end
  table.insert(output, '<' .. el .. space .. attribute_string .. '>')
  for _,v in ipairs(t) do
    table.insert(output, tostring(v))
  end
  table.insert(output, '</' .. el .. '>')
  return table.concat(output)
end

local M = {}

setmetatable(M, {
  __call = function (_, f,cfenv)
    local fenv
    if cfenv then
      fenv = cfenv
    else
      fenv = {
        print = print,
        error = error,
        assert = assert,
        select = select,
        type = type,
        tostring = tostring,
        tonumber = tonumber,
        unpack = unpack,
        ipairs = ipairs,
        pairs = pairs,
        next = next,
        table = table,
        math = math,
        string = string
      }
    end
    setfenv(f,fenv)
    setmetatable(fenv, {
      __index = function (_, cmd)
        return function (t) return make_html_elem(cmd, t) end
      end
    })
    return f()
  end
})

return M
