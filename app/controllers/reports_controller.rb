class ReportsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_report,except: [:procesoUsuario,:index,:new,:create,:historial,:asignados,:asignadosTecnico,:historialTecnico,:creadosUsuario,:historialUsuario,:welcome]
    before_action :autenticar_cliente!,only: [:new,:create,:show]
    before_action :autenticar_tecnico!,only: [:resuelto,:asignadosTecnico,:historialTecnico,:edit]
    before_action :autenticar_admin!,only: [:index,:desasignar,:asignar,:historial,:asignados]
    
    def welcome
    end
    
   def index
       @reports = Report.recibidos.ultimos
   end
    
    def show
        if @report.tecnico != nil
        @tecnico = User.find(@report.tecnico)
        end
    end
    
     def historial
        @reports = Report.resueltos.en_orden
    end
    
    def asignados
        @reports = Report.asignados.ultimos
    end
    
    def asignadosTecnico
        @reports = Report.asignados.ultimos.where("tecnico = ?",current_user.id)
    end
    
    def historialTecnico
        @reports = Report.resueltos.en_orden.where("tecnico = ?",current_user.id)
    end
    
    def creadosUsuario
        @reports = Report.recibidos.ultimos.where("user_id = ?",current_user.id)
    end
    
    def procesoUsuario
        @reports = Report.asignados.en_orden.where("user_id = ?",current_user.id)
    end
    
    def historialUsuario
        @reports = Report.resueltos.en_orden.where("user_id = ?",current_user.id)
    end
    
    def new
        @report = Report.new
    end
    
    def create
        #hasta strong params
        @report = current_user.reports.new(report_params)
        @report.valid?
        if @report.save
            ActionCorreo.informe_email.deliver
            redirect_to root_path
        else
            render :new
        end
            
    end
    
    def edit
        @tecnicos = User.where("permission_level = 2").sort_by{|e| e[:last_name]}
    end
    
    def update
        @tecnicos = User.where("permission_level = 2").sort_by{|e| e[:last_name]}
        if @report.update(report_params)
            if @report.may_asignar?
                @report.asignar!
            else
                @report.resolver!
            end
        redirect_to @report
        else
            render :edit
        end
    end
    
    private
    
    def set_report
        @report = Report.find(params[:id])
    end
    
    def report_params
        params.require(:report).permit(:prioridad,:descripcion,:point_of_t,:problem,:tecnico)
    end
        
end