class Prospect < ApplicationRecord
  has_many :conversations, dependent: :destroy
  belongs_to :user

end
