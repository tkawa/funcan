class User < ActiveRecord::Base
  has_many :votes

  def self.create_with_omniauth(auth)
    create! do |u|
      u.name = auth['user_info']['name']
      u.screen_name = auth['user_info']['nickname']
      u.uid = auth['uid']
      u.image = auth['user_info']['image']
      u.provider = auth['provider']
      u.token = auth['credentials']['token']
      u.secret = auth['credentials']['secret']
    end
  end
end
