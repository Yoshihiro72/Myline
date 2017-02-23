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

  # 既にルームが存在すれば移行、無ければ新規作成して移行
  def check_room
    user = User.find_by(id: current_user.id)
    talking_with_ids = JSON.parse(user.talking_with)
    if talking_with_ids.include?(params[:id])
      redirect_to :action => "show",
        :controller => "rooms", :id => params[:id]
    else
      members = [current_user.id, params[:id]]
      new_room = Room.create(
        :members => JSON.generate(members),
        :member_count => 2
      )
      user.talking_with = members
      user.save!
      redirect_to :action => "show",
        :controller => "rooms", :id => params[:id]
    end
  end

  private

  def search_users(keyword, mode)
    friends = JSON.parse(@user.friends)
  end

end
