local SendLog = function(Link, D)
    local Link = _G.AutofarmSettings.Webhook

    if (Link ~= "") then
        warn("attempting to send log to webhook.")

        local Data =
        {
            ["content"] = D
        }

        local s, e = pcall(function()
            local http_request = http_request or syn and syn.request
            http_request({ Url = Link, Body = game:GetService("HttpService"):JSONEncode(Data), Method = "POST", Headers = { ["content-type"] = "application/json" } })
        end)

        if (e) then
            warn("error while sending log, maybe incorrect webhook link?")
        end
    end
end

return SendLog
