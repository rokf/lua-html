local empty = {
  ['area'] = true,
  ['base'] = true,
  ['br'] = true,
  ['col'] = true,
  ['embed'] = true,
  ['hr'] = true,
  ['img'] = true,
  ['input'] = true,
  ['keygen'] = true,
  ['link'] = true,
  ['meta'] = true,
  ['param'] = true,
  ['source'] = true,
  ['track'] = true,
  ['wbr'] = true
}

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
  if not empty[el] then
    for _,v in ipairs(t) do table.insert(output, tostring(v)) end
    table.insert(output, '</' .. el .. '>')
  end
  return table.concat(output)
end

local M = {}

setmetatable(M, {
  __call = function (_, f,data,cfenv)
    local fenv
    if cfenv then
      fenv = cfenv
      fenv.data = data or {}
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
        string = string,
        data = data or {}
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
