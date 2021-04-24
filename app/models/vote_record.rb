class VoteRecord < ApplicationRecord
  belongs_to :candidate
  belongs_to :voter
end
