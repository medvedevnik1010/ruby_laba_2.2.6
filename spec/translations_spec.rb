require 'translations'
require 'translation'

RSpec.describe Translations do
  describe '#read_from_csv_file' do
    it 'should read translations from correct file' do
      list = Translations.new
      file_name = 'non-existent'
      expect(CSV).to receive(:foreach).with(file_name, headers: true).and_return(Translation.new('hello','zdrav','privet'))
      list.append(list.read_from_csv_file(file_name))
      expect([list.at(0).to_s]).to eq([Translation.new('hello','zdrav','privet').to_s])
    end
  end
end