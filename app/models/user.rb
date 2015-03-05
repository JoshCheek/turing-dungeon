class User < ActiveRecord::Base
  belongs_to :cohort

  def self.find_or_create_with_omniauth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])
    user.name = auth['info']['name']
    user.email = auth['info']['email']
    user.avatar = auth['info']['image']
    user.token = auth['credentials']['token']
    user.save
    user
  end
end
