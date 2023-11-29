# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:author) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:author) }
    it { should have_many(:books).class_name('Book') }
    it { should accept_nested_attributes_for(:books) }
  end

  describe 'callbacks' do
    subject { FactoryBot.build(:author) }
    it { should callback(:announce).after(:save) }
    # it { should callback(:send_email).after(:save) }
  end

  describe 'others' do
    subject { FactoryBot.build(:author) }

    it { should have_one_attached(:picture) }
    it { should have_rich_text(:content) }
  end

  describe 'class_methods' do
    describe '.ransackable_associations' do
      it 'returns an array with the allowed association' do
        associations = Author.ransackable_associations

        expect(associations).to eq(['books'])
      end
    end

    describe '.ransackable_attributes' do
      it 'returns an array with the allowed attributes' do
        attributes = Author.ransackable_attributes

        expect(attributes).to eq(%w[title first_name last_name created_at updated_at])
      end
    end
  end
end
