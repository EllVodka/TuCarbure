using MongoDB.Bson.Serialization.Attributes;

namespace tuCarbureApi.EntityLayer
{
    public class CarburantToUpdate
    {
        [BsonElement("stationId")]
        public string StationId { get; set; }

        [BsonElement("nomCarburant")]
        public string NomCarburant { get; set;}

        [BsonElement("prix")]
        public decimal PrixCarburant { get; set;}

        [BsonElement("dateMaj")]
        public string DateMaj { get; set; }
    }
}
