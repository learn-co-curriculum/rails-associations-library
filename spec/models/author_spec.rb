require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) {Author.create(:name => "Chimamanda Ngozi Adichie")}

  it "has a name" do
    expect(author.name).to eq("Chimamanda Ngozi Adichie")
  end

  describe "connection to book model" do
    it "responds to books method" do
      expect(author).to respond_to(:books)
    end

    it "responds to book_authors method" do
      expect(author).to respond_to(:book_authors)
    end
  end
end