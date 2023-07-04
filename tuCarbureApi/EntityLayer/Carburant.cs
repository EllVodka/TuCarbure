using MongoDB.Bson.Serialization.Attributes;

namespace tuCarbureApi.EntityLayer;

public partial class Carburant {

    [BsonElement("nom")]
    public string? Nom {get; set;}

    [BsonElement("nomEuropeen")]
    public string? NomEuropeen {get; set;}

    [BsonElement("prix")]
    public decimal? Prix {get; set;}
    
    [BsonElement("dateMaj")]
    public DateTime? DateMaj {get; set;}

}