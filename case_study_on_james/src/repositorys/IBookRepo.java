package repositorys;

import models.Books;
import models.BooksType;

import java.util.List;

public interface IBookRepo {
    List getAllBook();
    List<BooksType> getAllBookType();
    void createBook(Books books);
    void delete(int id);
    Books getBook(int id);
    void saveEdit(Books books);
}
