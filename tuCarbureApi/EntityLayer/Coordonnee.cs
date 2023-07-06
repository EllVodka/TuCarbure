using MongoDB.Bson.Serialization.Attributes;

namespace tuCarbureApi.EntityLayer;

public partial class Coordonnee {

    [BsonElement("latitude")]
    public double Latitude {get; set;}

    [BsonElement("longitude")]
    public double Longitude {get; set;}
}