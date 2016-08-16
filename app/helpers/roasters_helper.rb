module RoastersHelper
    def roasters_list
        Roaster.all.map { |o| [o.name, o.id] }
    end
end
