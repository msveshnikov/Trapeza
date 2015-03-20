# encoding: utf-8
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = 'Трапеза'
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def getfavs
    s = cookies[:fav]
    s = '' if s.blank?
    s.split(',')
  end

  def getfav(id)
    if getfavs.include? id.to_s
      return 'heart-on.png'
    else
      return 'heart-off.png'
    end
  end

  POSTS = [['23.02.2015', '11.04.2015', 'Великий Пост'],
           ['18.01.2015', '18.01.2015', 'Крещенский сочельник'],
           ['08.06.2015', '11.07.2015', 'Петров пост'],
           ['14.08.2015', '27.08.2015', 'Успенский пост'],
           ['28.11.2015', '06.01.2016', 'Рождественский пост']]

  def postinfo
    POSTS.each do |f|
      today = Date.today
      if today >= Date.strptime(f[0], '%d.%m.%Y') && today <= Date.strptime(f[1], '%d.%m.%Y')
        return "#{f[2]} (c #{f[0]} по #{f[1]}). Открыть <a href=" '/categories?post=1' '>Постное Меню</a>'.html_safe
      end
    end
    nil
  end
end
