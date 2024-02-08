require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Validations' do
    it 'is not valid without a title' do
      book = build(:book, title: nil)
      expect(book).not_to be_valid
    end
  end

  context 'Uniqueness' do
    it 'is not valid without a unique title' do
      book1 = create(:book)
      book2 = build(:book, title: book1.title)
  
      expect(book2).not_to be_valid
      expect(book2.errors[:title]).to include("has already been taken")
    end
  end

  context 'Destroy book and everything dependent on it' do
    let!(:book) { create(:book) }

    before { book.destroy }

    it 'deletes associated records' do
      expect(Book.find_by(id: book.id)).to be_nil
      # Add expectations to verify deletion of associated records here
    end
  end
end
