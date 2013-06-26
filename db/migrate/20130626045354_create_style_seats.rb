class CreateStyleSeats < ActiveRecord::Migration
  def change
    create_table :style_seats do |t|
      t.string :title
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
