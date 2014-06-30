class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
      t.belongs_to :user, index: true, null: false
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
