class TranslationsController < ApplicationController
  def generate
    @practice_word = Translation.new.get_translated_word(params["sentence"])
    render :json => @practice_word
  end
end
