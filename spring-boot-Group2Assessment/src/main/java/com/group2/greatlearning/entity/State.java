package com.group2.greatlearning.entity;



import javax.persistence.*;

@Entity
@Table(name="state")

public class State {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name="name")
    private String name;
    
    
    

    public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public Country getCountry() {
		return country;
	}




	public void setCountry(Country country) {
		this.country = country;
	}




	@ManyToOne
    @JoinColumn(name="country_id")
    private Country country;
}
