require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'adding clips' do
    it 'should save a clip in its collection' do
      project = FactoryBot.create(:project)
      clip = FactoryBot.create(:clip)

      project.clips.push(clip)
      project.save

      p = Project.find(project.id)
      expect(p.clips.length).to eq(1)
    end

    it 'should accept clips as attributes' do
      project = FactoryBot.create(:project)
      clip = FactoryBot.create(:clip)

      project.update({
        project_clips_attributes: [
          {clip_id: clip.id},
        ],
      })

      p = Project.find(project.id)
      expect(p.clips.length).to eq(1)

      clip2 = FactoryBot.create(:clip)
      project.update({
        project_clips_attributes: [
          {clip_id: clip2.id},
        ],
      })

      p = Project.find(project.id)
      expect(p.clips.length).to eq(2)

      project.update({
        project_clips_attributes: [
          {id: project.project_clips.first.id, _destroy: true},
        ],
      })

      p = Project.find(project.id)
      expect(p.clips.length).to eq(1)
    end
  end
end
