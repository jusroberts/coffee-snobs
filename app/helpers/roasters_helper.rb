module RoastersHelper
    def roasters_list
        Roaster.all.map { |o| [o.name, o.id] }
    end

    def roaster_name id
        Roaster.all.find(id).name rescue "INVALID"
    end
end
