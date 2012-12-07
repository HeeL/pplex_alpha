class LanguagesController < ApplicationController
  
  def match_names
    @langs = Language.match_names(params[:name])
    render layout: false
  end
  
end
