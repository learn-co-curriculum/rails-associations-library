require 'rails_helper'

RSpec.describe Author, type: :model do
  before(:each) do
    @author = Author.create(:name => "Chimamanda Ngozi Adichie")
  end

  it "has a name" do
    expect(@author.name).to eq("Chimamanda Ngozi Adichie")
  end

  describe "associations" do
    it "responds to author_books method" do
      expect(@author).to respond_to(:author_books)
    end

    it "responds to books method" do
      @author.books.build
      expect(@author).to have(:no).errors_on(:books)
    end
  end
end
