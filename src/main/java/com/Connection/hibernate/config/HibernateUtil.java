package com.Connection.hibernate.config;



import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

    public static <T> SessionFactory CreateSessionFactory(Class<T> C) {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");
        configuration.addAnnotatedClass(C);
        return configuration.buildSessionFactory();
    }
}