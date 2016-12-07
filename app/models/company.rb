class Company < ActiveRecord::Base
    has_many :users
    validates :nombre, presence: true, uniqueness: true
    validates :rfc, presence: true, uniqueness: true
    validates :razon_social, presence:true, uniqueness: true
    validates :telefono, presence:true ,length: { is: 10 },:numericality => { :only_integer => true }
    validates :email, presence:true
    validates :contacto, presence:true
    validates :nomenclatura, presence:true, uniqueness: true
end
