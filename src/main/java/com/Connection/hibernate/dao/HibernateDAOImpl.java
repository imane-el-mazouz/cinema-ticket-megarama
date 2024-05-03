package com.Connection.hibernate.dao;

import com.Connection.hibernate.config.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.ArrayList;

public class HibernateDAOImpl implements HibernateDAO {

    @Override
    public void save(Object C){
        Session session = HibernateUtil.CreateSessionFactory(C.getClass()).openSession();
        session.beginTransaction();
        session.save(C);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public <T> void delete(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object O = session.get(C, id);
        if(O != null){
            session.delete(O);
        }
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public void merge(Object C){
        Session session = HibernateUtil.CreateSessionFactory(C.getClass()).openSession();
        session.beginTransaction();
        session.merge(C);
        session.getTransaction().commit();
        session.close();
    }

    @Override
    public <T> ArrayList<T> show(Class<T> C) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<T> criteria = builder.createQuery(C);
        criteria.from(C);
        ArrayList<T> data = (ArrayList<T>) session.createQuery(criteria).getResultList();
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> Object load(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object data = session.load(C, id);
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> Object get(Class<T> C, Integer id) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Object data = session.get(C, id);
        session.getTransaction().commit();
        session.close();
        return data;
    }

    @Override
    public <T> ArrayList<T> byTitle(Class<T> C, String title) throws InstantiationException, IllegalAccessException {
        Session session = HibernateUtil.CreateSessionFactory(C).openSession();
        session.beginTransaction();
        Query query = session.createQuery("FROM " + C.getSimpleName() + " C WHERE C.titleFilm LIKE :title");
        query.setParameter("title", "'%" + title + "%'");
        ArrayList<T> data = (ArrayList<T>) query.list();
        session.getTransaction().commit();
        session.close();
        return data;
    }


}
