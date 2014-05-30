package com.demirci.infonal.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.demirci.infonal.model.User;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;

/*
 * Class for declaration to obtain and modify user information
 * @author Mustafa Oguz Demirci
 */

@Repository
public class UserService {
	@Autowired
    private MongoTemplate mongoTemplate;
     
    public static final String COLLECTION_NAME = "User";
     
    /**
    * Adds a new user to database.
    * @param user The information of the created person.
    * @return  The created person.
    */
    public User addUser(User user) {
        if (!mongoTemplate.collectionExists(User.class)) {
            mongoTemplate.createCollection(User.class);
        }      
        user.setId(UUID.randomUUID().toString());
      	mongoTemplate.insert(user, COLLECTION_NAME);
        
      	return user;
    }
     
    /**
     * Selects all users from database.
     * @return  List of users.
     */
    public List<User> listUser() {
        return mongoTemplate.findAll(User.class, COLLECTION_NAME);
    }
     
    /**
     * Deletes a user from database.
     * @param id The identity of the user on database.
     * @return  The created person.
     */
    public void deleteUser(String id) {
    	System.out.println("DELETE");
    	DB db = mongoTemplate.getDb();
    	DBCollection collection = db.getCollection("User");
    	BasicDBObject query = new BasicDBObject("_id", id);
    	collection.remove(query);
        //mongoTemplate.remove(user, COLLECTION_NAME);
    }
     
    /**
     * Updates a user on database.
     * @param id The identity of the user
     * @param name The name of the user.
     * @param surname The surname of the user.
     * @param telephone The telephone of the user.
     */
    public void updateUser(String id, String name, String surname, String telephone) {
    	System.out.println("UPDATE");
    	DB db = mongoTemplate.getDb();
    	DBCollection collection = db.getCollection("User");
    	BasicDBObject newDocument = new BasicDBObject();
    	BasicDBObject query = new BasicDBObject("_id", id);
    	newDocument.put("name", name);
    	newDocument.put("surname", surname);
    	newDocument.put("telephone", telephone);
    	  
        BasicDBObject updateObj = new BasicDBObject();
        updateObj.put("$set", newDocument);
        collection.update(query, updateObj, false, false);    	
    }
}
