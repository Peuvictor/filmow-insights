class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.integer :year
      t.float :rating
      t.string :filmow_url

      t.timestamps
    end
  end
end
