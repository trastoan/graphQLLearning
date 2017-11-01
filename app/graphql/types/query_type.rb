Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  
  field :allPerformances, !types[Types::PerformanceType]  do
    resolve -> (obj, args, ctx) { Performance.all }
  end

  field :allArtists, !types[Types::ArtistType] do 
  	resolve -> (obj, args, ctx) {Artist.all}
  end
  
end
