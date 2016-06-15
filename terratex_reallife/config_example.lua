-- not used in all files... will be set later
config={}
-- Name of Owner
config["owner"]="[GDR]byReaper"

--Supportemail
config["supportmail"]="server@gamingdash.xyz"

-- array with all domains which should not found in Anti-Advertise-Functions
config["domains"]={"gamingdash.xyz"}

-- Main Domain / will later be set in credits or info guis
config["maindomain"]="gamingdash.xyz"

--Bugtracker URL
config["bugdomain"]="https://github.com/TerraTex-Community/TerraTex-Reallife-Reloaded/issues";

--IP or Domain to Teamspeak3
config["teamspeak"]="gamingdash.xyz"

--Clantag: will protect Register with this tag or names of Clanmembers without this tag (Will set that [ABC]DEF is the same like DEF in checkups)
config["clantag"]="[GDR]"

--Community Name - The Name of the Community, which should be written f.e. in credits
config["communityname"]="GamingDash"

--Mappername
config["mappername"]="N-A"

--Scriptername
config["scriptername"]="[GDR]byReaper"

--24h Restart type
-- Options:
-- GMX - Gamemoderestart at 3/4 o'clock
-- SHUTDOWN  - complete Shutdown of the server at 3/4 o'clock  (recommend but you have to setup a automatic restart Script on your host)
-- NONE - No Restart at 3/4 o'clock (not recommend)
config["dailyrestarttype"]="GMX"

-- ################  FEATURE SETTINGS  #################
-- Enable or Disable Standard of Living (Means you need a specific house value to buy expensive cars)
config["feature.stardard_of_living"] = false -- will change it next time.

-- Pizzaroller Limitierung false = aus | zahlenwert = max km/h Default Roller:
config["feature.limiter.pizza"] = 50

-- Rookieroller / Faggio Limitierung false = aus | zahlenwert = max km/h Default Roller:
config["feature.limiter.faggio"] = 65

-- Quad false = aus | zahlenwert = max km/h Default Roller:
config["feature.limiter.quad"] = 90

-- Waffentruck Limitierung false = aus | zahlenwert = max km/h Default Roller:
config["feature.limiter.muntruck"] = false




