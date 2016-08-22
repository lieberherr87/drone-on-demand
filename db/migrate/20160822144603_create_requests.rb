class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.date :due_date
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
