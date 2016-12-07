class Report < ActiveRecord::Base
    include AASM
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    belongs_to :user
    validates :prioridad, presence: true
    validates :descripcion, presence: true
    validates :point_of_t, presence:true
    validates :problem, presence:true
    
    scope :asignados, ->{where(state: "asignado")}
    scope :resueltos, ->{where(state: "resuelto")}
    scope :en_orden, ->{order("created_at DESC")}
    scope :recibidos, ->{where(state: "recibido")}
    scope :ultimos, ->{order("created_at ASC")}
    
    aasm column: "state" do
        state :recibido, initial: true
        state :asignado
        state :resuelto
        
        event :asignar do
            transitions from: :recibido, to: :asignado
        end
        
        event :desasignar do
            transitions from: :asignado, to: :recibido
        end
        
        event :resolver do
            transitions from: :asignado,to: :resuelto
        end
        
    end
    
    private
    
end
