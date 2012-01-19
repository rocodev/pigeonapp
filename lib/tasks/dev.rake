require "lorem_helper"
include LoremHelper

namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed" ]
  
  task :fake => :environment do
    
    random_amout = rand(50) + 1
    
    random_amout.times do 
      user_id = rand(50) % 2 + 1
      board_id = rand(50) % 2 + 1
      pin = Pin.new(:description => lorem_sentence, :user_id => user_id, :board_id => board_id )
      pin.save
      
      puts "generate ##{pin.id} pin"
      
      comment_count = rand(3)
      comment_count.times do 
        comment_user_id = rand(50) % 2 + 1
        comment = Comment.new(:content => lorem_sentence, :user_id => user_id, :pin => pin )
        comment.save
      end
    end
    
    users =  User.limit(2)
    
    # random insert like pin
    
    puts "insert rand like"
    
    users.each do |user|
      random_like_amount = rand(10) +1
      random_like_amount.times do 
        user.likes << Pin.first(:order => 'RAND()') 
      end
    end
    
  end
end