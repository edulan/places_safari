class User < ActiveRecord::Base

  def self.register(login, password)

    hash = Digest::MD5.hexdigest(password)
    user = User.create(:email => login, :password => hash)
    return user if  user.valid?

    raise Exception.new("Error creating user")

  end

end
