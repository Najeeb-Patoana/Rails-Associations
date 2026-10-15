class CreateGroupsUsersJoinTable < ActiveRecord::Migration[8.1]
  def change
    create_table :groups_users, id: false do |t|
      t.references :group,
                   null: false,
                   foreign_key: true

      t.references :user,
                   null: false,
                   foreign_key: true
    end

    add_index :groups_users, [ :group_id, :user_id ], unique: true
  end
end
