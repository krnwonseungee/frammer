IO.foreach("public/dictionary.txt").each do |line|
  delimiter = ["(f)", "(m)", "(m'f)", "(m'p)", "(f'p)", "  "].select{|el| line.include?(el) == true }.first
  split_definitions_arry = line.split(delimiter)
  french_term = split_definitions_arry.shift
  TranslatedDefinition.create(french_word: french_term, english_word: split_definitions_arry.join(" "))
end

StanfordCoreNLP.use :french # or :german

# text = 'Angela Merkel met Nicolas Sarkozy on January 25th in ' +
#    'Berlin to discuss a new austerity package. Sarkozy ' +
#    'looked pleased, but Merkel was dismayed.'

text = 'Au lendemain des révélations sur Bygmalion, Copé a annoncé sa démission de la direction de moi. Elle sera effective le 15 juin.'

pipeline =  StanfordCoreNLP.load(:tokenize, :ssplit, :pos, :lemma, :parse)
text = StanfordCoreNLP::Annotation.new(text)
pipeline.annotate(text)

text.get(:sentences).each do |sentence|
  # Syntatical dependencies
  puts sentence.get(:basic_dependencies).to_s
  sentence.get(:tokens).each do |token|
    # Default annotations for all tokens
    # print token.get(:value).to_s
    # print token.get(:original_text).to_s
    # print token.get(:character_offset_begin).to_s
    # print token.get(:character_offset_end).to_s
    # POS returned by the tagger
    puts token
    puts token.get(:part_of_speech).to_s
    puts " "
    # Lemma (base form of the token)
    # print token.get(:lemma).to_s
    # Named entity tag
    # print token.get(:named_entity_tag).to_s
    # Coreference
    # print token.get(:coref_cluster_id).to_s
    # Also of interest: coref, coref_chain,
    # coref_cluster, coref_dest, coref_graph.
  end
end
