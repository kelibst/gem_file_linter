require_relative '../lib/bot.rb'
require 'colorize'
require_relative '../spec/test_reader.rb'

describe LinterBot do
  let(:gem_file) { 'spec/test.txt' }
  subject { LinterBot.new(gem_file) }

  describe '#display_gem_file' do
    @gem_file = 'spec/test.txt'
    it 'returns to return a string containedin the file to be read.' do
      expect(subject.display_gem_file).to eq(test_filedata)
    end

    it 'Should not return an integer' do
      expect(subject.display_gem_file.is_a?(Integer)).to eq(false)
    end
  end

  describe '#can_write_file?' do
    it 'returns true if the file writable' do
      expect(subject.can_write_file?).to eq(File.writable?(gem_file))
    end
  end

  describe '#all_errors' do
    it 'returns false if input if empty' do
      expect(subject.all_errors.empty?).to eq(false)
    end
  end
end
