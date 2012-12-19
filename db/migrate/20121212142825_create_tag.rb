class CreateTag < ActiveRecord::Migration
  def self.up
    create_table :tags do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :tag_assignments do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :tag_id
      t.integer  :entry_id
    end
    add_index :tag_assignments, [:tag_id]
    add_index :tag_assignments, [:entry_id]

    add_column :entries, :tagstring, :string
  end

  def self.down
    remove_column :entries, :tagstring

    drop_table :tags
    drop_table :tag_assignments
  end
end
