require 'test_helper'

class Resolvers::SingInUserTest < ActiveSupport::TestCase
   def perform(args = {})
     Resolvers::SignInUser.new.call(nil, args, {cookies: {}})
   end

  setup do
    @user = Artist.create! name: 'test', email: 'test@mail.com', password: 'test'
  end

  test 'creates a token' do
      result = perform(
                   email: {
                       email: @user.email,
                       password: @user.password
                   }
      )

      assert result.present?
      assert result.token.present?
      assert_equal result.user, @user
    end

    test 'handling credentials' do
      assert_nil perform
    end

    test 'handling wrong email' do
      assert_nil perform(email: { email: 'wrong' })
    end

    test 'handling wrong password' do
      assert_nil perform(email: {email: @user.email, password: 'wrong'})
    end


end