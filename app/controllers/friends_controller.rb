class FriendsController < ApplicationController
  def index
    @users = User.where("confirmed_at is not ?", nil)
  end

  def add
    @user = current_user
    @user.friends = "[]" if @user.friends == nil
    friends = JSON.parse(@user.friends)
    friends.push(params[:id])
    @user.friends = JSON.generate(friends)
    @user.save!
  end

  private

  #def user_params
  #  params.require(:user).permit(:id)
  #end
end
