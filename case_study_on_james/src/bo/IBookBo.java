package bo;

import models.Books;
import models.BooksType;

import java.util.List;

public interface IBookBo {
    List getAllBook();
    List<BooksType> getAllBookType();
    List createBooks(Books books);
    void delete(int id);
    Books getBook(int id);
    void saveEdit(Books books);
}
