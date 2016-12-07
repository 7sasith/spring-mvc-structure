package com.rumex.dao;

import java.io.Serializable;
import java.util.List;

/**
 * Abstract Data Access Object interface which contains CRUD operation
 */
public interface AbstractDao<T extends Serializable, PK> {

    /**
     * Persist given entity to database
     *
     * @param object entity object
     * @return Serializable object
     */
    Long save(final T object);

    /**
     * Read object of given entity type and id from database
     *
     * @param id   identifier of record
     * @return entity object of given identifier
     */
    T get(PK id);

    /**
     * Modify given entity object in database
     *
     * @param object entity object
     */
    void update(T object);

    /**
     * Delete given entity object from database
     *
     * @param object entity object
     */
    void delete(T object);

    /**
     * Read all objects of given entity type from database
     *
     * @return entity objects of given entity type
     */
    List<T> getAll();
}
