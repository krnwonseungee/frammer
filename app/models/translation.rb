class Translation < ActiveRecord::Base
  include HTTParty
  base_uri 'http://glosbe.com/gapi/'

  def initialize
    @options = { from: 'fra', dest: 'eng', format: 'json' }
  end

  def get_translated_word(french_word)
    @options[:phrase] = french_word
    glosbe_hash = self.class.get("/translate", @options)
    # glosbe_hash["tuc"]
  end
end


# http://glosbe.com/gapi/translate?
#   from=pol&
#   dest=eng&
#   format=json&
#   phrase=witaj&
#   pretty=true


