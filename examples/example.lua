-- the module will be used as a function
local htmlgen = require 'lua-html'

-- the function accepts a function
-- and an optional ENV to run the function in
local markup = htmlgen(function ()
  return html {
    class="main",
    head {
      title { "website title" },
      meta { lang = "en" }
    },
    body {
      h1 { "welcome" },
      p { "body text" }
    }
  }
end)

print(markup)
