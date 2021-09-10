class CreateArtist < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :twitter
      t.string :external_id
      
      t.timestamps
    end
  end
end
