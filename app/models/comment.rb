# -*- encoding : utf-8 -*-
require "pigeon_util/regex"
class Comment < ActiveRecord::Base
  belongs_to :question, :counter_cache => true
  belongs_to :user
  
  validates_presence_of :content, :message => "請輸入內容"
  validates_format_of :guest_email, :with => PigeonUtil::Regex::EMAIL, :message => "請輸入正確的Email", :if => Proc.new { |comment| comment.user_id.blank? }
  validate :must_has_user_or_guest_data

  def author_name
    if user
      user.login
    else
      guest_name
    end
  end
  protected 
  
  def must_has_user_or_guest_data
    if self.guest_name.blank? && self.user_id.blank?
      errors.add(:name, "請輸入名稱")
    end
  end
end
