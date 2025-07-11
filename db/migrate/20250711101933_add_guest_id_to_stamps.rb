class AddGuestIdToStamps < ActiveRecord::Migration[8.0]
  def change
    add_column :stamps, :guest_id, :string
  end
end
