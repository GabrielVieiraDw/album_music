require 'rails_helper'

RSpec.describe 'Albums', type: :request do
  
  it "Create an album" do
    subject = create(:album)

    expect(subject.name).to eq('Highway to hell')
    expect(subject.year).to eq('2021')
  end
end
