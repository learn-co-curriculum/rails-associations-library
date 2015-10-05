require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:all) do
    @book = Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")
  end
  it 'has a title' do
    expect(@book.title).to eq("Half of a Yellow Sun")
  end

  it "has a description" do
  expect(@book.description).to eq("With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")
  end

  description "associations" do
    it "responds to author_books method" do
      expect(@book).to respond_to(:author_books)
    end

    # it "responds to author" do
    #   expect(@book).to respond_to(:authors)
    # end
  end
end
