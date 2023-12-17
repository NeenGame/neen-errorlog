RegisterNetEvent('__cfx_internal:serverPrint')
AddEventHandler('__cfx_internal:serverPrint', function(msg)
    if (msg == "") then return end
    local str = string.sub(msg, 1, 6)
    local BlER = CheckForBlacklistedErrors(str)
    local WLER = CheckForWhitelistedErrors(str)
    if BlER then return end
    local PlayerName = GetPlayerName(PlayerId())
    local PlayerId = GetPlayerServerId(PlayerId())
    print('[SERVER SIDE ERROR]: \n'..msg)
    if not WLER then return end
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

function CheckForWhitelistedErrors(str)
    for i=1,#SHERROR.WhiteListedErrors do
        if string.match(str, SHERROR.WhiteListedErrors[i]) then
            return true
        end
    end
    return false
end