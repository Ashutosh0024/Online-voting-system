class CreateVoters < ActiveRecord::Migration[6.1]
  def change
    create_table :voters do |t|
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
      t.string :voter_id

      t.timestamps
    end
  end
end
