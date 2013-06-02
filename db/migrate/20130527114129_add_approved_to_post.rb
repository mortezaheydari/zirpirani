class AddApprovedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :approved, :integer, default: 0
  end
end
