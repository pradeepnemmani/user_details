# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string(255)
#

require 'rails_helper'

RSpec.describe User, :type => :model do
	before(:each) do
		@attr = { 
			:name => "Example User", 
			:email => "user@example.com",
			:password => "foobar",
			:password_confirmation => "foobar"
		}
	end
  # pending "add some examples to (or delete) #{__FILE__}"
  it "should create a new instance given a valid attribute " do
  	User.create!(@attr)
end

it "should require a name" do
 no_name_user= User.new(@attr.merge(:name => ""))
 no_name_user.should_not be_valid
	end

	it "should requir an email address" do
		no_email_user = User.new(@attr.merge(:email => ""))
	end

	it "should reject name that are  too long" do
		long_name = "a" * 51
		long_name_user = User.new(@attr.merge( :name => long_name))
		long_name_user.should_not be_valid
	end

	it " should be  accept valid email address " do
		addressess = %w[hello@foo.com bye@baz.com seeyou@foo.com]
		addressess.each do |address|
			valid_email_addree = User.new(@attr.merge(:email => address))
			valid_email_addree.should be_valid
		end
	end	

	#it "should not accept the invalid email address" do
	#	invalid_addressess = %w[user@foo,com user_at_foo.org example.user@foo] 
	#	addressess.each do |address|
	#		invalid_eamil_address = User.new(@attr.merge(:email => address))
	#		invalid_eamil_address.should_not be_valid
	#	end
	#end	

	it "should reject duplicate email addresses" do
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end

	it " should  reject email address identical up to case" do
		upcased_email = "USER@EXAMPLE.COM"
		User.create!(@attr.merge(:email => upcased_email))
		user_with_duplicate_email = User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end

	describe "Passwords" do

		before(:each) do
			@user =User.new(@attr)
		end

		it "should have a password attribute" do
			@user.should respond_to(:password)
		end

		it "should have password conformationa attribute" do
			@user.should respond_to(:password_confirmation)
		end
	end
	describe "password validation" do

		it "should requir a password" do 
			User.new(@attr.merge(:password =>"", :password_confirmation => "")).should_not be_valid

		end

		it "should requir a matching password confirmation " do
			User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
		end

		it "should reject short passwords" do
			short = "a" * 5
			hash = @attr.merge(:password => short, :password_confirmation => short)
			User.new(hash).should_not be_valid
		end

		it "should reject long passwords" do
			short = "a" * 41
			hash = @attr.merge(:password => short, :password_confirmation => short)
			User.new(hash).should_not be_valid
		end

	end

	describe "password encryption" do
		
		before(:each) do
			@user =  User.create!(@attr)
		 end

		it "should have an encrypted password  attribute" do
			@user.should respond_to(:encrypted_password)
		end

	end



end
