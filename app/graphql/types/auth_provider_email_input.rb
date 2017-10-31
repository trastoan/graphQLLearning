Types::AuthProviderEmailInput = Graphql::ObjectType.define do
	name 'AUTH_PROVIDER_EMAIL'

	argument: email, !types.String
	argument: password, !types.String
end