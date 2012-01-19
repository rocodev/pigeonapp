# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


#CATEGOEY_NAME = %w(ART FOOD DESIGN SPORTS TECHNOLOGY WEDDING OTHER)
#
#def create_seed_category
#  CATEGOEY_NAME.each do |name|
#    category = Category.create(:name => name)
#  end
#end

def create_user(email,login,fb_id)
  user = User.new(:email => email)
  user.password = Devise.friendly_token[0,20]
  user.login = login
  user.save!
  
  user_identiry = user.authorizations.build(:provider => "facebook", :uid => fb_id)
  user_identiry.save!
end
  
def create_seed_user
  create_user("xuite.joke@gmail.com", "xdite", "577398551")
  create_user("evendesign@gmail.com", "evenwu", "612130717")
end

Company.create!(:name => "Logdown", :slug => "logdown")
Company.create!(:name => "Rocodev", :slug => "rocodev")

#create_seed_category
#create_seed_user
#