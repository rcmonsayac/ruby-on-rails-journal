class Task < ApplicationRecord
    validates :title, presence: true,
                     uniqueness: true
    # validates :deadline, presence: true
    belongs_to :category
end
