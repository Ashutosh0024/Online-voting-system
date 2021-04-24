class CreateVoteRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :vote_records do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :voter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
