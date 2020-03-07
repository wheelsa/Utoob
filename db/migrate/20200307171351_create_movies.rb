class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :duration
      t.string :genre
      t.string :description
      t.string :trailer
      t.string :image

      t.timestamps
    end
  end
end
