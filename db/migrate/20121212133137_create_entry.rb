class CreateEntry < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string   :name
      t.text     :body_markdown
      t.text     :body_html
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :entries
  end
end
