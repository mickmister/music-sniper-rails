class CreateOAuthAccessData < ActiveRecord::Migration[5.2]
  def change
    create_table :o_auth_access_data do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :token
      t.string :refresh_token
      t.timestamp :expires_at

      t.timestamps
    end
    add_index :o_auth_access_data, :provider
  end
end
