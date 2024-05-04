package com.Connection;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateConf {
    private static SessionFactory factory;

    private HibernateConf() {}

    public static SessionFactory getFactory() {
        if(factory == null) {
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            factory = configuration.buildSessionFactory();
        }
        return factory;
    }
}