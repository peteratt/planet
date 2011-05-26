class CommentsController < ApplicationController
  
  def create
    
    if current_user
      @site = Site.find(params[:site_id])
      params[:comment][:user_id] = current_user.id
    
      @comment = @site.comments.build(params[:comment])
    
      if @comment.save
        redirect_to site_path(@site)
      else
        redirect_to(@site, :notice => 'Error, comentario de mas de 140 caracteres')
      end
    else
      redirect_to new_user_session_path
    end
    
  end
  
  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end
  
  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @comment = current_user.comments.find(params[:id])
    @site = Site.find(@comment.site_id)

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to(@site, :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @site = Site.find(@comment.site_id)
    
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(@site, :notice => 'Comment was succesfully deleted.') }
      format.xml  { head :ok }
    end
  end
  
end
