class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :french_word
      t.text :english_word
      t.timestamps
    end
  end
end
