class AddImageToStyleSeat < ActiveRecord::Migration
  def change
    add_column :style_seats, :image, :string
  end
end
