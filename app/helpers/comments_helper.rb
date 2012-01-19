# -*- encoding : utf-8 -*-
module CommentsHelper
  def render_latest_comment_status(comment)
    l(comment.created_at, :format => :long) + " by #{comment.author_name}"
  end
end
