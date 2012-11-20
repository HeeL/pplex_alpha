class LanguagesController < ApplicationController
  
  def match_names
    langs = Language.match_names(params[:name])
    respond_to do |format|
      format.json { render json: langs.as_json(only: [:id, :name]) }
    end 
  end
  
end
