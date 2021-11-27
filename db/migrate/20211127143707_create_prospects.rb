class CreateProspects < ActiveRecord::Migration[6.1]
  def change
    create_table :prospects do |t|
      t.string :email
      t.string :name
      t.string :telephone
      t.string :status
      t.text :conversation

      t.timestamps
    end
  end
end
