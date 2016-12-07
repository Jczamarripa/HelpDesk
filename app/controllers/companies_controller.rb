class CompaniesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_company ,except: [:index,:new,:create,:usuarios,:tecnicos,:uodateu]
    before_action :autenticar_admin!
   def index
       @companies = Company.all
   end
    
    def usuarios
       @usuarios = User.where("permission_level = 1")
   end
    
    def tecnicos
       @tecnicos = User.where("permission_level = 2")
   end
    
    def show
    end
    
    def new
        @company = Company.new
    end
    
    def usuarios
        @usuarios = User.where("permission_level = 1")
    end
    
    def create
        #hasta strong params
        @company = Company.new(company_params)
        @company.valid?
        if @company.save
            redirect_to @company
        else
            render :new
        end
            
    end
    
    def edit
    end
    
    def update
        if @company.update(company_params)
            redirect_to @company
        else
            render :edit
        end
    end
    
    private
    
    def set_company
        @company = Company.find(params[:id])
    end
    
    def company_params
        params.require(:company).permit(:nombre,:rfc,:razon_social,:telefono,:contacto,:nomenclatura,:email)
    end
        
end