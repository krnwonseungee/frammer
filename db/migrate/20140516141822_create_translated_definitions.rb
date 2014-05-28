class CreateTranslatedDefinitions < ActiveRecord::Migration
  def change
    create_table :translated_definitions do |t|
      t.string :french_word
      t.text :english_word
      t.timestamps
    end
  end
end
