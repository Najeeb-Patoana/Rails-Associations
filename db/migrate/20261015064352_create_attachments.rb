class CreateAttachments < ActiveRecord::Migration[8.1]
  def change
    create_table :attachments do |t|
      t.string :file_name, null: false

      t.references :attachable,
                   polymorphic: true,
                   null: false

      t.timestamps
    end

    add_index :attachments,
              [ :attachable_type, :attachable_id ],
              unique: true
  end
end
