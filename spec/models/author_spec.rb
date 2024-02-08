require 'rails_helper'

RSpec.describe Author, type: :model do
  subject(:author) { build(:author) }

  context 'Validations' do
    it 'is not valid without a name' do
      author.name = nil
      expect(author).not_to be_valid
    end
  end

  context 'Uniqueness' do
    it 'is not valid without a unique name' do
      author = create(:author) # Define the author object here
      new_author = build(:author, name: author.name)
  
      expect(new_author).not_to be_valid
      expect(new_author.errors[:name]).to include("has already been taken")
    end
  end

  context 'Destroy author and everything dependent on it' do
    let!(:author) { create(:author) }

    before { author.destroy }

    it 'deletes associated books' do
      expect(Book.find_by(author_id: author.id)).to be_nil
    end
  end
end
