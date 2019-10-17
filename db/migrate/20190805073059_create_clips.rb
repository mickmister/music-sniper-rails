class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.references :user, index: true
      t.references :audio_file, index: true

      t.string :name
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
