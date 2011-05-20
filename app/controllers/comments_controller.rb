class CommentsController < ApplicationController
  
  def create
    
    @site = Site.find(params[:site_id])
    params[:comment][:user_id] = current_user.id
    
    @comment = @site.comments.build(params[:comment])
    
    if @comment.save
      redirect_to site_path(@site)
    else
      redirect_to site_path(@site)
    end
    
  end
  
end
