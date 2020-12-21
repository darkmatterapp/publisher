require 'rails_helper'

RSpec.describe Setting, type: :model do
  fixtures :settings
  let(:setting) { settings(:setting) }

  describe '.of' do
    it 'finds by the slug' do
      setting.update(slug: 'some_key')
      expect(described_class.of(:some_key)).to eq setting
    end
  end
end
