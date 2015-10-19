require 'rails_helper'

RSpec.describe Genre, type: :model do
<<<<<<< HEAD
  let(:genre) {Genre.create(:name => "Fiction")}
=======
  let(genre) {Genre.create(:name => "Fiction")}
>>>>>>> master

  describe "its attributes" do
    it "has a name" do
      expect(genre.name).to eq("Fiction")
    end
  end

  describe "relationship to book" do
    it "responds to books method" do
      expect(genre).to respond_to(:books)
    end
  end
end
