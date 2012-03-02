module MinnieOmniAuth
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)
      desc "Configures your app with a sessions_controller for Minnie-OmniAuth."

      def copy_sessions_controller
        copy_file "sessions_controller.rb", "app/controllers/sessions_controller.rb"
      end

      def show_readme
        readme "README" if behavior == :invoke
      end      
    end
  end
end