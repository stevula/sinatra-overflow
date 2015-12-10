class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :post_type
      t.string :title
      t.text :body
      t.boolean :best_answer

      t.references :author, index: true
      t.references :question, index: true
      t.timestamps null: false
    end
  end
end
