<h3 align="center">lua-html</h1>

This is a Lua 5.1 / LuaJIT module which can generate HTML
by combining functions, tables and their metatables.

It uses the `__index` metatable field to replace undefined
function calls with HTML strings.

The metatable of the module itself has a `__call` field.
After the module is required it can be called as a function.

The function accepts two arguments. A function and an optional
custom environment table. The function runs inside a custom
environment so you can still get those `undefined` errors
outside of it.

Every function which doesn't exist inside the environment
gets replaced by a HTML element (string) with its name. It accepts
a table. Key - value pairs are turned into attributes, the rest is
converted into a string and put inside the element.
