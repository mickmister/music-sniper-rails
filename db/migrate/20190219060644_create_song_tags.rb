class CreateSongTags < ActiveRecord::Migration[5.2]
  def change
    create_table :song_tags do |t|
      t.references :tag, index: true
      t.references :section, index: true

      t.timestamps
    end
  end
end
