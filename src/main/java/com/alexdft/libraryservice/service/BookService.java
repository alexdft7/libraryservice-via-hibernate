package com.alexdft.libraryservice.service;

import com.alexdft.libraryservice.DAO.BookDAO;
import com.alexdft.libraryservice.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookService {

    private BookDAO bookDAO;

    @Autowired
    public BookService(BookDAO bookDAO) {
        this.bookDAO=bookDAO;
    }

    @Transactional
    public void saveBook(Book book) {
        bookDAO.saveBook(book);
    }

    @Transactional
    public Book getBook(int Id) {
        return bookDAO.getBook(Id);
    }

    @Transactional
    public List<Book> getBooksSortedByTitle() {
        return bookDAO.getBooksSortedByTitle();
    }

    @Transactional
    public List<Book> getBooksSortedByScore() {
        return bookDAO.getBooksSortedByScore();
    }

    @Transactional
    public void deleteBook(int Id) {
        bookDAO.deleteBook(Id);
    }
}
