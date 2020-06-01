package com.alexdft.libraryservice.service;

import com.alexdft.libraryservice.DAO.ScoreDAO;
import com.alexdft.libraryservice.entity.Score;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ScoreService {

    private ScoreDAO scoreDAO;

    @Autowired
    public ScoreService(ScoreDAO scoreDAO) {
        this.scoreDAO=scoreDAO;
    }

    @Transactional
    public void addScore(Score score) {
        scoreDAO.addScore(score);
    }

    @Transactional
    public Score getScore(int id) {
        return scoreDAO.getScore(id);
    }

    @Transactional
    public List<Score> getScores() { return  scoreDAO.getScores(); }

    @Transactional
    public void deleteScore(int id) {
        scoreDAO.deleteScore(id);
    }
}
