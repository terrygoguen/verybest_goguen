class Venue < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  # Validations

  # Scopes

  def to_s
    dish_id
  end

end
