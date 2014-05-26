class Translator < ActiveRecord::Base
  include HTTParty
  base_uri 'http://glosbe.com/gapi/'

  def get_english_sentence(french_sentence)
    @eng_sent_arr = Array.new
    french_sentence.split(" ").each do |fr_word|
      if Translator.where("french_word like ?", fr_word ).exists?
        translated_word = get_translated_word_via_db(fr_word) + " "
        puts "THRU DB #{translated_word}"
      else
        translated_word = get_translated_word_via_api(fr_word) + " "
        puts "THRU API #{translated_word}"
      end
      @eng_sent_arr << translated_word
    end
    @eng_sent_arr
  end

  def split_words(sent_str)
    sent_str.split(" ")
  end

  def get_translated_word_via_db(untranslated_word)
    Translator.where("french_word like ?", fr_word ).first.english_word
  end

  def get_translated_word_via_api(untranslated_word)
    @options = {  query: {from: 'fra', dest: 'eng', format: 'json', phrase: untranslated_word } }
    self.class.get("/translate", @options)["tuc"][0]["phrase"]["text"]
  end

end


# http://glosbe.com/gapi/translate?
#   from=pol&
#   dest=eng&
#   format=json&
#   phrase=witaj&
#   pretty=true


