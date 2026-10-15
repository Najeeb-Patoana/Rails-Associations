class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false

      t.references :user,
                   null: false,
                   foreign_key: true

      t.references :post,
                   null: true,
                   foreign_key: true

      t.references :article,
                   null: true,
                   foreign_key: true

      t.references :parent_comment,
                   null: true,
                   foreign_key: { to_table: :comments }

      t.timestamps
    end
  end
end
