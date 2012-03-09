require 'authlogic'

namespace :bolt do
    
  namespace :users do

    desc "Create default admin user"
    task :create_admin => :environment do
    
      raise "Usage: specify email address, e.g. rake [task] email=mail@backbonecms.com" unless ENV.include?("email")
  		    
      admin = Bolt::User.new( {:login => 'admin', :name => 'Admin', :email => ENV['email'], :access_level => $BOLT_USER_ACCESS_LEVEL_ADMIN, :password => 'password', :password_confirmation => 'password'} )
      
      unless admin.save
        puts "[Bolt] Failed: check that the 'admin' account doesn't already exist."
      else
        puts "[Bolt] Created new admin user with login 'admin' and password 'password'"
      end      
    end

    desc "Remove all users"
    task :remove_all => :environment do
      users = Bolt::User.find(:all)
      num_users = users.size
      users.each { |user| user.destroy }
      puts "[Bolt] Removed #{num_users} user(s)"      
    end

  end

end
