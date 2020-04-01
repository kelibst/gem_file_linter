require_relative '../lib/bot.rb'
require_relative '../spec/test_reader.rb'

describe Bot do
  let(:gem_file) { 'gem' }
  subject { Bot.new(gem_file) }

  describe '#display_gem_file' do
    @gem_file = 'test.txt'
    it 'returns to return a string containing the files in the file to be read.' do
      expect(subject.display_gem_file).to eq(test_filedata)
    end
  end

  # describe '#file_prepend' do

  # let(:new_str) {'Hello World'}

  # it 'returns prepends the string at the beginning of the file.' do

  #     expect(subject.file_prepend('test.txt', new_str)).to eq('Hello Worldtest'.length)
  # end

  # end
end
