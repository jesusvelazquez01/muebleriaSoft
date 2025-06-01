/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import Logica.MateriaPrima;
import Persistencia.exceptions.NonexistentEntityException;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author jv176
 */
public class MateriaPrimaJpaController implements Serializable {
    
    public MateriaPrimaJpaController(){
    emf=Persistence.createEntityManagerFactory("com.programacion_III_sistema-muebleria_war_1.0-SNAPSHOTPU");
    } 
    

    public MateriaPrimaJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(MateriaPrima materiaPrima) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(materiaPrima);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(MateriaPrima materiaPrima) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            materiaPrima = em.merge(materiaPrima);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = materiaPrima.getId();
                if (findMateriaPrima(id) == null) {
                    throw new NonexistentEntityException("The materiaPrima with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            MateriaPrima materiaPrima;
            try {
                materiaPrima = em.getReference(MateriaPrima.class, id);
                materiaPrima.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The materiaPrima with id " + id + " no longer exists.", enfe);
            }
            em.remove(materiaPrima);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<MateriaPrima> findMateriaPrimaEntities() {
        return findMateriaPrimaEntities(true, -1, -1);
    }

    public List<MateriaPrima> findMateriaPrimaEntities(int maxResults, int firstResult) {
        return findMateriaPrimaEntities(false, maxResults, firstResult);
    }

    private List<MateriaPrima> findMateriaPrimaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(MateriaPrima.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public MateriaPrima findMateriaPrima(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(MateriaPrima.class, id);
        } finally {
            em.close();
        }
    }

    public int getMateriaPrimaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<MateriaPrima> rt = cq.from(MateriaPrima.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
