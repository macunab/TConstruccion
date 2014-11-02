package org.construccion.repository;

import org.construccion.models.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Tag JpaRepository
//author : Marco, Acuna.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
public interface TagRepository extends JpaRepository<Tag, Integer> {

}
