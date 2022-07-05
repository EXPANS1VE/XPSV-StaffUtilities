Citizen.CreateThread(function()
  if (GetCurrentResourceName() ~= "XPSV-StaffUtilities") then
		StopResource(GetCurrentResourceName());
		print("[" .. GetCurrentResourceName() .. "] " .. "IMPORTANT: This resource must be named XPSV-StaffUtilities for it to work properly with other scripts...");
	end
end)
