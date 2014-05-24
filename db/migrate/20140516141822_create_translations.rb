class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :french_word
      t.text :english_word
      t.timestamps
    end
  end
end
