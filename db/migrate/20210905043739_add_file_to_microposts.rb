class AddFileToMicroposts < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :file, :string
  end
end
