class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :title
      t.text :body
      t.boolean :best_answer
      t.timestamps null: false

      t.references :author, index: true
      t.references :question, index: true
    end
  end
end
