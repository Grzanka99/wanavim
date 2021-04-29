local function loadLanguages(LangList)
    for _, lang in pairs(LangList) do
        if lang.enabled then
            require("lang." .. lang.name)
        end
    end

    return true
end

return loadLanguages
