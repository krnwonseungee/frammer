class Translator
  include HTTParty
  base_uri 'http://glosbe.com/gapi/'

  def get_english_sentence(french_sentence)
    @eng_sent_arr = Array.new
    french_sentence.split(" ").each do |fr_word|
      @eng_sent_arr << get_translated_word(fr_word)
    end
    @eng_sent_arr
  end

  def get_translated_word(french_word)
    if TranslatedDefinition.where("french_word like ?", french_word + "%" ).length != 0
      find_translated_word_via_db(french_word)
    else
      find_translated_word_via_api(french_word) + " "
    end
  end

  private

  def find_translated_word_via_db(untranslated_word)
    puts "THRU DB #{untranslated_word}"
    TranslatedDefinition.where("french_word like ?", untranslated_word + "%" ).first.english_word + " "
  end

  def find_translated_word_via_api(untranslated_word)
    puts "THRU API #{untranslated_word}"
    @options = {  query: {from: 'fra', dest: 'eng', format: 'json', phrase: untranslated_word } }
    self.class.get("/translate", @options)["tuc"][0]["phrase"]["text"]
  end
end
