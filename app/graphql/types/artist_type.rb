Types::ArtistType = Graphql::ObjectType.define do
	name 'Artist'

	field: id, !types.ID
	field: name, !types.String
	field: about, types.String
	field: email, !types.String
end
