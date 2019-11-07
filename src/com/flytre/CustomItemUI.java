package com.flytre;

import com.flytre.CustomItems.*;
import com.flytre.Particles.*;

import java.util.ArrayList;
import java.util.HashMap;

public class CustomItemUI {

    private static ArrayList<CustomItem> items = new ArrayList<>();
    private static ArrayList<ParticleShape> particles = new ArrayList<>();
    private static HashMap<String,String> objectives = new HashMap<>();


    public static void addObjective(String objName) {
        objectives.put(objName,"dummy");
    }

    public static void addObjective(String objName, String criteria) {
        objectives.put(objName,criteria);
    }

    public static void addItem(CustomItem.Builder item) {

        try {
            items.add(item.build());
        } catch (InvalidItemException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void addParticle(ParticleShape particle) {
        particles.add(particle);
    }

    public static void generateDatapack() {

        Implementer.initialize();

        for(String s : objectives.keySet())
            FunctionWriter.addObj(s,objectives.get(s));

        boolean bow, sword, ability, trident, shield, armor = false;
        bow = sword = ability = trident = shield = armor;

        for(ParticleShape p : particles)
            Implementer.addParticle(p);

        for (CustomItem i : items) {
            if (i instanceof CustomBow) {
                if (!bow) Implementer.initializeBow();
                bow = true;
                Implementer.addBow((CustomBow) i);

            } else if (i instanceof CustomSword) {
                if (!sword) Implementer.initializeSword();
                sword = true;
                Implementer.addSword((CustomSword) i);

            } else if (i instanceof CustomAbility) {
                if (!ability) Implementer.initializeAbility();
                ability = true;
                Implementer.addAbility((CustomAbility) i);

            } else if (i instanceof CustomTrident) {
                if (!trident) Implementer.initializeTrident();
                trident = true;
                Implementer.addTrident((CustomTrident) i);

            } else if (i instanceof CustomShield) {
                if (!shield) Implementer.initializeShield();
                shield = true;
                Implementer.addShield((CustomShield) i);
            } else if (i instanceof CustomArmor) {
                if (!armor) Implementer.initializeArmor();
                armor = true;
                Implementer.addArmor((CustomArmor) i);

            }

        }

            if (bow) Implementer.postInitializeBow();
            if (sword) Implementer.postInitializeSword();
            if (ability) Implementer.postInitializeAbility();
            if (trident) Implementer.postInitializeTrident();
            if (shield) Implementer.postInitializeShield();
            if (armor) Implementer.postInitializeShield();

    }

    public static void main(String[] args) {

        //rng number gen for spray
        addObjective("rng");
        addObjective("health");

        CustomBow.Builder b = new CustomBow.Builder("test");
        addItem(b);

        generateDatapack();


    }
}
