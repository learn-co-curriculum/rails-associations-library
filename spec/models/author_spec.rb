require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) {Author.create(:name => "Chimamanda Ngozi Adichie")}

  it "has a name" do
    expect(author.name).to eq("Chimamanda Ngozi Adichie")
  end

  describe "associations" do
    it "responds to author_books method" do
      expect(author).to respond_to(:author_books)
    end

    it "responds to books method" do
      expect(author).to respond_to(:books)
    end
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> master
