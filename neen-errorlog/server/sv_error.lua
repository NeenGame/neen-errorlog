RegisterNetEvent('neen-errorlog:[Server]:SendData', function(message)
    local embedData = {{
        ['title'] = '',
        ['color'] = 762640,
        ["footer"] = {["text"] = os.date("%c") .. " - © Error"},
        ['author'] = {
            ['name'] = 'ERRORS',
        },
        ['description'] = message,
    }}
    PerformHttpRequest(SHERROR.Webhook, function(err, text, headers) end, 'POST', json.encode({username = "ERRORS",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end)