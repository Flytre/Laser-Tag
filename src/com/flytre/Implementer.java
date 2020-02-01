package com.flytre;

import com.flytre.CustomItems.*;
import com.flytre.Particles.ParticleHelix;
import com.flytre.Particles.ParticleShape;

import java.util.ArrayList;

class Implementer {


    private static int enderIDCounter = 2;
    private static int triggerCount = 217466;

    static void initialize() {
        FunctionWriter.deleteOld();
        FunctionWriter.createDatapack();
        FunctionWriter.makeFunction("init_items");
        FunctionWriter.makeFunction("info");
        FunctionWriter.makeFunction("generic_base");

        FunctionWriter.makeLoadJSON();
        FunctionWriter.makeTickJSON();


    }

    static void initializeBow() {
        FunctionWriter.makeFunction("bow_base");
        FunctionWriter.addStatment("generic_base", "function flytre:bow_base");

        FunctionWriter.addStatment("bow_arrow_init", "execute as @a run scoreboard players operation @s enderID2 = @s enderID");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s run scoreboard players operation @a enderID2 -= @s enderID");


        FunctionWriter.addObj("enderID");
        FunctionWriter.addObj("enderID2");
        FunctionWriter.addObj("arrowDetection");

        FunctionWriter.addStatment("bow_base", "execute as @a store result score @s enderID run data get entity @s UUIDLeast 0.00000000001");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow] at @s store result score @s enderID run data get entity @s OwnerUUIDLeast 0.00000000001");


    }

    static void initializeSword() {

        FunctionWriter.makeFunction("sword_base");
        FunctionWriter.addStatment("generic_base", "function flytre:sword_base");

        FunctionWriter.addObj("damageDealt", "minecraft.custom:minecraft.damage_dealt");
        FunctionWriter.addObj("killedEntity", "totalKillCount");


    }

    static void initializeAbility() {

        FunctionWriter.makeFunction("ability_base");
        FunctionWriter.addStatment("generic_base", "function flytre:ability_base");

        FunctionWriter.addObj("rightclick", "minecraft.used:minecraft.carrot_on_a_stick");
        FunctionWriter.addObj("custom_item");

        FunctionWriter.addStatment("ability_base", "effect clear @a[scores={fatigue=0,rightclick=0}] mining_fatigue");
        FunctionWriter.addStatment("ability_base", "execute as @a store result score @s fatigue run data get entity @s SelectedItem.tag.Damage 100");
        FunctionWriter.addStatment("ability_base", "effect give @a[scores={fatigue=1..}] mining_fatigue 1 255 true");
        FunctionWriter.addStatment("ability_base", "effect give @a[scores={rightclick=1..}] mining_fatigue 1 255 true");

        FunctionWriter.makeFunction("reset_abilities");

    }

    static void initializeTrident() {
        FunctionWriter.makeFunction("trident_base");
        FunctionWriter.addStatment("generic_base", "function flytre:trident_base");
    }

    static void initializeShield() {
        FunctionWriter.makeFunction("shield_base");
        FunctionWriter.addStatment("generic_base", "function flytre:shield_base");
        FunctionWriter.addObj("shieldblock", "minecraft.custom:minecraft.damage_blocked_by_shield");
    }

    static void initializeArmor() {
        FunctionWriter.makeFunction("armor_base");
        FunctionWriter.addStatment("generic_base", "function flytre:armor_base");
    }


    /*
    hasPlayerSelector false: @s references the arrow
    hasPlayerSelector true: @s references the arrow, @a[tag=bow_<id>] references the shooter
    */
    static void addBow(CustomBow bow) {

        FunctionWriter.addStatment("bow_base", "execute as @a[nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}}] at @s run execute as @e[type=arrow,distance=..10,tag=!init,limit=1] at @s run function flytre:bow_arrow_init");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s if entity @a[scores={enderID2=0},nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}},distance=..10] run tag @s add custom_arrow");
        FunctionWriter.addStatment("bow_arrow_init", "execute as @s[type=arrow,tag=!init] at @s if entity @a[scores={enderID2=0},nbt={SelectedItem:{tag:{ability:\"" + bow.getId() + "\"}}},distance=..10] run tag @s add " + bow.getId());

        if (bow.getTrail() != null)
            FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s positioned ~ ~.5 ~ run particle " + bow.getTrail() + " ~ ~-" + bow.getTrailRad() + " ~0 0 " + (bow.getTrailRad() * 2) + " 0 0 30 force");


        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s run kill @e[type=armor_stand,distance=..8,tag=" + bow.getId() + ",limit=1]");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + ",nbt={inGround:0b}] at @s run summon armor_stand ~ ~1 ~ {Tags:[" + bow.getId() + ",arrow_stand],NoGravity:1b,Small:1,Marker:1b,Invisible:1,Invulnerable:1,NoBasePlate:1,PersistenceRequired:1,DisabledSlots:2039583}");
        FunctionWriter.addStatment("bow_base", "execute as @e[type=arrow,tag=" + bow.getId() + "] at @s store result score @e[type=armor_stand,tag=" + bow.getId() + ",limit=1,distance=..8] enderID run data get entity @s OwnerUUIDLeast 0.00000000001");

        if (!bow.hasPlayerSelector()) {
            if (bow.getEffect() != null)
                for (String s : bow.getEffect())
                    FunctionWriter.addStatment("bow_base", "execute as @e[type=armor_stand,tag=" + bow.getId() + ",scores={arrowDetection=3}] at @s run " + s);


        } else {

            FunctionWriter.addObj("enderID" + (++enderIDCounter));

            FunctionWriter.makeFunction("bows/" + bow.getId());

            FunctionWriter.addStatment("bow_base", "execute as @e[type=armor_stand,tag=" + bow.getId() + ",scores={arrowDetection=3}] at @s run function flytre:bows/" + bow.getId());


            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run execute as @a run scoreboard players operation @s enderID" + enderIDCounter + " = @s enderID");
            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run scoreboard players operation @a enderID" + enderIDCounter + " -= @s enderID");
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @a[scores={enderID" + enderIDCounter + "=0}] add bow_" + bow.getId());
            if (bow.getEffect() != null)
                for (String s : bow.getEffect()) {
                    FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @s run " + s);
                }
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @a remove bow_" + bow.getId());
            FunctionWriter.addStatment("bows/" + bow.getId(), "scoreboard players reset * enderID" + enderIDCounter);
            FunctionWriter.addStatment("bows/" + bow.getId(), "tag @s add effectDone");
            FunctionWriter.addStatment("bows/" + bow.getId(), "execute as @e[type=armor_stand,tag=" + bow.getId() + ",tag=!effectDone,scores={arrowDetection=3},sort=random,limit=1] at @s run function flytre:bows/" + bow.getId());

        }


        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s bow{ability:\\\"" + bow.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s bow{ability:\\\"" + bow.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + bow.getDisplayName() + " bow.\",\"color\":\"green\"}]");

    }


    /*
    Type: damage_as_victim: @s references the hurt entity
    Type: damage_as_attacker: @s references the attacker
    Type: kill_as_attacker: @s references the killer
     */
    static void addSword(CustomSword sword) {


        for (String s : sword.getEffect()) {

            if (sword.getType().equals("damage_as_victim"))
                FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run " + s);

            else if (sword.getType().equals("damage_as_attacker"))
                FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run " + s);
            else if (sword.getType().equals("kill_as_attacker"))
                FunctionWriter.addStatment("sword_base", "execute as @a[scores={killedEntity=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run " + s);


        }
        if (sword.getType().equals("damage_as_victim") || sword.getType().equals("damage_as_attacker"))
            FunctionWriter.addStatment("sword_base", "execute as @a[scores={damageDealt=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run particle " + sword.getParticle() + " ~-0.1 ~0.65 ~-.1 0.2 0.75 0.2 0 35 force");
        if (sword.getType().equals("kill_as_attacker"))
            FunctionWriter.addStatment("sword_base", "execute as @a[scores={killedEntity=1..},nbt={SelectedItem:{tag:{ability:\"" + sword.getId() + "\"}}}] at @s run execute as @e[nbt={HurtTime:10s},distance=..5,limit=1] at @s run particle " + sword.getParticle() + " ~-0.1 ~0.65 ~-.1 0.2 0.75 0.2 0 20 force");


        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s diamond_sword{ability:\\\"" + sword.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s diamond_sword{ability:\\\"" + sword.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + sword.getDisplayName() + " sword.\",\"color\":\"green\"}]");


    }

    static void addAbility(CustomAbility ability, ShopItem si) {
        addAbility(ability, si, null);
    }

    static void addAbility(CustomAbility ability, ShopItem si, CustomGun g) {

        FunctionWriter.makeFunction("abilities/" + ability.getId());
        FunctionWriter.addObj(ability.getId() + "_cd");

        FunctionWriter.setLoc("ability_base");
        FunctionWriter.section(true);
        FunctionWriter.comment("Ability: " + ability.getId());
        FunctionWriter.scomment("Update cooldown.");
        FunctionWriter.state("scoreboard players add @a " + ability.getId() + "_cd 0");
        FunctionWriter.state("scoreboard players add @a[scores={" + ability.getId() + "_cd=..-1}] " + ability.getId() + "_cd 1");

        AbilityTableGenerator atg = new AbilityTableGenerator(ability, si);

        if (ability.getCharges() > 1) {

            FunctionWriter.addObj(ability.getId() + "_cl");
            FunctionWriter.addObj(ability.getId() + "_rl");
            FunctionWriter.setLoc("ability_base");
            FunctionWriter.scomment("Update reload time and refill clip when fully reloaded.");
            FunctionWriter.state("scoreboard players set @a[scores={" + ability.getId() + "_rl=-1}] " + ability.getId() + "_cl " + ability.getCharges());
            FunctionWriter.state("scoreboard players add @a[scores={" + ability.getId() + "_rl=..-1}] " + ability.getId() + "_rl 1");
            FunctionWriter.state("scoreboard players add @a " + ability.getId() + "_rl 0");
            FunctionWriter.state("scoreboard players add @a " + ability.getId() + "_cl 0");
        }


        if (ability.getCooldown() >= 25) {
            FunctionWriter.setLoc("ability_base");
            FunctionWriter.scomment("Update the durability bar based on the cooldown bar.");
            if (ability.getCharges() > 1) {
                FunctionWriter.state("scoreboard players add @a " + ability.getId() + "_cd 1");
                FunctionWriter.state("execute as @a[scores={" + ability.getId() + "_rl=0..," + ability.getId() + "_cd=..-1},nbt={Inventory:[{tag:{ability:\"" + ability.getId() + "\"}}]}] run function flytre:abilities/loot/" + ability.getId());
                FunctionWriter.state("scoreboard players remove @a " + ability.getId() + "_cd 1");
            } else
                FunctionWriter.state("execute as @a[nbt={Inventory:[{tag:{ability:\"" + ability.getId() + "\"}}]}] run function flytre:abilities/loot/" + ability.getId());
        }


        if (ability.getCharges() > 1) {
            FunctionWriter.setLoc("ability_base");
            FunctionWriter.scomment("Update the charges and reload durability bar when needed.");
            FunctionWriter.state("execute as @a[scores={" + ability.getId() + "_cd=0..," + ability.getId() + "_rl=0," + ability.getId() + "_cl=1..}] run function flytre:abilities/loot/" + ability.getId() + "_clip");
            FunctionWriter.state("scoreboard players add @a " + ability.getId() + "_rl 1");
            FunctionWriter.state("execute as @a[scores={" + ability.getId() + "_rl=..0},nbt={Inventory:[{tag:{ability:\"" + ability.getId() + "\"}}]}] run function flytre:abilities/loot/" + ability.getId() + "_reload");
            FunctionWriter.state("scoreboard players remove @a " + ability.getId() + "_rl 1");

        }

        FunctionWriter.scomment("Run the ability when the conditions are right.");
        if (ability.getCharges() == 1) {
            FunctionWriter.addStatment("ability_base", "execute as @a[scores={rightclick=1..," + ability.getId() + "_cd=0},nbt={SelectedItem:{tag:{ability:\"" + ability.getId() + "\"}}}] at @s run function flytre:abilities/" + ability.getId());
            if (g == null || g.getType().equals("pistol")) {
                FunctionWriter.addStatment("ability_base", "execute as @a[scores={rightclick=1..," + ability.getId() + "_cd=0},nbt={Inventory:[{Slot:-106b,tag:{ability:\"" + ability.getId() + "\"}}]}] at @s run function flytre:abilities/" + ability.getId());
            }
        } else {
            FunctionWriter.addStatment("ability_base", "execute as @a[scores={rightclick=1..," + ability.getId() + "_cd=0," + ability.getId() + "_cl=1..," + ability.getId() + "_rl=0},nbt={SelectedItem:{tag:{ability:\"" + ability.getId() + "\"}}}] at @s run function flytre:abilities/" + ability.getId());
            if (g == null || g.getType().equals("pistol")) {
                FunctionWriter.addStatment("ability_base", "execute as @a[scores={rightclick=1..," + ability.getId() + "_cd=0," + ability.getId() + "_cl=1..," + ability.getId() + "_rl=0},nbt={Inventory:[{Slot:-106b,tag:{ability:\"" + ability.getId() + "\"}}]}] at @s run function flytre:abilities/" + ability.getId());
            }
        }


        FunctionWriter.setLoc("abilities/" + ability.getId());
        FunctionWriter.comment("Add a sound, message, and all effects.");
        if (ability.getSound() != null)
            FunctionWriter.state("playsound " + ability.getSound() + " player @s");

        if (ability.getMessage() != null)
            FunctionWriter.state("tellraw @s [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Ability\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\":\",\"color\":\"none\"},{\"text\":\" " + ability.getMessage() + "\",\"color\":\"none\"}]");

        if (ability.getEffect() != null)
            for (String s : ability.getEffect())
                FunctionWriter.addStatment("abilities/" + ability.getId(), s);

        FunctionWriter.scomment("Update the clip, reload time, cooldown, and item.");
        if (ability.getCharges() > 1) {
            FunctionWriter.state("scoreboard players remove @s " + ability.getId() + "_cl 1");
            FunctionWriter.state("execute as @s[scores={" + ability.getId() + "_rl=0," + ability.getId() + "_cl=1..}] run function flytre:abilities/loot/" + ability.getId() + "_clip");

            FunctionWriter.state("execute as @s[scores={" + ability.getId() + "_cl=..0}] run scoreboard players set @s " + ability.getId() + "_rl " + (ability.getReloadTime() * -1));
        }

        FunctionWriter.state("scoreboard players set @s " + ability.getId() + "_cd " + (ability.getCooldown() * -1));


        if (ability.getOverTimeEffect() != null && ability.getOverTimeDuration() > 0)
            for (String s : ability.getOverTimeEffect()) {
                FunctionWriter.makeFunction("abilities/" + ability.getId() + "_time");
                FunctionWriter.addStatment("ability_base", "\n#Overtime effect");
                FunctionWriter.addStatment("ability_base", "execute as @a[scores={" + ability.getId() + "_cd=" + (ability.getCooldown() * -1) + ".." + ((ability.getCooldown() - ability.getOverTimeDuration()) * -1) + "}] at @s run function flytre:abilities/" + ability.getId() + "_time");
                FunctionWriter.addStatment("abilities/" + ability.getId() + "_time", s);

            }

        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s carrot_on_a_stick{ability:\\\"" + ability.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s carrot_on_a_stick{ability:\\\"" + ability.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + ability.getDisplayName() + " ability.\",\"color\":\"green\"}]");

        FunctionWriter.setLoc("reset_abilities");
        FunctionWriter.scomment("Ability: " + ability.getId());
        FunctionWriter.state("scoreboard players set @s " + ability.getId() + "_cd 0");
        if (ability.getCharges() > 1) {
            FunctionWriter.state("scoreboard players set @s " + ability.getId() + "_rl 0");
            FunctionWriter.state("scoreboard players set @s " + ability.getId() + "_cl " + ability.getCharges());
        }
    }


    /*
    Type: hurt_entity: @s references the entity
    Type: trident: @s references the trident

    hasPlayerSelector false: @s references the trident/hurt_entity
    hasPlayerSelector true: @s references the trident, @a[tag=tri_<id>] references the thrower
     */
    static void addTrident(CustomTrident trident) {


        if (trident.hasPlayerSelector() && trident.getEffect() != null) {

            FunctionWriter.addObj("enderID" + (++enderIDCounter));

            FunctionWriter.makeFunction("tridents/" + trident.getId());

            if (trident.getType().equals("trident"))
                FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run function flytre:tridents/" + trident.getId());
            else if (trident.getType().equals("hurt_entity")) {
                FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run function flytre:tridents/" + trident.getId());
                if (trident.hasEffectAnyways())
                    FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run function flytre:tridents/" + trident.getId());

            }
            FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @s run execute as @a run scoreboard players operation @s enderID" + enderIDCounter + " = @s enderID");
            FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @s run scoreboard players operation @a enderID" + enderIDCounter + " -= @s enderID");
            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @a[scores={enderID" + enderIDCounter + "=0}] add tri_" + trident.getId());

            if (trident.getEffect() != null)
                for (String s : trident.getEffect())
                    FunctionWriter.addStatment("tridents/" + trident.getId(), s);

            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @a remove tri_" + trident.getId());
            FunctionWriter.addStatment("tridents/" + trident.getId(), "scoreboard players reset * enderID" + enderIDCounter);
            FunctionWriter.addStatment("tridents/" + trident.getId(), "tag @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1,sort=nearest] add effectApplied");

            if (trident.getType().equals("trident"))
                FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run function flytre:tridents/" + trident.getId());
            else if (trident.getType().equals("hurt_entity")) {
                FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run function flytre:tridents/" + trident.getId());
                if (trident.hasEffectAnyways())
                    FunctionWriter.addStatment("tridents/" + trident.getId(), "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied,limit=1] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run function flytre:tridents/" + trident.getId());

            }


        } else {


            if (trident.getEffect() != null) {
                if (trident.getType().equals("hurt_entity"))
                    for (String s : trident.getEffect()) {
                        FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s run execute as @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] at @s run " + s);
                        if (trident.hasEffectAnyways())
                            FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s unless entity @e[limit=1,sort=nearest,nbt={HurtTime:10s},distance=..5] run " + s);
                    }
                else if (trident.getType().equals("trident"))
                    for (String s : trident.getEffect())
                        FunctionWriter.addStatment("trident_base", "execute as @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] at @s run " + s);
            }

        }
        FunctionWriter.addStatment("trident_base", "tag @e[type=trident,nbt={DealtDamage:1b,Trident:{tag:{ability:\"" + trident.getId() + "\"}}},tag=!effectApplied] add effectApplied");
        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s trident{ability:\\\"" + trident.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s trident{ability:\\\"" + trident.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + trident.getDisplayName() + " trident.\",\"color\":\"green\"}]");

    }

    static void addShield(CustomShield shield) {

        if (shield.getEffect() != null)
            for (String s : shield.getEffect())
                FunctionWriter.addStatment("shield_base", "execute as @a[scores={shieldblock=1..},nbt={SelectedItem:{tag:{ability:\"" + shield.getId() + "\"}}}] at @s run " + s);


        if (shield.getPassiveEffect() != null)
            for (String s : shield.getPassiveEffect()) {
                FunctionWriter.addStatment("shield_base", "execute as @a[nbt={SelectedItem:{tag:{ability:\"" + shield.getId() + "\"}}}] at @s run " + s);
                FunctionWriter.addStatment("shield_base", "execute as @a[nbt={Inventory:[{Slot: -106b, tag:{ability:\"" + shield.getId() + "\"}}]}] at @s run " + s);
            }

        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s shield{ability:\\\"" + shield.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s shield{ability:\\\"" + shield.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + shield.getDisplayName() + " shield.\",\"color\":\"green\"}]");


    }

    static void addArmor(CustomArmor armor) {
        FunctionWriter.makeFunction("armor/" + armor.getId());

        if (armor.getEffect() != null) {
            for (String s : armor.getEffect())
                FunctionWriter.addStatment("armor/" + armor.getId(), s);
            if (armor.getParts().indexOf('h') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:103b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('c') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:102b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('l') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:101b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());
            if (armor.getParts().indexOf('b') != -1)
                FunctionWriter.addStatment("armor_base", "execute as @a[nbt={Inventory:[{Slot:103b,tag:{ability:\"" + armor.getId() + "\"}}]}] at @s run function flytre:armor/" + armor.getId());

        }


        String piece = armor.getParts().indexOf('h') != -1 ? "helmet" : armor.getParts().indexOf('c') != -1 ? "chestplate" : armor.getParts().indexOf('c') != -1 ? "leggings" : "boots";

        FunctionWriter.addStatment("info", "tellraw @s [\"\",{\"text\":\"/give @s diamond_" + piece + "{ability:\\\"" + armor.getId() + "\\\"}\",\"color\":\"gold\",\"clickEvent\":{\"action\":\"suggest_command\",\"value\":\"/give @s diamond_" + piece + "{ability:\\\"" + armor.getId() + "\\\"}\"}},{\"text\":\": give yourself a(n) " + armor.getDisplayName() + " " + piece + ".\",\"color\":\"green\"}]");

    }

    static void addParticle(ParticleShape p) {
        p.write();
    }

    static void postInitializeBow() {

        FunctionWriter.addStatment("bow_arrow_init", "execute as @e[type=arrow,tag=!custom_arrow,tag=!init,limit=1] at @s run function flytre:bow_arrow_init");


        FunctionWriter.addStatment("bow_base", "tag @e[type=arrow] add init");
        FunctionWriter.addStatment("bow_base", "scoreboard players add @e[type=armor_stand,tag=arrow_stand] arrowDetection 1");
        FunctionWriter.addStatment("bow_base", "kill @e[type=arrow,tag=custom_arrow,nbt={inGround:1b}]");
        FunctionWriter.addStatment("bow_base", "kill @e[type=armor_stand,tag=arrow_stand,scores={arrowDetection=4..}]");


    }

    static void postInitializeSword() {
        FunctionWriter.addStatment("sword_base", "scoreboard players set @a[scores={damageDealt=1..}] damageDealt 0");
        FunctionWriter.addStatment("sword_base", "scoreboard players set @a[scores={killedEntity=1..}] killedEntity 0");


    }

    static void postInitializeAbility() {

        FunctionWriter.addStatment("ability_base", "scoreboard players set @a[scores={rightclick=1..}] rightclick 0");
        FunctionWriter.addStatment("ability_base", "scoreboard players set @a custom_item 0");
    }

    static void postInitializeTrident() {
        FunctionWriter.addStatment("shield_base", "scoreboard players set @a[scores={shieldblock=1..}] shieldblock 0");
    }

    static void postInitializeShield() {
    }

    static void postInitializeArmor() {
    }

    static void initializeGun() {
        FunctionWriter.addObjComment("Health handling not included.");
        FunctionWriter.addObj("health");
        FunctionWriter.addObjComment("Set respawn timer to 0 to damage a target.");
        FunctionWriter.addObj("repspawnTimer");
        FunctionWriter.addObjComment("Set game_stage global to 2 to damage players.");
        FunctionWriter.addObj("global");
        FunctionWriter.addObj("range");
        FunctionWriter.addObj("damage");
        FunctionWriter.addObj("damage2");
        FunctionWriter.addObj("armorPen");
        FunctionWriter.addObj("dropoff");
        FunctionWriter.addObj("armor");
        FunctionWriter.addObj("armor2");
        FunctionWriter.addObj("spray");
        FunctionWriter.addObj("travel_time");
        FunctionWriter.addObj("kills");
        FunctionWriter.addObj("kills2");
        FunctionWriter.addObj("gunSneak", "minecraft.custom:minecraft.sneak_time");

        FunctionWriter.setLoc("init_items");
        FunctionWriter.state("scoreboard players set 100 dropoff 100");
        FunctionWriter.state("scoreboard players set 10000 dropoff 10000");
        FunctionWriter.state("team remove green");
        FunctionWriter.state("team remove blue");
        FunctionWriter.state("team add green {\"color\":\"green\",\"text\":\"Creepers\"}");
        FunctionWriter.state("team add blue {\"color\":\"aqua\",\"text\":\"Guardians\"}");
        FunctionWriter.state("team modify green friendlyFire false");
        FunctionWriter.state("team modify blue friendlyFire false");
        FunctionWriter.state("team modify blue color blue");
        FunctionWriter.state("team modify green color green");


    }

    static void addShopItem(ShopItem si) {


        FunctionWriter.setLoc("shop/" + si.getId());

        String[] lore = si.getLore();
        for (int i = 0; i < lore.length; i++)
            lore[i] = "\"\\\"" + lore[i] + "\\\"\"";

        FunctionWriter.state( "tag @s[nbt={Inventory:[{tag:{" + si.getNbtNoBrackets() + "}}]}] add preowner");
        FunctionWriter.state( "tellraw @s[tag=preowner] [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Shop\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\": You've already bought a \",\"color\":\"none\"},{\"text\":\"" + si.getName() + "\",\"color\":\"gold\"},{\"text\":\".\",\"color\":\"none\"}]");
        FunctionWriter.state( "tellraw @s[tag=!preowner,scores={credits=" + si.getCost() + "..}] [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Shop\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\": You have bought a\",\"color\":\"none\"},{\"text\":\" " + si.getName() + "\",\"color\":\"gold\"},{\"text\":\".\",\"color\":\"none\"}]");
        FunctionWriter.state( "tellraw @s[tag=!preowner,scores={credits=.." + (si.getCost() - 1) + "}] [\"\",{\"text\":\"[\",\"color\":\"green\"},{\"text\":\"Shop\",\"color\":\"none\"},{\"text\":\"]\",\"color\":\"green\"},{\"text\":\": You cannot afford a\",\"color\":\"none\"},{\"text\":\" " + si.getName() + "\",\"color\":\"gold\"},{\"text\":\".\",\"color\":\"none\"}]");


        String armorNBTGreen = "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorGreen() != -1 ? "," + "color:" + si.getColorGreen() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtGreen().length() > 0 ? "," + si.getNbtGreen() : "") + "}";
        String armorNBTBlue = "{display:{Name:\"\\\"" + si.getName() + "\\\"\",Lore:[" + String.join(",", lore) + "]" + (si.getColorBlue() != -1 ? "," + "color:" + si.getColorBlue() : "") + "}" + (si.getNbtNoBrackets().length() > 0 ? "," + si.getNbtNoBrackets() : "") + (si.getNbtBlue().length() > 0 ? "," + si.getNbtBlue() : "") + "}";

        if (si.getItemID().matches("[a-z_]+_helmet")) {
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=green] armor.head " + si.getItemID() + armorNBTGreen);
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=blue] armor.head " + si.getItemID() + armorNBTBlue);

        } else if (si.getItemID().matches("[a-z_]+_chestplate")) {
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=green] armor.chest " + si.getItemID() + armorNBTGreen);
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=blue] armor.chest " + si.getItemID() + armorNBTBlue);

        } else if (si.getItemID().matches("[a-z_]+_leggings")) {
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=green] armor.legs " + si.getItemID() + armorNBTGreen);
            FunctionWriter.state( "replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=blue] armor.legs " + si.getItemID() + armorNBTBlue);

        } else if (si.getItemID().matches("[a-z_]+_boots")) {
            FunctionWriter.state("replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=green] armor.feet " + si.getItemID() + armorNBTGreen);
            FunctionWriter.state("replaceitem entity @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=blue] armor.feet " + si.getItemID() + armorNBTBlue);

        } else {
            FunctionWriter.state("give @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=green] " + si.getItemID() + armorNBTGreen);
            FunctionWriter.state("give @s[tag=!preowner,scores={credits=" + si.getCost() + "..},team=blue] " + si.getItemID() + armorNBTBlue);
        }
        FunctionWriter.state( "scoreboard players remove @s[tag=!preowner,scores={credits=" + si.getCost() + "..}] credits " + si.getCost());
        FunctionWriter.state( "playsound block.sweet_berry_bush.place player @s ~ ~ ~ 25");
        FunctionWriter.state( "tag @s remove preowner");

        FunctionWriter.addStatment("testing", "give @p oak_sign{BlockEntityTag:{Text1:\"{\\\"text\\\":\\\"[Buy]\\\",\\\"color\\\":\\\"green\\\",\\\"clickEvent\\\":{\\\"action\\\":\\\"run_command\\\",\\\"value\\\":\\\"trigger trigger set " + triggerCount + "\\\"}}\",Text2:\"[\\\"\\\",{\\\"text\\\":\\\"" + si.getName() + "\\\",\\\"color\\\":\\\"dark_red\\\"}]\",Text3:\"[\\\"\\\",{\\\"text\\\":\\\"Cost: \\\",\\\"color\\\":\\\"black\\\"},{\\\"text\\\":\\\"" + si.getCost() + "\\\",\\\"color\\\":\\\"dark_aqua\\\"}]\"},display:{Name:\"{\\\"text\\\":\\\"" + si.getName() + "\\\"}\"}}");


        FunctionWriter.addStatment("shop_base", "execute as @a[scores={trigger=" + triggerCount + "}] run function flytre:shop/" + si.getId());
        triggerCount++;


    }

    static void addGun(CustomGun g) throws InvalidItemException {
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " armorPen " + (int) (g.getArmorPen()));
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " dropoff " + (int) ((1 - (g.getDropoff() / 4)) * 10000));
        FunctionWriter.addStatment("init_items", "scoreboard players set " + g.getId() + " spray " + (int) g.getSpray());


        if (g.getType().equals("shotgun") || g.getType().equals("firecracker")) {
            FunctionWriter.makeFunction("guns/initiate_" + g.getId());
            for (int i = 0; i < 5; i++)
                FunctionWriter.addStatment("guns/initiate_" + g.getId(), "function flytre:guns/fire_" + g.getId());
            if (g.getType().equals("firecracker"))
                FunctionWriter.addStatment("guns/initiate_" + g.getId(), "scoreboard players set @s range 10000");

        }


        FunctionWriter.makeFunction("guns/fire_" + g.getId());
        FunctionWriter.addStatment("guns/fire_" + g.getId(), "playsound " + g.getSound() + " player @a[distance=..10] ~ ~ ~ 0.3");

        FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s range 0");
        FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s damage " + (int) (100 * g.getDamage()));
        if (g.getSpray() >= 1) {
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "function flytre:rand_num");
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players operation @s rng = num rng");
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players operation @s rng %= " + g.getId() + " spray");

            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=.." + (int) (g.getSpray() / 2 - 1) + "}] run scoreboard players add @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=" + (int) (g.getSpray() / 2 + 1) + "..}] run scoreboard players remove @s rng " + (int) (g.getSpray() / 4));
            for (int i = 0; i < g.getSpray(); i++) {
                FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s rng matches " + i + " if score @s gunSneak matches 0 positioned ~ ~1.6 ~ rotated ~" + (i - (int) (g.getSpray() / 2)) + " ~ run function flytre:guns/fire2_" + g.getId());
                FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s rng matches " + i + " if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ rotated ~" + (i - (int) (g.getSpray() / 2)) + " ~ run function flytre:guns/fire2_" + g.getId());
            }
        } else {
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s gunSneak matches 0 positioned ~ ~1.6 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_" + g.getId());
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute if score @s gunSneak matches 1.. positioned ~ ~1.3 ~ positioned ^ ^ ^0.25 run function flytre:guns/fire2_" + g.getId());
        }

        FunctionWriter.makeFunction("guns/fire2_" + g.getId());

        if (g.getSpray() >= 1) {
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "function flytre:rand_num");
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "scoreboard players operation @s rng = num rng");
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "scoreboard players operation @s rng %= " + g.getId() + " spray");


            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=.." + (int) (g.getSpray() / 2 - 1) + "}] run scoreboard players add @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "execute as @s[scores={gunSneak=1..,rng=" + (int) (g.getSpray() / 2 + 1) + "..}] run scoreboard players remove @s rng " + (int) (g.getSpray() / 4));
            FunctionWriter.addStatment("guns/fire_" + g.getId(), "scoreboard players set @s gunSneak 0");


            for (int i = 0; i < g.getSpray(); i++)
                FunctionWriter.addStatment("guns/fire2_" + g.getId(), "execute if score @s rng matches " + i + " rotated ~ ~" + (i - (int) (g.getSpray() / 2)) + " run function flytre:guns/beam_" + g.getId());
        } else {
            FunctionWriter.addStatment("guns/fire2_" + g.getId(), "function flytre:guns/beam_" + g.getId());

        }

        FunctionWriter.makeFunction("guns/beam_" + g.getId());

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "tag @s remove fired");

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players add @s travel_time 1");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[scores={travel_time=4..}] run scoreboard players set @s travel_time 0");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players add @s range 1");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players operation @s damage *= " + g.getId() + " dropoff");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "scoreboard players operation @s damage /= 10000 dropoff");

        String damageFunc = "flytre:guns/damage_" + g.getId();
        if (g.getType().equals("rocket"))
            damageFunc = "flytre:guns/rocket_" + g.getId();

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=blue] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=green] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=blue,tag=!fired] if entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function " + damageFunc);
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=green,tag=!fired] if entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function " + damageFunc);

        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=blue] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=green] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run tag @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator] add t_" + g.getId());
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=blue,tag=!fired] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!blue,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function " + damageFunc);
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute if score game_stage global matches 2 as @s[team=green,tag=!fired] positioned ~ ~-1 ~ if entity @a[distance=..0.7,limit=1,team=!green,gamemode=!spectator,scores={health=1..,respawnTimer=0}] run function " + damageFunc);


        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue,scores={travel_time=0}] run particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force");
        FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green,scores={travel_time=0}] run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1 force");

        if (g.getType().equals("shocker")) {
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green,scores={travel_time=2}] run particle minecraft:block yellow_concrete ~ ~ ~ 0 0 0 0 1 force");

        }

        if (g.getType().equals("slime")) {
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] unless block ~ ~ ~ #flytre:shoot_through run particle minecraft:block ice ~ ~ ~ 0 0 0 0 10 force");
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] unless block ~ ~ ~ #flytre:shoot_through run particle minecraft:block slime_block ~ ~ ~ 0 0 0 0 10 force");
        }
        if (g.getType().equals("rocket")) {
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[tag=!fired] unless block ~ ~ ~ #flytre:shoot_through run function " + damageFunc);
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue,tag=!fired] unless entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green,tag=!fired] unless entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());


        } else {


            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=blue] unless entity @a[distance=..0.6,limit=1,team=!blue,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());
            FunctionWriter.addStatment("guns/beam_" + g.getId(), "execute as @s[team=green] unless entity @a[distance=..0.6,limit=1,team=!green,gamemode=!spectator] if score @s range matches .." + (g.getRange() * 4) + " if block ~ ~ ~ #flytre:shoot_through positioned ^ ^ ^0.25 run function " + "flytre:guns/beam_" + g.getId());
        }


        if (g.getType().equals("rocket")) {
            FunctionWriter.makeFunction("guns/rocket_" + g.getId());
            FunctionWriter.addStatment("guns/rocket_" + g.getId(), "tag @s add fired");
            FunctionWriter.addStatment("guns/rocket_" + g.getId(), "execute as @s[team=green] run function flytre:guns/rocket_" + g.getId() + "_green");
            FunctionWriter.addStatment("guns/rocket_" + g.getId(), "execute as @s[team=blue] run function flytre:guns/rocket_" + g.getId() + "_blue");
            for (String s : new String[]{"blue", "green"}) {
                String name = "guns/rocket_" + g.getId() + "_" + s;
                FunctionWriter.makeFunction(name);
                FunctionWriter.addStatment(name, "particle minecraft:explosion ~ ~ ~ 0 0 0 0 10 force");
                FunctionWriter.addStatment(name, "effect give @a[gamemode=!spectator,team=!" + s + ",distance=..4] instant_damage 1 0 true");
                FunctionWriter.addStatment(name, "scoreboard players remove @a[gamemode=!spectator,team=!" + s + ",distance=..4] health 100");
                FunctionWriter.addStatment(name, "scoreboard players remove @a[gamemode=!spectator,team=!" + s + ",distance=..3] health 100");
                FunctionWriter.addStatment(name, "scoreboard players remove @a[gamemode=!spectator,team=!" + s + ",distance=..2] health 300");
                FunctionWriter.addStatment(name, "scoreboard players remove @a[gamemode=!spectator,team=!" + s + ",distance=..1] health 500");


                FunctionWriter.addStatment(name, "execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death,tag=!quadKill] run tellraw @a [\"\",{\"selector\":\"@a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death,tag=!quadKill]\",\"color\":\"yellow\"},{\"text\":\" was tagged by \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
                FunctionWriter.addStatment(name, "execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death] run scoreboard players add @s kills 1");
                FunctionWriter.addStatment(name, "execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death] run scoreboard players add @s kills2 1");
                FunctionWriter.addStatment(name, "execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death,tag=quadKill] run tellraw @a [\"\",{\"selector\":\"@a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death,tag=quadKill]\",\"color\":\"yellow\"},{\"text\":\" lost their streak to \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
                FunctionWriter.addStatment(name, "execute if entity @a[scores={health=..0},distance=..4,gamemode=!spectator,team=!" + s + ",tag=!gun_death,tag=quadKill] run tag @s remove quadKill");
                FunctionWriter.addStatment(name, "tag @a[scores={health=..0},distance=..4,tag=!gun_death,gamemode=!spectator,team=!" + s + "] add gun_death");

                FunctionWriter.addStatment(name, "tag @a[distance=..0.7,tag=t_" + g.getId() + "] remove t_" + g.getId() + "");

            }

        }
        FunctionWriter.makeFunction("guns/damage_" + g.getId());
        if (g.getType().equals("slime")) {
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @s[team=blue] run particle minecraft:block ice ~ ~ ~ 0 0 0 0 10 force");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @s[team=green] run particle minecraft:block slime_block ~ ~ ~ 0 0 0 0 10 force");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "effect give @a[distance=..0.7,tag=t_" + g.getId() + "] slowness 1 2 true");
        }
        if (!g.getType().equals("shocker")) {
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players set @a[distance=..0.7,tag=t_" + g.getId() + "] armor2 100");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "effect give @a[distance=..0.7,tag=t_" + g.getId() + "] instant_damage 1 0 true");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[distance=..0.7,tag=t_" + g.getId() + "] add shot");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @a[distance=..0.7,tag=t_" + g.getId() + "] armor2 -= " + g.getId() + " armorPen");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] run scoreboard players operation @s armor2 *= @s armor");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] run scoreboard players operation @s armor2 /= 100 dropoff");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players set @s damage2 100");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players add @s range 1000000");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage2 -= @a[distance=..0.7,tag=t_" + g.getId() + "] armor2");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage *= @s damage2");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @s damage /= 100 dropoff");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "scoreboard players operation @a[distance=..0.7,tag=t_" + g.getId() + "] health -= @s damage");

            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + "] at @s run playsound flytre.hit player @a[distance=..10] ~ ~ ~");


            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=!quadKill] run tellraw @a [\"\",{\"selector\":\"@p[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + "]\",\"color\":\"yellow\"},{\"text\":\" was tagged by \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] run scoreboard players add @s kills 1");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] run scoreboard players add @s kills2 1");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=quadKill] run tellraw @a [\"\",{\"selector\":\"@p[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + "]\",\"color\":\"yellow\"},{\"text\":\" lost their streak to \",\"color\":\"yellow\"},{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute if entity @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death,tag=quadKill] run tag @s remove quadKill");

            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[scores={health=..0},distance=..0.7,tag=t_" + g.getId() + ",tag=!gun_death] add gun_death");

        }
        if (g.getType().equals("shocker")) {
            FunctionWriter.addStatment("init_items", "scoreboard players set 80 damage 80");
            FunctionWriter.addStatment("init_items", "scoreboard players set 100 damage 100");
            /*
            Shock algorithm
            1. remove all shock tags
            2. tag first player with shock
            3. at the shocked player run shock particles
            4. deal damage and tag the first player with shocked and remove shock
            5. at a random player unshocked within 5 blocks tag it with shock
            6. draw a line from the current player to the new yet-to-be shocked player
            7. repeat 2 thru 6


            how to do damage?
            -test for hp < 0 and
             */
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a remove shocked");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a remove shock");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a remove initial_shocker");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @s add initial_shocker");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[distance=..0.7,tag=t_" + g.getId() + ",limit=1] add shocked");
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute as @a[distance=..0.7,tag=t_" + g.getId() + ",limit=1] at @s run function flytre:guns/shock_" + g.getId());

            FunctionWriter.makeFunction("guns/shock_" + g.getId());
            FunctionWriter.makeFunction("guns/shock_line_" + g.getId());


            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute at @s run playsound minecraft:flytre.shocker.hit player @a[distance=..7] ~ ~ ~");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "tag @s add shocking");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute at @s run function flytre:particles/shocker");


            FunctionWriter.addStatment("guns/shock_line_" + g.getId(), "particle block yellow_concrete ~ ~ ~ 0 0 0 0 1 force");
            FunctionWriter.addStatment("guns/shock_line_" + g.getId(), "execute positioned ~ ~-1 ~ unless entity @a[tag=shocking,distance=..0.7] positioned ~ ~1 ~ positioned ^ ^ ^0.25 run function flytre:guns/shock_line_" + g.getId());


            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage *= 80");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage /= 100");

            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players set @s armor2 100");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "tag @s add shot");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @s armor2 -= " + g.getId() + " armorPen");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @s armor2 *= @s armor");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @s armor2 /= 100 dropoff");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players set @a[tag=initial_shocker] damage2 100");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players add @a[tag=initial_shocker] range 1000000");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage2 -= @s armor2");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage *= @a[tag=initial_shocker] damage2");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage /= 100 dropoff");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @s health -= @a[tag=initial_shocker] damage");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "effect give @s instant_damage 1 0 true");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage *= 80 damage");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "scoreboard players operation @a[tag=initial_shocker] damage /= 100 damage");


            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death,tag=!quadKill] run tellraw @a [\"\",{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\" was tagged by \",\"color\":\"yellow\"},{\"selector\":\"@a[tag=initial_shocker]\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death] run scoreboard players add @a[tag=initial_shocker] kills 1");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death] run scoreboard players add @a[tag=initial_shocker] kills2 1");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute if entity @s[scores={health=..0},tag=shocking,tag=!gun_death,tag=quadKill] run tellraw @a [\"\",{\"selector\":\"@s\",\"color\":\"yellow\"},{\"text\":\" lost their streak to \",\"color\":\"yellow\"},{\"selector\":\"@a[tag=initial_shocker]\",\"color\":\"yellow\"},{\"text\":\".\",\"color\":\"yellow\"}]");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute as @a[scores={health=..0},tag=shocking,tag=!gun_death,tag=quadKill] run tag @s remove quadKill");
            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute as @a[scores={health=..0},tag=shocking,tag=!gun_death] run tag @s add gun_death");

            FunctionWriter.addStatment("guns/shock_" + g.getId(), "execute as @a[tag=shocking] run function flytre:guns/shock2_" + g.getId());
            FunctionWriter.makeFunction("guns/shock2_" + g.getId());
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "tag @s add shocked");
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "tag @s remove shocking");
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "execute as @a[tag=initial_shocker,team=blue] run tag @r[distance=..5,tag=!shocked,team=!blue,gamemode=!spectator] add shocking");
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "execute as @a[tag=initial_shocker,team=green] run tag @r[distance=..5,tag=!shocked,team=!green,gamemode=!spectator] add shocking");
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "execute as @s positioned ~ ~1 ~ if entity @a[tag=shocking,limit=1] facing entity @a[tag=shocking,distance=..5,limit=1] eyes run function flytre:guns/shock_line_" + g.getId());
            FunctionWriter.addStatment("guns/shock2_" + g.getId(), "execute as @s at @s as @p[tag=shocking] at @s run function flytre:guns/shock_" + g.getId()); //recurse if entity to shock to


            addParticle(new ParticleHelix("shocker", 0.5, "block yellow_concrete", 4, 2));
        }


        FunctionWriter.addStatment("guns/damage_" + g.getId(), "tag @a[distance=..0.7,tag=t_" + g.getId() + "] remove t_" + g.getId() + "");


        if (g.getType().equals("firecracker"))
            FunctionWriter.addStatment("guns/damage_" + g.getId(), "execute positioned ^ ^ ^2 run function flytre:guns/initiate_" + g.getId());

        FunctionWriter.addStatment("guns/damage_" + g.getId(), "function flytre:sync_xp");


        ArrayList<String> lore2 = new ArrayList();
        if (g.getType().equals("shotgun"))
            lore2.add("§7§oShoots multiple laser at a time.");
        if (g.getType().equals("shocker")) {
            lore2.add("§7§oArcing lasers hit additional");
            lore2.add("§7§onearby enemies.");
        }
        if (g.getType().equals("slime"))
            lore2.add("§7§oLasers carry sticky slime.");
        if (g.getType().equals("rocket")) {
            lore2.add("§7§oExplosive laser can hit");
            lore2.add("§7§omultiple enemies at once.");
        }
        if (g.getType().equals("firecracker"))
            lore2.add("§7§oLasers spray out from hit enemies.");

        if (!g.getType().equals("rocket"))
            lore2.add("§7Damage: §c" + (int) (g.getDamage() * 100));
        else
            lore2.add("§7Damage: §c100-1200");

        int fireSpeed = (20 / (int) (20 / g.getRps()));
        if (fireSpeed == 0)
            lore2.add("§7Fire Speed: §c" + ((int) (g.getRps() * 100)) / 100.0 + " lasers/sec");
        else
            lore2.add("§7Fire Speed: §c" + (20 / (int) (20 / g.getRps())) + " lasers/sec");

        lore2.add("§7Range: §c" + g.getRange() + "m");

        if (g.getSpray() > 0)
            lore2.add("§7Spray: §c" + (int) g.getSpray() + "°");
        if (g.getArmorPen() > 0)
            lore2.add("§7Armor Pierce: §c" + (int) g.getArmorPen() + "%");
        if (g.getDropoff() > 0)
            lore2.add("§7Dropoff: §c" + (g.getDropoff() * 100) + " % per m");
        if (g.getType().equals("sniper"))
            lore2.add("§7Movement Speed: §c-10%");
        if (g.getType().equals("minigun"))
            lore2.add("§7Movement Speed: §c-40%");
        if (g.getType().equals("shotgun"))
            lore2.add("§7Lasers: §c5");
        if (g.getType().equals("firecracker"))
            lore2.add("§7Impact Lasers: §c5");
        if (g.getType().equals("slime"))
            lore2.add("§7Slow: §c45%");
        if (g.getType().equals("shocker"))
            lore2.add("§7Arc distance: §c5");
        if (g.getClipSize() > 1) {
            lore2.add("§7Battery Power: §c" + g.getClipSize() + " lasers");
            lore2.add("§7Charging Time: §c" + ((int) (g.getReloadTime() * 100)) / 100.0 + " sec" + (g.getReloadTime() == 1 ? "" : "s"));
        }

        String[] lore = new String[lore2.size()];
        for (int i = 0; i < lore2.size(); i++)
            lore[i] = lore2.get(i);


        int model = 0;
        if (g.getType().equals("pistol"))
            model = 1;
        if (g.getType().equals("sniper"))
            model = 3;
        if (g.getType().equals("smg") || g.getType().equals("rifle"))
            model = 5;
        if (g.getType().equals("shotgun"))
            model = 12;
        if (g.getType().equals("slime"))
            model = 17;
        if (g.getType().equals("rocket"))
            model = 19;
        if (g.getType().equals("shocker"))
            model = 21;
        if (g.getType().equals("minigun"))
            model = 23;
        if (g.getType().equals("firecracker"))
            model = 25;

        ShopItem si = null;
        if (g.getType().equals("sniper"))
            si = new ShopItem(g.getId(), "carrot_on_a_stick", g.getName(), lore, g.getCost(), "ability:\"" + g.getId() + "\",scope:1,HideFlags:63,AttributeModifiers:[{AttributeName:\"generic.movementSpeed\",Name:\"generic.movementSpeed\",Amount:-0.1,Operation:1,UUIDLeast:" + (int) (Math.random() * 100000) + ",UUIDMost:" + (int) ((Math.random() * 100000) + 100000) + ",Slot:\"mainhand\"}]");
        else if (g.getType().equals("minigun"))
            si = new ShopItem(g.getId(), "carrot_on_a_stick", g.getName(), lore, g.getCost(), "ability:\"" + g.getId() + "\",HideFlags:63,AttributeModifiers:[{AttributeName:\"generic.movementSpeed\",Name:\"generic.movementSpeed\",Amount:-0.4,Operation:1,UUIDLeast:" + (int) (Math.random() * 100000) + ",UUIDMost:" + (int) ((Math.random() * 100000) + 100000) + ",Slot:\"mainhand\"}]");
        else
            si = new ShopItem(g.getId(), "carrot_on_a_stick", g.getName(), lore, g.getCost(), "ability:\"" + g.getId() + "\",scope:1");

        si.setNbtGreen("CustomModelData:" + model);
        si.setNbtBlue("CustomModelData:" + (model + 1));

        addShopItem(si);


        CustomAbility cag = null;


        int cooldown = (int) (20 / g.getRps());
        if (g.getRps() >= 20)
            cooldown = 0;

        if (!g.getType().equals("shotgun"))
            cag = new CustomAbility.Builder(g.getId()).effect("function flytre:guns/fire_" + g.getId()).cooldown(cooldown).charges(g.getClipSize()).reloadTime((int) (g.getReloadTime() * 20)).build();
        else
            cag = new CustomAbility.Builder(g.getId()).effect("function flytre:guns/initiate_" + g.getId()).cooldown(cooldown).charges(g.getClipSize()).reloadTime((int) (g.getReloadTime() * 20)).build();
        addAbility(cag, si, g);
    }

    static void postInitializeGun() {
    }


}
