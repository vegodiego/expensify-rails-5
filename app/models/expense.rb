class Expense < ApplicationRecord
	validates :concept, presence: true
	validates :amount, presence: true
end
