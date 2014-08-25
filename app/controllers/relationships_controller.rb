class RelationshipsController < ApplicationController
  
  def create
    @jobapp = Jobapp.find(params[:relationship][:jobapp_id])
    if current_user.apply!(@jobapp)
      flash[:success] = "applied!"
      redirect_to @jobapp
    end
  end

  # def destroy
    # @user = Relationship.find(params[:id]).followed
    # current_user.unfollow!(@user)
    # respond_to do |format|
      # format.html { redirect_to @user }
      # format.js
    # end
  # end
end
