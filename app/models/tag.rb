class Tag < ActiveRecord::Base

  hobo_model # Don't put anything above this

  set_default_order "name"

  fields do
    name :string
    timestamps
  end
  attr_accessible :name

  has_many :entries,:through => :tag_assignments
  has_many :tag_assignments  ,:dependent => :destroy

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
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
