class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.text :name
      t.text :email
      t.text :department
      t.text :message
      t.boolean :status

      t.timestamps
    end
  end
end
