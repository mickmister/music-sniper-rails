class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.references :audio_file, index: true
      t.string :name

      t.timestamps
    end
  end
end
