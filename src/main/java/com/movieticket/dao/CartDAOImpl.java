package com.movieticket.dao;

import com.Connection.HibernateConf;
import com.movieticket.model.Cart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class CartDAOImpl implements CartDAO {
    private SessionFactory factory = HibernateConf.getFactory();

    @Override
    public void addToCart(Cart cart) {
        Transaction transaction = null;
        try (Session session = factory.openSession()) {
            transaction = session.beginTransaction();
            session.save(cart);
            transaction.commit();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
