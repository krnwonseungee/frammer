class TranslationsController < ApplicationController
  def generate
    untranslated_sentence = params["sentence"]
    translation_maker = Translation.new
    @practice_word = translion_maker.get_translated_word(untranslated_sentence)
    render :json => @practice_word
    # redirect_to root_path
  end
end
