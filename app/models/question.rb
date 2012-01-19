# -*- encoding : utf-8 -*-
require "pigeon_util/regex"
class Question < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :category, :counter_cache => true
  has_many :comments
  
  validates_presence_of :content, :message => "請輸入內容"
  validates_format_of :guest_email, :with => PigeonUtil::Regex::EMAIL, :message => "請輸入正確的Email", :if => Proc.new { |comment| comment.user_id.blank? }
  validate :must_has_user_or_guest_data

  protected 
  
  def must_has_user_or_guest_data
    if self.guest_name.blank? && self.user_id.blank?
      errors.add(:name, "請輸入名稱")
    end
  end
  
end
