describe "saved a drawing to the image folder:" do
  it "a file called drawing exists in the public/img folder" do
    possible_extentions = ["png", "jpg", "gif", "jpeg"]
    possible_file_names = possible_extentions.map {|ext| "images/drawing.#{ext}"}
    file_name = Dir["images/*"][0]
    expect(file_name).to satisfy { |n| possible_file_names.include?(n) }
  end

  it "the drawing file is not empty" do
    file_names = Dir["images/*"]
    contents = read_file(file_names[0])
    expect(contents.length).to be > 500
  end
end

describe "filled out models:" do
  MODELS = ["book", "checkout", "county", "genre", "library", "member", "topic", "author"]
  it "each model file has content" do
    MODELS.each do |model|
      contents = read_file("app/models/#{model}.rb")
      expect(contents.length).to be > 25
    end
  end
end

describe "filled out migrations:" do
  MIGRATIONS = ["books", "authors", "libraries", "members", "checkouts", "topics", "genres", "counties"]
  it "each model file has content" do
    MIGRATIONS.each_with_index do |model, i|
      contents = read_file("db/migrate/0#{i + 1}_create_#{model}.rb")
      expect(contents.length).to be > 25
    end
  end
end

describe "answered questions correctly:" do
  it "which one of the original eight migrations was a join table between memebers and books?" do
    file_name = "05_create_checkouts.rb"
    expect(encode(file_name)).to eq("578733af48e2ed4890e138fc3183f211ea1878fe")
  end
end
