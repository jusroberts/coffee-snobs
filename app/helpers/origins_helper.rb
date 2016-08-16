module OriginsHelper
    def origins_list
        Origin.all.map { |o| [o.name, o.id] }
    end


end
