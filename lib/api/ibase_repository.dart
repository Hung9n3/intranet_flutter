

abstract class IBaseRepository{
   Future getAll(String url) ;
   Future getById(String id, String url);
   Future getListById(List<String> listId, String url);
   Future create (T,String url);
   Future delete(List<String> listId, String url);
   Future update (T,String url);
}
