class Comment < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :site
	
	validates_presence_of :comentario # El campo comentario se hace obligatorio
	
	# Debe estar protegido para evitar accesos indeseados
  	attr_protected :user_id

end
