#Minnie-OmniAuth

minnie-omniauth is an authentication strategy for the [minnie gem](https://github.com/mm53bar/minnie).

###First Things First

Make sure you know what you're doing with OmniAuth. Check out the Railscast at [http://railscasts.com/episodes/235-omniauth-part-1](http://railscasts.com/episodes/235-omniauth-part-1)

###Install

All good with Omniauth.  OK - let's get going.

Add minnie-omniauth to your Gemfile

     gem 'minnie-omniauth'

Now follow the instructions for the minnie gem to run the generator.  Here's a hint:

     bundle exec rails generate minnie:install

Then run the minnie-omniauth installer to get a sessions_controller that works with OmniAuth:

     bundle exec rails generate minnie-omniauth:install

Update your generated ApplicationController with the appropriate signin URL for your OmniAuth strategy. For example:

     def sign_in_path
       '/auth/twitter'
     end

Now generate a User model with this command:

     bundle exec rails generate model User uid:string name:string username:string access_token:string access_token_secret:string

And update the generated User model so that your model looks like this:

     class User < ActiveRecord::Base
       include Minnie::User::Omniauth
     end

Lastly, make sure you've set up your provider's callback in config/routes.rb:

     match '/auth/:provider/callback', to: 'sessions#create'

You're all done!  Now try to sign in to your app at [/signin](http://localhost:3000/signin).  

###Issues

There isn't much code here so try resolving issues on your own. If you get some issues fixed, send me a pull request!

If you're not making any headway, just create an issue and I'll try to look at it.

