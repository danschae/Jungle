require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validates' do
    it 'saves if all the required fields are filled' do
    @user = User.new(name: 'Daniel Schaefer', email: 'danschae@gmail.com', password:'123456', password_confirmation: '123456')
    @user.save
      expect(User.count).to eq(1)
    end
    it 'Does not save if passwords dont match' do
    @user = User.new(name: 'Daniel Schaefer', email: 'danschae@gmail.com', password:'123456', password_confirmation: '12345')
    @user.save
       expect(User.count).to eq(0)
    end
    it 'Password must be more than 3 characters' do
      @user = User.new(name: 'Daniel Schaefer', email: 'danschae@gmail.com', password:'12', password_confirmation: '12')
      @user.save
        expect(User.count).to eq(0)
    end
    it 'wont work if email already exists and is typed in capital letters' do
      @user = User.new(name: 'Daniel Schaefer', email: 'danschae@gmail.com', password:'123456', password_confirmation: '123456')
      @user.save
      @user1 = User.new(name: 'Daniel Schaefer', email: 'DANSCHAE@gmail.com', password:'123456', password_confirmation: '123456')
      @user1.save
        expect(User.count).to eq(1)
    end
  end

  describe '.authenticate_with_credentials' do 
    it "signs up and removes whitespaces" do
      @user = User.new(name: 'Daniel Schaefer', email: ' danschae@gmail.com', password:'123456', password_confirmation: '123456')
      @user.save
      @found = User.find_by(name: 'Daniel Schaefer')
      
    end
    it 'signs in if case is wrong and there are whitespaces' do
      @user = User.new(name: 'Daniel Schaefer', email: ' TEST@TEST.com', password:'123456', password_confirmation: '123456')
      @user.save
      expect(User.authenticate_with_credentials('test@test.com', "123456")).to be_truthy
    end
  end
end
