using tuCarbureApi.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using System.Linq;
using MongoDB.Bson;
using tuCarbureApi.EntityLayer;
using MongoDB.Driver.GeoJsonObjectModel;
using Microsoft.AspNetCore.Mvc;

namespace tuCarbureApi.Services;

public class MongoDBService {
    
    private readonly IMongoCollection<Station> _stations;

    public MongoDBService(IOptions<MongoDBSettings> mongoDBSettings) {
        MongoClient client = new(mongoDBSettings.Value.ConnectionURI);
        IMongoDatabase database = client.GetDatabase(mongoDBSettings.Value.DatabaseName);
        _stations = database.GetCollection<Station>(mongoDBSettings.Value.CollectionName);
    }

    public async Task CreateAsync(Station station) {
        await _stations.InsertOneAsync(station);
        return;
    }

    public async Task<List<Station>> GetAsync() {
        return await _stations.Find(new BsonDocument()).ToListAsync();
    }

    public async Task<Station> GetByIdAsync(string id ){
        return await _stations.Find(station => station.StationId == id).FirstOrDefaultAsync();
    }

    public async Task<IEnumerable<Station>> GetStationByDistance([FromBody] StationRequest request){
        var coordinates = new GeoJsonPoint<GeoJson2DGeographicCoordinates>
        (new GeoJson2DGeographicCoordinates(request.Latitude, request.Longitude));

        var filterBuilder = Builders<Station>.Filter;
        var filter = filterBuilder.Near("coordonnees", coordinates, request.DistanceMax) 
            & filterBuilder.Eq("carburants.nom", request.NomCarburant) ;

        IEnumerable<Station> stations = await _stations.Find(filter).ToListAsync();
        var sortedStations = stations.OrderBy(s => s.Carburants.First(c => c.Nom == request.NomCarburant).Prix);
        
        return sortedStations;
        
    }
    public async Task PatchAsync(string id, string nomCarburant, decimal prix) {
        var stationFromDB = await _stations.Find(station => station.StationId == id).SingleAsync();
        return;
    }

 
}