namespace tuCarbureApi.EntityLayer;

public partial class Carburant {

    public Carburant() {}

    public string Nom {get; set;}
    public string NomEuropeen {get; set;}
    public decimal Prix {get; set;}
    public DateTime DateMaj {get; set;}
}