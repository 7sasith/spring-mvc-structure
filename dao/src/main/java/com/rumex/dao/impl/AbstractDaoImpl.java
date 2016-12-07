package com.rumex.dao.impl;

import com.rumex.dao.AbstractDao;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

/**
 * {@inheritDoc}
 */
@Repository("abstractDao")
public abstract class AbstractDaoImpl<T extends Serializable, PK extends Serializable> implements AbstractDao<T, PK> {

    private Class<T> model;
    @Autowired
    private SessionFactory sessionFactory;

    @SuppressWarnings("unchecked")
    public AbstractDaoImpl() {
        this.model = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
    }

    /**
     * Current session to work with database
     *
     * @return {@link Session}
     */
    protected Session   getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public Long save(T object) {
        return (Long) getSession().save(object);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @SuppressWarnings("unchecked")
    public T get(PK id) {
        return (T) getSession().get(this.model, id);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void update(T object) {
        getSession().update(object);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public void delete(T object){
        getSession().delete(object);
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @SuppressWarnings("unchecked")
    public List<T> getAll() {
        final Session session = getSession();
        final Criteria criteria = session.createCriteria(this.model);
        return criteria.list();
    }

}
