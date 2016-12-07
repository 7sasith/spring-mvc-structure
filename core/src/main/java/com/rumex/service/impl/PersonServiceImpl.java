package com.rumex.service.impl;

import com.rumex.dao.PersonDao;
import com.rumex.model.Person;
import com.rumex.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by sasith on 29/09/16.
 */

@Transactional
@Service("personService")
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonDao personDao;

    @Override
    public Long savePerson(Person person) {
        return personDao.save(person);
    }

    @Override
    public void updatePerson(Person person) {
        Person personDB = getPerson(person.getId());

        if(personDB != null) {
            personDao.update(personDB);
        }

    }

    @Override
    public Person getPerson(Long personId) {
        return personDao.get(personId);
    }

    @Override
    public void deletePerson(Long personId) {
        Person person = getPerson(personId);
        personDao.delete(person);
    }

    @Override
    public List<Person> getAllPersons() {
        return personDao.getAll();
    }

    @Override
    public List<Person> getPersonByName(String name) {
        return personDao.getPersonByPersonName(name);
    }
}
