class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :provider
      t.text :uid
      t.text :avatar
      t.text :token
      t.references :cohort, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :cohorts
  end
end
