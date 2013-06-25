class AddFeaturedAndCategoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :boolean, default: false
    add_column :posts, :category, :string
  end
end
