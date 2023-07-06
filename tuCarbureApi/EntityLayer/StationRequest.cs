using MongoDB.Bson.Serialization.Attributes;

namespace tuCarbureApi.EntityLayer
{
    public class StationRequest
    {
        [BsonElement("latitude")]
        public double Latitude { get; set; }

        [BsonElement("longitude")]
        public double Longitude { get; set; }

        [BsonElement("distanceMax")]
        public int DistanceMax {get; set; }

        [BsonElement("nomCarburant")]
        public string? NomCarburant {get; set; }
    }
}