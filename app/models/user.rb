class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # ユーザーのfriendsを取得し、idの文字列からインスタンスへ変換
  def friend_id_to_instance(user, ids = nil)
    user[:friends] = "[]" if user[:friends] == nil
    friend_ids = ids.nil? ? JSON.parse(user.friends) : ids
    friends = []
    friend_ids.each do |id|
      friends.push(User.find_by(id: id.to_i))
    end
    friends
  end

  # 友達一覧でボタンがクリックされたユーザーを友達(追加 or 解除)
  def friends_edit(user, mode, id)
    user.friends = "[]" if user.friends == nil
    friend_ids = JSON.parse(user.friends)

    if mode == "add"
      friend_ids.push(id)
    else
      friend_ids.delete(id)
    end

    user.friends = JSON.generate(friend_ids)
    user.save!
    friend_ids
  end

  # ユーザーのfriendsを取得し、idの文字列からインスタンスへ変換
  def room_id_to_instance(user, ids = nil)
    user[:rooms] = "[]" if user[:rooms] == nil
    room_ids = ids.nil? ? JSON.parse(user.rooms) : ids
    rooms = []
    room_ids.each do |id|
      rooms.push(Room.find_by(id: id.to_i))
    end
    rooms
  end

end
