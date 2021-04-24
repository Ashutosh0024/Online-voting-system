class Candidate < ApplicationRecord

  enum gender: ['male', 'female']

  has_many :vote_records, dependent: :destroy

  def age
    Date.today.year - dob.year if dob.present?
  end

  def address
    [address1, address2, state, city, pin].join(" ")
  end

  def vote_count
    vote_records.count
  end

end
