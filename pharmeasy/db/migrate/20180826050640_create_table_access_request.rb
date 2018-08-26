class CreateTableAccessRequest < ActiveRecord::Migration[5.0]
  def change
    create_table :access_requests do |t|
      t.integer :requestee_id
      t.integer :requester_id
      t.string :status
      t.timestamps
    end
  end
end
