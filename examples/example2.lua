
local htmlgen = require 'lua-html'

print(htmlgen(function ()
  return div {
    class = "container",
    p { "Hello" },
    img { class = "image", "Hi" }
  }
end))
