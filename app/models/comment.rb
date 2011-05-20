class Comment < ActiveRecord::Base
  
  belongs_to :site
  belongs_to :user
  
  validates :body, :presence => true, :length => { :maximum => 140 }

end
