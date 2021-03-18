class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :semester
      t.string :course
      t.string :others
      t.string :degree
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
