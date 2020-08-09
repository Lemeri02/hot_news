class CreateArticleLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :article_locations do |t|
      t.references :article, null: false
      t.references :location, null: false
    end
  end
end
