require 'search_object/plugin/graphql'

class Resolvers::ArtistSearch
	include SearchObject.module(:graphql)

	scope { Artist.all }

	type !types[Types::ArtistType]

	ArtistFilter = GraphQL::InputObjectType.define do
		name 'ArtistFilter'

		argument :OR, -> {types[ArtistFilter]}

		argument :name_contains, types.String
		argument :email_contains, types.String
	end


	option :filter, type: ArtistFilter, with: :apply_filter
	# Can be generalized on a interface or something like that
	option :first, type: types.Int, with: :apply_first
	option :skip, type: types.Int, with: :apply_skip

	def apply_first(scope, value)
		scope.limit(value)
	end


	def apply_skip(scope, value)
		scope.offset(value)
	end
 	# end generalization

	def apply_filter(scope, value)
		branches = normalize_filters(value).reduce { |a, b| a.or(b)}
		scope.merge branches
	end

	def normalize_filters(value, branches = [])
		scope = Artist.all

		scope = scope.where('name Like ?', "%#{value['name_contains']}%") if value['name_contains']
		scope = scope.where('email Like ?', "%#{value['email_contains']}%") if value['email_contains']

		branches << scope

		value['OR'].reduce(branches) { |s, v| normalize_filters(v,s)} if value['OR'].present?

		branches
	end

end