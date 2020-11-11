class ChangeDatatypeImageOfblogs < ActiveRecord::Migration[5.2]
  def change
    change_column :blogs, :image, :string
  end
end
