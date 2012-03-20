# -*- encoding : utf-8 -*-
module ThingsHelper
  
  def render_thing_verb(verb)
    if verb == "NO"
      "不"
    else
      "要"
    end
  end
end
