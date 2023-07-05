using tuCarbureApi.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using MongoDB.Bson;
using tuCarbureApi.EntityLayer;
using MongoDB.Driver.GeoJsonObjectModel;

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

    public async Task<List<Station>> GetByIdAsync(string id ){
        return await _stations.Find(station => station.StationId == id).ToListAsync();
    }

    public async Task<List<Station>> GetStationByDistance(double latitude, double longitude, int distanceMax){
        var coordinates = new GeoJsonPoint<GeoJson2DGeographicCoordinates>
        (new GeoJson2DGeographicCoordinates(latitude, longitude));

        var filter = Builders<Station>.Filter.Near("coordonnees", coordinates, distanceMax);
        List<Station> stations = await _stations.Find(filter).ToListAsync();
        return stations;
        
    }

    public async Task<Station> PatchAsync(Station station) {
        return station;
    }

 
}