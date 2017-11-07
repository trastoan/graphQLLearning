Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :allPerformances, function: Resolvers::PerformanceSearch

  field :allArtists, !types[Types::ArtistType] do 
  	resolve -> (obj, args, ctx) {Artist.all}
  end
  
end
