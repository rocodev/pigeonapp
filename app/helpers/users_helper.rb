# -*- encoding : utf-8 -*-
module UsersHelper
  
  def render_question_user_name(question)
    unless question.user_id.blank?
      question.user.login
    else
      question.guest_name
    end
  end
  
  def render_question_create_time(question)
    l(question.created_at, :fomat => :long)
  end
  
  def render_user_avatar(user,size = :normal, opts = {})
    link = opts[:link] || true
    
    width = 36
    case size
    when :normal
      width = 36
    when :small
      width = 16
    when :large
      width = 64
    else
      width = size
    end
    
    hash = (user.blank? or user.email.blank?) ? Digest::MD5.hexdigest("") : Digest::MD5.hexdigest(user.email)
    return image_tag("http://www.gravatar.com/avatar/#{hash}.png?s=#{width}&d=identicon")  if user.blank?
    
    img_src = "http://www.gravatar.com/avatar/#{hash}.png?s=#{width}&d=identicon"
    img = image_tag(img_src, :style => "width:#{width}px;height:#{width}px;", :class => "buddy-icon")
  
    return img
  end
  
end
