require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end
    it "is not valid when passwords do not match" do
      @user = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "oops")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
    end
    it "is not valid when name is empty" do
      @user = User.create(name: nil, email: "email@email.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank") 
    end
    it "is not valid when email is empty" do
      @user = User.create(name: "joe", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank") 
    end
    it "is not valid when password is empty" do
      @user = User.create(name: "joe", email: "email@email.com", password: nil, password_confirmation: nil)
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end
    it "Email should be unique: user is not valid when email matches another user" do
      @user = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "password")
      @user1 = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "password")
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken") 
    end
    it "Email should be case sensitive: user is not valid when email matches another user when all same case" do
      @user = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "password")
      @user1 = User.create(name: "notjoe", email: "EMAIL@EMAIL.COM", password: "password", password_confirmation: "password")
      expect(@user1).to_not be_valid
      expect(@user1.errors.full_messages).to include("Email has already been taken") 
    end
    it "Password should have minimum length" do
      @user = User.create(name: "joe", email: "email@email.COM", password: "a", password_confirmation: "a")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)") 
    end
  end
  describe '.authenticate_with_credentials' do
    before(:all) do @user = User.create(name: "joe", email: "email@email.com", password: "password", password_confirmation: "password")
    end
    it "User should be able to login with correct email and password" do
      @session = @user.class.authenticate_with_credentials("email@email.com","password")
      expect(@session).to eql(@user)
  end
    it "User should be able to login with spaces" do
      @session1 = @user.class.authenticate_with_credentials("  email@email.com","password")
      expect(@session1).to eql(@user)
  end
    it "User should be able to login without case sensitive email" do
      @session2 = @user.class.authenticate_with_credentials("EMAIL@EMAIL.COM","password")
      expect(@session2).to eql(@user)
  end
  after(:all) do User.delete(@user.id)
  end
end
end