local MoreCensoredWords = {
    "cum", "nut", "suck dick", "hated", "greenin", "greening out", "greening", "codeine", "ride", "on me", "lungs", "burn my lungs",
    "opium", "dope", "coke", "sniffing", "blunt", "blunts", "roll", "stiletto", "stilettos", "bih", "kiss", "hug", "lean",
    "couple", "screw", "screwed", "cup", "pour", "heroin", "heroine", "herpes", "crack", "ecstasy", "veins", "pain", "gargle", "gang",
    "homixide", "homicide", "pourin", "pouring", "badass", "gown", "suck", "motherfucking", "motherfuckin", "motherfucker", "tattoo", "tats", "i live", "lung",
    "shot him", "killed him", "kill him", "devil", "satan", "rob", "boys", "meet me", "luv", "give me head", "fine as", "marry", "marriage", "girlfriend", "boyfriend", "suck it", "pronouns",
    "warcrime", "war", "crime", "triple 6", "666", "batty", "bauty", "butt", "fill me up", "cheating", "cheat", "cheated", "goddamn", "god damn", "slut", "bae", "whore", "eat you", "fag", "faggot",
    "baby mama", "shawty", "location", "lady", "wet", "ass", "thongs", "thong", "baby", "married", "queen", "queef", "bando", "stove", "cook", "cooked", "cooking",
    "restrain", "restrained", "banging", "bang", "like", "shots", "desperate", "molly", "under", "slave", "girls", "smoking", "relapsed", "relapse", "boyz", "big", "grass", "ritalin", "abort",
    "abortion", "aborted", "bride", "wife", "suicide", "intercourse", "baes", "hit", "from the back", "lay", "goon", "goons", "popped"
}


-- Add more words up here!





local function Notify(titletxt, text, time)
    local GUI = Instance.new("ScreenGui")
    local Main = Instance.new("Frame", GUI)
    local title = Instance.new("TextLabel", Main)
    local message = Instance.new("TextLabel", Main)
    GUI.Name = "NotificationOof"
    GUI.Parent = game.CoreGui
    Main.Name = "MainFrame"
    Main.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
    Main.BorderSizePixel = 0
    Main.Position = UDim2.new(1, 5, 0, 50)
    Main.Size = UDim2.new(0, 330, 0, 100)
 
    title.BackgroundColor3 = Color3.new(0, 0, 0)
    title.BackgroundTransparency = 0.89999997615814
    title.Size = UDim2.new(1, 0, 0, 30)
    title.Font = Enum.Font.SourceSansSemibold
    title.Text = titletxt
    title.TextColor3 = Color3.fromRGB(59, 164, 240) --- Color to liking
    title.TextSize = 25  --- Size to liking
 
    message.BackgroundColor3 = Color3.new(0, 0, 0)
    message.BackgroundTransparency = 1
    message.Position = UDim2.new(0, 0, 0, 30)
    message.Size = UDim2.new(1, 0, 1, -30)
    message.Font = Enum.Font.SourceSans
    message.Text = text
    message.TextColor3 = Color3.fromRGB(59, 164, 240)  --- color to liking
    message.TextSize = 25   --- Size to liking
 
    task.wait(0.1)
    Main:TweenPosition(UDim2.new(1, -330, 0, 50), "Out", "Sine", 0.5)
    task.wait(time)
    Main:TweenPosition(UDim2.new(1, 5, 0, 50), "Out", "Sine", 0.5)
    task.wait(10.0)
    GUI:Destroy();
