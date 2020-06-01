package com.alexdft.libraryservice.DAO;

import com.alexdft.libraryservice.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public BookDAO(SessionFactory sessionFactory) {
        this.sessionFactory=sessionFactory;
    }

    public void saveBook(Book book) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(book);
    }

    public Book getBook(int Id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Book.class, Id);
    }

    public List<Book> getBooksSortedByTitle() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Book> query = currentSession.createQuery("from Book order by title");
        return query.getResultList();
    }

    public List<Book> getBooksSortedByScore() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Book> query = currentSession.createQuery("from Book order by averageScore desc");
        return query.getResultList();
    }

    public void deleteBook(int Id) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(getBook(Id));
    }
}
