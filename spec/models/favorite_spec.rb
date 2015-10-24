require 'rails_helper'
include RandomData


RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
  let(:post) { create(:post) }
  let(:user) { create(:user) }
  let(:favorite) { Favorite.create!(post: post, user: user) }

  it { should belong_to(:post) }
  it { should belong_to(:user) }

end
