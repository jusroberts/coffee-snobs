module RoastLevelsHelper
    def roast_levels_list
        RoastLevel.all.map { |o| [o.name, o.id] }
    end

    def roast_level_name id
        RoastLevel.all.find(id).name rescue "INVALID"
    end
end
