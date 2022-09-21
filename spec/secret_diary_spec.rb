require 'secret_diary'

RSpec.describe SecretDiary do
  it 'Returns contents after unlocking' do
    diary = double :fake_diary, read: 'This is the secret contents' 
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq 'This is the secret contents'
  end

  it 'raises error if attempting to read before unlocking' do
    diary = double :fake_diary, read: 'This is the secret contents' 
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error 'Go away!'
  end

  it 'raises error if relocking' do
    diary = double :fake_diary, read: 'This is the secret contents' 
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    secret_diary.lock
    expect { secret_diary.read }.to raise_error 'Go away!'
  end
end