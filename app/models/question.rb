class Question < ActiveRecord::Base
  belongs_to :company
  has_many :comments
  
end
