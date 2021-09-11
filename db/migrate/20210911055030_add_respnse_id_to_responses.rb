class AddRespnseIdToResponses < ActiveRecord::Migration[6.0]
  def change
    add_column :responses, :response_id, :integer
  end
end
