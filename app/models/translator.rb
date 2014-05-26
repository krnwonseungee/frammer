class Translator < ActiveRecord::Base
  include HTTParty
  base_uri 'http://glosbe.com/gapi/'

  # def initialize(args)
  #   @french_word = args[:french_word]
  #   @eng_word = args[:english_word]
  #   @options = {  query: {from: 'fra', dest: 'eng', format: 'json'} }
  #   @eng_sent_arr = Array.new
  # end

  def get_english_sentence(french_sentence)
    french_sentence.split(" ").each do |fr_word|
      @eng_sent_arr << (get_translated_word(fr_word) + " ")
    end
    @eng_sent_arr
  end

  def split_words(sent_str)
    sent_str.split(" ")
  end

  def get_translated_word(untranslated_word)
    @options[:query][:phrase] = untranslated_word
    self.class.get("/translate", @options)["tuc"][0]["phrase"]["text"]
  end

end


# http://glosbe.com/gapi/translate?
#   from=pol&
#   dest=eng&
#   format=json&
#   phrase=witaj&
#   pretty=true


