Types::ApplauseType = GraphQL::ObjectType.define  do
	name 'Applause'

	field :id, !types.ID
	field :artist, -> {Types::ArtistType}
	field :performance, -> {Types::PerformanceType}
end