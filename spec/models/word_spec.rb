require 'rails_helper'

RSpec.describe Word, type: :model do
  it { should have_one(:definition).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end
