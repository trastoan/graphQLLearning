require 'test_helper'

class Resolvers::CreateArtistTest < ActiveSupport::TestCase
	def perform(args = {})
		Resolvers::CreateArtist.new.call(nil, args, nil)
	end

	test 'Artist without about' do 
		artist = perform(
			name: 'Test User',
      		authProvider: {
		        email: {
		          email: 'email@example.com',
		          password: '[omitted]'
		        }
		    }
		)

	assert artist.persisted?
	assert_equal artist.name, 'Test User'
	assert_equal artist.email, 'email@example.com'
	end

	test 'Artist with about' do
		artist = perform(
			name: 'Test User',
			about: 'something',
      		authProvider: {
		        email: {
		          email: 'email@example.com',
		          password: '[omitted]'
		        }
		    }
		)

	assert artist.persisted?
	assert_equal artist.name, 'Test User'
	assert_equal artist.email, 'email@example.com'
	assert_equal artist.about, 'something'
	end

	test 'failure' do
    	assert perform.is_a? GraphQL::ExecutionError
  	end
end
