class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :trackable, :omniauthable

  class << self
    def find_for_jawbone_oauth(auth)
      user = User.find_or_initialize_by(auth.slice(:provider, :uid))
      user.attributes = {
        name:   auth[:info][:first_name],
        token:  auth[:credentials][:token],
        secret: auth[:credentials][:refresh_token],
        # TODO save refresh_token
        # TODO save expires_at
      }
      user.save
      user
    end
  end
end
