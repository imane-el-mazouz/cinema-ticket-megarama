package com.movieticket.dao;

import com.Connection.HibernateConf;
import com.movieticket.model.Cart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


public class CartDAOImpl implements CartDAO {
    private SessionFactory factory = HibernateConf.getFactory();

    @Override
    public void addToCart(Cart cart) {
        try (Session session = factory.openSession()) {
            session.beginTransaction();
            session.save(cart);
            session.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
