Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createPerformance, function: Resolvers::CreatePerformance.new
  field :createArtist, function: Resolvers::CreateArtist.new
  field :signinUser, function: Resolvers::SignInUser.new
end

