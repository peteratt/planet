class Type < ActiveRecord::Base
  has_many :sites
  
  # Se añade esta definición de recurso
  validates :name, :description, :presence => true # Asegura su presencia
  validates :name, :uniqueness => true # Campo único (no repetido)
end
