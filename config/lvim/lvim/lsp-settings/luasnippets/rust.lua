-- 复制一个插入值的第一行
local function clone(args)
    return args[1][1]
end

return {
    s("wopt", {
        t"pub fn ", i(1), t"(mut self, ", f(clone, 1), t": ", i(2), t") -> Self {",
            t({"", "\tself."}), f(clone, 1), t" = Some(", f(clone, 1), t");",
        t({"", "", "\tself", "}"}),
    }),
    s("sopt", {
        t"pub fn set_", i(1), t"(&mut self, ", f(clone, 1), t": ", i(2), t") -> &mut Self {",
            t({"", "\tself."}), f(clone, 1), t" = Some(", f(clone, 1), t");",
        t({"", "}"}),
    }),
    s("ifset", {
        t"let ", i(1), t" = if ", f(clone, 1), t".is_some() {",
            t({"", "\tSet("}), f(clone, 1), t")",
        t({"", "} else {", "\tNotSet", "};"}),
    }),
}

