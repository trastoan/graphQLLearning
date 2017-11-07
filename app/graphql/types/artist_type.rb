Types::ArtistType = GraphQL::ObjectType.define do
	name 'Artist'

	field :id, !types.ID
	field :name, !types.String
	field :email, !types.String
	field :about, types.String

	field :applauses, -> { !types[Types::ApplauseType]}
	
end
