class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
      t.string :category
      t.integer :number_of_players

      t.timestamps
    end
  end
end
