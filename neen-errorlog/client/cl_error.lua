RegisterNetEvent('__cfx_internal:serverPrint')
AddEventHandler('__cfx_internal:serverPrint', function(msg)
    if (msg == "") then return end
    local BlER = CheckForBlacklistedErrors(string.sub(msg, 1, 6))
    if BlER then return end
    local PlayerName = GetPlayerName(PlayerId())
    local PlayerId = GetPlayerServerId(PlayerId())
    print('[SERVER SIDE ERROR]: \n'..msg)
    exports['screenshot-basic']:requestScreenshotUpload(tostring(SHERROR.Webhook), "files[]", function(uploadData)end)
    Wait(1300)
    TriggerServerEvent('neen-errorlog:[Server]:SendData', '**Name: '..PlayerName.. '\n ID: '..PlayerId.. '**\n **Error: **'..msg)
end)

function CheckForBlacklistedErrors(str)
    for i=1,#SHERROR.BlacklistedWords do
        if string.match(str, SHERROR.BlacklistedWords[i]) then
            return true
        end
    end
    return false
end