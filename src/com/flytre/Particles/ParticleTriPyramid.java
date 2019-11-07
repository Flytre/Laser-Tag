package com.flytre.Particles;

public class ParticleTriPyramid extends ParticleShape {
    private double rad;
    private double height;


    public ParticleTriPyramid(String id, String particle, double rad, double height) {
        super(id, particle);
        this.rad = rad;
        this.height = height;
    }

    @Override
    public void write() {
        double x1 = rad * Math.sin(240 * Math.PI/180);
        double z1 = rad * Math.cos(240 * Math.PI/180);
        double x2 = rad * Math.sin(0 * Math.PI/180);
        double z2 = rad * Math.cos(0 * Math.PI/180);
        double x3 = rad * Math.sin(120 * Math.PI/180);
        double z3 = rad * Math.cos(120 * Math.PI/180);

        //base
        line(x1,0,z1,x2,0,z2);
        line(x1,0,z1,x3,0,z3);
        line(x2,0,z2,x3,0,z3);

        //heights
        line(x1,0,z1,0,height,0);
        line(x2,0,z2,0,height,0);
        line(x3,0,z3,0,height,0);


    }
}
