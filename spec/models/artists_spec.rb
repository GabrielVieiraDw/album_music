require 'rails_helper'

RSpec.describe Artist, type: :model do
    
  it "Create an artist" do
    subject = create(:artist)

    expect(subject.name).to be_kind_of(String)
    puts subject.name
  end
end
