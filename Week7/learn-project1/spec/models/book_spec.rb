# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:book) }
    it { should validate_presence_of(:year_published) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:out_of_print) }
    it { should validate_presence_of(:views) }
  end

  describe 'associations' do
    subject { FactoryBot.build(:book) }
    it { should have_many(:reviews).class_name('Review') }
    it { should have_and_belong_to_many(:orders).class_name('Order') }
    it { should belong_to :author }
    it { should belong_to :supplier }
  end

  describe 'callbacks' do
    subject { FactoryBot.build(:book) }
    it { should callback(:log_product_saved_to_db).after(:save) }
  end

  describe 'others' do
    subject { FactoryBot.build(:book) }

    it { should have_one_attached(:avatar) }
    it { should have_rich_text(:content) }
  end
end
