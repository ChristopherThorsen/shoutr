class FollowingRelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:user_id])
    current_user.follow(other_user)
    redirect_to :back
  end

  def destroy
    user = User.find(params[:user_id])
    target_relationship = FollowingRelationship.where(follower: current_user, followed_user: user)
    FollowingRelationship.destroy(target_relationship)
    redirect_to :back
    
  end
end
