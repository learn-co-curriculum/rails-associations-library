require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a name and a description' do
    expect {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}.to_not raise_error
  end
end
