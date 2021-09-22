require 'rails_helper'

RSpec.describe 'Artists', type: :request do
  
  it "Create an artist" do
    subject = create(:artist)

    expect(subject.name).to eq('ACDC')
  end
end
