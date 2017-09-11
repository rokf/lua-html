package = "lua-html"
version = "dev-0"

source = {
  url = "git://github.com/rokf/lua-html"
}

description = {
  summary = "Generate HTML with Lua",
  homepage = "https://github.com/rokf/lua-html",
  maintainer = "Rok Fajfar <snewix7@gmail.com>",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1, < 5.2"
}

build = {
  type = "builtin",
  modules = {
    ["lua-html"] = "lua-html.lua"
  }
}
