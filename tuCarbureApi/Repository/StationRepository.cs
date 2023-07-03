using tuCarbureApi.EntityLayer;
using tuCarbureApi.Interfaces;

namespace tuCarbureApi.Repository
{
    public class StationRepository : IRepository<Station>
    {
        public List<Station> Get() {
            return new List<Station>();
        }
    }
}