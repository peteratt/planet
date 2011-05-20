class Site < ActiveRecord::Base
  belongs_to :type
  belongs_to :user
  
  # Se añaden estas definiciones
  validates :name, :description, :type_id, :latitude, :longitude, :zoom, :image_url, :presence => true
  validates :zoom, :numericality => {:greater_than_or_equal_to => 0.1}
  validates :name, :uniqueness => true # Campo único (no repetido)
  
  # Debe estar protegido para evitar accesos indeseados
  attr_protected :user_id
end
