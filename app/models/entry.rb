class Entry < ActiveRecord::Base

  hobo_model # Don't put anything above this

  before_save MarkdownWrapper.new

  fields do
    name          :string
    tagstring     :string
    body_markdown :text
    body_html     :html
    timestamps
  end
  attr_accessible :name, :body_markdown, :tagstring, :tags #,:created_at  #, :body_html


  has_many :tags,:through => :tag_assignments,:accessible => true
  has_many :tag_assignments ,:dependent => :destroy

  belongs_to :user, :creator => true

  has_many :comments ,:dependent => :destroy


  children :tags
  children :comments

  lifecycle do
    state :drafted ,:default => true
    state :published

    transition :publish ,{:drafted => :published},:available_to => :user
    transition :unpublish,{:published => :drafted}, :available_to => :user

  end




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
    acting_user.administrator? or state == 'published'
  end

end
