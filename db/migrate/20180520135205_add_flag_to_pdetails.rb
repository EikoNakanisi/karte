class AddFlagToPdetails < ActiveRecord::Migration[5.0]
  def change
    add_column :pdetails, :availability, :boolean
  end
end
