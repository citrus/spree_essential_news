class CreateArticleProducts < ActiveRecord::Migration
  def self.up
    create_table :article_products do |t|
      t.references :article
      t.references :product
      t.integer    :position
    end
  end

  def self.down
    drop_table :article_products
  end
end