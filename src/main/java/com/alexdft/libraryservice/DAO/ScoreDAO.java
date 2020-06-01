package com.alexdft.libraryservice.DAO;

import com.alexdft.libraryservice.entity.Score;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScoreDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public ScoreDAO(SessionFactory sessionFactory) {
        this.sessionFactory=sessionFactory;
    }

    public void addScore(Score score) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(score);
    }

    public Score getScore(int scoreId){
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Score.class, scoreId);
    }

    public List<Score> getScores() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Score> query = currentSession.createQuery("from Score");
        return query.getResultList();
    }

    public void deleteScore(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(getScore(id));
    }
}
