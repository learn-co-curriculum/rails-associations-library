require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(genre) {Genre.create(:name => "Fiction")}

  context "relationship to book" do
    expect(genre).to respond_to(:books)
  end
end
