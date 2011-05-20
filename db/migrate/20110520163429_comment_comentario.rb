class CommentComentario < ActiveRecord::Migration
  def self.up
  	change_table :comments do |t| # añade la columna name a la tabla sites
		t.column :comentario, :text
	end
  end

  def self.down
  	change_table :comments do |t|
		t.remove :comentario
	end
  end
end
