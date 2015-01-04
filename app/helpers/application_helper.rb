# encoding: utf-8
module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Трапеза"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def getfavs
    s=cookies[:fav]
    s="" if s.blank?
    return s.split(",")
  end

  def getfav(id)
    if getfavs.include? id.to_s
      return "heart-on.png"
    else
      return "heart-off.png"
    end
  end
end
