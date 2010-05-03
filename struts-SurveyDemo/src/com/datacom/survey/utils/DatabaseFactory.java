package com.datacom.survey.utils;

import java.util.List;
import java.util.Vector;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

public class DatabaseFactory {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("HorsePU");

	@SuppressWarnings("unchecked")
	public static List getListData(String namedQuery) {
		
		EntityManager em = emf.createEntityManager();
		
		List results = new Vector();
		
		try {
			results = em.createNamedQuery(namedQuery).getResultList();
			results.size();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return results;
	}

	public static List getListData(String namedQuery, int id) {
		
		EntityManager em = emf.createEntityManager();
		
		List results = new Vector();
		try {
			results = em.createNamedQuery(namedQuery).setParameter("id", id).getResultList();
			results.size();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
			
		return results;
	}
	
	public static Object getData(String namedQuery, int id) {

		EntityManager em = emf.createEntityManager();		
		
		Object result = null;
		
		try {
			result = em.createNamedQuery(namedQuery).setParameter("id", id).getSingleResult();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
			
		return result;
	}

	public static Object getData(String namedQuery, String parameter, String value) {

		EntityManager em = emf.createEntityManager();
		
		Object result = null;
		try {
			result = em.createNamedQuery(namedQuery).setParameter(parameter, value).getSingleResult();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
			
		return result;
	}
	
	public synchronized static Object updateData(Object data) {
		
		EntityManager em = emf.createEntityManager();
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();

			data = em.merge(data);
//			em.persist(data);
			
			em.flush();
			tx.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			tx.rollback();
		} finally {
//			em.close();
		}
		
		return data;
	}
	
	public synchronized static void delete(String namedQuery, int id) {
		
		EntityManager em = emf.createEntityManager();
		
		EntityTransaction tx = em.getTransaction();
		try {
			tx.begin();

			em.createNamedQuery(namedQuery).setParameter("id", id).executeUpdate();
		
			em.flush();

			tx.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
			tx.rollback();
		} finally {
//			em.close();
		}
	}
}
