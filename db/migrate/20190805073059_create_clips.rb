class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.references :user, index: true
      t.references :audio_file, index: true

      t.string :name
      t.integer :start_time
      t.integer :end_time

      t.datetime :deleted_at, index: true
      t.timestamps
    end
  end
end
