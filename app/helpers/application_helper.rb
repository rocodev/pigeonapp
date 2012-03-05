# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def render_page_title
     if @company
       title = @page_title ? "#{@company.name} Support Center | #{@page_title}" : "#{@company.name} Support Center"
     else
       title = @page_title ? "#{SITE_NAME} | #{@page_title}" : SITE_NAME rescue "SITE_NAME"
     end
     content_tag("title", title, nil, false)
  end
  
  def render_site_title
    if @company
      title = @company.name
    else
      title = SITE_NAME
    end
  end
  
  # temp hack
  def notice_message
    flash_messages = []
    flash.each do |type, message|
      type = :success if type == :notice
      text = content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + message, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end
  
end
