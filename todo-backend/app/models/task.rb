class Task < ApplicationRecord
    belongs_to :user
    validates :title, :description, :status, :user_id, presence: true
end
