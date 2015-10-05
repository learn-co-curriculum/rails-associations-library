require 'rails_helper'

RSpec.describe Author, type: :model do
    let(:author) {Author.create(:name => "Chimamanda Ngozi Adichie")}
    let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

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
end
