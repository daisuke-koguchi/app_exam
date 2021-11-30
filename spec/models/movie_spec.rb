require 'rails_helper'
RSpec.describe Movie, type: :model do
  it "is valid with a title, production_year, running_time, rating" do
    movie = Movie.new(
      title: 'DIC',
      production_year: 2000,
      running_time: 120,
      rating: 'G')
    expect(movie).to be_valid
  end
  it "is invalid without a title"
  it "is invalid with a duplicate title"
  it "is invalid with title is 101 or more characters"
end