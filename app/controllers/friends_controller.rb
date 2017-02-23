class FriendsController < ApplicationController
  def index
    @users = User.where("confirmed_at is not ?", nil)
    @friends = User.new.friend_id_to_instance(current_user)
  end

  # Ajaxでユーザーのfriendsを追加、削除
  def modify
    user = User.find_by(id: current_user.id)
    ids = user.friends_edit(user, params[:mode], params[:id])
    @friends = User.new.friend_id_to_instance(current_user, ids)
  end

  private

  def search_users(keyword, mode)
    friends = JSON.parse(@user.friends) 
  end

end
