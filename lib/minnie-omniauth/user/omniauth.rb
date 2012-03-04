module Minnie
  module User
    module Omniauth
      extend ActiveSupport::Concern    

      module ClassMethods
        def authenticate(auth_hash)
          if (user = self.first(conditions: {uid: auth_hash['uid']}))
            user.assign_account_info(auth_hash)
            user.save
            user
          else
            create_from_auth_hash(auth_hash)
          end
        end

        def create_from_auth_hash(auth_hash)
          create do |user|
            user.assign_account_info(auth_hash)
          end
        end         
      end    

      module InstanceMethods
        def assign_account_info(auth_hash)
          self.uid                 = auth_hash['uid']
          self.name                = auth_hash['info']['name']
          self.username            = auth_hash['info']['nickname'] if auth_hash['info']['nickname']          
          self.access_token        = auth_hash['credentials']['token']  if auth_hash['credentials']['token']
          self.access_token_secret = auth_hash['credentials']['secret'] if auth_hash['credentials']['secret']                   
        end 
      end 
    end
  end
end


