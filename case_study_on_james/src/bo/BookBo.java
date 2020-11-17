package bo;

import models.Books;
import models.BooksType;
import repositorys.BookRepo;
import repositorys.IBookRepo;
import validate.Validate;

import java.util.ArrayList;
import java.util.List;

public class BookBo implements IBookBo {
   private IBookRepo bookRepo = new BookRepo();
    @Override
    public List getAllBook() {
        return bookRepo.getAllBook();
    }

    @Override
    public List<BooksType> getAllBookType() {
        return bookRepo.getAllBookType();
    }

    @Override
    public List<String> createBooks(Books books) {
        List<String> list = new ArrayList();
        if (Validate.regex(books.getTitle())){
            list.add("1");
            bookRepo.createBook(books);
        }else {
            list.add("0");
        }
        return list;
    }

    @Override
    public void delete(int id) {
        bookRepo.delete(id);
    }

    @Override
    public Books getBook(int id) {
        return bookRepo.getBook(id);
    }

    @Override
    public void saveEdit(Books books) {
        bookRepo.saveEdit(books);
    }
}
