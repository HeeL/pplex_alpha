module ApplicationHelper

  def js_msg(text_arr)
    js = text_arr.map{|text| "show_message(\"#{text.gsub(/"/, "'")}\");" if text.present?}.reject{|i| i.nil?}
    javascript_tag("$(document).ready(function(){ #{js.join} });") unless js.empty?
  end

end
