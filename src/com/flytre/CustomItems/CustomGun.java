package com.flytre.CustomItems;

public class CustomGun {

    private String id; //done
    private double damage; //done
    private int armorPen; //done
    private double rps; //done
    private double dropoff; //done
    private double spray; //done!!!
    private int range; //done
    private String sound;
    private String name;
    private int cost;
    private String type;
    private int clipSize;
    private double reloadTime;

    public CustomGun(String id, double damage, int armorPen, double rps, double dropoff, double spray, int range, String sound, String name, int cost, String type, int clipSize, double reloadTime) {
        this.id = id;
        this.damage = damage;
        this.armorPen = armorPen;
        this.rps = rps;
        this.dropoff = dropoff;
        this.spray = spray;
        this.range = range;
        this.sound = sound;
        this.name = name;
        this.cost = cost;
        this.type = type;
        this.clipSize = clipSize;
        this.reloadTime = reloadTime;
    }

    public String getId() {
        return id;
    }

    public double getDamage() {
        return damage;
    }

    public double getArmorPen() {
        return armorPen;
    }

    public double getRps() {
        return rps;
    }

    public double getDropoff() {
        return dropoff;
    }

    public double getSpray() {
        return spray;
    }

    public int getRange() {
        return range;
    }

    public String getSound() {return sound;}

    public String getType() {return type;}

    public String getName() {
        return name;
    }

    public int getCost() {
        return cost;
    }

    public int getClipSize() {
        return clipSize;
    }

    public void setClipSize(int clip_size) {
        this.clipSize = clipSize;
    }

    public double getReloadTime() {
        return reloadTime;
    }
}
