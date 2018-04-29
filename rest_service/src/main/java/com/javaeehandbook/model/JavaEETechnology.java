package com.javaeehandbook.model;

import javax.persistence.*;

@Entity
@Table(name = "java_technologies", schema = "j2eehandbook")
public class JavaEETechnology {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tech_id")
    private int id;

    @Column(name = "tech_name")
    private String name;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "used_versions_id")
    @Column(name = "versions")
    private JavaEETechnologyVersions versions;

    @Column(name = "description")
    private String description;

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

    public JavaEETechnologyVersions getVersions() {
        return versions;
    }

    public void setVersions(JavaEETechnologyVersions versions) {
        this.versions = versions;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
