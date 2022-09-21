require 'diary'
require 'secret_diary'

RSpec.describe 'integration' do
  describe '#read' do
    context 'secret diary is locked' do
      it 'raises an error' do
        diary = Diary.new('My very important secret')
        secret_diary = SecretDiary.new(diary)
        expect { secret_diary.read }.to raise_error 'Go away!'
      end
    end

    context 'secret diary is unlocked' do
      it 'returns the contents' do
        diary = Diary.new('My not so important secret')
        secret_diary = SecretDiary.new(diary)
        secret_diary.unlock
        expect(secret_diary.read).to eq 'My not so important secret'
      end
    end
  end

  describe '#lock' do
    it 'relocks the book' do
      diary = Diary.new('My somewhat important secret')
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect { secret_diary.read }.to raise_error 'Go away!'
    end
  end
end