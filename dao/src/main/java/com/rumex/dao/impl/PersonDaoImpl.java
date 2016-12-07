package com.rumex.dao.impl;

import com.rumex.dao.PersonDao;
import com.rumex.model.Person;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by sasith on 29/09/16.

 */
@Repository("personDao")
public class PersonDaoImpl extends AbstractDaoImpl<Person, Long> implements PersonDao {

    @Override
    public List<Person> getPersonByPersonName(String name) {
        Criteria criteria = getSession().createCriteria(Person.class);
        criteria.add(Restrictions.like("firstName", name));
        return (List<Person>) criteria.list();
    }
}