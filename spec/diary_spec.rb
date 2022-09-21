require 'diary'

RSpec.describe Diary do
  describe '#read' do
    it 'returns contents' do
      diary = Diary.new('some awesome contents')
      expect(diary.read).to eq 'some awesome contents'
    end
  end
end