require 'rails_helper'

RSpec.describe User, type: :model do

  it "valid username, email and password" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "not valid username is empty" do
    user = FactoryBot.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("を入力してください")
  end

  it "not valid email is empty" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "not valid same 2 email" do
    user1 = FactoryBot.create(:user, email: "test@example.com")
    user2 = FactoryBot.build(:user, email: "test@example.com")
    user2.valid?
    expect(user2.errors[:email]).to include("はすでに存在します")
  end

  it "not valid password is empty" do 
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("を入力してください")
  end

end
