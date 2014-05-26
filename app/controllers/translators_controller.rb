class TranslatorsController < ApplicationController
  def generate
    @practice_word = Translator.new.get_english_sentence(params["sentence"])
    print "PRACTICE!!! #{@practice_word}"
    render :json => @practice_word
  end
end
