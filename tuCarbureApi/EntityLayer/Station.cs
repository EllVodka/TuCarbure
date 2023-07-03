namespace tuCarbureApi.EntityLayer;
public partial class Station
{
    public Station(){}

    public int StationId {get; set;}
    public string Marque {get; set;}
    public string Voie {get; set;}
    public int NumVoie {get; set;}
    public string Ville {get; set;}
    public int CodePostal {get; set;}
    public decimal Latitude {get; set;}
    public decimal Longitude {get; set;}
    public List<Carburant> Carburants {get; set;}


}