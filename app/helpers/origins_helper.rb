module OriginsHelper
    def origins_list
        Origin.all.map { |o| [o.name, o.id] }
    end

    def origin_name id
        Origin.all.find(id).name rescue "INVALID"
    end


end
