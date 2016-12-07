module PermissionsConcern
 extend ActiveSupport::Concern

    def es_cliente?
        self.permission_level >= 1
    end
    
    def es_tecnico?
        self.permission_level >= 2
    end

    def es_admin?
        self.permission_level >= 3
    end

end