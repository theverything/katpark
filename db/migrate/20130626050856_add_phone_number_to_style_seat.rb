class AddPhoneNumberToStyleSeat < ActiveRecord::Migration
  def change
    add_column :style_seats, :phone_number, :string
  end
end
