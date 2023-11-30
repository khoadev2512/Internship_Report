# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:book) }

    it { is_expected.to validate_presence_of(:year_published) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:out_of_print) }
    it { is_expected.to validate_presence_of(:views) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:book) }

    it { is_expected.to have_many(:reviews).class_name('Review') }
    it { is_expected.to have_and_belong_to_many(:orders).class_name('Order') }
    it { is_expected.to belong_to :author }
    it { is_expected.to belong_to :supplier }
  end

  describe 'callbacks' do
    subject { FactoryBot.build(:book) }

    it { is_expected.to callback(:log_product_saved_to_db).after(:save) }
  end

  describe 'others' do
    subject { FactoryBot.build(:book) }

    it { is_expected.to have_one_attached(:avatar) }
    it { is_expected.to have_rich_text(:content) }
  end
end
