require 'rails_helper'

RSpec.describe County, type: :model do
  let(:county) {County.create(:name => "Kings County")}

  it 'has a name' do
    expect(county.name).to eq("Kings County")
  end

  describe "relationship to library" do
    it "responds to libraries method" do
      expect(county).to respond_to(:libraries)
    end
  end

  describe "relationship to member" do
    it 'responds to members method' do
      expect(county).to respond_to(:members)
    end
  end
end
