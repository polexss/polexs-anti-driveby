CreateThread(function()
    local weaponRemove = false
        while true do
            local sleep = 1000
            local ped = PlayerPedId()
            local weaponIs = GetSelectedPedWeapon(ped)
            local vehicleIn = IsPedInAnyVehicle(ped)
            if vehicleIn then
                sleep = 500
                    if not weaponRemove then
                        RemoveAllPedWeapons(ped, true)
                        weaponRemove = true
                    end
                end
                if weaponIs ~= `WEAPON_UNARMED` then
                    sleep = 1
                    if IsControlPressed(0, 25) then
                        if not isInVehicleCamMode then
                            isInVehicleCamMode = true
                            SetFollowVehicleCamViewMode(4)
                        end
                    else
                        if isInVehicleCamMode then
                            isInVehicleCamMode = false
                            SetFollowVehicleCamViewMode(1)
                        end
                    end
                end
            Wait(sleep)
        end
end)
