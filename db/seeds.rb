IO.foreach("public/dictionary.txt").each do |line|
  delimiter = ["(f)", "(m)", "(m'f)", "(m'p)", "(f'p)", "  "].select{|el| line.include?(el) == true }.first
  split_definitions_arry = line.split(delimiter)
  french_term = split_definitions_arry.shift
  Translator.create(french_word: french_term, english_word: split_definitions_arry.join(" "))
end

