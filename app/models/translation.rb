class Translation < ActiveRecord::Base
  include HTTParty
  base_uri 'http://glosbe.com/gapi/'

  def initialize
    @options = {  query: {from: 'fra', dest: 'eng', format: 'json'} }
  end

  def get_translated_word(french_word)
    @options[:query][:phrase] = french_word
    self.class.get("/translate", @options)
  end
end


# http://glosbe.com/gapi/translate?
#   from=pol&
#   dest=eng&
#   format=json&
#   phrase=witaj&
#   pretty=true