end
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/flamingboy44/-back-ups-for-libs/refs/heads/main/bacon"))()
local window = lib:CreateWindow("Lyrics Bot Modified")
local window2 = lib:CreateWindow("Advanced Options")
local x2345 = lib:CreateLabel(window2, "Advanced")
local drop = lib:CreateDropdown(window2, "Methods")
local label = lib:CreateLabel(window, "Main")
local textBox = lib:CreateTextBox(window, Enum.Font.Legacy, "Artist Name", "")
local textBox2 = lib:CreateTextBox(window, Enum.Font.Legacy, "Song Name", "")
local toggled = false
local advanced_T = false
local plr = game:FindService("Players").LocalPlayer
local RaveMode = false
local waitbet : number = 0
local slider = lib:CreateSlider(window, "Wait Between Each Line", 0, 5, 0, function(value)
    print(value)
    waitbet = value
    print(waitbet, value)
end)
local toggle2 = lib:CreateToggle(window2, "Advanced Mode", false, function(toggleState)
    advanced_T = not advanced_T
end)
local WaitToSync = false
local toggle3 = lib:CreateToggle(window2, "Wait to Sync", false, function(toggleState)
    WaitToSync = not WaitToSync
end)
local ShowArt = false
local toggle4 = lib:CreateToggle(window2, "Show Cover Art", false, function(toggleState)
    ShowArt = not ShowArt
end)
local textBox3 = lib:CreateTextBox(window2, Enum.Font.Legacy, "How long the song is (advanced)", "")
---- \\ UI above this line // ----
local method = 1
lib:NewDropdownButton(window2, drop, "Use Musixmatch (Sync)", function()
    method = 1
end)
lib:NewDropdownButton(window2, drop, "Use Lyrist (No Sync)", function()
     method = 2
end)
----------------------





local function drawImageAtPosition(osX, osY)
    local suck, res = pcall(function()
        return request({
            Url = "https://lyrist.vercel.app/api/"..textBox.Text.."/"..textBox2.Text,
            Method = "GET"
        })
    end)
    if suck then
    local pixelSize = 2
    local stuff = game:GetService("HttpService"):JSONDecode(res.Body)
    local directimglink = stuff.image
    local url1 = "https://biinou.serv00.net/image_to_pixel_data.php?url="..directimglink
    local success, response = pcall(function()
        return request({
            Url = url1,
            Method = "GET"
        })
    end)

    if success and response then
        local succ, pixels = pcall(function()
            return game:GetService("HttpService"):JSONDecode(response.Body)
        end)

        if succ then
            local screenSize = workspace.CurrentCamera.ViewportSize
            local screenWidth = screenSize.X
            local screenHeight = screenSize.Y
            local imageWidth = 50
            local imageHeight = 50
            local drawnPixels = {}

            local function drawImage(imageData)
                for _, pixel in ipairs(imageData) do
                    local x, y, r, g, b = pixel[1], pixel[2], pixel[3], pixel[4], pixel[5]

                    local pixelSquare = Drawing.new("Square")
                    pixelSquare.Size = Vector2.new(pixelSize, pixelSize)
                    pixelSquare.Position = Vector2.new(osX + (x * pixelSize), osY + (y * pixelSize))
                    pixelSquare.Color = Color3.fromRGB(r, g, b)
                    pixelSquare.Filled = true
                    pixelSquare.Visible = true
                    pixelSquare.Transparency = 0
                    task.spawn(function()
                        for i = 1, 10 do
                            task.wait(.05)
                            pixelSquare.Transparency = i / 10
                        end
                    end)
                    table.insert(drawnPixels, pixelSquare)
                end
            end
            drawImage(pixels)
            task.wait(2)
            for _, v in ipairs(drawnPixels) do
                v.Visible = false
                v:Remove()
            end
        else
            print("fail3d to decode JSON: " .. tostring(pixels))
        end
    else
        print("API fail: " .. tostring(response))
    end
end
end






----------------
local s_TITLE
local a_NAME
local t_STAMP
local SingingSong
local replaceSpaces = function(str)
    if str then
        local replacements = {
            [" "] = "%20",
            ["!"] = "%21",
            ["#"] = "%23",
            ["$"] = "%24",
            ["&"] = "%26",
            ["'"] = "%27",
            ["("] = "%28",
            [")"] = "%29",
            ["*"] = "%2A",
            ["+"] = "%2B",
            [","] = "%2C",
            ["/"] = "%2F",
            [":"] = "%3A",
            [";"] = "%3B",
            ["="] = "%3D",
            ["?"] = "%3F",
            ["@"] = "%40",
            ["["] = "%5B",
            ["]"] = "%5D"
        }
        str = string.gsub(str, ".", replacements)
    end
    return str
