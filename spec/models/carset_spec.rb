require 'rails_helper'

RSpec.describe Carset, :type => :model do
  describe '#parse_file' do
    let(:set) { build :carset }
    let(:contents) { "1909, 'Ford', 'Model T'\n1926, 'Chrysler', 'Imperial'\n1948, 'Citron', '2CV'\n" }

    it "passes the file contents to the import service" do
      CarsetImportService.should_receive(:process).with(contents).and_return({ success: true })
      set.parse_file
    end

    it 'saves the failed record' do
      CarsetImportService.should_receive(:process).and_return({ success: false, failed_records: 'a' })
      set.parse_file
      expect(set.failed_records).to eq('a')
    end

  end
end
