# -*- encoding : utf-8 -*-
class User
  module OmniauthCallbacks
    
    ["facebook"].each do |provider|
      define_method "find_or_create_for_#{provider}" do |response|
        uid = response["uid"]
        data = response["info"]

        if auth = Authorization.where( :provider => provider , :uid => uid).first
          auth.user
        elsif user = User.find_by_email(data["email"])
          user.bind_service(response)
          user
        else 
          user = User.new_from_provider_data(provider,uid,data)

          if user.save(:validate => false)
            user.authorizations << Authorization.new(:provider => provider, :uid => uid )
            return user
          else
            Rails.logger.warn("User.create_from_hash 失败，#{user.errors.inspect}")
            return nil
          end
        end
        
      end
    end
     
    
    def new_from_provider_data(provider, uid, data)
      user = User.new
      user.email = data["email"]
      user.email = "twitter+#{uid}@example.com" if provider == "twitter"
      user.email = "douban+#{uid}@example.com" if provider == "douban"
      
      user.login = data["nickname"]
      user.login = data["name"] if provider == "google"
      user.login.gsub!(/[^\w]/, "_")
      if User.where(:login => user.login).count > 0 || user.login.blank?
        user.login = "u#{Time.now.to_i}"
      end
      
      user.password = Devise.friendly_token[0,20]

      return user
    end
  end
end
