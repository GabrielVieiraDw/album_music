require 'rails_helper'

RSpec.describe Album, type: :model do
  it "Create an album" do
    subject = create(:album)

    expect(subject.name).to be_kind_of(String)
    puts subject.name
    expect(subject.year).to be_kind_of(String)
    puts subject.year
  end
end
