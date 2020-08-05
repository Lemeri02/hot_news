class AddArticleRefToLocation < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :article, foreign_key: true
  end
end
