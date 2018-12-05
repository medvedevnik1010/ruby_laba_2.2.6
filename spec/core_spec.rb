require 'core'
require 'translations'

RSpec.describe Core do
  describe '#run' do
    it 'should add translation to translations list' do
        allow($stdout).to receive(:puts)
        core = Core.new
        allow(core).to receive(:menu_response_process)
        core.run
    end
  end

  describe '#menu_response_process' do
    before(:example) do
        @core = Core.new
        allow($stdout).to receive(:puts)
        allow(@core).to receive(:print)
        @translations = Translations.new
        allow(@translations).to receive(:read_from_csv_file)
        allow(@core).to receive(:sub_menu)
    end

    it 'provides a choice of the RU_EN mode of the translator' do        
        expect(@core).to receive(:gets).and_return('1')
        @core.menu_response_process(@translations)
    end

    it 'provides a choice of the EN_RU mode of the translator' do        
        expect(@core).to receive(:gets).and_return('2')
        @core.menu_response_process(@translations)
    end

    it 'wrong input' do        
        expect(@core).to receive(:gets).and_return('3')
        @core.menu_response_process(@translations)
    end
  end
end
