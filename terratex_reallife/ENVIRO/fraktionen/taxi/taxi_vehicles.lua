frakselfcars[4]={}
taxiPrices={}
--taxiPrices[timezone][tarifzone]
--zeiten= 6:00-12:00 12:00-18:00 18:00-6:00
taxiPrices[1]={0,0,0}
taxiPrices[2]={0,0,0}
taxiPrices[3]={0,0,0}
taxiObject=false
taxiObjectOpen=false
taxiGrundPrice=0
function mv_taxi_func(thePlayer)
	local x,y,z=getElementPosition(thePlayer)
	local dis=getDistanceBetweenPoints3D(x,y,z,1727.0999755859,2303.1999511719,11.5)
	if(dis<20)then
		if(vioGetElementData(thePlayer,"fraktion")==4)then
			if(taxiObjectOpen)then
				moveObject(taxiObject,2500,1727.0999755859,2303.1999511719,11.5)
				taxiObjectOpen=false
			else
				moveObject(taxiObject,2500,1726.8000488281,2303.6999511719,8.1999998092651)
				taxiObjectOpen=true
			end
		end
	end
end
addCommandHandler("mv",mv_taxi_func,false,false)

function onCreatetaxicars_func()
	taxiObject=createObject(7657,1727.0999755859,2303.1999511719,11.5,0.00000000,0.00000000,0.00000000)  



	frakselfcars[4][1]  = createVehicle(438,1680.0213623047,2288.3430175781,10.532094955444,0,0,269.00000000,"SA-TAXI") -- cabbie
	frakselfcars[4][2]  = createVehicle(438,1680.24609375,2292.578125,10.531458854675,0,0,268.99475098,"SA-TAXI") -- cabbie
	frakselfcars[4][3]  = createVehicle(438,1680.1740722656,2296.6215820313,10.484557151794,0,0,268.99475098,"SA-TAXI") -- cabbie
	frakselfcars[4][4]  = createVehicle(420,1679.4636230469,2347.1325683594,10.456047058105,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][5]  = createVehicle(420,1679.1672363281,2355.3957519531,10.456862449646,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][6]  = createVehicle(420,1679.2801513672,2350.8015136719,10.461874008179,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][7]  = createVehicle(420,1679.3402099609,2359.3937988281,10.453304290771,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][8]  = createVehicle(420,1679.3402099609,2363.8088378906,10.459678649902,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][9]  = createVehicle(420,1679.6767578125,2368.4821777344,10.4284324646,0,0,269.00000000,"SA-TAXI") -- taxi
	frakselfcars[4][10] = createVehicle(487,1748.5380859375,-2045.2353515625,20.824502944946,0,0,269.00000000,"SA-TAXI")    --  maverick
	frakselfcars[4][11]  = createVehicle(580,1679.4522705078,2318.4145507813,10.684432029724,0,0,269.00000000,"SA-TAXI") -- stafford
	frakselfcars[4][12]  = createVehicle(580,1679.3552246094,2322.3806152344,10.677325248718,0,0,269.00000000,"SA-TAXI") -- stafford
	frakselfcars[4][13]  = createVehicle(580,1679.5283203125,2326.6899414063,10.67725276947,0,0,269.00000000,"SA-TAXI") -- stafford
	frakselfcars[4][14] = createVehicle(409,1681.4486083984,2303.525390625,9.9008722305298,0,0,269.00000000,"SA-TAXI") -- stretch
	frakselfcars[4][15] = createVehicle(409,1681.4145507813,2312.7951660156,9.901496887207,0,0,269.00000000,"SA-TAXI")  -- stretch
	frakselfcars[4][16] = createVehicle(409,1682.6624755859,2340.6682128906,10.010292053223,0,0,269.00000000,"SA-TAXI") -- stretch 


	for theKey,theVehicle in ipairs(frakselfcars[4]) do
		setVehicleColor ( theVehicle, 6,6,6,6 )
		prepare(theVehicle,4)
		addEventHandler("onVehicleEnter",theVehicle,donotentertaxi)
		vioSetElementData(theVehicle,"tank",100)
			table.insert(frakcars,theVehicle)
	end
	loadTaxiPricesFromDB()
end
addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),onCreatetaxicars_func)

