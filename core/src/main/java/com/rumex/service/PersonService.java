package com.rumex.service;

import com.rumex.model.Person;

import java.util.List;

/**
 * Created by sasith on 29/09/16.
 */
public interface PersonService {

    Long savePerson(Person person);

    void updatePerson(Person person);

    Person getPerson(Long personId);

    void deletePerson(Long personId);

    List<Person> getAllPersons();

    List<Person> getPersonByName(String name);
}
