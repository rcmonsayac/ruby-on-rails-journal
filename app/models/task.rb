class Task < ApplicationRecord
    validates :title, presence: true,
                     uniqueness: true
    # validates :deadline, datetime: true
    belongs_to :category
    belongs_to :user
end
