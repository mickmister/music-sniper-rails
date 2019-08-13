class CreateProjectClips < ActiveRecord::Migration[5.2]
  def change
    create_table :project_clips do |t|
      t.references :project, index: true
      t.references :clip, index: true

      t.timestamps
    end
  end
end
