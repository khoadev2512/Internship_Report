require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:author) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:title) }
  end
end
