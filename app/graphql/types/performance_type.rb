Types::PerformanceType = GraphQL::ObjectType.define do
	name 'Performance'

	field :id, !types.ID
	field :title, !types.String
	field :place, !types.String
	field :about, !types.String

	# - "-> { }": helps against loading issues between types
  	# - "property": remaps field to an attribute of Performance model
	field :createdBy, -> {Types::ArtistType}, property: :artist
	field :applauses, -> { !types[Types::ApplauseType]}
end
