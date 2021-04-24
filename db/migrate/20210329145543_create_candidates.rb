class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :party
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.integer :gender
      t.string :aadhar_number
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :pin
      t.string :phone
      t.integer :vote_count, default: 0

      t.timestamps
    end
  end
end
