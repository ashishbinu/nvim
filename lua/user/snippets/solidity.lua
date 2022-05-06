---@diagnostic disable: unused-local
local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

return {
    s(
        "main",
        fmt(
            [[// SPDX-License-Identifier: MIT
pragma solidity {};

contract  {
    constructor() {
    }
}
]],
            { i(1, "^0.8.0") }
        )
    ),
}
