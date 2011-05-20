class CommentUsuariositio < ActiveRecord::Migration
  def self.up
  	change_table :comments do |t| # añade la columna user_id a la tabla comments
		t.column :user_id, :integer
		t.column :site_id, :integer
	end
  end

  def self.down
  	change_table :sites do |t|
		t.remove :user_id
		t.remove :site_id
	end
  end
end
