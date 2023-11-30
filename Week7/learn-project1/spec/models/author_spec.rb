# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:author) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:author) }

    it { is_expected.to have_many(:books).class_name('Book') }
    it { is_expected.to accept_nested_attributes_for(:books) }
  end

  describe 'callbacks' do
    subject { FactoryBot.build(:author) }

    it { is_expected.to callback(:announce).after(:save) }
    # it { should callback(:send_email).after(:save) }
  end

  describe 'others' do
    subject { FactoryBot.build(:author) }

    it { is_expected.to have_one_attached(:picture) }
    it { is_expected.to have_rich_text(:content) }
  end

  describe 'class_methods' do
    describe '.ransackable_associations' do
      it 'returns an array with the allowed association' do
        associations = described_class.ransackable_associations

        expect(associations).to eq(['books'])
      end
    end

    describe '.ransackable_attributes' do
      it 'returns an array with the allowed attributes' do
        attributes = described_class.ransackable_attributes

        expect(attributes).to eq(%w[title first_name last_name created_at updated_at])
      end
    end
  end
end
