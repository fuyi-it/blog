class Comment < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    body :text
    timestamps
  end
  attr_accessible :body,:entry_id,:user_id

  belongs_to :entry
  belongs_to :user,:creator => true

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
