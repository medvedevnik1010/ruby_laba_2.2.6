require 'translations'
require 'translation'

RSpec.describe Translations do
  describe '#read_from_csv_file' do
    it 'should read translations from correct file' do
      list = Translations.new
      translation = Translation.new('hello', 'zdrav', 'privet')
      file_name = 'non-existent'
      expect(CSV).to receive(:foreach).with(file_name, headers: true).and_return(translation)
      list.read_from_csv_file(file_name)
    end
  end

  describe '#append' do
    it 'should add translation to translations list' do
      list = Translations.new
      translation = Translation.new('hello', 'zdrav', 'privet')
      list.append(translation)
      expect(list.translations).to eq([translation])
    end
  end

  describe '#each_to_print' do
    it 'should print translations to console' do
      list = Translations.new
      allow($stdout).to receive(:puts)
      translation = Translation.new('bye', 'poka', '')
      list.append(translation)
      list.each_to_print
    end
  end

  describe '#clear' do
    it 'should clear translations list' do
      list = Translations.new
      bye_translation = Translation.new('bye', 'poka', '')
      list.append(bye_translation)
      list.clear
      expect(list.translations.empty?).to eq(true)
    end
  end

  describe '#at' do
    it 'should return translation by index from translations list' do
      list = Translations.new
      bye_translation = Translation.new('bye', 'poka', '')
      list.append(bye_translation)
      expect(list.at(0)).to eq(bye_translation)
    end
  end

  describe '#to_s' do
    it 'should convert translation with synonyms to string' do
      bye_translation = Translation.new('hello', 'privet', 'zdrav')
      expect(bye_translation.to_s).to eq('Word: hello, Translation: privet, Synonyms: zdrav')
    end
  end

  describe '#print_translation_with_synonyms' do
    before(:example) do
      @list = Translations.new
      @bye_translation = Translation.new('bye', 'poka', '')
      @hello_translation = Translation.new('hello', 'привет', 'здравствуйте')
      allow($stdout).to receive(:puts)
      allow(@list).to receive(:print)
    end

    it 'should print translation without synonyms for preset word' do
      @list.append(@bye_translation)
      @list.print_translation_with_synonyms('bye')
      @list.clear
    end

    it 'should print translation with synonyms for preset word' do
      @list.append(@hello_translation)
      @list.print_translation_with_synonyms('hello')
    end
  end

  describe '#print_words_starts_with_letter' do
    it 'should print words that starts with preset letter' do
      list = Translations.new
      allow($stdout).to receive(:puts)
      allow(list).to receive(:print)
      bye_translation = Translation.new('bye', 'poka', '')
      list.append(bye_translation)
      list.print_words_starts_with_letter('b')
    end
  end

  describe '#print_words_translation' do
    it 'should print input words translations' do
      list = Translations.new
      allow($stdout).to receive(:puts)
      bye_translation = Translation.new('bye', 'poka', '')
      list.append(bye_translation)
      list.print_words_translation('bye')
    end
  end
end
