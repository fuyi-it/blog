class CreateComment < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text     :body
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :entry_id
      t.integer  :user_id
    end
    add_index :comments, [:entry_id]
    add_index :comments, [:user_id]

    add_column :entries, :user_id, :integer

    add_index :entries, [:user_id]
  end

  def self.down
    remove_column :entries, :user_id

    drop_table :comments

    remove_index :entries, :name => :index_entries_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
