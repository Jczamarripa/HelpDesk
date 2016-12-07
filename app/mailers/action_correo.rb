class ActionCorreo < ApplicationMailer
    def informe_email
  
  mail(to: "helpdesk@sonnica.com.mx", subject: 'Nuevo reporte en HelpDesk')
end
end
