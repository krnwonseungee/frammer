class TranslationsController < ApplicationController
  def generate
    @practice_word = Translation.new.get_translated_word(params["sentence"])
    # print "PRACTICE!!! #{@practice_word}"
    render :json => @practice_word
  end
end
