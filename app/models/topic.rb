class Topic < ActiveRecord::Base

  has_many :posts, dependent: :destroy

  scope :visible_to, -> (user) { user ? all : publicly_viewable}

  scope :publicly_viewable, -> { where(public: true) }
  scope :privatly_viewable, -> { where(public: false)}

end
