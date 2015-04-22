class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
