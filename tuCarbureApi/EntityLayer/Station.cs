using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using Newtonsoft.Json;
using System.Text.Json.Serialization;

namespace tuCarbureApi.EntityLayer;

public partial class Station
{

    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? StationId {get; set;}

    [BsonElement("marque")]
    public string? Marque {get; set;}

    [BsonElement("voie")]
    public string? Voie {get; set;}

    [BsonElement("numVoie")]
    public int? NumVoie {get; set;}

    [BsonElement("ville")]
    public string? Ville {get; set;}

    [BsonElement("codePostal")]
    public int CodePostal {get; set;}

    [BsonElement("coordonnees")]
    public Coordonnee? Coordonnees {get; set;}

    [BsonElement("carburants")]
    public List<Carburant> Carburants {get; set;} = null!;


}