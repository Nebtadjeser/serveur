local component = require("component")
local os = require("os")
local event = require("event")
 
cb = component.chat_box
modem = component.modem
 
 
print(cb.getDistance())
 
function envoyerZana(message)
  if message ~= "1" and message ~= "2" and message ~= "3" and message ~= "5" then
    print( "Nope" )
  else
    modem.open(4343)
    while modem.isOpen(4343) do
      modem.broadcast(4242, message)
      local _, _, _, _, _, a = event.pull(1,"modem_message")
    --print(a)
      if a == "a" then
        modem.close(4343)
      end
    end
  end
end
 
 
while true do
  local evenement, adresse, nom, message = event.pull("chat_message")
  print(nom .. " ; " .. message)
  if nom == "Zanaszeriel" then
    envoyerZana(message)
  elseif nom == "Nebtadjser" then
    envoyerDjeser(message)
  end
  os.sleep(2)
end
