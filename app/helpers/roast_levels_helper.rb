module RoastLevelsHelper
    def roast_levels_list
        RoastLevel.all.map { |o| [o.name, o.id] }
    end
end
