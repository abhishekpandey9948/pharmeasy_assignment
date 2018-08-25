class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :prescription, index: true
      t.string :file_name
      t.timestamps
    end
  end
end
