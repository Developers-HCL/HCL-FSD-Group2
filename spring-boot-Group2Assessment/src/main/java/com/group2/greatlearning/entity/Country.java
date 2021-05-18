package com.group2.greatlearning.entity;


import net.minidev.json.annotate.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="country")

public class Country {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name= "id")
    private int id;


    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    
    
    
    public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getCode() {
		return code;
	}




	public void setCode(String code) {
		this.code = code;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public List<State> getStates() {
		return states;
	}




	public void setStates(List<State> states) {
		this.states = states;
	}




	@OneToMany(mappedBy = "country")
    @JsonIgnore
    private List<State> states;
}