end
local url
coroutine.resume(
    coroutine.create(function()
        while true and game:GetService('RunService').Heartbeat:Wait() do
            -- Ensure s_TITLE and a_NAME are not nil
            if (advanced_T == false and s_TITLE and a_NAME and method == 1) then
                url = "https://biinou.serv00.net/server/getLyricsMusix.php?q="..s_TITLE.."%20"..a_NAME.."&type=default"
            elseif (advanced_T == true and s_TITLE and a_NAME and t_STAMP and method == 1) then
                url = "https://biinou.serv00.net/server/getLyricsMusix.php?t="..s_TITLE.."&a="..a_NAME.."&d="..t_STAMP.."&type=alternative"
            end
            if (s_TITLE and a_NAME and method == 2) then
                url = "https://lyrist.vercel.app/api/"..a_NAME.."/"..s_TITLE
            end
        end
    end)
)

local uSettings = {
    PlaybackSpeed = 1,
    Volume = 5,
    PlayF = 2
}

local h

local sendMsg = function(cc)
    local msg = cc;
    if game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel then
        game:GetService("TextChatService").ChatInputBarConfiguration.TargetTextChannel:SendAsync(msg);
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

local function censorText(text)
    local cussWords = {
        "smoke", "ass", "nigga", "bitch", "fuck", "ho", "smokin", "bullet", "shit",
        "shoot", "kill", "oxy", "niggas", "bitches", "cut throat", "cuck", "break a leg", "dyin", "stop breathing",
        "kill yourself", "hang yourself", "sex", "sexy", "sexiness", "body", "mama", "hoe",
        "young", "lil' sister", "pedophile", "pedophiles", "femboy", "femboys", "nail", "dick", "tits", "boobs", "gayass", "gay", "ganja",
        "handjob", "ecchi", "hentai", "pussy", "anal", "geeked", "guns", "blowing", "drank", "drugs", "drug", "kill", "jump", "weed",
        "retarded", "retard", "girl", "body", "all night", "love", "valentine", "geek", "fucked", "bitched", "babygirl", "cocaine",
        "baby girl", "ouh", "ou", "lovin", "loving", "address", "pain", "suck a", "xanax", "sexual", "metrosexual", "kid", "fall in love", "bitched", "dicked",
        "date", "hoes", "freak", "as hell", "geeked up", "hate", "hating", "hatin", "address", "atlanta", "high", "type", "shi", "pimp",
        "pour", "glock", "suck my dick", "die", "cock", "sucking my cock", "sucking my dick", "suck my cock", "fucking", "fuckin", "OD", "pedo", "nigger"
    }
    table.move(MoreCensoredWords, 1, #MoreCensoredWords, #cussWords + 1, cussWords)
    for _, word in ipairs(cussWords) do
        local pattern = "%f[%a]" .. word .. "%f[%A]"
        text = string.gsub(text, pattern, function(match)
            return string.rep("*", #match)
        end)
        local lowerPattern = "%f[%a]" .. string.lower(word) .. "%f[%A]"
        text = string.gsub(text, lowerPattern, function(match)
            return string.rep("*", #match)
        end)
        local upperPattern = "%f[%a]" .. string.upper(word) .. "%f[%A]"
        text = string.gsub(text, upperPattern, function(match)
            return string.rep("*", #match)
        end)
        local capitalizedPattern = "%f[%a]" .. string.gsub(word, "^%l", string.upper) .. "%f[%A]"
        text = string.gsub(text, capitalizedPattern, function(match)
            return string.rep("*", #match)
        end)
    end
    return text
end

local pm = function()
    local response = request({
        Url = url,
        Method = "GET"
    })
    if response.StatusCode == 200 then
        if WaitToSync == true then
            task.spawn(Notify, "Play song now to sync!", "Play now and sync!", 3)
            task.wait((math.floor(math.pi)) - 1.5)
        end
        local lyrics = response.Body
        local previousTime = 0
        --y:Play()
        local x3d = coroutine.create(function()
            for line in string.gmatch(lyrics, "[^\r\n]+") do
                local time, text = string.match(line, "%[(%d+:%d+%.%d+)%]%s*(.+)")
                if time and text then
                    local minutes, seconds = string.match(time, "(%d+):(%d+%.%d+)")
                    if minutes and seconds then
                        local cleanedText = string.gsub(text, "%b()", "")
                        cleanedText = string.gsub(cleanedText, "^%s*(.-)%s*$", "%1")
                        if cleanedText ~= "" then
                            if SingingSong == true then
                                local currentTime = tonumber(minutes) * 60 + tonumber(seconds)
                                local waitTime = currentTime - previousTime
                                local xxx = (math.random(0 , waitbet))
                                task.wait(waitTime + xxx)
                                sendMsg("🎶 " .. censorText(cleanedText) .. " 🎶")
                                previousTime = currentTime
                            else
                                print("Stopped singing")
                            end
                        else
                            print("Skipped line with just parentheses or empty text.")
                        end
                    else
                        print("failed to get time: " .. time)
                    end
                else
                    print("failed to get line: " .. line)
                end
            end
        end)
        coroutine.resume(x3d)
    else
        warn("failed with status code: " .. response.StatusCode)
    end
end

local pmm = function()
    local response = request({
        Url = url,
        Method = "GET"
    })
    if response.StatusCode == 200 then
        if WaitToSync == true then
            task.spawn(Notify, "Play song now to sync!", "Play now and sync!", 3)
            task.wait((math.floor(math.pi)) - 1.5)
        end
        local json = game:GetService("HttpService"):JSONDecode(response.Body)
        local lyrics = json.lyrics
        if lyrics == nil then
            warn('No lyrics were found')
        else
            local lines = string.split(lyrics, "\n")
            for _, line in ipairs(lines) do
                if SingingSong == true then
                    local cleanedText = string.gsub(line, "%b()", "")
                    cleanedText = string.gsub(cleanedText, "%b[]", "")
                    cleanedText = string.gsub(cleanedText, "^%s*(.-)%s*$", "%1")
                    if cleanedText ~= "" then
                        sendMsg("🎶 " .. censorText(cleanedText) .. " 🎶")
                        local randomDelay = math.random() or ((math.floor(math.pi)) * 0.1)
                        task.wait(3 + randomDelay)
                    end
                else
                    return
                end
            end
        end
    else
        warn("failed " .. response.StatusCode)
    end
end

local button = lib:CreateButton(window, "🎶 Sing It! 🎶", function()
    SingingSong = false
    if ShowArt == true then
        task.spawn(drawImageAtPosition, 1490, 86)
    end
    task.spawn(Notify, "🎶 Now Playing: "..textBox2.Text.." 🎶", " by "..textBox.Text, 3)
    a_NAME = replaceSpaces(textBox.Text)
    s_TITLE = replaceSpaces(textBox2.Text)
    t_STAMP = textBox3.Text
    -- Validate
    if a_NAME and s_TITLE and a_NAME ~= "" and s_TITLE ~= "" then
        textBox.Text = a_NAME
        textBox2.Text = s_TITLE
        if advanced_T == true and t_STAMP and t_STAMP ~= "" then
            textBox3.Text = t_STAMP
        end
        task.wait(3)
        SingingSong = true
        if method == 1 then
            pm()
        elseif method == 2 then
            pmm()
        end
    else
        warn("Please provide valid inputs for Artist Name and Song Name.")
    end
end)
local button = lib:CreateButton(window, "Stop Singing 😡", function()
    SingingSong = false
end)
