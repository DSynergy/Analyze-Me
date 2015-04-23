class User < ActiveRecord::Base

  def self.find_or_create_from_auth_hash(data)
    user = User.find_or_create_by(provider: data.provider, uid: data.uid)
    #if you have multiple providers, need to have has many relationship to providers and provider table
    user.email = data.info.email
    user.first_name = data.info.first_name
    user.last_name = data.info.last_name
    user.name = data.info.name
    user.gender = data.extra.raw_info.gender
    user.image = data.info.image
    user.token = data.credentials.token
    user.link = data.extra.raw_info.link
    user.locale = data.extra.raw_info.locale
    user.save
    user
  end
end
