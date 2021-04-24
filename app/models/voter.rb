class Voter < ApplicationRecord
  enum gender: ['male', 'female']

  def age
    Date.today.year - dob.year if dob.present?
  end

  def address
    [address1, address2, state, city, pin].join(" ")
  end
end
