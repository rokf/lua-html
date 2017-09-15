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

local function make_main()

  -- making <li> elements from data.list
  local list_elements = {}
  for _,v in ipairs(data.list) do
    table.insert(list_elements, li { v })
  end

  -- return a html string
  return html {
    head {
      title { data.title }
    },
    body {
      h1 { data.header_text },
      ul(list_elements)
    }
  }
end

-- second argument can be a table
-- which can be accessed with the
-- name data
print(htmlgen(make_main,{
  title = "Title",
  header_text = "Header text",
  list = { "A", "B", "C" }
}))
