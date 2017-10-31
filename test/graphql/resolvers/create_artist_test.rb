require 'test_helper'

class Resolvers::CreateArtistTest < ActiveSupport::TestCase
	def perform(args = [])
		Resolvers.CreateArtist.new.call(nil, args, nil)
	end

	test 'success' do 
		artist = Perform(
			name: 'Test User',
      		authProvider: {
		        email: {
		          email: 'email@example.com',
		          password: '[omitted]'
		        }
		    }
		)

	assert artist.persisted?
	assert_equal user.name, 'Test User'
	assert_equal user.email, 'email@example.com'
	end

	test 'failure' do
    	assert perform.is_a? GraphQL::ExecutionError
  	end
end
