function loadLanguages(LangList)
    ---@diagnostic disable-next-line: unused-local
    for key, lang in pairs(LangList) do
        if lang.enabled then
            require("lang." .. lang.name)
        end
    end

    return true
end
