class Comment < ApplicationRecord
<<<<<<< Updated upstream
=======
  belongs_to :user
  belongs_to :prototype

  validates :content, presence: true
>>>>>>> Stashed changes
end
