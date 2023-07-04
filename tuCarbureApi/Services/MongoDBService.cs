using tuCarbureApi.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using MongoDB.Bson;
using tuCarbureApi.EntityLayer;

namespace tuCarbureApi.Services;

public class MongoDBService {
    
    private readonly IMongoCollection<Station> _stations;

    public MongoDBService(IOptions<MongoDBSettings> mongoDBSettings) {
        MongoClient client = new MongoClient(mongoDBSettings.Value.ConnectionURI);
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

    public async Task<Station> PatchAsync(Station station) {
        return station;
    }

 
}