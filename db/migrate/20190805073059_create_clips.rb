class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
      t.references :user, index: true
      t.references :audio_file, index: true
      
      # full-length clips can be filtered out of most views
      t.boolean :is_audio_file, default: false
      
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
