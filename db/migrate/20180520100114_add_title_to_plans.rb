class AddTitleToPlans < ActiveRecord::Migration[5.0]
  def change
    add_column :plans, :hyokad, :date
    add_column :plans, :plno, :integer
  end
end
