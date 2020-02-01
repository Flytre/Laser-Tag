package com.flytre.CustomItems;

import com.flytre.InvalidItemException;

public class CustomAbility implements CustomItem {

    private String id;
    private String displayName;
    private int cooldown;
    private String sound;
    private String[] effect;
    private String message;
    private int charges;
    private int reloadTime;


    private String[] overTimeEffect;
    private int overTimeDuration;

    public CustomAbility(Builder builder) throws InvalidItemException {

        if (!builder.id.matches("[A-Za-z0-9_]{2,14}"))
            throw new InvalidItemException("id", "must be 2-14 alphanumeric characters, with underscores allowed");

        if (builder.cooldown < 0)
            throw new InvalidItemException("cooldown", "must be 0 or a positive number");

        if (builder.reloadTime < 0)
            throw new InvalidItemException("reloadTime", "must be 0 or a positive number");


        if (builder.charges < 0)
            throw new InvalidItemException("charges", "must be 0 or a positive number");


        if (builder.overTimeDuration > 0 && builder.overTimeEffect == null)
            throw new InvalidItemException("overTimeEffectDuration", "requires an over-time effect");

        if (builder.overTimeDuration <= 0 && builder.overTimeEffect != null)
            throw new InvalidItemException("overTimeEffectDuration", "must be a postive number");

        if (builder.cooldown <= builder.overTimeDuration && builder.overTimeEffect != null)
            throw new InvalidItemException("overTimeDuration", "over-time effect duration must be less than the cooldown");


        this.id = builder.id;
        this.displayName = builder.displayName;
        this.cooldown = builder.cooldown;
        this.sound = builder.sound;
        this.effect = builder.effect;
        this.overTimeEffect = builder.overTimeEffect;
        this.overTimeDuration = builder.overTimeDuration;
        this.message = builder.message;
        this.charges = builder.charges;
        this.reloadTime = builder.reloadTime;

    }

    public String getId() {
        return id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public int getCooldown() {
        return cooldown;
    }

    public void setCooldown(int cooldown) {
        this.cooldown = cooldown;
    }


    public String getSound() {
        return sound;
    }

    public String[] getEffect() {
        return effect;
    }

    public String[] getOverTimeEffect() {
        return overTimeEffect;
    }

    public int getOverTimeDuration() {
        return overTimeDuration;
    }

    public String getMessage() {
        return message;
    }

    public int getCharges() {
        return charges;
    }

    public int getReloadTime() {
        return reloadTime;
    }

    public static class Builder implements CustomItem.Builder {

        private String id;
        private String displayName;
        private int cooldown = 600;
        private String sound = null;
        private String[] effect = null;
        private String[] overTimeEffect = null;
        private int overTimeDuration = 0;
        private String message;
        private int charges = 1;
        private int reloadTime = 0;


        public Builder(String id) {
            this.id = id;
            this.displayName = id;
        }

        public Builder message(String m) {
            message = m;
            return this;
        }

        public Builder cooldown(int ticks) {
            cooldown = ticks;
            return this;
        }

        public Builder sound(String s) {
            sound = s;
            return this;
        }

        public Builder effect(String single) {
            effect = new String[1];
            effect[0] = single;
            return this;
        }

        public Builder displayName(String name) {
            displayName = name;
            return this;
        }

        public Builder effect(String[] multiple) {
            effect = multiple;
            return this;
        }

        public Builder charges(int k) {
            charges = k;
            return this;
        }

        public Builder reloadTime(int k) {
            reloadTime = k;
            return this;
        }

        public Builder overTimeEffect(String single) {
            overTimeEffect = new String[1];
            overTimeEffect[0] = single;
            return this;
        }

        public Builder overTimeEffect(String[] multiple) {
            overTimeEffect = multiple;
            return this;
        }

        public Builder overTimeDuration(int sec) {
            overTimeDuration = sec;
            return this;
        }

        public CustomAbility build() throws InvalidItemException {
            return new CustomAbility(this);
        }


    }
}
