namespace tuCarbureApi.Interfaces{
    public interface IRepository<T>{
        List<T> Get();
        T GetById(int id);
    }
}
    