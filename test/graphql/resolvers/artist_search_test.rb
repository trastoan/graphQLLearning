require 'test_helper'

class Resolvers::ArtistSearchTest < ActiveSupport::TestCase
	def find(args)
		Resolvers::ArtistSearch.call(nil, args, nil)
	end


	test 'skip option' do
		artist = create :artist, name: 'old'
		create :artist, name: 'new'

		assert_equal find(skip: 1), [artist]
	end

	test 'first option' do
		artist = create :artist, name: 'old'
		create :artist, name: 'new'

		assert_equal find(first: 1), [artist]
	end

	test 'filter_options' do
		artist1 = create :artist, name: 'Adam1', email: 'adam1@mail.com'
		artist2 = create :artist, name: 'Adam2', email: 'adam2@mail.com'
		artist3 = create :artist, name: 'Adam3', email: 'adam3@mail.com'

		result = find(
			filter: {
				'name_contains' => 'adam1',
				'OR' => [{
					'email_contains' => 'adam2@mail.com',
					'OR' => [{
						'email_contains' => 'adam3@mail.com'
					}]
				}, {
					'email_contains' => 'adam2@mail.com'
				}]
			}
		)

		assert_equal result.map(&:name).sort, [artist1, artist2, artist3].map(&:name).sort
	end

end