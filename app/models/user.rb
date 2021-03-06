class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
    belongs_to :company
    accepts_nested_attributes_for :company
    has_many :reports
    include PermissionsConcern
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