function loadTaxiPricesFromDB()
	local tarifa=MySQL_GetVar("taxipreise", "preis", "timezone='1' and tarifzone='1'")
	local tarifb=MySQL_GetVar("taxipreise", "preis", "timezone='1' and tarifzone='2'")
	local tarifc=MySQL_GetVar("taxipreise", "preis", "timezone='1' and tarifzone='3'")
	taxiPrices[1]={tarifa,tarifb,tarifc}
	
	tarifa=MySQL_GetVar("taxipreise", "preis", "timezone='2' and tarifzone='1'")
	tarifb=MySQL_GetVar("taxipreise", "preis", "timezone='2' and tarifzone='2'")
	tarifc=MySQL_GetVar("taxipreise", "preis", "timezone='2' and tarifzone='3'")
	taxiPrices[2]={tarifa,tarifb,tarifc}
	
	tarifa=MySQL_GetVar("taxipreise", "preis", "timezone='3' and tarifzone='1'")
	tarifb=MySQL_GetVar("taxipreise", "preis", "timezone='3' and tarifzone='2'")
	tarifc=MySQL_GetVar("taxipreise", "preis", "timezone='3' and tarifzone='3'")
	taxiPrices[3]={tarifa,tarifb,tarifc}
	taxiGrundPrice=MySQL_GetVar("taxipreise", "preis", "timezone='0' and tarifzone='0'")
end

function aktualizeTaxiPricesFromDB()
	MySQL_SetVar("taxipreise", "preis", taxiPrices[1][1],"timezone='1' and tarifzone='1'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[1][2],"timezone='1' and tarifzone='2'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[1][3],"timezone='1' and tarifzone='3'")
	
	MySQL_SetVar("taxipreise", "preis", taxiPrices[2][1],"timezone='2' and tarifzone='1'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[2][2],"timezone='2' and tarifzone='2'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[2][3],"timezone='2' and tarifzone='3'")
		
	MySQL_SetVar("taxipreise", "preis", taxiPrices[3][1],"timezone='3' and tarifzone='1'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[3][2],"timezone='3' and tarifzone='2'")
	MySQL_SetVar("taxipreise", "preis", taxiPrices[3][3],"timezone='3' and tarifzone='3'")
	
	MySQL_SetVar("taxipreise", "preis", taxiGrundPrice,"timezone='0' and tarifzone='0'")
end


function setTarif_func(thePlayer,Command,timezone,tarifzone,preis)
	if(vioGetElementData(thePlayer,"fraktion")==4 and vioGetElementData(thePlayer,"fraktionsrang")==6)then
		if(timezone and tarifzone and preis)then
			local timezon=tonumber(timezone)
			local tarifzon=tonumber(tarifzone)
			local prei=tonumber(preis)
			if(timezon and tarifzon and prei)then
				taxiPrices[timezon][tarifzon]=prei
				showError(thePlayer,string.format("Der Neue Preis der Tarifzone %s der Zeitzone %s wurde gesetzt!", tarifzon, timezon))
						
			else
				showError(thePlayer,"Nutzung: /settarif [timezone 1-3] [tarifzone 1-3] [Preis]")
			end
			aktualizeTaxiPricesFromDB()
		else
			showError(thePlayer,"Nutzung: /settarif [timezone 1-3] [tarifzone 1-3] [Preis]")
		end
	else
		showError(thePlayer,"Du bist nicht Berechtigt! (Berechtigung: Rang 6)")
	end
end
addCommandHandler("settarif",setTarif_func,false,false)

function setGrundTarif_func(thePlayer,Command,preis)
	if(vioGetElementData(thePlayer,"fraktion")==4 and vioGetElementData(thePlayer,"fraktionsrang")==6)then
		if(preis)then

			local prei=tonumber(preis)
			if(prei)then
				taxiGrundPrice=prei
				showError(thePlayer,"Der neue Grundpreis wurde gesetzt.")
						
			else
				showError(thePlayer,"Nutzung: /setgrundtarif [Preis]")
			end
			aktualizeTaxiPricesFromDB()
		else
			showError(thePlayer,"Nutzung: /setgrundtarif [Preis]")
		end
	else
		showError(thePlayer,"Du bist nicht der Taxileader!")
	end
end
addCommandHandler("setgrundtarif",setGrundTarif_func,false,false)



function getTaxiTimeZone()
	local timer=getRealTime()
	local hour=timer["hour"]
	if(hour>=8 and hour<15)then
		return 1
	elseif(hour>=15 and hour<24)then
		return 2
	else
		return 3
	end
end

function donotentertaxi(thePlayer,seat)

	if(seat==0)then
		if(vioGetElementData(thePlayer,"fraktion")~=4)then
			removePedFromVehicle(thePlayer)
			showError(thePlayer,"Du bist kein Taxifahrer!")
		end
	else
		local ttime=getTaxiTimeZone()
	
		outputChatBox("Willkommen im SA-TAXI! Folgende Preise gelten:",thePlayer)
		outputChatBox(string.format("Tarifzone 1:%s", toprice(taxiPrices[ttime][1])),thePlayer)
		outputChatBox(string.format("Tarifzone 2:%s", toprice(taxiPrices[ttime][2])),thePlayer)
		outputChatBox(string.format("Tarifzone 3:%s", toprice(taxiPrices[ttime][3])),thePlayer)
		outputChatBox(string.format("Grundtarif:%s", toprice(taxiGrundPrice)),thePlayer)
	
	end

end












