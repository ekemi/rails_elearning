class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :student_name
      t.references :user, null: false, foreign_key: true
      t.string :studentID

      t.timestamps
    end
  end
end
