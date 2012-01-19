# -*- encoding : utf-8 -*-
require "pigeon_util/regex"
class Comment < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  
  validates_presence_of :content, :message => "請輸入內容"
  validates_format_of :email, :with => PigeonUtil::Regex::EMAIL, :message => "請輸入正確的Email", :if => Proc.new { |comment| comment.user_id.blank? }
  validate :must_has_user_or_guest_data

  protected 
  
  def must_has_user_or_guest_data
    if self.name.blank? && self.user_id.blank?
      errors.add(:name, "請輸入名稱")
    end
  end
end
