require 'rspec'

require_relative 'hashtags.rb'

# Проверяем метод hashtags
describe 'hashtags' do

  # 1 хэштег
  it 'returns single hastag' do

    # %w- выведет слова вне массива и разделитих не запятыми ,а пробелами
    # ["#tags"] -без %w
    # "#tags" - с использованием %w
    expect(hashtags('words with #tags')).to eq %w(#tags)
  end

  # Несколько хэштегов
  it 'should several hastag' do

    # %w- выведет слова вне массива и разделитих не запятыми ,а пробелами
    # ["#words", "#tags"] -без %w
    # "#words #tags" - с использованием %w
    # .to - ожидаемый результат
    # eq  - равно
    #
    expect(hashtags('#words with #tags')).to eq %w(#words #tags)
  end

  # Хэштеги с русскими словами
  it 'should captured hashtag in Russian' do
    expect(hashtags('слова с #тегами ')) .to eq %w(#тегами)
  end

  # Хэштег с подчеркиванием
  it 'should captured hashtag with underscores' do
    expect(hashtags('hashtag#___with underscores ')) .to eq %w(#___with)
  end

  # Хэштег с минусом
  it 'should not capture the question mark' do
    expect(hashtags(' #hashtag-with minus')) .to eq %w(#hashtag-with)
  end

  # Не захватывает знак вопроса(?)
  it 'does not return question mark' do
    expect(hashtags('does not return question #mark?')) .to eq %w(#mark)
  end

  # Не захватывается восклицательный знак(!)
  it 'does not return exclamation mark 'do
    expect(hashtags('does not return exclamation #mark!')) .to eq %w(#mark)
  end
end
