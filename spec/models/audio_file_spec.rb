require 'rails_helper'

RSpec.describe AudioFile, type: :model do
  describe 'full length clip' do
    it 'should create the full length clip' do
      file = FactoryBot.create(:audio_file)
      
      expect(file.full_length_clip).not_to eq(nil)
      expect(file.full_length_clip).to eq(Clip.last)
      expect(file.full_length_clip.is_audio_file).to eq(true)
    end
  end
end
