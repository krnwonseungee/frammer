class TranslatorsController < ApplicationController
  def generate
    render :json => Translator.new.get_english_sentence(params["sentence"])
  end
end
