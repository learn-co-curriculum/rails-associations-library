require 'rails_helper'

RSpec.describe Checkout, type: :model do
  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

  let(:checkout) {Checkout.create(:start_date => "2015-09-25", :date_returned => "2015-09-30", :book_id => book.id)}

  it "has a start_date" do
    expect(checkout).to respond_to(:start_date)
  end

  it "has an end date" do
    expect(checkout).to respond_to(:date_returned)
  end

  describe "relationship to book" do
    it "responds to books method" do
      expect(checkout).to respond_to(:book)
    end
  end
end
