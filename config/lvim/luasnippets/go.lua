-- 复制一个插入值的第一行
local function clone(args)
    return args[1][1]
end

-- 拼接两个插入值，以访问表成员
local function getter(args)
    -- 参数1的第一行与参数2的第一行
    return args[1][1] .. "." .. args[2][1]
end

return {
    s("ifsetc", {
        t"if ", i(1), t".", i(2), t" != ", i(3), t" {",
            t({ "", "\tcreator.Set" }), f(clone, 2), t"(", f(getter, {1, 2}), t")",
        t({"", "}"})
    }),

    s("ifsetu", {
        t"if ", i(1), t".", i(2), t" != ", i(3), t" {",
            t({ "", "\tupdater.Set" }), f(clone, 2), t"(", f(getter, {1, 2}), t")",
        t({"", "}"})
    }),
}
