package com.rumex.dao;

import com.rumex.model.Person;

import java.util.List;

/**
 * Created by sasith on 29/09/16.
 */
public interface PersonDao extends AbstractDao<Person, Long> {

    List<Person> getPersonByPersonName(String name);
}
