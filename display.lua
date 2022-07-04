Citizen.CreateThread(function()
  if (GetCurrentResourceName() ~= "XPSV-StaffUtilities") then
		StopResource(GetCurrentResourceName());
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named XPSV-StaffUtilities for it to work properly with other scripts...");
	end
end)

Citizen.CreateThread(function()
	local CurrentVersion = 'v1.1'
	if not CurrentVersion then
		print('^1XPSV-StaffUtilities Version Check Failed!^7')
	end

	function VersionCheckHTTPRequest()
		PerformHttpRequest('https://raw.githubusercontent.com/Xanex-JS/Menu-Checker/master/version.json', VersionCheck, 'GET')
	end

	-- i am so bored

	function VersionCheck(err, response, headers)
		Citizen.Wait(3000)
		if err == 200 then
			local Data = json.decode(response)

			if CurrentVersion ~= Data.NewestVersion then
				print('\n--------------------------------------------------------------------------')
				print('\nXPSV-StaffUtilities is outdated!')
				print('Current Version: ^2' .. Data.NewestVersion .. '^7')
				print('Your Version: ^1' .. CurrentVersion .. '^7')
				print('Please download the lastest version from ^5' .. Data.DownloadLocation .. '^7')
				if Data.Changes ~= '' then
					print('\n^5Changes: ^7' .. Data.Changes)
				end
				print('\n--------------------------------------------------------------------------\n^7')
			else
				print('^2XPSV-StaffUtilities is up to date!^7')
			end
		else
			print('^1XPSV-StaffUtilities Version Check Failed!^7')
		end

		SetTimeout(60000000, VersionCheckHTTPRequest)
	end

	if CurrentVersion then
		VersionCheckHTTPRequest()
	end
end)
