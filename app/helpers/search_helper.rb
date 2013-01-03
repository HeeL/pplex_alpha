module SearchHelper

  def prices(person)
    min = person.min_price
    max = person.max_price
    return '&ndash;'.html_safe if min + max == 0
    return "$#{min}" if min == max
    "$#{min} &ndash; $#{max}".html_safe
  end

  def langs(person)
    person.languages.empty? ? '&ndash;'.html_safe : person.languages.map(&:name).join(', ')
  end

end